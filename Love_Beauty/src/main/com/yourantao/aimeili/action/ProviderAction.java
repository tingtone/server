package main.com.yourantao.aimeili.action;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;

import main.com.yourantao.aimeili.bean.Image;
import main.com.yourantao.aimeili.bean.ImageDAO;
import main.com.yourantao.aimeili.bean.Provider;
import main.com.yourantao.aimeili.bean.ProviderDAO;
import main.com.yourantao.aimeili.bean.ProviderLocations;
import main.com.yourantao.aimeili.bean.ProviderLocationsDAO;
import main.com.yourantao.aimeili.conf.Config;
import main.com.yourantao.aimeili.conf.Constant;
import main.com.yourantao.aimeili.util.MD5;
import main.com.yourantao.aimeili.util.RankGenerator;
import main.com.yourantao.aimeili.vo.ProviderLocationsView;
import main.com.yourantao.aimeili.vo.ProviderView;

public class ProviderAction extends BaseAction implements Constant,
		ProviderInterface {
	private static final Logger LOG = LoggerFactory.getLogger(ProviderAction.class);
	
	//下面是重要的
	private File newprovider_thumb; // 上传缩略图
	private String thumbContentType;// 上传文件类型
	private String thumbFileName; // 上传缩略图的名称
	
	private ProviderDAO providerDAO;
	private ProviderLocationsDAO providerLocationsDAO;
	private ImageDAO imageDAO;
	
	//struts 机制要用到的setter
	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.ProviderInterface#setNewprovider_thumbContentType(java.lang.String)
	 */
	public void setNewprovider_thumbContentType(String thumbContentType)
	{
		System.out.println("thumbContentType : " + thumbContentType);
		this.thumbContentType = thumbContentType;
	}
	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.ProviderInterface#setNewprovider_thumbFileName(java.lang.String)
	 */
	public void setNewprovider_thumbFileName(String thumbFileName)
	{
		System.out.println("thumbFileName : " + thumbFileName);
		this.thumbFileName = thumbFileName;
	}
	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.ProviderInterface#setNewprovider_thumb(java.io.File)
	 */
	public void setNewprovider_thumb(File newproviderThumb) {
		newprovider_thumb = newproviderThumb;
	}
	//spring要使用到的setter/getter
	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.ProviderInterface#getProviderDAO()
	 */
	public ProviderDAO getProviderDAO() {
		return providerDAO;
	}
	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.ProviderInterface#setProviderDAO(main.com.yourantao.aimeili.bean.ProviderDAO)
	 */
	public void setProviderDAO(ProviderDAO providerDAO) {
		this.providerDAO = providerDAO;
	}
	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.ProviderInterface#getProviderLocationsDAO()
	 */
	public ProviderLocationsDAO getProviderLocationsDAO() {
		return providerLocationsDAO;
	}
	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.ProviderInterface#setProviderLocationsDAO(main.com.yourantao.aimeili.bean.ProviderLocationsDAO)
	 */
	public void setProviderLocationsDAO(ProviderLocationsDAO providerLocationsDAO) {
		this.providerLocationsDAO = providerLocationsDAO;
	}
	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.ProviderInterface#getImageDAO()
	 */
	public ImageDAO getImageDAO() {
		return imageDAO;
	}
	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.ProviderInterface#setImageDAO(main.com.yourantao.aimeili.bean.ImageDAO)
	 */
	public void setImageDAO(ImageDAO imageDAO) {
		this.imageDAO = imageDAO;
	}
	/**
	 *  自定义获取provider信息的函数
	 * @see main.com.yourantao.aimeili.action.ProviderInterface#getProvider()
	 */
	@Override
	public String getProvider() {
	
		//Constant.java	PROVIDER_ID=pid
		Integer providerId = getIntegerParameter(PROVIDER_ID);
		if(providerId == null)
			return null;

		//ProviderDAO.java findByProviderId
		//这里的返回值并未确定下来
		Provider provider = providerDAO.findById(providerId);

		ProviderView  providerView = new ProviderView();
		providerView.setProviderId(provider.getProviderId());
		providerView.setProviderName(provider.getProviderName());
		providerView.setProviderDescription(provider.getProviderDescription());
		providerView.setProviderService(provider.getProviderService());
		providerView.setProviderDeliver(provider.getProviderDeliver());

		
		Image thumb = imageDAO.findById(provider.getProviderThumbId()); //缩略图
		
		if(thumb != null)
			providerView.setProviderThumb(Config.get(Config.BASE_IMAGEURL) + thumb.getImgUrl());
		else
			providerView.setProviderThumb("");

		printObject(providerView);
		return null;
	}
	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.ProviderInterface#updateProvider()
	 */
	@Override
	public String updateProvider() {
		
		Integer providerId = getIntegerParameter(PROVIDER_ID);
		if(providerId == null)
			return null;
		String providerDes = getStringParameter("pdes");
		String providerService = getStringParameter("pservice");
		String providerDeliver = getStringParameter("pdeliver");
		
		Provider provider = providerDAO.findById(providerId);
//		provider.setProviderThumbId(-1);//为了在底层数据库操作时判断是否需要对thumbId字段进行更新
		if (thumbFileName != null && !thumbFileName.equals("")) { // 上传缩略图，并存储
			//System.out.println("in update provider-------thumb");
			String FileName = MD5.md5(thumbFileName)
					+ getExtention(thumbFileName);
			File thumbFile = new File(Config.get(Config.BASE_IMAGESTORAGE) + FileName);
			int imageid = getImgAttribute(newprovider_thumb, FileName);
			provider.setProviderThumbId(imageid);
			copy(newprovider_thumb, thumbFile);
		}
		//System.out.println("thumb id is" + provider.getProviderThumbId());
		
		provider.setProviderDeliver(providerDeliver);
		provider.setProviderDescription(providerDes);
		provider.setProviderService(providerService);
		//这里需要换一种新的方式进行处理，是否成功，还没有测试
//		providerDAO.merge(provider);
		//int result = providerDAO.updateProvider(provider);
		//返回结果进行返回
		return SUCCESS;
	}
	/* (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.ProviderInterface#getProviderLocations()
	 */
	@SuppressWarnings("unchecked")
	@Override
	public String getProviderLocations() {
		ProviderLocations providerLocations = new ProviderLocations();
		//Constant.java	PROVIDER_ID=pid
		Integer providerId = getIntegerParameter(PROVIDER_ID);
		
		providerLocations.setProviderId(providerId);
		//Constant.java	PROVIDER_LOCATION_LEVEL = plevel
		Integer providerLocationsLevel = getIntegerParameter("plevel");
		//System.out.println(providerLocationsLevel);
		if(providerId == null || providerLocationsLevel == null)
			return null;
		//根据level判断查询的相关信息
		switch(providerLocationsLevel)
		{
			case 2:
				providerLocations.setProvince(getStringParameter("location1"));
				break;
			case 3:
				providerLocations.setProvince(getStringParameter("location1"));
				providerLocations.setCity(getStringParameter("location2"));
				break;
			default:
		}
		//printObject(providerLocations);
		List<ProviderLocations> queryResults= providerLocationsDAO.findByExample2(providerLocations, providerLocationsLevel);
		HashSet<String> hset = new HashSet<String>();
		HashSet<ProviderLocationsView> hsetView = new HashSet<ProviderLocationsView>();
		Iterator<ProviderLocations> locationsIterator = queryResults.iterator();
		switch(providerLocationsLevel)
		{
			case 2:
				while(locationsIterator.hasNext())
				{
					ProviderLocations result = (ProviderLocations)locationsIterator.next();
					if(hset.add(result.getCity()))
					{
						ProviderLocationsView locationsView = new ProviderLocationsView();
						//locationsView.setId(result.getId());
						locationsView.setValue(result.getCity());
						hsetView.add(locationsView);
					}
				}
				break;
			case 3:
				while(locationsIterator.hasNext())
				{
					ProviderLocations result = (ProviderLocations)locationsIterator.next();
					if(hset.add(result.getDistric()))
					{
						ProviderLocationsView locationsView = new ProviderLocationsView();
						locationsView.setId(result.getId());
						locationsView.setValue(result.getDistric());
						hsetView.add(locationsView);
					}
				}
				break;
			default:
				while(locationsIterator.hasNext())
				{
					ProviderLocations result = (ProviderLocations)locationsIterator.next();
					if(hset.add(result.getProvince()))
					{
						ProviderLocationsView locationsView = new ProviderLocationsView();
						//locationsView.setId(result.getId());
						locationsView.setValue(result.getProvince());
						hsetView.add(locationsView);
					}
				}
		}
		
		printArray(hsetView);
		
		return null;
	}
	
	/*
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.ProviderInterface#updateOrAddProviderLocations()
	 */
	public String updateOrAddProviderLocations()
	{
		int providerId = getIntegerParameter(PROVIDER_ID);
		String updateType = getReqeust().getParameter("submit");
		String province = getReqeust().getParameter("location1");
		String city = getReqeust().getParameter("location2");
		String districAndId = getReqeust().getParameter("location3");
		String newProvince = getReqeust().getParameter("newlocation1");
		String newCity = getReqeust().getParameter("newlocation2");
		String newDistric = getReqeust().getParameter("newlocation3");
		
		if(updateType.equals("add"))
		{
			ProviderLocations providerLocations = new ProviderLocations();
			providerLocations.setProviderId(providerId);
			
			if(newProvince.equals(""))
				providerLocations.setProvince(province);
			else
				providerLocations.setProvince(newProvince);
			
			if(newCity.equals(""))
				providerLocations.setCity(city);
			else
				providerLocations.setCity(newCity);
			
			int loc = districAndId.lastIndexOf(" ");
			String distric = districAndId.substring(0, loc);
			if(newDistric.equals(""))
				providerLocations.setDistric(distric);
			else
				providerLocations.setDistric(newDistric);
			providerLocationsDAO.save(providerLocations);
			return SUCCESS;
		}
		else if(updateType.equals("update"))
		{
			int loc = districAndId.lastIndexOf(" ");
			int id = Integer.parseInt(districAndId.substring(loc+1));
			ProviderLocations persistProviderLocations = providerLocationsDAO.findById(id);
			
			if(!newProvince.equals(""))
				persistProviderLocations.setProvince(newProvince);
			
			if(!newCity.equals(""))
				persistProviderLocations.setCity(newCity);
			
			if(!newDistric.equals(""))
				persistProviderLocations.setDistric(newDistric);
			providerLocationsDAO.merge(persistProviderLocations);
			return SUCCESS;
		}
		return ERROR;
	}

}

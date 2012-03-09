package main.com.yourantao.aimeili.action;

import java.io.File;

import main.com.yourantao.aimeili.bean.ImageDAO;
import main.com.yourantao.aimeili.bean.ProviderDAO;
import main.com.yourantao.aimeili.bean.ProviderLocationsDAO;

public interface ProviderInterface {

	//struts 机制要用到的setter
	public void setNewprovider_thumbContentType(String thumbContentType);

	public void setNewprovider_thumbFileName(String thumbFileName);

	public  void setNewprovider_thumb(File newproviderThumb);

	//spring要使用到的setter/getter
	public  ProviderDAO getProviderDAO();

	public  void setProviderDAO(ProviderDAO providerDAO);

	public  ProviderLocationsDAO getProviderLocationsDAO();

	public  void setProviderLocationsDAO(
			ProviderLocationsDAO providerLocationsDAO);

	public  ImageDAO getImageDAO();

	public  void setImageDAO(ImageDAO imageDAO);

	/**
	 * 通过商城ID号获得商城详细信息
	 */
	public  String getProvider();

	public  String updateProvider();

	/**
	 * 通过商城ID号获取商城的地址信息
	 */
	
	public  String getProviderLocations();
	/**
	 * 修改商城的发货地址或者增加商城的发货地址
	 */
	public String updateOrAddProviderLocations();

}
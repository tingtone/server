package main.com.yourantao.aimeili.action;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import main.com.yourantao.aimeili.bean.BrandDAO;
import main.com.yourantao.aimeili.bean.SeriesDAO;
import main.com.yourantao.aimeili.conf.Constant;

/**
 * 品牌数据操作
 * 
 * @author mac 创建时间： 2012-3-6 下午04:46:30 修改时间：2012-3-6 下午04:46:30 具体描述： TODO
 */
@SuppressWarnings("serial")
public class BrandAction extends BaseAction implements Constant, BrandInterface {

	private static final Logger log = LoggerFactory
			.getLogger(CategoryAction.class);
	private BrandDAO brandDAO;
	private SeriesDAO seriesDAO;

	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.BrandInterface#getBrands()
	 */
	@Override
	public String getBrands() {
		List brandList = brandDAO.findAll(); // 无条件全部获得
		printArray(brandList);
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.BrandInterface#getSeries()
	 */
	@Override
	public String getSeries() {
		Integer brandId=getIntegerParameter(BRAND_ID);
		List seriesList = seriesDAO.findByBrandId(brandId);
		printArray(seriesList);
		return null;
	}

	// spring

	public BrandDAO getBrandDAO() {
		return brandDAO;
	}

	public void setBrandDAO(BrandDAO brandDAO) {
		this.brandDAO = brandDAO;
	}

	public SeriesDAO getSeriesDAO() {
		return seriesDAO;
	}

	public void setSeriesDAO(SeriesDAO seriesDAO) {
		this.seriesDAO = seriesDAO;
	}
}

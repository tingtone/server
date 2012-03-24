package main.com.yourantao.aimeili.action;

import java.util.ArrayList;
import java.util.List;

import main.com.yourantao.aimeili.bean.City;
import main.com.yourantao.aimeili.bean.CityDAO;
import main.com.yourantao.aimeili.conf.Constant;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SuppressWarnings("serial")
public class CityAction extends BaseAction implements Constant,CityInterface{
	private static final Logger log = LoggerFactory.getLogger(CityAction.class);
	private CityDAO cityDAO;
	public CityDAO getCityDAO() {
		return cityDAO;
	}
	public void setCityDAO(CityDAO cityDAO) {
		this.cityDAO = cityDAO;
	}
	
	/*
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.CityInterface#getAll()
	 */
	@Override
	public String getAll() {
		List<City> cities=cityDAO.findAll();
		printArray(cities);
		return null;
	}
	
	/*
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.CityInterface#getMainCity()
	 */
	@Override
	public String getMainCity() {
		List<City> cities=cityDAO.findByCityDeep(2);   //层2是主要城市
//		List<String> cityNames=new ArrayList<String>();
//		for (City city : cities) {
//			cityNames.add(city.getCityName());
//		}
		printArray(cities);
		return null;
	}
	
	/*
	 * (non-Javadoc)
	 * @see main.com.yourantao.aimeili.action.CityInterface#getProvince()
	 */
	@Override
	public String getProvince() {
		List<City> cities=cityDAO.findByCityDeep(1);   //层1是省级
		printArray(cities);
		return null;
	}
	
}

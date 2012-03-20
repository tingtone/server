package main.com.yourantao.aimeili.action;

public interface CityInterface {

	
	/**
	 * for nothing
	 * 获得省级地址
	 * @return
	 */
	public String getProvince();
	
	/**
	 * for client
	 * 获得给城市选择的城市
	 * @return
	 */
	public String getMainCity();
	
	/**
	 * for client
	 * 获得多层的全部地址
	 * @return
	 */
	public String getAll();
	
	
	
}

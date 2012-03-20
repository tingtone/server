package main.com.yourantao.aimeili.bean;

/**
 * City entity. @author MyEclipse Persistence Tools
 */

public class City implements java.io.Serializable {

	// Fields

	private Integer cityId;
	private String cityName;
	private Integer cityDeep;
	private String cityAddress;
	private String cityParentName;

	// Constructors

	/** default constructor */
	public City() {
	}

	/** minimal constructor */
	public City(String cityName) {
		this.cityName = cityName;
	}

	/** full constructor */
	public City(String cityName, Integer cityDeep, String cityAddress,
			String cityParentName) {
		this.cityName = cityName;
		this.cityDeep = cityDeep;
		this.cityAddress = cityAddress;
		this.cityParentName = cityParentName;
	}

	// Property accessors

	public Integer getCityId() {
		return this.cityId;
	}

	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}

	public String getCityName() {
		return this.cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public Integer getCityDeep() {
		return this.cityDeep;
	}

	public void setCityDeep(Integer cityDeep) {
		this.cityDeep = cityDeep;
	}

	public String getCityAddress() {
		return this.cityAddress;
	}

	public void setCityAddress(String cityAddress) {
		this.cityAddress = cityAddress;
	}

	public String getCityParentName() {
		return this.cityParentName;
	}

	public void setCityParentName(String cityParentName) {
		this.cityParentName = cityParentName;
	}

}
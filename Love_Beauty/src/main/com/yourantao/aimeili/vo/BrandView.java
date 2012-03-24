package main.com.yourantao.aimeili.vo;

/**
 * 品牌显示类
 * 
 * @author mac
 * 创建时间： 2012-3-14 下午03:49:52
 * 修改时间：2012-3-14 下午03:49:52
 * 具体描述： TODO
 */
public class BrandView {
	private Integer brandId;
	private String brandName;
	private String brandAlias;
	private String brandDescription;
	private String brandImageUrl;
	private String brandOtherName;
	
	
	public String getBrandOtherName() {
		return brandOtherName;
	}
	public void setBrandOtherName(String brandOtherName) {
		this.brandOtherName = brandOtherName;
	}
	public String getBrandDescription() {
		return brandDescription;
	}
	public void setBrandDescription(String brandDescription) {
		this.brandDescription = brandDescription;
	}
	public Integer getBrandId() {
		return brandId;
	}
	public void setBrandId(Integer brandId) {
		this.brandId = brandId;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getBrandAlias() {
		return brandAlias;
	}
	public void setBrandAlias(String brandAlias) {
		this.brandAlias = brandAlias;
	}
	public String getBrandImageUrl() {
		return brandImageUrl;
	}
	public void setBrandImageUrl(String brandImageUrl) {
		this.brandImageUrl = brandImageUrl;
	}
	
}

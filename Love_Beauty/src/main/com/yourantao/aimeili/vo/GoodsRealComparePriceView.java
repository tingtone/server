package main.com.yourantao.aimeili.vo;

/**
 * 比比价的真实商品view
 * 
 * @author mac
 * 创建时间： 2012-3-28 下午01:21:01
 * 修改时间：2012-3-28 下午01:21:01
 * 具体描述： TODO
 */
public class GoodsRealComparePriceView {
	private int providerId;
	private String providerName;
	private String description;
	private String goodsName;
	private int goodsRealId;// 真实商品ID
	private float goodsPrice;
	private String goodsContent;
	
	public String getProviderName() {
		return providerName;
	}
	public void setProviderName(String providerName) {
		this.providerName = providerName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getProviderId() {
		return providerId;
	}
	public void setProviderId(int providerId) {
		this.providerId = providerId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getGoodsRealId() {
		return goodsRealId;
	}
	public void setGoodsRealId(int goodsRealId) {
		this.goodsRealId = goodsRealId;
	}
	public float getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(float goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public String getGoodsContent() {
		return goodsContent;
	}
	public void setGoodsContent(String goodsContent) {
		this.goodsContent = goodsContent;
	}
	
}

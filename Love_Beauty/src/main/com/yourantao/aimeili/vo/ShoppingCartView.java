package main.com.yourantao.aimeili.vo;

public class ShoppingCartView {
	private int providerId;
	private int goodsRealId;
	private String goodsName;
	private String goodsThumb;
	private String goodsContent;
	private float goodsPrice;
	private int count;
	
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
	public String getGoodsThumb() {
		return goodsThumb;
	}
	public void setGoodsThumb(String goodsThumb) {
		this.goodsThumb = goodsThumb;
	}
	public String getGoodsContent() {
		return goodsContent;
	}
	public void setGoodsContent(String goodsContent) {
		this.goodsContent = goodsContent;
	}
	public float getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(float goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public void setGoodsRealId(int goodsRealId) {
		this.goodsRealId = goodsRealId;
	}
	public int getGoodsRealId() {
		return goodsRealId;
	}
	
}

package main.com.yourantao.aimeili.vo;

import java.util.List;

public class GoodsRealSimpleView {
	//商品名称
	private String goodsName;
	//商品ID
	private int goodsId;
	//商品缩略图
	private String goodsThumb;
	//private String goodsContent;
	//商品价格
	private float goodsPrice;
	//商品数量
	private int goodsCount;
	//商城ID
	private int providerId;
	
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
	public float getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(float goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public int getGoodsCount() {
		return goodsCount;
	}
	public void setGoodsCount(int goodsCount) {
		this.goodsCount = goodsCount;
	}
	public int getProviderId() {
		return providerId;
	}
	public void setProviderId(int providerId) {
		this.providerId = providerId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public int getGoodsId() {
		return goodsId;
	}
}

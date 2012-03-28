package main.com.yourantao.aimeili.vo;

import java.util.ArrayList;
import java.util.List;

public class ShoppingCartView {
	private int providerId;
	private List<GoodsRealSimpleView> goodsList = new ArrayList<GoodsRealSimpleView>();
	//自定义setter
	public void addGoods(GoodsRealSimpleView goodsRealSimpleView){
		this.goodsList.add(goodsRealSimpleView);
	}
	public int getProviderId() {
		return providerId;
	}
	public void setProviderId(int providerId) {
		this.providerId = providerId;
	}
	public void setGoodsList(List<GoodsRealSimpleView> goodsList) {
		this.goodsList = goodsList;
	}
	public List<GoodsRealSimpleView> getGoodsList() {
		return goodsList;
	}
	
}

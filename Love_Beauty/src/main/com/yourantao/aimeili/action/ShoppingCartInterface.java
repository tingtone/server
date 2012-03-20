package main.com.yourantao.aimeili.action;

import main.com.yourantao.aimeili.bean.GoodsRealDAO;
import main.com.yourantao.aimeili.bean.ShoppingCartDAO;

public interface ShoppingCartInterface {

	//spring 机制要用到getter/setter
	public abstract ShoppingCartDAO getShoppingCartDAO();

	public abstract void setShoppingCartDAO(ShoppingCartDAO shoppingCartDAO);
	public abstract GoodsRealDAO getGoodsRealDAO();
	public abstract void setGoodsRealDAO(GoodsRealDAO goodsRealDAO);
	/**
	 * 获取购物车内容
	 * @return
	 */
	public abstract String getShoppingCart();

	/**
	 * 添加商品到购物车中
	 * @return
	 */
	public abstract String addGoods();

	/**
	 * 修改购物车中商品的数量？？？
	 * @return
	 */
	public abstract String modifyQuantity();
	/**
	 * 接受商品的新的价格
	 * @return
	 */
	public abstract String acceptGoods();
	/**
	 * 删除购物车中的某一个商品
	 * @return
	 */
	public abstract String deleteGoods();

	/**
	 * 删除购物车中的所有商品
	 * @return
	 */
	public abstract String deleteAllGoods();

}
package main.com.yourantao.aimeili.action;

import main.com.yourantao.aimeili.bean.ShoppingCartDAO;

public interface ShoppingCartInterface {

	//spring 机制要用到getter/setter
	public abstract ShoppingCartDAO getShoppingCartDAO();

	public abstract void setShoppingCartDAO(ShoppingCartDAO shoppingCartDAO);

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
	 * 修改购物车中商品的状态
	 * @return
	 */
	public abstract String changeStatus();

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
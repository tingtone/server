package main.com.yourantao.aimeili.action;

import main.com.yourantao.aimeili.bean.GoodsRealDAO;
import main.com.yourantao.aimeili.bean.OrderDAO;
import main.com.yourantao.aimeili.bean.OrderGoodsDAO;
import main.com.yourantao.aimeili.bean.ShoppingCartDAO;
import main.com.yourantao.aimeili.bean.UserAddressDAO;

public interface OrderInterface {


	/**
	 * 获取各种类型订单的数量
	 * 这里只有待确认订单/历史订单的数量
	 * @return
	 */
	public String getOrderCount();

	/**
	 * 获取未确认的订单
	 */
	public abstract String getUnconfirmedOrders();

	/**
	 * 用户进行收货确认,一个订单对应多个商城的订单,收货确认如何确定？？？？？？？
	 * 
	 * @return
	 */
	public abstract String confirmOrders();

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.OrderInterface#getUnfinishedOrders()
	 */
	public abstract String getUnfinishedOrders();

	/**
	 * 获取成功订单
	 * 
	 * @return
	 */
	public abstract String getHistoryOrders();

	/**
	 * 提交订单,需要计算出当前所有的商品的总金额,并与实际的商品总金额比较
	 * 
	 * @return
	 */
	public abstract String addOrder();

	/**
	 * 删除订单中的某一件商品,可能导致订单整体删除
	 * 管理员可能要使用这个功能,但是这种情况下就不能使用uuid来访问而是使用userId直接进行访问
	 * @return
	 */
	public abstract String deleteGoods();

	// 以下是小编的接口
	/*
	 * 获取未完成的且没有被管理员处理过的订单
	 */
	public abstract String getOrdersForEditor();

}
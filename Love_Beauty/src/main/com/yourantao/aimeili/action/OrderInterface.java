package main.com.yourantao.aimeili.action;

import main.com.yourantao.aimeili.bean.GoodsRealDAO;
import main.com.yourantao.aimeili.bean.OrderDAO;
import main.com.yourantao.aimeili.bean.OrderGoodsDAO;
import main.com.yourantao.aimeili.bean.UserAddressDAO;

public interface OrderInterface {

	//spring 机制要使用的getter/setter
	public abstract OrderDAO getOrderDAO();

	public abstract void setOrderDAO(OrderDAO orderDAO);

	public abstract OrderGoodsDAO getOrderGoodsDAO();

	public abstract void setOrderGoodsDAO(OrderGoodsDAO orderGoodsDAO);

	public abstract GoodsRealDAO getGoodsRealDAO();

	public abstract void setGoodsRealDAO(GoodsRealDAO goodsRealDAO);

	public abstract UserAddressDAO getUserAddressDAO();

	public abstract void setUserAddressDAO(UserAddressDAO userAddressDAO);

	/**
	 * 获取待确认订单
	 * @return
	 */
	public abstract String getUnconfirmedOrders();

	public abstract String getUnconfirmOrder();

	/**
	 * 用户进行订单确认
	 * @return
	 */
	public abstract String confirmOrders();

	/**
	 * 获取订单(这里的订单追踪是针对实际的订单追踪)追踪信息
	 * @return
	 */
	public abstract String getOrderTracking();

	/**
	 * 获取未完成的订单
	 * @return
	 */
	public abstract String getUnfinishedOrders();

	/**
	 * 获取成功订单
	 * @return
	 */
	public abstract String getHistoryOrder();

	public abstract String addOrder();

}
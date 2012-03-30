package main.com.yourantao.aimeili.action;

import main.com.yourantao.aimeili.bean.GoodsRealDAO;
import main.com.yourantao.aimeili.bean.OrderDAO;
import main.com.yourantao.aimeili.bean.OrderGoodsDAO;
import main.com.yourantao.aimeili.bean.ShoppingCartDAO;
import main.com.yourantao.aimeili.bean.UserAddressDAO;
import main.com.yourantao.aimeili.bean.UserFavoriteDAO;

public interface OrderInterface {

	// spring 机制要使用的getter/setter
	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.OrderInterface#getOrderDAO()
	 */
	public abstract OrderDAO getOrderDAO();

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.OrderInterface#setOrderDAO(main.com
	 * .yourantao.aimeili.bean.OrderDAO)
	 */
	public abstract void setOrderDAO(OrderDAO orderDAO);

	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.OrderInterface#getOrderGoodsDAO()
	 */
	public abstract OrderGoodsDAO getOrderGoodsDAO();

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.OrderInterface#setOrderGoodsDAO(main
	 * .com.yourantao.aimeili.bean.OrderGoodsDAO)
	 */
	public abstract void setOrderGoodsDAO(OrderGoodsDAO orderGoodsDAO);

	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.OrderInterface#getGoodsRealDAO()
	 */
	public abstract GoodsRealDAO getGoodsRealDAO();

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.OrderInterface#setGoodsRealDAO(main
	 * .com.yourantao.aimeili.bean.GoodsRealDAO)
	 */
	public abstract void setGoodsRealDAO(GoodsRealDAO goodsRealDAO);

	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.OrderInterface#getUserAddressDAO()
	 */
	public abstract UserAddressDAO getUserAddressDAO();

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.OrderInterface#setUserAddressDAO(main
	 * .com.yourantao.aimeili.bean.UserAddressDAO)
	 */
	public abstract void setUserAddressDAO(UserAddressDAO userAddressDAO);

	public abstract ShoppingCartDAO getShoppingCartDAO();

	public abstract void setShoppingCartDAO(ShoppingCartDAO shoppingCartDAO);
	
	public abstract UserFavoriteDAO getUserFavoriteDAO();

	public abstract void setUserFavoriteDAO(UserFavoriteDAO userFavoriteDAO);
	
	/**
	 * 获取各种类型订单的数量
	 * 这里只有待确认订单/历史订单的数量
	 * @return
	 */
	public abstract String fetchCountOverview();

	/**
	 * 获取未确认的订单
	 */
	public abstract String fetchUnconfirmedOrders();

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
	public abstract String fetchUnfinishedOrders();

	/**
	 * 获取成功订单
	 * 
	 * @return
	 */
	public abstract String fetchHistoryOrders();
	/**
	 * 检查商品状态
	 * 
	 * @return
	 */
	public abstract String examOrderGoods();
	/**
	 * 提交订单,需要计算出当前所有的商品的总金额,并与实际的商品总金额比较
	 * 
	 * @return
	 */
	public abstract String addOrder();

	/**
	 * 删除订单中的某一件商品,可能导致订单整体删除
	 * @return
	 */
	public abstract String deleteGoods();
	
	// 以下是小编的接口
	/*
	 * 获取未完成的且没有被管理员处理过的订单
	 */
	public abstract String setConfirmPhoneForEditor();
	public abstract String deleteGoodsForEditor();
	public abstract String deleteOrderForEditor();
	public abstract String acceptPriceForEditor();
	public abstract String modifyQuantityForEditor();
	public abstract String addRelatedNumForEditor();
	public abstract String getUserInOrder();
	public abstract String getUserOrder();
	public abstract String getSpecificOrderForEditor();
}
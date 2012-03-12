package main.com.yourantao.aimeili.action;

import java.util.List;

import main.com.yourantao.aimeili.bean.OrderDAO;
import main.com.yourantao.aimeili.bean.OrderGoodsDAO;
import main.com.yourantao.aimeili.conf.Constant;


public class OrderAction extends BaseAction implements Constant{
		private OrderDAO orderDAO;
		private OrderGoodsDAO orderGoodsDAO;
		//spring 机制要使用的getter/setter
		public OrderDAO getOrderDAO() {
			return orderDAO;
		}
		public void setOrderDAO(OrderDAO orderDAO) {
			this.orderDAO = orderDAO;
		}
		public OrderGoodsDAO getOrderGoodsDAO() {
			return orderGoodsDAO;
		}
		public void setOrderGoodsDAO(OrderGoodsDAO orderGoodsDAO) {
			this.orderGoodsDAO = orderGoodsDAO;
		}
		/**
		 * 获取待确认订单
		 * @return
		 */
		public String getUnconfirmedOrder()
		{
			int userId = getIntegerParameter(USER_ID);
			//
			List result = orderDAO.findByUserId(userId);
			//这样直接返回会有问题,需要进行其他操作
			printArray(result);
			//
			return null;
		}
		/**
		 * 获取订单中商品
		 * @return
		 */
		public String getOrderProduct()
		{
			int orderId = getIntegerParameter(ORDER_ID);
			List orderGoods =orderGoodsDAO.findByOrderId(orderId);
			//这样直接返回会有问题,需要进行其他操作
			
			//
			return null;
		}
		public String getOrderTracking()
		{
			String orderRelatedNUM = getStringParameter("");//undefined constant
			//这里开始从某个地方获取特定的订单追踪信息
			//
			return null;
		}
		/**
		 * 获取未完成的订单
		 * @return
		 */
		public String getUnfinishedOrder()
		{
			return null;
		}
		/**
		 * 获取成功订单
		 * @return
		 */
		public String getHistoryOrder()
		{
			return null;
		}
}

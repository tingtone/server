package main.com.yourantao.aimeili.action;

import java.util.List;

import main.com.yourantao.aimeili.bean.GoodsRealDAO;
import main.com.yourantao.aimeili.bean.Order;
import main.com.yourantao.aimeili.bean.OrderDAO;
import main.com.yourantao.aimeili.bean.OrderGoodsDAO;
import main.com.yourantao.aimeili.conf.Constant;


public class OrderAction extends BaseAction implements Constant{
		private OrderDAO orderDAO;
		private OrderGoodsDAO orderGoodsDAO;
		private GoodsRealDAO goodsRealDAO;
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
		public GoodsRealDAO getGoodsRealDAO() {
			return goodsRealDAO;
		}
		public void setGoodsRealDAO(GoodsRealDAO goodsRealDAO) {
			this.goodsRealDAO = goodsRealDAO;
		}
		/**
		 * 获取待确认订单
		 * @return
		 */
		public String getUnconfirmedOrder()
		{
			//获取参数
			int userId = getIntegerParameter(USER_ID);
			//需要定义什么样的状态是待确认的订单
			Order orderExample = new Order();
			orderExample.setUserId(userId);
			orderExample.setHandled((short)1);//这里只是查找出部分数据,自己手动写hql
			String hql = "select orderId,userId,orderNum,addressId,providerId from Order "
				+ "where userId="+ userId +" and finish=0 and handled != 0";
			//getHibernateTemplate().find(hql);
			//orderExample.setHandled((short)2);
			//orderExample.setHandled((short)3);
			orderExample.setFinish((short)0);//未收货
			List result = orderDAO.findByExample(orderExample);
			//
			//这样直接返回会有问题,需要进行其他操作
			printArray(result);
			//
			return null;
		}
		public String confirmOrder()
		{
			//获取参数
			int userId = getIntegerParameter(USER_ID);
			int orderId = getIntegerParameter(ORDER_ID);
			return null;
		}
		/**
		 * 获取订单中商品
		 * 摒弃不用
		 * @return
		 */
		public String getOrderProduct()
		{
			int orderId = getIntegerParameter(ORDER_ID);
			List orderGoods =orderGoodsDAO.findByOrderId(orderId);
			//这样直接返回会有问题,需要进行其他操作
			return null;
		}
		/**
		 * 获取订单(这里的订单追踪是针对实际的订单追踪)追踪信息
		 * @return
		 */
		public String getOrderTracking()
		{
			int orderId = getIntegerParameter(ORDER_ID);
			Order order = orderDAO.findById(orderId);
			order.getOrderNum();//这个实际的商城的订单号
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
			//获取参数
			int userId = getIntegerParameter(USER_ID);
			return null;
		}
		/**
		 * 获取成功订单
		 * @return
		 */
		public String getHistoryOrder()
		{
			//获取参数
			int userId = getIntegerParameter(USER_ID);
			return null;
		}
}

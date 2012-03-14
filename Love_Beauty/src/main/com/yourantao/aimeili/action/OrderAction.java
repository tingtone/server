package main.com.yourantao.aimeili.action;

import java.util.List;

import main.com.yourantao.aimeili.bean.GoodsRealDAO;
import main.com.yourantao.aimeili.bean.Order;
import main.com.yourantao.aimeili.bean.OrderDAO;
import main.com.yourantao.aimeili.bean.OrderGoodsDAO;
import main.com.yourantao.aimeili.bean.UserAddress;
import main.com.yourantao.aimeili.bean.UserAddressDAO;
import main.com.yourantao.aimeili.conf.Constant;
import main.com.yourantao.aimeili.vo.OrderView;


public class OrderAction extends BaseAction implements Constant{
		private OrderDAO orderDAO;
		private OrderGoodsDAO orderGoodsDAO;
		private GoodsRealDAO goodsRealDAO;
		private UserAddressDAO userAddressDAO;
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
		public UserAddressDAO getUserAddressDAO() {
			return userAddressDAO;
		}
		public void setUserAddressDAO(UserAddressDAO userAddressDAO) {
			this.userAddressDAO = userAddressDAO;
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
			String hql = "select orderId,orderNum,addressId,providerId from Order "
				+ "where userId="+ userId +" and finish=0 and handled != 0";
			//getHibernateTemplate().find(hql);
			//orderExample.setHandled((short)2);
			//orderExample.setHandled((short)3);
			orderExample.setFinish((short)0);//未收货
			List result = orderDAO.findByExample(orderExample);//这里假设取出来的就是result
			for(int index=0; index <result.size(); index++)
			{
				OrderView orderView = new OrderView();
				List tmp = (List) result.get(0);
				orderView.setOrderId((Integer) tmp.get(0));//
				orderView.setProvideId((Integer) tmp.get(0));//
				int handled =(Integer) tmp.get(0);
				orderView.setOrderHandled(handled);
				switch(handled)
				{
				case 1://管理员未处理
					//无预计到达时间
					//无最新订单时间
					//无最新订单状态
					break;
				case 2://管理员电话确认
					//同上
					break;
				case 3://管理员已经处理
					//所有字段都可以
					//订单最新状态从何处获取
					break;
				default:
				}
				UserAddress userAddress = userAddressDAO.findById((Integer)tmp.get(0));
				orderView.setAddress(
						userAddress.getProvince()+ userAddress.getCity() 
					+ userAddress.getDistrict()+ userAddress.getDetail());
				
			}
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
			//
			Order order = orderDAO.findById(orderId);
			if(order.getHandled() == 3)
			{
				order.setFinish((short) 3);
				orderDAO.merge(order);
				//outputString("");
			}
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
		public String addOrder()
		{
			//获取参数
			int userId = getIntegerParameter(USER_ID);
			return null;
		}
}

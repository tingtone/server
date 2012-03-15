package main.com.yourantao.aimeili.action;

import java.util.ArrayList;
import java.util.List;

import main.com.yourantao.aimeili.bean.GoodsReal;
import main.com.yourantao.aimeili.bean.GoodsRealDAO;
import main.com.yourantao.aimeili.bean.Order;
import main.com.yourantao.aimeili.bean.OrderDAO;
import main.com.yourantao.aimeili.bean.OrderGoods;
import main.com.yourantao.aimeili.bean.OrderGoodsDAO;
import main.com.yourantao.aimeili.bean.UserAddress;
import main.com.yourantao.aimeili.bean.UserAddressDAO;
import main.com.yourantao.aimeili.conf.Constant;
import main.com.yourantao.aimeili.vo.GoodsRealSimpleView;
import main.com.yourantao.aimeili.vo.OrderSimpleView;
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
		public String getUnconfirmedOrders()
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
			List<OrderSimpleView> orderSimpleViewList= new ArrayList<OrderSimpleView>();
			for(int index=0; index <result.size(); index++)
			{
				OrderSimpleView orderSimpleView = new OrderSimpleView();
				List tmp = (List) result.get(0);//指定index
				int handled =(Integer) tmp.get(0);//指定index
				orderSimpleView.setOrderHandled(handled);
				if(handled == 3)
				{
					//管理员已经下单,应该可以获得对应预计到达时间
					orderSimpleView.setArrivalTime("");//这里从某处获取对应的预计到达时间
				}
				orderSimpleView.setTime((String)tmp.get(0));//设置对应时间,这个时间可以代表多个含义
				//下面计算订单中所有商品的金额
				List<OrderGoods> orderGoodsList = orderGoodsDAO.findByOrderId((Integer)tmp.get(0));
				float sumary = (float) 0.0;
				for(int index2 = 0; index2 < orderGoodsList.size(); index2++)
				{
					OrderGoods orderGoods = orderGoodsList.get(index2);
					GoodsReal goodsReal = goodsRealDAO.findById(orderGoods.getGoodsRealId());
					sumary += (orderGoods.getCount()*goodsReal.getGoodsPrice());
				}
				orderSimpleView.setOrderSumary(sumary);
				//添加某一个araayList中
				orderSimpleViewList.add(orderSimpleView);
			}
			printArray(orderSimpleViewList);
			//
			return null;
		}
		public String getUnconfirmOrder()
		{
			//获取参数
			int userId = getIntegerParameter(USER_ID);
			int orderId = getIntegerParameter(ORDER_ID);
			//
			Order order = orderDAO.findById(orderId);
			//进行验证?
			//
			OrderView orderView = new OrderView();
			orderView.setOrderId(order.getOrderId());//
			orderView.setProviderId(order.getProviderId());//
			orderView.setOrderNum(order.getOrderNum());
			int handled = order.getHandled();
			orderView.setOrderHandled(handled);
			orderView.setHandledTime(order.getHandledTime().toString());
			
			List<OrderGoods> orderGoodsList = orderGoodsDAO.findByOrderId(order.getOrderId());
			List<GoodsRealSimpleView> goodsRealSimpleViewList = new ArrayList<GoodsRealSimpleView>();
			float sumary = (float)0;
			for(int index=0; index < orderGoodsList.size(); index++)
			{
				OrderGoods orderGoods = orderGoodsList.get(index);
				
				GoodsReal goodsReal = goodsRealDAO.findById(orderGoods.getGoodsRealId());
				
				//
				sumary += (goodsReal.getGoodsPrice()* orderGoods.getCount());
				
				GoodsRealSimpleView goodsRealSimpleView = new GoodsRealSimpleView();
				goodsRealSimpleView.setGoodsName(goodsReal.getGoodsName());
				goodsRealSimpleView.setGoodsContent(goodsReal.getGoodsContent());
				goodsRealSimpleView.setGoodsPrice(goodsReal.getGoodsPrice());
				goodsRealSimpleView.setGoodsCount(orderGoods.getCount());
				goodsRealSimpleView.setGoodsThumb(goodsReal.getGoodsThumb());
				//添加到
				goodsRealSimpleViewList.add(goodsRealSimpleView);
			}
			orderView.setOrderSumary(sumary);
			orderView.setGoods(goodsRealSimpleViewList);
			switch(handled)
			{
			case 1://管理员未处理
				//有orderNum
				//无relateNum
				//无预计到达时间
				//无最新订单时间
				//无最新订单状态
				//break;
			case 2://管理员电话确认
				//同上
				break;
			case 3://管理员已经处理
				//订单最新状态从何处获取
				//orderView.setTraceTime("");
				//orderView.setTraceDesc("");
				//预计到达时间
				//orderView.setOrderArrivalTime("");
				break;
			default:
				outputString("msg:error in handled");
				return null;
			}
			UserAddress userAddress = userAddressDAO.findById(order.getAddressId());
			orderView.setName(userAddress.getReceiver());
			orderView.setAddress(
					userAddress.getProvince()+ userAddress.getCity() 
				+ userAddress.getDistrict()+ userAddress.getDetail());
			orderView.setMobile(userAddress.getMobile());
			printObject(orderView);
			return null;
		}
		/**
		 * 用户进行订单确认
		 * @return
		 */
		public String confirmOrders()
		{
			//获取参数
			int userId = getIntegerParameter(USER_ID);
			int orderId = getIntegerParameter(ORDER_ID);
			Order order = orderDAO.findById(orderId);
			//验证是否合法
			if(order.getUserId() == userId)
			{
				outputString("msg:order is not your order");
				return null;
			}
			if(order.getHandled() == 3)
			{
				//用户确认之后需要进行更新操作
				order.setFinish((short) 3);
				orderDAO.merge(order);
				
				outputString("");
			}
			else
			{
				outputString("msg:订单不存在或订单未完成或请等待管理员处理");
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
		public String getUnfinishedOrders()
		{
			//获取参数
			int userId = getIntegerParameter(USER_ID);
			Order orderExample = new Order();
			orderExample.setUserId(userId);
			orderExample.setHandled((short)0);
			List<Order> result = orderDAO.findByExample(orderExample);
			List<OrderView> orderViewList = new ArrayList<OrderView>();
			for(int index=0; index < result.size(); index++)
			{
				Order order = result.get(index);
				OrderView orderView = new OrderView();
				orderView.setOrderId(order.getOrderId());
				//orderView.set
			}
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

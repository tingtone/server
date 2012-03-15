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
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.OrderInterface#getOrderDAO()
		 */
		public OrderDAO getOrderDAO() {
			return orderDAO;
		}
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.OrderInterface#setOrderDAO(main.com.yourantao.aimeili.bean.OrderDAO)
		 */
		public void setOrderDAO(OrderDAO orderDAO) {
			this.orderDAO = orderDAO;
		}
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.OrderInterface#getOrderGoodsDAO()
		 */
		public OrderGoodsDAO getOrderGoodsDAO() {
			return orderGoodsDAO;
		}
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.OrderInterface#setOrderGoodsDAO(main.com.yourantao.aimeili.bean.OrderGoodsDAO)
		 */
		public void setOrderGoodsDAO(OrderGoodsDAO orderGoodsDAO) {
			this.orderGoodsDAO = orderGoodsDAO;
		}
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.OrderInterface#getGoodsRealDAO()
		 */
		public GoodsRealDAO getGoodsRealDAO() {
			return goodsRealDAO;
		}
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.OrderInterface#setGoodsRealDAO(main.com.yourantao.aimeili.bean.GoodsRealDAO)
		 */
		public void setGoodsRealDAO(GoodsRealDAO goodsRealDAO) {
			this.goodsRealDAO = goodsRealDAO;
		}
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.OrderInterface#getUserAddressDAO()
		 */
		public UserAddressDAO getUserAddressDAO() {
			return userAddressDAO;
		}
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.OrderInterface#setUserAddressDAO(main.com.yourantao.aimeili.bean.UserAddressDAO)
		 */
		public void setUserAddressDAO(UserAddressDAO userAddressDAO) {
			this.userAddressDAO = userAddressDAO;
		}
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.OrderInterface#getUnconfirmedOrders()
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
				orderSimpleView.setOrderSumary((Float)tmp.get(0));//指定index
				//orderSimpleView.setOrderSumary(sumary);
				//添加某一个araayList中
				orderSimpleViewList.add(orderSimpleView);
			}
			printArray(orderSimpleViewList);
			//
			return null;
		}
		/**
		 * 获取指定的未确认的订单
		 * @return
		 */
		public String getUnconfirmedOrder()
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
			//float sumary = (float)0;
			for(int index=0; index < orderGoodsList.size(); index++)
			{
				OrderGoods orderGoods = orderGoodsList.get(index);
				
				GoodsReal goodsReal = goodsRealDAO.findById(orderGoods.getGoodsRealId());
				
				//
				//sumary += (goodsReal.getGoodsPrice()* orderGoods.getCount());
				
				GoodsRealSimpleView goodsRealSimpleView = new GoodsRealSimpleView();
				goodsRealSimpleView.setGoodsName(goodsReal.getGoodsName());
				goodsRealSimpleView.setGoodsContent(goodsReal.getGoodsContent());
				goodsRealSimpleView.setGoodsPrice(goodsReal.getGoodsPrice());
				goodsRealSimpleView.setGoodsCount(orderGoods.getCount());
				goodsRealSimpleView.setGoodsThumb(goodsReal.getGoodsThumb());
				//添加到
				goodsRealSimpleViewList.add(goodsRealSimpleView);
			}
			//orderView.setOrderSumary(sumary);
			orderView.setOrderSumary(order.getOrderSum());

			orderView.setGoods(goodsRealSimpleViewList);
			switch(handled)
			{
			case 1://管理员未处理
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
		 * 用户进行收货确认
		 * @return
		 */
		public String confirmOrders()
		{
			//获取参数
			int userId = getIntegerParameter(USER_ID);
			int orderId = getIntegerParameter(ORDER_ID);
			String orderNum = getStringParameter(ORDER_NUM);
			Order order = orderDAO.findById(orderId);
			//验证是否合法
			if(order.getUserId() == userId && order.getOrderNum().equals(orderNum))
			{
				outputString("msg:this order is not yours");
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
				outputString("{'msg':'订单不存在或订单未完成或请等待管理员处理'}");
			}
			return null;
		}
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.OrderInterface#getOrderTracking()
		 */
		public String getOrderTracking()
		{
			//获取参数
			int userId = getIntegerParameter(USER_ID);
			int orderId = getIntegerParameter(ORDER_ID);
			String orderNum = getStringParameter(ORDER_NUM);
			Order order = orderDAO.findById(orderId);
			//验证是否合法
			if(order.getUserId() == userId && order.getOrderNum().equals(orderNum))
			{
				outputString("{'msg':'订单不匹配'}");
				return null;
			}
			//下面是从某处获取所有的订单信息
			order.getRelatedNum();//根据这个进行查找
			//这里开始从某个地方获取特定的订单追踪信息
			//
			return null;
		}
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.OrderInterface#getUnfinishedOrders()
		 */
		public String getUnfinishedOrders()
		{
			//获取参数
			int userId = getIntegerParameter(USER_ID);
			//需要定义什么样的状态是未完成的订单
			Order orderExample = new Order();
			orderExample.setUserId(userId);
			orderExample.setHandled((short)1);//这里只是查找出部分数据,自己手动写hql
			//String hql = "select orderId,orderNum,providerId from Order "
			//	+ "where userId="+ userId +" and finish=0 and handled = 1";
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
				//管理员未下单,无预计到达时间
				//orderSimpleView.setArrivalTime("");//这里从某处获取对应的预计到达时间
				orderSimpleView.setTime((String)tmp.get(0));//设置对应时间,这个时间可以代表多个含义
				//下面计算订单中所有商品的金额
				List<OrderGoods> orderGoodsList = orderGoodsDAO.findByOrderId((Integer)tmp.get(0));
				//float sumary = (float) 0.0;
				for(int index2 = 0; index2 < orderGoodsList.size(); index2++)
				{
					OrderGoods orderGoods = orderGoodsList.get(index2);
					GoodsReal goodsReal = goodsRealDAO.findById(orderGoods.getGoodsRealId());
					//sumary += (orderGoods.getCount()*goodsReal.getGoodsPrice());
				}
				//orderSimpleView.setOrderSumary(sumary);
				orderSimpleView.setOrderSumary((Float)tmp.get(0));//指定index

				//添加某一个araayList中
				orderSimpleViewList.add(orderSimpleView);
			}
			printArray(orderSimpleViewList);
			//
			return null;
		}
		/**
		 * 获取指定的未完成的订单
		 * @return
		 */
		public String getUnfinishedOrder()
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
			if(handled != 0)
			{
				outputString("{'msg':'订单不匹配'}");
				return null;
			}
			orderView.setOrderHandled(handled);
			orderView.setHandledTime(order.getHandledTime().toString());
			
			List<OrderGoods> orderGoodsList = orderGoodsDAO.findByOrderId(order.getOrderId());
			List<GoodsRealSimpleView> goodsRealSimpleViewList = new ArrayList<GoodsRealSimpleView>();
			//float sumary = (float)0;
			for(int index=0; index < orderGoodsList.size(); index++)
			{
				OrderGoods orderGoods = orderGoodsList.get(index);
				
				GoodsReal goodsReal = goodsRealDAO.findById(orderGoods.getGoodsRealId());
				
				//
				//sumary += (goodsReal.getGoodsPrice()* orderGoods.getCount());
				
				GoodsRealSimpleView goodsRealSimpleView = new GoodsRealSimpleView();
				goodsRealSimpleView.setGoodsName(goodsReal.getGoodsName());
				goodsRealSimpleView.setGoodsContent(goodsReal.getGoodsContent());
				goodsRealSimpleView.setGoodsPrice(goodsReal.getGoodsPrice());
				goodsRealSimpleView.setGoodsCount(orderGoods.getCount());
				goodsRealSimpleView.setGoodsThumb(goodsReal.getGoodsThumb());
				//添加到
				goodsRealSimpleViewList.add(goodsRealSimpleView);
			}
			//orderView.setOrderSumary(sumary);
			orderView.setOrderSumary(order.getOrderSum());
			orderView.setGoods(goodsRealSimpleViewList);
			
			printObject(orderView);
			return null;
		}
		
		/**
		 * 获取成功订单
		 * @return
		 */
		public String getHistoryOrders()
		{
			//获取参数
			int userId = getIntegerParameter(USER_ID);
			//需要定义什么样的状态是待确认的订单
			Order orderExample = new Order();
			orderExample.setUserId(userId);
			orderExample.setHandled((short)3);//这里只是查找出部分数据,自己手动写hql
			//String hql = "select orderId,orderNum,addressId,providerId from Order "
				//+ "where userId="+ userId +" and finish=3 and handled = 3";
			//getHibernateTemplate().find(hql);
			//orderExample.setHandled((short)2);
			//orderExample.setHandled((short)3);
			orderExample.setFinish((short)3);//收货
			List result = orderDAO.findByExample(orderExample);
			List<OrderSimpleView> orderSimpleViewList= new ArrayList<OrderSimpleView>();
			for(int index=0; index <result.size(); index++)
			{
				OrderSimpleView orderSimpleView = new OrderSimpleView();
				List tmp = (List) result.get(0);//指定index
				int handled =(Integer) tmp.get(0);//指定index
				orderSimpleView.setOrderHandled(handled);
				
				orderSimpleView.setTime((String)tmp.get(0));//设置对应时间,这个时间可以代表多个含义
				//下面计算订单中所有商品	的金额
				List<OrderGoods> orderGoodsList = orderGoodsDAO.findByOrderId((Integer)tmp.get(0));
				float sumary = (float) 0.0;
				for(int index2 = 0; index2 < orderGoodsList.size(); index2++)
				{
					OrderGoods orderGoods = orderGoodsList.get(index2);
					GoodsReal goodsReal = goodsRealDAO.findById(orderGoods.getGoodsRealId());
					sumary += (orderGoods.getCount()*goodsReal.getGoodsPrice());
				}
				//orderSimpleView.setOrderSumary(sumary);
				orderSimpleView.setOrderSumary((Float)tmp.get(0));//指定index
				//orderView.setOrderSumary(order.getOrderSum());

				//添加某一个araayList中
				orderSimpleViewList.add(orderSimpleView);
			}
			printArray(orderSimpleViewList);
			//
			return null;
		}
		public String getHistoryOrder()
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
			//int handled = order.getHandled();
			//orderView.setOrderHandled(handled);
			//orderView.setHandledTime(order.getHandledTime().toString());
			
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
			orderView.setOrderSumary(order.getOrderSum());
			orderView.setGoods(goodsRealSimpleViewList);
			return null;
		}
		/**
		 * 提交订单,不一定是下单,需要计算出当前所有的商品的总金额
		 * @return
		 */
		public String addOrder()
		{
			String msg="";
			//获取参数
			int userId = getIntegerParameter(USER_ID);
			int providerId = getIntegerParameter(PROVIDER_ID);
			//若存在addressId说明这是在下单
			//如果addressId为null说明只是保存订单
			Integer addressId = getIntegerParameter("");//
			//复杂参数
			String goodsRealIdString = getStringParameter("idlist");
			String countString = getStringParameter("countlist");
			String[] goodsRealIdList= goodsRealIdString.split(",");
			String[] countList = countString.split(",");
			if(goodsRealIdList.length != countList.length)
			{
				outputString("{'msg':'goods与count不匹配'}");
				return null;
			}
			//下单
			Order order = new Order();
			order.setUserId(userId);
			order.setFinish((short)0);//设置未收货
			order.setProviderId(providerId);
			if(addressId == null)
			{
				//说明这是一个未完成订单
				order.setHandled((short)0);
				//order.setHandledTime();
			}
			else
			{
				//说明这是一个完整的订单
				order.setHandled((short)1);
				//
				String paymentType = getStringParameter("");//
				String deliverType = getStringParameter("");//
				String deliverTime = getStringParameter("");//
				int invoice = getIntegerParameter("");//
				order.setAddressId(addressId);
				order.setPaymentType("货到付款");
				order.setDeliverType("送货上门");
				order.setDeliverTime(deliverTime);
				order.setInvoice((short) invoice);
				//order.setHandledTime();
				//产生订单号
				//计算总价格
			}
			
			//order.setAddTime();//添加编辑时间
			//通过某种方式保存记录,并获得orderId
			float sumary = (float)0;
			for(int index = 0; index < goodsRealIdList.length; index++)
			{
				OrderGoods orderGoods = new OrderGoods();
				int count = Integer.valueOf(countList[index]);
				orderGoods.setCount(count);
				int goodsRealId = Integer.valueOf(goodsRealIdList[index]);
				orderGoods.setGoodsRealId(goodsRealId);
				goodsRealDAO.findById(goodsRealId);
				orderGoods.setOrderId(order.getOrderId());//这里需要已经知道orderId
				orderGoodsDAO.save(orderGoods);
			}
			if(addressId != null)
			{
				order.setOrderSum(sumary);
				orderDAO.merge(order);
			}
			//计算
			outputString(msg);
			return null;
		}
		/**
		 * 删除订单中的某一件商品,可能导致订单整体删除
		 * @return
		 */
		public String deleteGoods()
		{
			String msg = "";
			//获取参数
			int userId = getIntegerParameter(USER_ID);
			int orderId = getIntegerParameter(ORDER_ID);
			int goodsRealId = getIntegerParameter(GOODS_REAL_ID);
			//验证参数合法性
			Order order = orderDAO.findById(orderId);
			if(order.getHandled() == 3 || order.getFinish() == 3)
			{
				//管理员下单之后就无法更改了
				outputString("{'msg':'已经下单或已经收货,无法更改'}");
				return null;
			}
			OrderGoods orderGoodsExample = new OrderGoods();
			orderGoodsExample.setOrderId(orderId);
			orderGoodsExample.setGoodsRealId(goodsRealId);
			List<OrderGoods> orderGoodsList = orderGoodsDAO.findByExample(orderGoodsExample);
			if(orderGoodsList.size() == 0)
			{
				outputString("{'msg':'不存在这样的订单商品'}");
				return null;
			}
			for(OrderGoods orderGoods: orderGoodsList)
			{
				//这里应该有且只有一条记录
				orderGoodsDAO.delete(orderGoods);//使用是否正确待定
			}
			//判断订单中是否还有商品
			//
			
			//
			outputString(msg);
			return null;
		}
		/**
		 * 更新订单中的总金额信息
		 * @return
		 */
		public String updateOrderSum()
		{
			//获取参数
			int userId = getIntegerParameter(USER_ID);
			int orderId = getIntegerParameter(ORDER_ID);
			
			return null;
		}
		/**
		 * 提交订单的地址信息/送货方式,另外一种下单提交方式,同样要计算
		 * @return
		 */
		public String addOrderDetail()
		{
			//
			int userId = getIntegerParameter(USER_ID);
			int orderId = getIntegerParameter(ORDER_ID);
			int addressId = getIntegerParameter("");//
			//订单的其他信息
			//见addOrder方法中的提交完整订单时获取的数据
			Order order = orderDAO.findById(orderId);
			if(order.getUserId() != userId || order.getHandled() != 0)
			{
				outputString("{'msg':'订单不匹配'}");
				return null;
			}
			//
			order.setAddressId(addressId);
			order.setHandled((short)1);
			//order.setHandledTime();
			orderDAO.merge(order);
			return null;
		}
		//以下是用户地址相关的操作
		/**
		 * 增加新的用户地址
		 */
		public String addUserAddress()
		{
			//获取参数
			int userId = getIntegerParameter(USER_ID);
			//有几个字段如何处理
			//province/city/distric
			//
			String detail = getStringParameter("");
			String mobile = getStringParameter("");
			String telephone = getStringParameter("");
			String receiver = getStringParameter("");
			String zipCode = getStringParameter("");
			Integer isDefault = getIntegerParameter("");
			UserAddress userAddress = new UserAddress();
			userAddress.setUserId(userId);
			//设置其他字段
			//
			userAddressDAO.save(userAddress);
			//addressId字段是否就是自动获得？持久化之后自动获取到了addressId
			printObject(userAddress);
			return null;
		}
		/**
		 * 删除地址,这个功能可能导致数据库出现问题
		 * @return
		 */
		public String deleteUserAddress()
		{
			String msg="";
			//获取参数
			int userId = getIntegerParameter(USER_ID);
			int addressId = getIntegerParameter(ADDRESS_ID);//
			UserAddress userAddress = userAddressDAO.findById(addressId);
			if(userAddress.getUserId() == userId)
			{
				userAddressDAO.delete(userAddress);//
			}
			else
			{
				msg = "{'msg':'地址与用户不匹配'}";
			}
			outputString(msg);
			return null;
			
		}
}

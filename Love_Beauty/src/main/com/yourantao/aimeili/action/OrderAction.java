package main.com.yourantao.aimeili.action;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import main.com.yourantao.aimeili.bean.GoodsReal;
import main.com.yourantao.aimeili.bean.GoodsRealDAO;
import main.com.yourantao.aimeili.bean.Order;
import main.com.yourantao.aimeili.bean.OrderDAO;
import main.com.yourantao.aimeili.bean.OrderGoods;
import main.com.yourantao.aimeili.bean.OrderGoodsDAO;
import main.com.yourantao.aimeili.bean.ShoppingCart;
import main.com.yourantao.aimeili.bean.ShoppingCartDAO;
import main.com.yourantao.aimeili.bean.UserAddress;
import main.com.yourantao.aimeili.bean.UserAddressDAO;
import main.com.yourantao.aimeili.bean.UserLogin;
import main.com.yourantao.aimeili.conf.Constant;
import main.com.yourantao.aimeili.vo.GoodsRealSimpleView;
import main.com.yourantao.aimeili.vo.OrderSimpleView;
import main.com.yourantao.aimeili.vo.OrderTraceView;
import main.com.yourantao.aimeili.vo.OrderView;

public class OrderAction extends BaseAction implements Constant {

	private static final Logger LOG = LoggerFactory
			.getLogger(OrderAction.class);

	private OrderDAO orderDAO;
	private OrderGoodsDAO orderGoodsDAO;
	private GoodsRealDAO goodsRealDAO;
	private UserAddressDAO userAddressDAO;
	private ShoppingCartDAO shoppingCartDAO;

	// spring 机制要使用的getter/setter
	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.OrderInterface#getOrderDAO()
	 */
	public OrderDAO getOrderDAO() {
		return orderDAO;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.OrderInterface#setOrderDAO(main.com
	 * .yourantao.aimeili.bean.OrderDAO)
	 */
	public void setOrderDAO(OrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.OrderInterface#getOrderGoodsDAO()
	 */
	public OrderGoodsDAO getOrderGoodsDAO() {
		return orderGoodsDAO;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.OrderInterface#setOrderGoodsDAO(main
	 * .com.yourantao.aimeili.bean.OrderGoodsDAO)
	 */
	public void setOrderGoodsDAO(OrderGoodsDAO orderGoodsDAO) {
		this.orderGoodsDAO = orderGoodsDAO;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.OrderInterface#getGoodsRealDAO()
	 */
	public GoodsRealDAO getGoodsRealDAO() {
		return goodsRealDAO;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.OrderInterface#setGoodsRealDAO(main
	 * .com.yourantao.aimeili.bean.GoodsRealDAO)
	 */
	public void setGoodsRealDAO(GoodsRealDAO goodsRealDAO) {
		this.goodsRealDAO = goodsRealDAO;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.OrderInterface#getUserAddressDAO()
	 */
	public UserAddressDAO getUserAddressDAO() {
		return userAddressDAO;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.OrderInterface#setUserAddressDAO(main
	 * .com.yourantao.aimeili.bean.UserAddressDAO)
	 */
	public void setUserAddressDAO(UserAddressDAO userAddressDAO) {
		this.userAddressDAO = userAddressDAO;
	}

	public ShoppingCartDAO getShoppingCartDAO() {
		return shoppingCartDAO;
	}

	public void setShoppingCartDAO(ShoppingCartDAO shoppingCartDAO) {
		this.shoppingCartDAO = shoppingCartDAO;
	}

	/**
	 * 获取各种类型订单的数量
	 * 
	 * @return
	 */
	public String getOrderCount() {
		// 获取参数
		String uuid = getRequest().getParameter("uuid");
		if (uuid == null) {
			printString("{'msg':'没有设备号'}");
			return null;
		}
		List<UserLogin> userLogin = userLoginDAO.findByUuid(uuid);
		if (userLogin.size() == 0) {
			printString("{'msg':'没有该用户'}");
			return null;
		}
		int uid = userLogin.get(0).getUserId();
		// 应该自己手动写一个HQL语句进行统计
		/*
		 * List<Integer> countList = orderDAO.getOrderCount(userId); String
		 * countString = "{'unconfirmed':'" + countList.get(0) +
		 * "','unfinished':'" + countList.get(1) + "','history':'" +
		 * countList.get(2) + "'}"; outputString(countString);
		 */
		return null;
	}

	/**
	 * 获取未确认的订单
	 */
	public String getUnconfirmedOrders() {
		// 获取参数
		String uuid = getRequest().getParameter("uuid");
		if (uuid == null) {
			printString("{'msg':'没有设备号'}");
			return null;
		}
		List<UserLogin> userLogin = userLoginDAO.findByUuid(uuid);
		if (userLogin.isEmpty()) {
			printString("{'msg':'没有该用户'}");
			return null;
		}
		int userId = userLogin.get(0).getUserId();
		// 需要定义什么样的状态是待确认的订单
		List<Order> orderList = orderDAO.findUnconfirmedOrdersByUserId(userId);
		List<OrderSimpleView> orderSimpleViewList = new ArrayList<OrderSimpleView>();
		for (Order order : orderList) {
			OrderSimpleView orderSimpleView = new OrderSimpleView();
			int handled = order.getHandled();
			orderSimpleView.setOrderHandled(handled);
			if (handled == 3) {
				// 管理员已经下单,应该可以获得对应预计到达时间
				// 从某个地方获取
				orderSimpleView.setArrivalTime("");
			}
			orderSimpleView.setTime(order.getHandledTime().toString());// 设置对应时间,这个时间可以代表多个含义
			orderSimpleView.setOrderNum(order.getOrderNum());
			// 下面计算订单中所有商品的金额
			List<OrderGoods> orderGoodsList = orderGoodsDAO.findByOrderId(order
					.getOrderId());
			// float sumary = (float) 0.0;
			for (OrderGoods orderGoods : orderGoodsList) {
				GoodsReal goodsReal = goodsRealDAO.findById(orderGoods
						.getGoodsRealId());
				// sumary += (orderGoods.getCount()*goodsReal.getGoodsPrice());
			}
			orderSimpleView.setOrderSumary((Float) order.getOrderSum());
			// 添加某一个araayList中
			orderSimpleViewList.add(orderSimpleView);
		}
		printArray(orderSimpleViewList);
		//
		return null;
	}

	/**
	 * 获取指定的未确认的订单
	 * 
	 * @return
	 */
	public String getUnconfirmedOrder() {
		// 获取参数
		String uuid = getRequest().getParameter("uuid");
		if (uuid == null) {
			printString("{'msg':'没有设备号'}");
			return null;
		}
		List<UserLogin> userLogin = userLoginDAO.findByUuid(uuid);
		if (userLogin.isEmpty()) {
			printString("{'msg':'没有该用户'}");
			return null;
		}
		int userId = userLogin.get(0).getUserId();
		Integer orderId = getIntegerParameter(ORDER_ID);
		// 验证参数
		if (orderId == null) {
			printString("{'msg':'没有订单号'}");
			return null;
		}
		Order order = orderDAO.findById(orderId);
		// 进行验证
		if (order.getUserId() != userId) {
			printString("{'msg':'订单号与用户不匹配'}");
			return null;
		}
		//
		OrderView orderView = new OrderView();
		orderView.setOrderId(order.getOrderId());
		orderView.setProviderId(order.getProviderId());
		orderView.setOrderNum(order.getOrderNum());
		int handled = order.getHandled();
		orderView.setOrderHandled(handled);
		orderView.setHandledTime(order.getHandledTime().toString());

		List<OrderGoods> orderGoodsList = orderGoodsDAO.findByOrderId(order
				.getOrderId());
		List<GoodsRealSimpleView> goodsRealSimpleViewList = new ArrayList<GoodsRealSimpleView>();
		// float sumary = (float)0;
		for (OrderGoods orderGoods : orderGoodsList) {
			GoodsReal goodsReal = goodsRealDAO.findById(orderGoods
					.getGoodsRealId());
			// sumary += (goodsReal.getGoodsPrice()* orderGoods.getCount());
			GoodsRealSimpleView goodsRealSimpleView = new GoodsRealSimpleView();
			goodsRealSimpleView.setGoodsName(goodsReal.getGoodsName());
			goodsRealSimpleView.setGoodsContent(goodsReal.getGoodsContent());
			goodsRealSimpleView.setGoodsPrice(goodsReal.getGoodsPrice());
			goodsRealSimpleView.setGoodsCount(orderGoods.getCount());
			goodsRealSimpleView.setGoodsThumb(goodsReal.getGoodsThumb());
			// 添加到
			goodsRealSimpleViewList.add(goodsRealSimpleView);
		}
		orderView.setGoods(goodsRealSimpleViewList);

		// orderView.setOrderSumary(sumary);
		orderView.setOrderSumary(order.getOrderSum());

		switch (handled) {
		case 1:// 管理员未处理
			// 无relateNum
			// 无预计到达时间
			// 无最新订单时间
			// 无最新订单状态
			// break;
		case 2:// 管理员电话确认
			// 同上
			break;
		case 3:// 管理员已经处理
			// 订单最新状态从何处获取
			// orderView.setTraceTime("");
			// orderView.setTraceDesc("");
			// 预计到达时间
			// orderView.setOrderArrivalTime("");
			break;
		default:
			printString("{'msg':'handled出错'}");
			return null;
		}
		UserAddress userAddress = userAddressDAO.findById(order.getAddressId());
		orderView.setName(userAddress.getReceiver());
		orderView.setAddress(userAddress.getProvince() + userAddress.getCity()
				+ userAddress.getDistrict() + userAddress.getDetail());
		orderView.setMobile(userAddress.getMobile());
		printObject(orderView);
		return null;
	}

	/**
	 * 用户进行收货确认
	 * 
	 * @return
	 */
	public String confirmOrders() {
		// 获取参数
		String uuid = getRequest().getParameter("uuid");
		if (uuid == null) {
			printString("{'msg':'没有设备号'}");
			return null;
		}
		List<UserLogin> userLogin = userLoginDAO.findByUuid(uuid);
		if (userLogin.isEmpty()) {
			printString("{'msg':'没有该用户'}");
			return null;
		}
		int userId = userLogin.get(0).getUserId();
		Integer orderId = getIntegerParameter(ORDER_ID);
		// 验证参数
		if (orderId == null) {
			printString("{'msg':'参数个数不足'}");
			return null;
		}
		Order order = orderDAO.findById(orderId);
		// 验证是否合法
		if (order.getUserId() != userId) {
			printString("{'msg':'订单与用户不匹配'}");
			return null;
		}
		if (order.getHandled() == 3) {
			// 用户确认之后需要进行更新操作
			order.setFinish((short) 3);
			orderDAO.merge(order);
			printString("");
		} else {
			printString("{'msg':'订单不存在或订单未完成或请等待管理员处理'}");
		}
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.OrderInterface#getOrderTracking()
	 */
	public String getOrderTracking() {
		// 获取参数
		Integer userId = getIntegerParameter(USER_ID);
		Integer orderId = getIntegerParameter(ORDER_ID);
		// 验证参数
		if (userId == null || orderId == null) {
			printString("{'msg':'参数个数不足'}");
			return null;
		}
		Order order = orderDAO.findById(orderId);
		// 验证是否合法
		if (order.getUserId() != userId) {
			printString("{'msg':'订单与用户不匹配'}");
			return null;
		}
		// 下面是从某处获取所有的订单追踪信息
		OrderTraceView orderTraceView = new OrderTraceView();
		List<String> timeList = new ArrayList<String>();
		List<String> desList = new ArrayList<String>();

		// 根据这个进行查找
		order.getRelatedNum();
		// 这里开始从某个地方获取特定的订单追踪信息
		//
		orderTraceView.setTime(timeList);
		orderTraceView.setDescription(desList);
		printObject(orderTraceView);
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.OrderInterface#getUnfinishedOrders()
	 */
	public String getUnfinishedOrders() {
		// 获取参数
		String uuid = getRequest().getParameter("uuid");
		if (uuid == null) {
			printString("{'msg':'没有设备号'}");
			return null;
		}
		List<UserLogin> userLogin = userLoginDAO.findByUuid(uuid);
		if (userLogin.isEmpty()) {
			printString("{'msg':'没有该用户'}");
			return null;
		}
		int userId = userLogin.get(0).getUserId();
		List<Order> orderList = orderDAO.findUnconfirmedOrdersByUserId(userId);
		List<OrderSimpleView> orderSimpleViewList = new ArrayList<OrderSimpleView>();
		for (Order order : orderList) {
			OrderSimpleView orderSimpleView = new OrderSimpleView();
			int handled = order.getHandled();// 指定index
			orderSimpleView.setOrderHandled(handled);
			// 管理员未下单,无预计到达时间?
			// orderSimpleView.setArrivalTime("");//这里从某处获取对应的预计到达时间
			orderSimpleView.setTime(order.getHandledTime().toString());// 设置对应时间,这个时间可以代表多个含义
			// 下面计算订单中所有商品的金额
			List<OrderGoods> orderGoodsList = orderGoodsDAO.findByOrderId(order
					.getOrderId());
			// float sumary = (float) 0.0;
			for (OrderGoods orderGoods : orderGoodsList) {
				GoodsReal goodsReal = goodsRealDAO.findById(orderGoods
						.getGoodsRealId());
				// sumary += (orderGoods.getCount()*goodsReal.getGoodsPrice());
			}
			// orderSimpleView.setOrderSumary(sumary);
			orderSimpleView.setOrderSumary(order.getOrderSum());// 指定index

			// 添加某一个araayList中
			orderSimpleViewList.add(orderSimpleView);
		}

		printArray(orderSimpleViewList);
		//
		return null;
	}

	/**
	 * 获取指定的未完成的订单
	 * 
	 * @return
	 */
	public String getUnfinishedOrder() {
		// 获取参数
		String uuid = getRequest().getParameter("uuid");
		if (uuid == null) {
			printString("{'msg':'没有设备号'}");
			return null;
		}
		List<UserLogin> userLogin = userLoginDAO.findByUuid(uuid);
		if (userLogin.isEmpty()) {
			printString("{'msg':'没有该用户'}");
			return null;
		}
		int userId = userLogin.get(0).getUserId();
		Integer orderId = getIntegerParameter(ORDER_ID);
		// 验证参数
		if (orderId == null) {
			printString("{'msg':'没有订单号'}");
			return null;
		}
		Order order = orderDAO.findById(orderId);
		// 进行验证?
		if (order.getUserId() != userId) {
			printString("{'msg':'订单与用户不匹配'}");
			return null;
		}
		//
		OrderView orderView = new OrderView();
		orderView.setOrderId(order.getOrderId());//
		orderView.setProviderId(order.getProviderId());//
		orderView.setOrderNum(order.getOrderNum());
		int handled = order.getHandled();
		if (handled != 0) {
			printString("{'msg':'订单状态不匹配'}");
			return null;
		}
		orderView.setOrderHandled(handled);
		orderView.setHandledTime(order.getHandledTime().toString());

		List<OrderGoods> orderGoodsList = orderGoodsDAO.findByOrderId(order
				.getOrderId());
		List<GoodsRealSimpleView> goodsRealSimpleViewList = new ArrayList<GoodsRealSimpleView>();
		// float sumary = (float)0;
		for (OrderGoods orderGoods : orderGoodsList) {
			GoodsReal goodsReal = goodsRealDAO.findById(orderGoods
					.getGoodsRealId());

			// sumary += (goodsReal.getGoodsPrice()* orderGoods.getCount());

			GoodsRealSimpleView goodsRealSimpleView = new GoodsRealSimpleView();
			goodsRealSimpleView.setGoodsName(goodsReal.getGoodsName());
			goodsRealSimpleView.setGoodsContent(goodsReal.getGoodsContent());
			goodsRealSimpleView.setGoodsPrice(goodsReal.getGoodsPrice());
			goodsRealSimpleView.setGoodsCount(orderGoods.getCount());
			goodsRealSimpleView.setGoodsThumb(goodsReal.getGoodsThumb());
			// 添加到
			goodsRealSimpleViewList.add(goodsRealSimpleView);
		}
		// orderView.setOrderSumary(sumary);
		orderView.setOrderSumary(order.getOrderSum());
		orderView.setGoods(goodsRealSimpleViewList);

		printObject(orderView);
		return null;
	}

	/**
	 * 获取成功订单
	 * 
	 * @return
	 */
	public String getHistoryOrders() {
		// 获取参数
		String uuid = getRequest().getParameter("uuid");
		if (uuid == null) {
			printString("{'msg':'没有设备号'}");
			return null;
		}
		List<UserLogin> userLogin = userLoginDAO.findByUuid(uuid);
		if (userLogin.isEmpty()) {
			printString("{'msg':'没有该用户'}");
			return null;
		}
		int userId = userLogin.get(0).getUserId();
		// 需要定义什么样的状态是待确认的订单
		Order orderExample = new Order();
		orderExample.setUserId(userId);
		orderExample.setHandled((short) 3);
		orderExample.setFinish((short) 3);// 收货
		List<Order> orderList = orderDAO.findByExample(orderExample);
		List<OrderSimpleView> orderSimpleViewList = new ArrayList<OrderSimpleView>();
		for (Order order : orderList) {
			OrderSimpleView orderSimpleView = new OrderSimpleView();

			int handled = order.getHandled();// 指定index
			orderSimpleView.setOrderHandled(handled);

			orderSimpleView.setTime(order.getHandledTime().toString());// 设置对应时间,这个时间可以代表多个含义
			/*
			 * 下面计算订单中所有商品 的金额 List<OrderGoods> orderGoodsList =
			 * orderGoodsDAO.findByOrderId(order.getOrderId()); for(int index2 =
			 * 0; index2 < orderGoodsList.size(); index2++) { OrderGoods
			 * orderGoods = orderGoodsList.get(index2); GoodsReal goodsReal =
			 * goodsRealDAO.findById(orderGoods.getGoodsRealId()); }
			 */
			orderSimpleView.setOrderSumary(order.getOrderSum());

			// 添加某一个araayList中
			orderSimpleViewList.add(orderSimpleView);
		}
		printArray(orderSimpleViewList);
		return null;
	}

	public String getHistoryOrder() {
		// 获取参数
		String uuid = getRequest().getParameter("uuid");
		if (uuid == null) {
			printString("{'msg':'没有设备号'}");
			return null;
		}
		List<UserLogin> userLogin = userLoginDAO.findByUuid(uuid);
		if (userLogin.isEmpty()) {
			printString("{'msg':'没有该用户'}");
			return null;
		}
		int userId = userLogin.get(0).getUserId();
		Integer orderId = getIntegerParameter(ORDER_ID);
		// 验证参数
		if (orderId == null) {
			printString("{'msg':'没有订单号'}");
			return null;
		}
		Order order = orderDAO.findById(orderId);
		// 进行验证
		if (order.getUserId() != userId) {
			printString("{'msg':'订单与用户不匹配'}");
			return null;
		}

		OrderView orderView = new OrderView();
		orderView.setOrderId(order.getOrderId());//
		orderView.setProviderId(order.getProviderId());//
		// orderView.setOrderNum(order.getOrderNum());
		// int handled = order.getHandled();
		// orderView.setOrderHandled(handled);
		orderView.setHandledTime(order.getHandledTime().toString());

		List<OrderGoods> orderGoodsList = orderGoodsDAO.findByOrderId(order
				.getOrderId());
		List<GoodsRealSimpleView> goodsRealSimpleViewList = new ArrayList<GoodsRealSimpleView>();
		float sumary = (float) 0;
		for (int index = 0; index < orderGoodsList.size(); index++) {
			OrderGoods orderGoods = orderGoodsList.get(index);
			GoodsReal goodsReal = goodsRealDAO.findById(orderGoods
					.getGoodsRealId());
			//
			sumary += (goodsReal.getGoodsPrice() * orderGoods.getCount());
			GoodsRealSimpleView goodsRealSimpleView = new GoodsRealSimpleView();
			goodsRealSimpleView.setGoodsName(goodsReal.getGoodsName());
			goodsRealSimpleView.setGoodsContent(goodsReal.getGoodsContent());
			goodsRealSimpleView.setGoodsPrice(goodsReal.getGoodsPrice());
			goodsRealSimpleView.setGoodsCount(orderGoods.getCount());
			goodsRealSimpleView.setGoodsThumb(goodsReal.getGoodsThumb());
			// 添加到
			goodsRealSimpleViewList.add(goodsRealSimpleView);
		}
		orderView.setOrderSumary(order.getOrderSum());
		orderView.setGoods(goodsRealSimpleViewList);
		return null;
	}

	/**
	 * 提交订单,需要计算出当前所有的商品的总金额,并与实际的商品总金额比较 从而决定是否提醒用户价格变动信息
	 * 
	 * @return
	 */
	public String addOrder() {
		String msg = "";
		// 获取参数
		String uuid = getRequest().getParameter("uuid");
		if (uuid == null) {
			printString("{'msg':'没有设备号'}");
			return null;
		}
		List<UserLogin> userLogin = userLoginDAO.findByUuid(uuid);
		if (userLogin.isEmpty()) {
			printString("{'msg':'没有该用户'}");
			return null;
		}
		int userId = userLogin.get(0).getUserId();
		Integer providerId = getIntegerParameter(PROVIDER_ID);
		Integer addressId = getIntegerParameter(ADDRESS_ID);
		// 复杂参数
		String cartIdString = getStringParameter("cartidlist");
		String paymentType = getStringParameter("");//
		String deliverType = getStringParameter("");//
		String deliverTime = getStringParameter("");//
		Integer invoice = getIntegerParameter("");//
		// 验证参数

		if (providerId == null) {
			printString("{'msg':'没有供应商'}");
			return null;
		} else if (addressId == null) {
			printString("{'msg':'goods与count不匹配'}");
			return null;
		}
		if (paymentType == null || invoice == null || deliverType == null
				|| deliverTime == null) {
			printString("{'msg':'参数个数不足'}");

		}
		String[] cartIdList = cartIdString.split(",");
		// 下单
		Order order = new Order();
		order.setUserId(userId);
		order.setFinish((short) 0);// 设置未收货
		order.setProviderId(providerId);
		// 说明这是一个完整的订单
		order.setHandled((short) 0);
		order.setAddTime(Timestamp.valueOf(dateFormat.format(new Date())));// 添加编辑时间
		order.setHandledTime(Timestamp.valueOf(dateFormat.format(new Date())));
		//
		order.setAddressId(addressId);
		order.setPaymentType("货到付款");
		order.setDeliverType("送货上门");
		order.setDeliverTime(deliverTime);
		order.setInvoice((short) (int) invoice);
		if (invoice != 0) {
			// 保存发票内容
			// 获取参数
		}

		// 通过某种方式保存记录,并获得orderId
		orderDAO.merge(order);
		float cartSummary = 0;
		float summary = 0;
		// 从购物车转到订单中
		for (int index = 0; index < cartIdList.length; index++) {
			ShoppingCart shoppingCart = shoppingCartDAO.findById(Integer
					.valueOf(cartIdList[index]));
			if (shoppingCart != null) {
				if (shoppingCart.getUserId() == userId) {
					OrderGoods orderGoods = new OrderGoods();
					orderGoods.setGoodsRealId(shoppingCart.getGoodsRealId());
					orderGoods.setCount(shoppingCart.getCount());
					// orderGoods.setPrice(shoppingCart.getPrice());
					orderGoods.setOrderId(order.getOrderId());// 这里需要已经知道orderId
					orderGoodsDAO.save(orderGoods);

					cartSummary += (shoppingCart.getPrice() * shoppingCart
							.getCount());
					//
					GoodsReal goodsReal = goodsRealDAO.findById(shoppingCart
							.getGoodsRealId());
					summary += (goodsReal.getGoodsPrice() * shoppingCart
							.getCount());

					shoppingCartDAO.delete(shoppingCart);
				}
			}
		}
		// 判断从购物车获取的商品的金额总和与从goods_real中获取的总额是否相等,如果是返回提醒
		if (summary != cartSummary) {
			msg = "{'msg':'商品价格发生变动'}";// 这个实际上还是操作成功的结果
		}
		order.setOrderSum(cartSummary);
		orderDAO.merge(order);
		// 计算订单号

		printString(msg);
		return null;
	}

	/**
	 * 删除订单中的某一件商品,可能导致订单整体删除 摒弃不用了
	 * 
	 * @return
	 */
	public String deleteGoods() {
		String msg = "";
		// 获取参数
		String uuid = getRequest().getParameter("uuid");
		if (uuid == null) {
			printString("{'msg':'没有设备号'}");
			return null;
		}
		List<UserLogin> userLogin = userLoginDAO.findByUuid(uuid);
		if (userLogin.isEmpty()) {
			printString("{'msg':'没有该用户'}");
			return null;
		}
		int userId = userLogin.get(0).getUserId();
		int orderId = getIntegerParameter(ORDER_ID);
		int goodsRealId = getIntegerParameter(GOODS_REAL_ID);
		// 验证参数合法性
		Order order = orderDAO.findById(orderId);
		if (order.getHandled() == 3 || order.getFinish() == 3) {
			// 管理员下单之后就无法更改了
			printString("{'msg':'已经下单或已经收货,无法更改'}");
			return null;
		}
		OrderGoods orderGoodsExample = new OrderGoods();
		orderGoodsExample.setOrderId(orderId);
		orderGoodsExample.setGoodsRealId(goodsRealId);
		List<OrderGoods> orderGoodsList = orderGoodsDAO
				.findByExample(orderGoodsExample);
		if (orderGoodsList.isEmpty()) {
			msg = "{'msg':'不存在这样的订单商品'}";
			// outputString("{'msg':'不存在这样的订单商品'}");
			return null;
		} else if (orderGoodsList.size() == 1) {
			orderGoodsDAO.delete(orderGoodsList.get(0));
			// 判断订单中是否还有商品
			List<OrderGoods> orderGoodsList2 = orderGoodsDAO
					.findByOrderId(orderId);
			if (orderGoodsList2.size() > 0) {
				orderDAO.delete(order);
			}
		} else {
			msg = "{'msg':'订单中商品不是唯一的'}";
			// outputString("{'msg':'订单中商品不是唯一的'}");
		}
		//
		printString(msg);
		return null;
	}

	/**
	 * 更新订单中的总金额信息 暂时未使用
	 * 
	 * @return
	 */
	public String updateOrderSum() {
		// 获取参数
		String uuid = getRequest().getParameter("uuid");
		if (uuid == null) {
			printString("{'msg':'没有设备号'}");
			return null;
		}
		List<UserLogin> userLogin = userLoginDAO.findByUuid(uuid);
		if (userLogin.isEmpty()) {
			printString("{'msg':'没有该用户'}");
			return null;
		}
		int userId = userLogin.get(0).getUserId();
		int orderId = getIntegerParameter(ORDER_ID);

		return null;
	}

	// 以下是小编的接口
	public String getOrdersForEditor() {
		//获取参数
		Integer orderType= getIntegerParameter("ocid");
		if(orderType == null)
			return null;
		//获取未处理订单
		
		return null;
	}
}

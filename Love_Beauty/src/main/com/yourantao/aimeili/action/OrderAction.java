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

public class OrderAction extends BaseAction implements Constant, OrderInterface {

	private static final Logger LOG = LoggerFactory
			.getLogger(OrderAction.class);

	private static final String PROVIDER_SPLITER = ";";
	private static final String CART_SPLITER = ",";

	private static final int NOT_YOURS_GOODS = 4;
	private static final int PRICE_CHANGE = 3;
	private static final int GOODS_NOT_FIT = 2;
	private static final int GOODS_NOT_EXIST = 1;

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

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.OrderInterface#getShoppingCartDAO()
	 */
	public ShoppingCartDAO getShoppingCartDAO() {
		return shoppingCartDAO;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.OrderInterface#setShoppingCartDAO(main
	 * .com.yourantao.aimeili.bean.ShoppingCartDAO)
	 */
	public void setShoppingCartDAO(ShoppingCartDAO shoppingCartDAO) {
		this.shoppingCartDAO = shoppingCartDAO;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.OrderInterface#getOrderCount()
	 */
	public String getOrderCount() {

		// 获取参数
		String uuid = getStringParameter("uuid");
		if (uuid == null) {
			printString("{'msg':'没有设备号'}");
			return null;
		}
		List<UserLogin> userLogin = userLoginDAO.findByUuid(uuid);
		if (userLogin.size() == 0) {
			printString("{'msg':'没有该用户'}");
			return null;
		}
		int userId = userLogin.get(0).getUserId();
		autoConfirmOrder();
		List<Integer> countList = orderDAO.getOrderCount(userId);
		String countString = "{'unconfirmed':'" + countList.get(0)
				+ "','history':'" + countList.get(1) + "'}";

		printString(countString);

		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.OrderInterface#getUnconfirmedOrders()
	 */
	public String getUnconfirmedOrders() {

		// 获取参数
		String uuid = getStringParameter("uuid");
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
		autoConfirmOrder();
		List<Order> orderList = orderDAO.findUnconfirmedOrdersByUserId(userId);
		List<OrderView> orderViewList = new ArrayList<OrderView>();

		for (Order order : orderList) {
			OrderView orderView;
			boolean existFlag = false;
			// 利用短路求值
			if (!orderViewList.isEmpty()
					&& order.getOrderNum().equals(
							orderList.get(orderViewList.size() - 1)
									.getOrderNum())) {
				existFlag = true;
				// 最新添加的orderView =
				orderView = orderViewList.get(orderViewList.size() - 1);
			} else {
				existFlag = false;
				orderView = new OrderView();
			}

			List<GoodsRealSimpleView> goodsRealSimpleViewList = new ArrayList<GoodsRealSimpleView>();
			//
			List<OrderGoods> orderGoodsList = orderGoodsDAO.findByOrderId(order
					.getOrderId());
			// 可以验证一些参数
			// orderView.setOrderId(order.getOrderId());
			orderView.setOrderNum(order.getOrderNum());
			for (OrderGoods orderGoods : orderGoodsList) {
				GoodsRealSimpleView goodsRealSimpleView = new GoodsRealSimpleView();
				goodsRealSimpleView.setGoodsCount(orderGoods.getCount());
				goodsRealSimpleView.setGoodsId(orderGoods.getGoodsRealId());
				goodsRealSimpleView.setGoodsPrice(orderGoods.getPrice());

				GoodsReal goodsReal = goodsRealDAO.findById(orderGoods.getId());
				goodsRealSimpleView.setGoodsName(goodsReal.getGoodsName());
				goodsRealSimpleView.setGoodsThumb(goodsReal.getGoodsThumb());

				goodsRealSimpleViewList.add(goodsRealSimpleView);
			}
			OrderTraceView orderTraceView = new OrderTraceView();
			// 物流信息需要从某处获得
			// related_num相关获取

			orderView.setGoodsAndTrace(goodsRealSimpleViewList, orderTraceView,
					order.getProviderId());
			// 设置收货人相关信息
			UserAddress userAddress = userAddressDAO.findById(order
					.getAddressId());
			orderView.setAddress(userAddress.getDetail());
			orderView.setName(userAddress.getReceiver());
			orderView.setMobile(userAddress.getMobile());
			if (!existFlag) {
				orderViewList.add(orderView);
			}
		}
		printArray(orderViewList);
		//
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.OrderInterface#confirmOrders()
	 */
	public String confirmOrders() {
		String msg = "";
		// 获取参数
		String uuid = getStringParameter("uuid");
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
		//
		String orderNum = getStringParameter(ORDER_NUM);

		// 验证参数
		if (orderNum == null) {
			printString("{'msg':'参数个数不足'}");
			return null;
		}
		List<Order> orderList = orderDAO.findByOrderNum(orderNum);
		for (Order order : orderList) {
			if (order.getUserId() != userId) {
				msg = "{'msg':'订单与用户不匹配'}";
				printString(msg);
				return null;
			} else if (order.getHandled() == 3) {
				// 用户确认之后需要进行更新操作
				order.setFinish((short) 3);
				orderDAO.merge(order);
			} else {
				msg = "{'msg':'订单不存在或订单未完成或请等待管理员处理'}";
				printString(msg);
				return null;
			}
		}
		printString(msg);
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
		String uuid = getStringParameter("uuid");
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
		// 未完成订单就是购物车
		OrderView orderView = new OrderView();
		List<ShoppingCart> shoppingCartList = shoppingCartDAO
				.findByUserId(userId);
		List<GoodsRealSimpleView> goodsRealViewList1 = new ArrayList<GoodsRealSimpleView>();
		List<GoodsRealSimpleView> goodsRealViewList2 = new ArrayList<GoodsRealSimpleView>();
		List<GoodsRealSimpleView> goodsRealViewList3 = new ArrayList<GoodsRealSimpleView>();
		List<GoodsRealSimpleView> goodsRealViewList4 = new ArrayList<GoodsRealSimpleView>();
		List<GoodsRealSimpleView> goodsRealViewList5 = new ArrayList<GoodsRealSimpleView>();
		List<GoodsRealSimpleView> goodsRealViewList6 = new ArrayList<GoodsRealSimpleView>();
		for (ShoppingCart shoppingCart : shoppingCartList) {
			GoodsRealSimpleView goodsRealSimpleView = new GoodsRealSimpleView();
			goodsRealSimpleView.setGoodsId(shoppingCart.getGoodsRealId());
			goodsRealSimpleView.setGoodsPrice(shoppingCart.getPrice());
			goodsRealSimpleView.setGoodsCount(shoppingCart.getCount());
			GoodsReal goodsReal = goodsRealDAO.findById(shoppingCart
					.getGoodsRealId());
			// 判断是否存在这样的goods了
			goodsRealSimpleView.setGoodsName(goodsReal.getGoodsName());
			goodsRealSimpleView.setGoodsThumb(goodsReal.getGoodsThumb());

			switch (shoppingCart.getProviderId()) {
			case 1:
				goodsRealViewList1.add(goodsRealSimpleView);
				break;
			case 2:
				goodsRealViewList2.add(goodsRealSimpleView);
				break;
			case 3:
				goodsRealViewList3.add(goodsRealSimpleView);
				break;
			case 4:
				goodsRealViewList4.add(goodsRealSimpleView);
				break;
			case 5:
				goodsRealViewList5.add(goodsRealSimpleView);
				break;
			case 6:
				goodsRealViewList6.add(goodsRealSimpleView);
				break;
			}
		}

		orderView.setOrderGoodsList1(goodsRealViewList1);
		orderView.setOrderGoodsList2(goodsRealViewList2);
		orderView.setOrderGoodsList3(goodsRealViewList3);
		orderView.setOrderGoodsList4(goodsRealViewList3);
		orderView.setOrderGoodsList5(goodsRealViewList5);
		orderView.setOrderGoodsList6(goodsRealViewList6);

		printObject(orderView);
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.OrderInterface#getHistoryOrders()
	 */
	public String getHistoryOrders() {
		// 获取参数
		String uuid = getStringParameter("uuid");
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
		autoConfirmOrder();
		List<Order> orderList = orderDAO.findHistoryOrdersByUserId(userId);
		List<OrderView> orderViewList = new ArrayList<OrderView>();
		for (Order order : orderList) {
			OrderView orderView;
			boolean existFlag = false;
			// 利用短路求值
			if (!orderViewList.isEmpty()
					&& order.getOrderNum().equals(
							orderList.get(orderViewList.size() - 1)
									.getOrderNum())) {
				existFlag = true;
				// 最新添加的orderView =
				orderView = orderViewList.get(orderViewList.size() - 1);
			} else {
				existFlag = false;
				orderView = new OrderView();
			}

			List<GoodsRealSimpleView> goodsRealSimpleViewList = new ArrayList<GoodsRealSimpleView>();
			//
			List<OrderGoods> orderGoodsList = orderGoodsDAO.findByOrderId(order
					.getOrderId());
			orderView.setOrderNum(order.getOrderNum());
			for (OrderGoods orderGoods : orderGoodsList) {
				GoodsRealSimpleView goodsRealSimpleView = new GoodsRealSimpleView();
				goodsRealSimpleView.setGoodsCount(orderGoods.getCount());
				goodsRealSimpleView.setGoodsId(orderGoods.getGoodsRealId());
				goodsRealSimpleView.setGoodsPrice(orderGoods.getPrice());

				GoodsReal goodsReal = goodsRealDAO.findById(orderGoods.getId());
				goodsRealSimpleView.setGoodsName(goodsReal.getGoodsName());
				goodsRealSimpleView.setGoodsThumb(goodsReal.getGoodsThumb());

				goodsRealSimpleViewList.add(goodsRealSimpleView);
			}
			OrderTraceView orderTraceView = new OrderTraceView();
			// 物流信息需要从某处获得
			// related_num相关获取

			orderView.setGoodsAndTrace(goodsRealSimpleViewList, orderTraceView,
					order.getProviderId());
			// 设置收货人相关信息
			UserAddress userAddress = userAddressDAO.findById(order
					.getAddressId());
			orderView.setAddress(userAddress.getDetail());
			orderView.setName(userAddress.getReceiver());
			orderView.setMobile(userAddress.getMobile());

			if (!existFlag) {
				orderViewList.add(orderView);
			}
		}
		printArray(orderViewList);
		//
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.OrderInterface#addOrder()
	 */
	public String addOrder() {
		String msg = "";
		// 获取参数
		String uuid = getStringParameter("uuid");
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
		// Integer providerId = getIntegerParameter(PROVIDER_ID);
		Integer addressId = getIntegerParameter(ADDRESS_ID);
		// 复杂参数
		String cartIdString = getStringParameter("cartidlist");
		// System.out.println(cartIdString);
		// msg += "cartIdString is" + cartIdString;
		String providerIdString = getStringParameter("pidlist");
		// String paymentType = getStringParameter("paymenttype");
		// String deliverType = getStringParameter("deliverType");
		String deliverTime = getStringParameter("deliverTime");
		// 根据是否使用发票来决定是否接受其他参数
		Integer invoice = getIntegerParameter("invoice");
		// 验证参数
		if (providerIdString == null) {
			printString("{'msg':'没有供应商'}");
			return null;
		}
		if (addressId == null) {
			printString("{'msg':'无地址信息'}");
			return null;
		}
		if (// paymentType == null || deliverType == null ||
		deliverTime == null || invoice == null) {
			printString("{'msg':'参数个数不足'}");
			return null;
		}

		/*
		 * 为了测试可以将这个先注释掉 // 获取参数 Integer invoiceType =
		 * getIntegerParameter("invoicetype"); String invoiceContent =
		 * getStringParameter("invoicecontent"); String invoiceName =
		 * getStringParameter("invoicename"); //验证参数 if(invoice != 0 &&
		 * (invoiceContent == null || invoiceName == null || invoiceType ==
		 * null)) { printString("{'msg':'发票相关参数个数不足'}"); return null; }
		 */

		// 首先划分出各个商城的cartIdList
		String[] providerIdList = providerIdString.split(PROVIDER_SPLITER);
		String[] cartIdListList = cartIdString.split(PROVIDER_SPLITER);
		String filterResult = examOrderGoods(providerIdList, cartIdListList,
				userId);
		if (!filterResult.equals("")) {
			printString(filterResult);
			return null;
		}
		// 订单要使用的订单号
		String orderNum = "";
		for (int outerIndex = 0; outerIndex < cartIdListList.length; outerIndex++) {
			String[] cartIdList = cartIdListList[outerIndex]
					.split(CART_SPLITER);
			if (cartIdList.length == 0) {// 这里的判断不知能否起到作用
				// printString("continue");
				continue;
			}
			Order order = new Order();
			order.setUserId(userId);
			order.setFinish((short) 0);// 设置未收货

			int providerId = Integer.valueOf(providerIdList[outerIndex]);
			order.setProviderId(providerId);
			// 说明这是一个完整的订单
			order.setHandled((short) 0);
			order.setAddTime(new Timestamp(System.currentTimeMillis()));// 添加编辑时间
			order.setHandledTime(new Timestamp(System.currentTimeMillis()));
			order.setAddressId(addressId);
			// 这里以后才能设置%%%%%%%%%%%%%%%%%
			order.setPostage((float) 100);// 先使用固定邮费
			order.setRelatedNum("wodegequ");
			// 结束%%%%%%%%%%%%%%%%%
			order.setPaymentType("货到付款");
			order.setDeliverType("送货上门");
			// order.setDeliverTime(deliverTime);测试时注释掉
			order.setDeliverTime("时间不限");
			order.setInvoice((short) (int) invoice);
			/*
			 * 为了测试线注释掉 if (invoice != 0) { // 保存发票内容
			 * order.setInvoiceContent(invoiceContent);
			 * order.setInvoiceName(invoiceName);
			 * order.setInvoiceType((short)(int)invoiceType); }
			 */
			// 通过某种方式保存记录,并获得orderId
			if (orderNum.equals("")) {
				// 计算一下orderNum,之后一直使用这个
				orderNum = "aimeili" + 10 + order.getOrderId();
			}
			order.setOrderNum(orderNum);
			/*
			 * int cartIdTmp = Integer.valueOf(cartIdList[0]); ShoppingCart
			 * shoppingCartTmp = shoppingCartDAO.findById(cartIdTmp);
			 * if(shoppingCartTmp == null){ continue;//这里的作用是放置用户进行重复请求，造成订单重复 }
			 */
			orderDAO.save(order);

			float cartSummary = 0;
			//float summary = 0;
			// 从购物车转到订单中
			for (int innerIndex = 0; innerIndex < cartIdList.length; innerIndex++) {
				
				int cartId = Integer.valueOf(cartIdList[innerIndex]);
				ShoppingCart shoppingCart = shoppingCartDAO.findById(cartId);
				OrderGoods orderGoods = new OrderGoods();
				orderGoods.setGoodsRealId(shoppingCart.getGoodsRealId());
				orderGoods.setCount(shoppingCart.getCount());
				orderGoods.setPrice(shoppingCart.getPrice());
				orderGoods.setOrderId(order.getOrderId());// 这里需要已经知道orderId
				orderGoodsDAO.save(orderGoods);
				// 计算价格
				cartSummary += (shoppingCart.getPrice() * shoppingCart
						.getCount());
				//
				GoodsReal goodsReal = goodsRealDAO.findById(shoppingCart
						.getGoodsRealId());
				//summary += (goodsReal.getGoodsPrice() * shoppingCart.getCount());
				// 从购物车中删除该商品
				shoppingCartDAO.delete(shoppingCart);
			}
			/* 判断从购物车获取的商品的金额总和与从goods_real中获取的总额是否相等,如果是返回提醒
			if (summary != cartSummary) {
				msg = "{'msg':'商品价格发生变动,请等待管理员联系再改动'}";// 这个实际上还是操作成功的结果
			}
			*/
			order.setOrderSum(cartSummary);
			order.setOrderNum(orderNum);
			orderDAO.merge(order);
		}
		printString(msg);
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.OrderInterface#deleteGoods()
	 */
	public String deleteGoods() {
		String msg = "";
		// 获取参数
		String uuid = getStringParameter("uuid");
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
		}
		//
		printString(msg);
		return null;
	}

	/*
	 * 提交订单前的检查操作
	 */
	private String examOrderGoods(String[] providerIdList,
			String[] cartIdListList, int userId) {
		String msg = "";

		for (int outerIndex = 0; outerIndex < cartIdListList.length; outerIndex++) {
			int providerId = Integer.valueOf(providerIdList[outerIndex]);
			String[] goodsIdList = cartIdListList[outerIndex]
					.split(CART_SPLITER);
			for (int innerIndex = 0; innerIndex < goodsIdList.length; innerIndex++) {
				int cartId = Integer.valueOf(goodsIdList[innerIndex]);
				ShoppingCart shoppingCart = shoppingCartDAO.findById(cartId);
				if (shoppingCart != null) {
					if (shoppingCart.getUserId() != userId) {
						msg = "{'msg':'" + providerId + PROVIDER_SPLITER
								+ shoppingCart.getGoodsRealId()
								+ PROVIDER_SPLITER + NOT_YOURS_GOODS + "'}";
						;
					} else {
						GoodsReal goodsReal = goodsRealDAO
								.findById(shoppingCart.getGoodsRealId());
						if (goodsReal != null) {
							if (goodsReal.getGoodsStatus() == 6) {
								if (goodsReal.getGoodsPrice() != shoppingCart
										.getPrice()) {
									// 商品价格发生变动
									msg = "{'msg':'" + providerId
											+ PROVIDER_SPLITER
											+ shoppingCart.getGoodsRealId()
											+ PROVIDER_SPLITER + PRICE_CHANGE
											+ "'}";
								} else {
									msg = "";
								}
							} else {
								// 商品下架或者待审核
								msg = "{'msg':'" + providerId
										+ PROVIDER_SPLITER
										+ shoppingCart.getGoodsRealId()
										+ PROVIDER_SPLITER + GOODS_NOT_FIT
										+ "'}";
							}
						} else {
							// 商品不存在
							msg = "{'msg':'" + providerId + PROVIDER_SPLITER
									+ shoppingCart.getGoodsRealId()
									+ PROVIDER_SPLITER + GOODS_NOT_EXIST + "'}";
						}
					}

				} else {
					msg = "{'msg':'购物车不存在'}";
				}
			}
		}
		return msg;
	}

	/**
	 * 检测待确认收货的订单,并将其设置成收获订单,超时时间以天为单位
	 * 
	 * @return
	 */
	private void autoConfirmOrder() {
		int intval = 10;
		long intvalMillise = intval * 24 * 60 * 60 * 1000;
		List<Order> orderList = orderDAO.findUnconfirmedOrders();
		for (Order order : orderList) {
			Timestamp handledTime = order.getHandledTime();
			if (System.currentTimeMillis() - handledTime.getTime() > intvalMillise) {
				order.setFinish((short) 3);
				orderDAO.merge(order);
			}
		}
		return;
	}

	// 以下是小编的接口
	/*
	 * 获取未完成的且没有被管理员处理过的订单
	 */
	public String getOrdersForEditor() {
		// 获取参数
		Integer orderType = getIntegerParameter("ocid");
		if (orderType == null)
			return null;
		// 获取未处理订单

		return null;
	}
}

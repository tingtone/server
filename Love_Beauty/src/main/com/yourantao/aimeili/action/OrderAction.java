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
import main.com.yourantao.aimeili.bean.UserFavorite;
import main.com.yourantao.aimeili.bean.UserFavoriteDAO;
import main.com.yourantao.aimeili.bean.UserLogin;
import main.com.yourantao.aimeili.conf.Config;
import main.com.yourantao.aimeili.conf.Constant;
import main.com.yourantao.aimeili.vo.GoodsRealSimpleView; //import main.com.yourantao.aimeili.vo.OrderSimpleView;
import main.com.yourantao.aimeili.vo.GoodsRealSimpleEditorView;
import main.com.yourantao.aimeili.vo.OrderEditorView;
import main.com.yourantao.aimeili.vo.OrderTraceView;
import main.com.yourantao.aimeili.vo.OrderView;
import main.com.yourantao.aimeili.vo.UserOrderView;

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
	private UserFavoriteDAO userFavoriteDAO;

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

	public UserFavoriteDAO getUserFavoriteDAO() {
		return userFavoriteDAO;
	}

	public void setUserFavoriteDAO(UserFavoriteDAO userFavoriteDAO) {
		this.userFavoriteDAO = userFavoriteDAO;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.OrderInterface#getOrderCount()
	 */
	public String fetchCountOverview() {

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
		autoConfirmOrder();//这里自动设置订单的状态为已经收货状态是否合理
		List<Integer> countList = orderDAO.getOrderCount(userId);
		List<ShoppingCart> shoppingCartList = shoppingCartDAO
				.findByUserId(userId);
		int shoppingCount = shoppingCartList.size();
		List<UserFavorite> userFavlist = userFavoriteDAO.findByUserId(userId);
		int favCount = userFavlist.size();
		String countString = "{'favourite':'" + favCount + "','shopping':'"
				+ shoppingCount + "','unconfirm':'" + countList.get(0)
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
	public String fetchUnconfirmedOrders() {

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
			orderView.setHandled(order.getHandled());
			orderView.setHandleTime(order.getHandledTime().toString());
			orderView.setAddTime(order.getAddTime().toString());
			orderView.addOrderId(order.getOrderId());

			ArrayList<GoodsRealSimpleView> goodsRealSimpleViewList = new ArrayList<GoodsRealSimpleView>();
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

			orderView.addGoodsAndTraceList(goodsRealSimpleViewList,
					orderTraceView);
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
		if (orderList.isEmpty()) {
			msg = "{'msg':'订单号不存在'}";
			printString(msg);
			return null;
		}
		for (Order order : orderList) {
			if (order.getUserId() != userId) {
				msg = "{'msg':'订单与用户不匹配'}";
				printString(msg);
				return null;
			} else if (order.getHandled() == 3 && order.getFinish() == 0) {
				// 用户确认之后需要进行更新操作
				order.setFinish((short) 3);
				orderDAO.merge(order);
			} else {
				msg = "{'msg':'订单不存在或请等待管理员处理或已经收货'}";
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
	public String fetchUnfinishedOrders() {
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
		ArrayList<GoodsRealSimpleView> goodsRealViewList1 = new ArrayList<GoodsRealSimpleView>();
		ArrayList<GoodsRealSimpleView> goodsRealViewList2 = new ArrayList<GoodsRealSimpleView>();
		ArrayList<GoodsRealSimpleView> goodsRealViewList3 = new ArrayList<GoodsRealSimpleView>();
		ArrayList<GoodsRealSimpleView> goodsRealViewList4 = new ArrayList<GoodsRealSimpleView>();
		ArrayList<GoodsRealSimpleView> goodsRealViewList5 = new ArrayList<GoodsRealSimpleView>();
		ArrayList<GoodsRealSimpleView> goodsRealViewList6 = new ArrayList<GoodsRealSimpleView>();
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
		orderView.addGoodsList(goodsRealViewList1);
		orderView.addGoodsList(goodsRealViewList2);
		orderView.addGoodsList(goodsRealViewList3);
		orderView.addGoodsList(goodsRealViewList4);
		orderView.addGoodsList(goodsRealViewList5);
		orderView.addGoodsList(goodsRealViewList6);
		printObject(orderView);
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.OrderInterface#getHistoryOrders()
	 */
	public String fetchHistoryOrders() {
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
			orderView.setHandled(order.getHandled());
			orderView.setHandleTime(order.getHandledTime().toString());
			orderView.setAddTime(order.getAddTime().toString());
			orderView.addOrderId(order.getOrderId());
			ArrayList<GoodsRealSimpleView> goodsRealSimpleViewList = new ArrayList<GoodsRealSimpleView>();
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

			orderView.addGoodsAndTraceList(goodsRealSimpleViewList,
					orderTraceView);
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
			orderDAO.save(order);
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
			// orderDAO.save(order);

			float cartSummary = 0;
			// 从购物车转到订单中
			for (int innerIndex = 0; innerIndex < cartIdList.length; innerIndex++) {

				int cartId = Integer.valueOf(cartIdList[innerIndex]);
				ShoppingCart shoppingCart = shoppingCartDAO.findById(cartId);
				OrderGoods orderGoods = new OrderGoods();
				orderGoods.setGoodsRealId(shoppingCart.getGoodsRealId());
				orderGoods.setCount(shoppingCart.getCount());
				orderGoods.setPrice(shoppingCart.getPrice());
				orderGoods.setOrderId(order.getOrderId());// 这里需要已经知道orderId
				// 价格来源的设置
				orderGoods.setPriceType((short) 0);
				orderGoodsDAO.save(orderGoods);
				// 计算价格
				cartSummary += (shoppingCart.getPrice() * shoppingCart
						.getCount());
				//
				GoodsReal goodsReal = goodsRealDAO.findById(shoppingCart
						.getGoodsRealId());

				// 从购物车中删除该商品
				shoppingCartDAO.delete(shoppingCart);
			}

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
		if (order.getHandled() > 0 || order.getFinish() == 3) {
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
								+ cartId + PROVIDER_SPLITER + NOT_YOURS_GOODS
								+ "'}";
					} else {
						GoodsReal goodsReal = goodsRealDAO
								.findById(shoppingCart.getGoodsRealId());
						if (goodsReal != null) {
							if (goodsReal.getGoodsStatus() == 6) {
								if (Math.abs(goodsReal.getGoodsPrice()
										- shoppingCart.getPrice()) > 0.00001) {
									// 商品价格发生变动
									/*
									 * System.out.println(goodsReal.getGoodsPrice
									 * ()+" "+shoppingCart .getPrice());
									 */
									msg = "{'msg':'" + providerId
											+ PROVIDER_SPLITER + cartId
											+ PROVIDER_SPLITER + PRICE_CHANGE
											+ "'}";
								} else {
									msg = "";
								}
							} else {
								// 商品下架或者待审核
								msg = "{'msg':'" + providerId
										+ PROVIDER_SPLITER + cartId
										+ PROVIDER_SPLITER + GOODS_NOT_FIT
										+ "'}";
							}
						} else {
							// 商品不存在
							msg = "{'msg':'" + providerId + PROVIDER_SPLITER
									+ cartId + PROVIDER_SPLITER
									+ GOODS_NOT_EXIST + "'}";
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
	 */
	private void autoConfirmOrder() {
		int intval = 10;
		// long intvalMillise = intval * 24 * 60 * 60 * 1000;
		long intvalMillise = 60 * 1000;
		Order orderExample = new Order();
		orderExample.setFinish((short) 0);
		orderExample.setHandled((short) 3);
		List<Order> orderList = orderDAO.findByExample(orderExample);

		// List<Order> orderList = orderDAO.findUnconfirmedOrders();

		// System.out.println(orderList.size());
		for (Order order : orderList) {
			Timestamp handledTime = order.getHandledTime();
			if (System.currentTimeMillis() - handledTime.getTime() > intvalMillise) {
				System.out.println(System.currentTimeMillis());
				System.out.println(handledTime.getTime());
				// Order orderTmp = orderDAO.findById(order.getOrderId());
				// orderTmp.setFinish((short)3);
				// orderDAO.merge(orderTmp);
				order.setFinish((short) 3);
				orderDAO.merge(order);
			}
		}
		return;
	}

	// 以下是小编的接口
	public String getUserInOrder() {
		String msg = "";
		// 获取参数
		Integer orderType = getIntegerParameter("otype");
		if (orderType == null) {
			msg = "{'msg':'参数不足'}";
			printObject(msg);
			return null;

		}
		List<Order> orderList;
		switch (orderType) {
		case 1:
			orderList = orderDAO.getUsersAndUnconfirmedPhoneOrders();
			break;
		case 2:
			orderList = orderDAO.getUsersAndUnhandledOrders();
			break;
		default:
			orderList = orderDAO.getUsersAndUnconfirmedPhoneOrders();
			break;
		}

		List<UserOrderView> userOrderViewList = new ArrayList<UserOrderView>();
		for (Order order : orderList) {
			// intList.add(order.getUserId());
			UserOrderView userOrderView = new UserOrderView();
			userOrderView.setUserId(order.getUserId());
			userOrderView.setOrderNum(order.getOrderNum());
			userOrderViewList.add(userOrderView);
		}
		printArray(userOrderViewList);
		return null;
	}

	/*
	 * 获取未完成的且没有被管理员处理过的订单 貌似不使用了
	 * 
	 * public String getOrdersForEditor() { // 获取参数 Integer orderType =
	 * getIntegerParameter("ocid"); if (orderType == null) {
	 * 
	 * printString("{'msg':'没有订单种类'}"); return null;
	 * 
	 * } autoConfirmOrder(); // 获取未处理订单 List<Order> unhandledOrderList =
	 * orderDAO.getUnhandledOrders(); List<OrderEditorView> orderEditorViewList
	 * = new ArrayList<OrderEditorView>(); for (Order order :
	 * unhandledOrderList) { OrderEditorView orderEditorView; boolean existFlag
	 * = false; // 利用短路求值 if (!orderEditorViewList.isEmpty() &&
	 * order.getOrderNum().equals( orderEditorViewList.get(
	 * orderEditorViewList.size() - 1) .getOrderNum())) { existFlag = true; //
	 * 最新添加的orderView = orderEditorView =
	 * orderEditorViewList.get(orderEditorViewList .size() - 1); } else {
	 * existFlag = false; orderEditorView = new OrderEditorView(); } //
	 * 开始设置orderEditorView的各个字段 orderEditorView.setUserId(order.getUserId());
	 * 
	 * orderEditorView.setHandled(order.getHandled());
	 * orderEditorView.setHandleTime(order.getHandledTime().toString());
	 * orderEditorView.setAddTime(order.getAddTime().toString());
	 * 
	 * orderEditorView.addOrderId(order.getOrderId());
	 * orderEditorView.setOrderNum(order.getOrderNum());
	 * 
	 * List<GoodsRealSimpleEditorView> goodsRealSimpleEditorViewList = new
	 * ArrayList<GoodsRealSimpleEditorView>(); // List<OrderGoods>
	 * orderGoodsList = orderGoodsDAO.findByOrderId(order .getOrderId()); for
	 * (OrderGoods orderGoods : orderGoodsList) { GoodsRealSimpleEditorView
	 * goodsRealSimpleEditorView = new GoodsRealSimpleEditorView();
	 * goodsRealSimpleEditorView.setGoodsCount(orderGoods.getCount());
	 * goodsRealSimpleEditorView.setGoodsId(orderGoods .getGoodsRealId());
	 * goodsRealSimpleEditorView.setGoodsPrice(orderGoods.getPrice());
	 * 
	 * GoodsReal goodsReal = goodsRealDAO.findById(orderGoods.getId());
	 * goodsRealSimpleEditorView .setGoodsName(goodsReal.getGoodsName());
	 * goodsRealSimpleEditorView.setGoodsThumb(goodsReal .getGoodsThumb());
	 * goodsRealSimpleEditorView.setGoodsUrl(goodsReal.getGoodsUrl());
	 * goodsRealSimpleEditorView.setNewGoodsPrice(goodsReal .getGoodsPrice());
	 * 
	 * goodsRealSimpleEditorViewList.add(goodsRealSimpleEditorView);
	 * 
	 * }
	 * 
	 * orderEditorView.setGoodsList(goodsRealSimpleEditorViewList, order
	 * .getProviderId());
	 * 
	 * 
	 * UserAddress userAddress = userAddressDAO.findById(order .getAddressId());
	 * orderEditorView.setAddress(userAddress.getDetail());
	 * orderEditorView.setName(userAddress.getReceiver());
	 * orderEditorView.setMobile(userAddress.getMobile()); if (!existFlag) {
	 * orderEditorViewList.add(orderEditorView); } }
	 * 
	 * printArray(orderEditorViewList); return null; }
	 */

	/**
	 * 管理员已经电话确认 需要计算新的商品总价格和检查商品是否还有问题
	 */
	public String setConfirmPhoneForEditor() {
		// 获取参数
		// Integer userId = getIntegerParameter(USER_ID);
		String orderNum = getStringParameter(ORDER_NUM);
		if (orderNum == null) {
			printObject("{'msg':'爱美丽订单号为空'}");
			return null;
		}
		List<Order> orderList = orderDAO.findByOrderNum(orderNum);
		for (Order order : orderList) {
			if (order.getHandled() == 3)
				continue;
			// 这里计算每一个订单的新的总价格,以后都不改变了
			int orderId = order.getOrderId();
			List<OrderGoods> orderGoodsList = orderGoodsDAO
					.findByOrderId(orderId);
			float summary = 0;
			for (OrderGoods orderGoods : orderGoodsList) {
				// 这里检查数据库中的价格和实际的价格是否发生变动,主要是防止管理员无意间忽略了部分商品价格的变动
				GoodsReal goodsReal = goodsRealDAO.findById(orderGoods
						.getGoodsRealId());
				//只有对于采用数据库中价格的商品才会出现价格变动
				if (orderGoods.getPriceType() == 0
						&& Math.abs(goodsReal.getGoodsPrice()
								- orderGoods.getPrice()) > 0.00001) {
					printObject("{'msg':'订单中还存在价格变动的商品'}");
					return null;
				}
				summary += orderGoods.getCount() * orderGoods.getPrice();
			}
			order.setHandled((short) 1);
			order.setOrderSum(summary);
			orderDAO.merge(order);
		}
		printObject("{'msg':'操作结束'}");
		return null;
	}

	/**
	 * 设置订单为管理员已经处理(管理员已经下单) 貌似没有使用,而是使用的addRelatedNum函数
	 */
	/*
	 * public String setHandledForEditor() { Integer orderId =
	 * getIntegerParameter(ORDER_ID); // String orderNum =
	 * getStringParameter(ORDER_NUM); String relatedNum =
	 * getStringParameter("relatednum"); if (orderId == null) {
	 * printObject("'msg':'没有提供OrderId'"); return null; } if (relatedNum ==
	 * null) { printObject("'msg':'没有提供对应商城的订单号'"); } Order order =
	 * orderDAO.findById(orderId); if (order == null) {
	 * printObject("'msg':'没有与之对应的订单号'"); return null; }
	 * order.setRelatedNum(relatedNum); orderDAO.merge(order);
	 * 
	 * printObject("{'msg':'操作结束'}");// 可能导致错误 return null; }
	 */

	/**
	 * 删除订单中的某一个商品 暂时没有考虑删除订单中最后一个商品的问题
	 */
	public String deleteGoodsForEditor() {
		String msg = "{'msg':'done'}";
		// 获取参数
		// Integer userId = getIntegerParameter(USER_ID);
		Integer orderId = getIntegerParameter(ORDER_ID);
		Integer goodsRealId = getIntegerParameter(GOODS_REAL_ID);
		// 验证参数合法性
		if (orderId == null || goodsRealId == null) {
			printObject("{'msg':'缺少参数'}");
			// System.out.println("param error");
			return null;
		}
		Order order = orderDAO.findById(orderId);
		if (order.getHandled() > 0 || order.getFinish() == 3) {
			// 管理员下单之后就无法更改了
			printObject("{'msg':'已经下单或已经收货,无法更改'}");
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
			// return null;
		} else if (orderGoodsList.size() == 1) {
			orderGoodsDAO.delete(orderGoodsList.get(0));
			// 判断订单中是否还有商品
			List<OrderGoods> orderGoodsList2 = orderGoodsDAO
					.findByOrderId(orderId);
			if (orderGoodsList2.isEmpty()) {
				// System.out.println("order is empty");
				orderDAO.delete(order);
			}
		} else {
			msg = "{'msg':'订单中商品不是唯一的'}";
		}
		//
		printObject(msg);
		return null;
	}

	public String deleteOrderForEditor() {
		// 获取参数
		Integer orderId = getIntegerParameter(ORDER_ID);
		// 验证参数
		if (orderId == null) {
			printObject("{'msg':'参数个数不足'}");
			return null;
		}
		Order order = orderDAO.findById(orderId);
		if (order == null) {
			printObject("{'msg':'不存在这样的订单'}");
		} else {
			orderDAO.delete(order);
			printObject("{'msg':'done'}");
		}
		return null;
	}

	/**
	 * 接受订单中新的价格
	 */
	public String acceptPriceForEditor() {
		String msg = "{'msg':'操作完成'}";
		Integer orderId = getIntegerParameter(ORDER_ID);
		Integer goodsRealId = getIntegerParameter(GOODS_REAL_ID);
		Integer priceType = getIntegerParameter("type");
		// 验证参数
		if (goodsRealId == null || orderId == null || priceType == null) {
			printString("{'msg':'参数个数不足'}");
			return null;
		}
		OrderGoods orderGoodsExample = new OrderGoods();
		orderGoodsExample.setOrderId(orderId);
		orderGoodsExample.setGoodsRealId(goodsRealId);
		List<OrderGoods> orderGoodsList = orderGoodsDAO
				.findByExample(orderGoodsExample);
		if (orderGoodsList.size() == 0) {
			msg = "{'msg':'购物车不存在这样的商品'}";
		} else if (orderGoodsList.size() > 1) {
			msg = "{'msg':'购物车中存在多件商品'}";// 这样的情况不应该出现的
		} else {
			GoodsReal goodsReal = goodsRealDAO.findById(goodsRealId);
			if (goodsReal == null) {
				msg = "{'msg':'该商品不存在'}";
			} else if (goodsReal.getGoodsStatus() != 6) {
				msg = "{'msg':'该商品已下架或者待审核'}";
			} else {
				if (priceType == 1) {
					// 使用数据库中的价格
					orderGoodsList.get(0).setPrice(goodsReal.getGoodsPrice());
					orderGoodsList.get(0).setPriceType((short) 0);
				} else {
					// 使用网站的价格
					Float nPrice = Float.valueOf(getStringParameter("nprice"));
					if (nPrice == null) {
						msg = "{'msg':'没有提供网站价格'}";
						printObject(msg);
						return null;
					}
					orderGoodsList.get(0).setPrice(nPrice);
					orderGoodsList.get(0).setPriceType((short) 3);
				}
				orderGoodsDAO.merge(orderGoodsList.get(0));
			}
		}
		printObject(msg);
		return null;
	}

	/**
	 * 修改商品数量
	 */
	public String modifyQuantityForEditor() {
		String msg = "{'msg':'done'}";
		// 获取参数
		Integer orderId = getIntegerParameter(ORDER_ID);
		Integer goodsRealId = getIntegerParameter(GOODS_REAL_ID);
		Integer count = getIntegerParameter(GOODS_COUNT);
		// 验证参数
		if (orderId == null || goodsRealId == null || count == null) {
			// System.out.println("{'msg':'参数个数不足'}");
			printString("{'msg':'param not complete'}");
			return null;
		} else if (count <= 0) {
			printString("{'msg':'count must > 0'}");
			return null;
		}
		OrderGoods orderGoodsExample = new OrderGoods();
		orderGoodsExample.setGoodsRealId(goodsRealId);
		orderGoodsExample.setOrderId(orderId);
		List<OrderGoods> orderGoodsList = orderGoodsDAO
				.findByExample(orderGoodsExample);
		if (orderGoodsList.isEmpty()) {
			msg = "{'msg':'goods not in order'}";
		} else if (orderGoodsList.size() > 1) {
			msg = "{'msg':'too many goods'}";// 这种情况是不应该出现的，这里先写出来，防止出现问题
		} else {
			orderGoodsList.get(0).setCount(count);
			orderGoodsDAO.merge(orderGoodsList.get(0));
			msg = "{'msg':'done'}";
		}
		printObject(msg);
		return null;
	}

	/**
	 * 
	 */
	public String addRelatedNumForEditor() {
		Integer orderId = getIntegerParameter(ORDER_ID);
		String relatedNum = getStringParameter("relatednum");
		Integer postage = getIntegerParameter("postage");
		//
		if (orderId == null || relatedNum == null || postage == null) {
			//
			printObject("{'msg':'param not complete'}");
			return null;
		}
		Order order = orderDAO.findById(orderId);
		if (order == null) {
			printObject("{'msg':'order not exist'}");
			return null;
		} else {
			order.setHandled((short) 3);
			order.setHandledTime(new Timestamp(System.currentTimeMillis()));
			order.setRelatedNum(relatedNum);
			printObject("{'msg':'done'}");
		}
		return null;
	}

	/**
	 * 获取指定用的指定订单,利用struts2进行转发
	 */
	public String getUserOrder() {
		return "userorder";
	}

	/**
	 * 获取指定的orderNum的订单信息
	 */
	public String getSpecificOrderForEditor() {
		// Integer userId = getIntegerParameter(USER_ID);
		String orderNum = getStringParameter(ORDER_NUM);
		// 验证参数
		if (orderNum == null) {
			printObject("'msg':'参数个数不足'");
			return null;
		}

		List<Order> orderList = orderDAO.findByOrderNum(orderNum);
		if (orderList.isEmpty()) {
			printString("'msg':'没有这个订单'");// 可能有问题
			return null;
		}
		Order orderTmp = orderList.get(0);
		UserAddress userAddress = userAddressDAO.findById(orderTmp
				.getAddressId());

		OrderEditorView orderEditorView = new OrderEditorView();
		orderEditorView.setUserId(orderTmp.getUserId());
		// 这里可能要给出更加详细的信息
		orderEditorView.setAddress(userAddress.getDetail());
		orderEditorView.setMobile(userAddress.getMobile());
		orderEditorView.setName(userAddress.getReceiver());

		for (Order order : orderList) {
			int orderId = order.getOrderId();
			ArrayList<GoodsRealSimpleEditorView> goodsRealSimpleEditorViewList = new ArrayList<GoodsRealSimpleEditorView>();
			List<OrderGoods> orderGoodsList = orderGoodsDAO
					.findByOrderId(orderId);
			for (OrderGoods orderGoods : orderGoodsList) {
				GoodsRealSimpleEditorView goodsRealSimpleEditorView = new GoodsRealSimpleEditorView();
				goodsRealSimpleEditorView.setGoodsPrice(orderGoods.getPrice());
				goodsRealSimpleEditorView.setGoodsCount(orderGoods.getCount());
				goodsRealSimpleEditorView.setGoodsId(orderGoods
						.getGoodsRealId());

				GoodsReal goodsReal = goodsRealDAO.findById(orderGoods
						.getGoodsRealId());
				goodsRealSimpleEditorView
						.setGoodsName(goodsReal.getGoodsName());
				goodsRealSimpleEditorView.setGoodsThumb(goodsReal
						.getGoodsThumb());
				// System.out.println(goodsReal.getGoodsThumb());
				// 这里要修改成推广联盟的链接
				goodsRealSimpleEditorView.setGoodsUrl(getAssistURL(order
						.getProviderId())
						+ goodsReal.getGoodsUrl());
				goodsRealSimpleEditorView.setNewGoodsPrice(goodsReal
						.getGoodsPrice());
				goodsRealSimpleEditorViewList.add(goodsRealSimpleEditorView);
			}
			orderEditorView.addGoodsList(goodsRealSimpleEditorViewList);
			orderEditorView.addOrderId(orderId);

			orderEditorView.setDeliverTime(order.getDeliverTime());
			orderEditorView.setDeliverType(order.getDeliverType());
			orderEditorView.setPaymentType(order.getPaymentType());

			orderEditorView.setInvoice(order.getInvoice());
			if (order.getInvoice() == 3) {
				// 设置发票相关信息
				orderEditorView.setInvoiceContent(order.getInvoiceContent());
				orderEditorView.setInvoiceName(order.getInvoiceName());
				orderEditorView.setInvoiceType(order.getInvoiceType());
			}
		}
		printObject(orderEditorView);
		return null;
	}

	/**
	 * 将providerId换成推广链接
	 * 
	 * @return
	 */
	private String getAssistURL(int providerId) {
		String url = "";
		switch (providerId) {
		case 1:
			url = "";
			break;
		case 2:
			url = "";
			break;
		case 3:
			url = "";
			break;
		case 4:
			url = Config.JINGDONG_UNION_BASEURL;
			break;
		case 5:
			url = Config.DANGDANG_BASEURL;
			break;
		case 6:
			url = Config.JINGDONG_UNION_BASEURL;
			break;
		default:

		}
		return url;
	}

	/*
	 * 暂时不使用
	 */
	public String setConfirmOrderForEditor() {
		return null;
	}
}

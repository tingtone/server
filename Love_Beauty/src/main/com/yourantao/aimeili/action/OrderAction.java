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
	 * 这里只有待确认订单/历史订单的数量
	 * @return
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
		// 应该自己手动写一个HQL语句进行统计
		
		 List<Integer> countList = orderDAO.getOrderCount(userId);
		 String countString = "{'unconfirmed':'" + countList.get(0) +
			"','history':'" +countList.get(1) + "'}";
		 
		 printString(countString);
		 
		return null;
	}

	/**
	 * 获取未确认的订单
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
		// 需要定义什么样的状态是待确认的订单
		
		List<Order> orderList = orderDAO.findUnconfirmedOrdersByUserId(userId);
		List<OrderView> orderViewList = new ArrayList<OrderView>();
		
		for(Order order: orderList)
		{
			OrderView orderView;
			boolean existFlag = false;
			//利用短路求值
			if(!orderViewList.isEmpty() && order.getOrderNum().equals(orderList.get(orderViewList.size()-1).getOrderNum()))
			{
				existFlag  = true;
				//最新添加的orderView = 
				orderView = orderViewList.get(orderViewList.size()-1);
			}
			else{
				existFlag  = false;
				orderView = new OrderView();
			}
			
			List<GoodsRealSimpleView> goodsRealSimpleViewList = new ArrayList<GoodsRealSimpleView>();
			//
			List<OrderGoods> orderGoodsList = orderGoodsDAO.findByOrderId(order.getOrderId());
			//可以验证一些参数
			for(OrderGoods orderGoods: orderGoodsList){
				GoodsRealSimpleView goodsRealSimpleView = new GoodsRealSimpleView();
				goodsRealSimpleView.setGoodsCount(orderGoods.getCount());
				goodsRealSimpleView.setGoodsId(orderGoods.getId());
				goodsRealSimpleView.setGoodsPrice(orderGoods.getPrice());
				GoodsReal goodsReal = goodsRealDAO.findById(orderGoods.getId());
				//这里需要进行判断商品是否还在数据库中,
				//如果商品已经下架,会导致问题的存在
				goodsRealSimpleView.setGoodsName(goodsReal.getGoodsName());
				goodsRealSimpleView.setGoodsThumb(goodsReal.getGoodsThumb());
				//
				goodsRealSimpleViewList.add(goodsRealSimpleView);
			}
			OrderTraceView orderTraceView= new OrderTraceView();
			//物流信息需要从某处获得
			//related_num相关获取
			
			switch(order.getProviderId()){
			case 1:
				orderView.setOrderGoodsList1(goodsRealSimpleViewList);
				orderView.setTraceView1(orderTraceView);
				break;
			case 2:
				orderView.setOrderGoodsList2(goodsRealSimpleViewList);
				orderView.setTraceView2(orderTraceView);
				break;
			case 3:
				orderView.setOrderGoodsList3(goodsRealSimpleViewList);
				orderView.setTraceView3(orderTraceView);
				break;
			case 4:
				orderView.setOrderGoodsList4(goodsRealSimpleViewList);
				orderView.setTraceView4(orderTraceView);
				break;
			case 5:
				orderView.setOrderGoodsList5(goodsRealSimpleViewList);
				orderView.setTraceView5(orderTraceView);
				break;
			case 6:
				orderView.setOrderGoodsList6(goodsRealSimpleViewList);
				orderView.setTraceView6(orderTraceView);
				break;
			}
			//设置收货人相关信息
			UserAddress userAddress = userAddressDAO.findById(order.getAddressId());
			orderView.setAddress(userAddress.getDetail());
			orderView.setName(userAddress.getReceiver());
			orderView.setMobile(userAddress.getMobile());
			
			if(!existFlag)
			{
				orderViewList.add(orderView);
			}
		}
		printArray(orderViewList);
		//
		return null;
	}
	/**
	 * 用户进行收货确认,一个订单对应多个商城的订单,收货确认如何确定？？？？？？？
	 * 
	 * @return
	 */
	public String confirmOrders() {
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
		//摒弃了？
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
		//未完成订单就是购物车
		OrderView orderView = new OrderView();
		List<ShoppingCart> shoppingCartList = shoppingCartDAO.findByUserId(userId);
		List<GoodsRealSimpleView> goodsRealViewList1= new ArrayList<GoodsRealSimpleView>();
		List<GoodsRealSimpleView> goodsRealViewList2= new ArrayList<GoodsRealSimpleView>();
		List<GoodsRealSimpleView> goodsRealViewList3= new ArrayList<GoodsRealSimpleView>();
		List<GoodsRealSimpleView> goodsRealViewList4= new ArrayList<GoodsRealSimpleView>();
		List<GoodsRealSimpleView> goodsRealViewList5= new ArrayList<GoodsRealSimpleView>();
		List<GoodsRealSimpleView> goodsRealViewList6= new ArrayList<GoodsRealSimpleView>();
		for(ShoppingCart shoppingCart: shoppingCartList){
			GoodsRealSimpleView goodsRealSimpleView = new GoodsRealSimpleView();
			goodsRealSimpleView.setGoodsId(shoppingCart.getGoodsRealId());
			goodsRealSimpleView.setGoodsPrice(shoppingCart.getPrice());
			goodsRealSimpleView.setGoodsCount(shoppingCart.getCount());
			GoodsReal goodsReal = goodsRealDAO.findById(shoppingCart.getGoodsRealId());
			//判断是否存在这样的goods了
			goodsRealSimpleView.setGoodsName(goodsReal.getGoodsName());
			goodsRealSimpleView.setGoodsThumb(goodsReal.getGoodsThumb());
			
			switch(shoppingCart.getProviderId()){
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

	/**
	 * 获取成功订单
	 * 
	 * @return
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
		
		List<Order> orderList = orderDAO.findHistoryOrdersByUserId(userId);
		List<OrderView> orderViewList = new ArrayList<OrderView>();
		//参见getUnconfirmedOrders代码,相似度很高
		//---
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
		//Integer providerId = getIntegerParameter(PROVIDER_ID);
		Integer addressId = getIntegerParameter(ADDRESS_ID);
		// 复杂参数
		String cartIdString = getStringParameter("cartidlist");
		String providerIdString = getStringParameter("pidlist");
		String paymentType = getStringParameter("paymenttype");
		String deliverType = getStringParameter("deliverType");
		String deliverTime = getStringParameter("deliverTime");
		//根据是否使用发票来决定是否接受其他参数
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
		if (paymentType == null || deliverType == null
				|| deliverTime == null || invoice == null ) {
			printString("{'msg':'参数个数不足'}");
			return null;
		}
		
		// 获取参数
		Integer invoiceType = getIntegerParameter("invoicetype");
		String invoiceContent = getStringParameter("invoicecontent");
		String invoiceName = getStringParameter("invoicename");
		//验证参数
		if(invoice != 0 && (invoiceContent == null || invoiceName == null || invoiceType == null))
		{
			printString("{'msg':'发票相关参数个数不足'}");
			return null;
		}
		//首先划分出各个商城的cartIdList
		String[] cartIdListList = cartIdString.split(";");
		String[] providerIdList = providerIdString.split(";");
		//订单要使用的订单号
		String orderNum = "";
		for(int outerIndex = 0; outerIndex < cartIdListList.length; outerIndex++){
			if(cartIdListList[outerIndex].equals("")){
				continue;
			}
			String[] cartIdList = cartIdListList[outerIndex].split(",");
			if(cartIdList[0].equals("")){
				continue;
			}
			Order order = new Order();
			order.setUserId(userId);
			order.setFinish((short) 0);// 设置未收货
			
			int providerId = Integer.valueOf(providerIdList[outerIndex]);
			order.setProviderId(providerId);
			// 说明这是一个完整的订单
			order.setHandled((short) 0);
			order.setAddTime(Timestamp.valueOf(dateFormat.format(new Date())));// 添加编辑时间
			order.setHandledTime(Timestamp.valueOf(dateFormat.format(new Date())));
			order.setAddressId(addressId);
			order.setPaymentType("货到付款");
			order.setDeliverType("送货上门");
			order.setDeliverTime(deliverTime);
			order.setInvoice((short) (int) invoice);
			if (invoice != 0) {
				// 保存发票内容
				order.setInvoiceContent(invoiceContent);
				order.setInvoiceName(invoiceName);
				order.setInvoiceType((short)(int)invoiceType);
			}

			// 通过某种方式保存记录,并获得orderId
			orderDAO.merge(order);
			if(orderNum.equals("")){
				//计算一下orderNum,之后一直使用这个
				orderNum = order.getOrderId().toString();
			}
			float cartSummary = 0;
			float summary = 0;
			// 从购物车转到订单中
			for(int innerIndex = 0; innerIndex < cartIdList.length; innerIndex++){
				ShoppingCart shoppingCart = shoppingCartDAO.findById(Integer
						.valueOf(cartIdList[innerIndex]));
				if (shoppingCart != null) {
					if (shoppingCart.getUserId() == userId) {
						OrderGoods orderGoods = new OrderGoods();
						orderGoods.setGoodsRealId(shoppingCart.getGoodsRealId());
						orderGoods.setCount(shoppingCart.getCount());
						// orderGoods.setPrice(shoppingCart.getPrice());
						orderGoods.setOrderId(order.getOrderId());// 这里需要已经知道orderId
						orderGoodsDAO.save(orderGoods);
						//计算价格
						cartSummary += (shoppingCart.getPrice() * shoppingCart
								.getCount());
						//
						GoodsReal goodsReal = goodsRealDAO.findById(shoppingCart
								.getGoodsRealId());
						summary += (goodsReal.getGoodsPrice() * shoppingCart
								.getCount());
						//从购物车中删除该商品
						shoppingCartDAO.delete(shoppingCart);
					}
				}
			}
			// 判断从购物车获取的商品的金额总和与从goods_real中获取的总额是否相等,如果是返回提醒
			if (summary != cartSummary) {
				msg = "{'msg':'商品价格发生变动,请等待管理员联系再改动'}";// 这个实际上还是操作成功的结果
			}
			order.setOrderSum(cartSummary);
			order.setOrderNum(orderNum);
			orderDAO.merge(order);

		}
		printString(msg);
		return null;
	}

	/**
	 * 删除订单中的某一件商品,可能导致订单整体删除
	 * 管理员可能要使用这个功能,但是这种情况下就不能使用uuid来访问而是使用userId直接进行访问
	 * @return
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
			// outputString("{'msg':'订单中商品不是唯一的'}");
		}
		//
		printString(msg);
		return null;
	}


	// 以下是小编的接口
	/*
	 * 获取未完成的且没有被管理员处理过的订单
	 */
	public String getOrdersForEditor() {
		//获取参数
		Integer orderType= getIntegerParameter("ocid");
		if(orderType == null)
			return null;
		//获取未处理订单
		
		return null;
	}
}

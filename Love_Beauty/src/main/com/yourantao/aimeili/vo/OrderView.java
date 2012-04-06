package main.com.yourantao.aimeili.vo;

import java.util.ArrayList;
import java.util.List;

public class OrderView {

	// 爱美丽订单编号
	private String orderNum;
	// 处理状态
	private int handled;
	// 订单处理时间
	private String handleTime;
	// 订单提交时间
	private String addTime;
	// 订单ID
	private List<Integer> orderIdList = new ArrayList<Integer>();
	//订单商品
	private List<ShoppingCartView> shoppingCartList = new ArrayList<ShoppingCartView>();
	// 物流信息
	private List<OrderTraceView> traceList = new ArrayList<OrderTraceView>();
	// 收件人姓名
	private String name;
	// 收件人地址
	private String addressCity;
	private String addressDetail;
	
	// 收件人手机
	private String mobile;

	// 自定的setter
	public void addOrderId(int orderId) {
		this.orderIdList.add(orderId);
	}
	//自定义setter
	public void addGoods(ShoppingCartView shoppingCartView ) {
		this.shoppingCartList.add(shoppingCartView);
	}
	// 自定义setter
	public void addTraceView(OrderTraceView traceView) {
		this.traceList.add(traceView);
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public int getHandled() {
		return handled;
	}
	public void setHandled(int handled) {
		this.handled = handled;
	}
	public String getHandleTime() {
		return handleTime;
	}
	public void setHandleTime(String handleTime) {
		this.handleTime = handleTime;
	}
	public String getAddTime() {
		return addTime;
	}
	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}
	public List<Integer> getOrderIdList() {
		return orderIdList;
	}
	public void setOrderIdList(List<Integer> orderIdList) {
		this.orderIdList = orderIdList;
	}
	public List<OrderTraceView> getTraceList() {
		return traceList;
	}
	public void setTraceList(List<OrderTraceView> traceList) {
		this.traceList = traceList;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddressCity() {
		return addressCity;
	}
	public void setAddressCity(String addressCity) {
		this.addressCity = addressCity;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public List<ShoppingCartView> getGoodsList() {
		return shoppingCartList;
	}
	public void setGoodsList(List<ShoppingCartView> goodsList) {
		this.shoppingCartList = goodsList;
	}

}

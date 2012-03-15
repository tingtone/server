package main.com.yourantao.aimeili.vo;

import java.util.List;

public class OrderView {
	private Integer orderId;
	private String orderNum;
	private int orderHandled;
	//订单的金额由客户端自己完成
	private float orderSumary;
	private String handledTime;
	private String orderArrivalTime;
	//订单对应的供应商
	private int providerId;
	//订单追踪信息
	private String traceTime;
	private String traceDesc;
	//订单商品
	private List<GoodsRealSimpleView> goods;
	//订单收货人信息
	private String Name;
	private String Address;
	private String mobile;
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public int getOrderHandled() {
		return orderHandled;
	}
	public void setOrderHandled(int orderHandled) {
		this.orderHandled = orderHandled;
	}
	public float getOrderSumary() {
		return orderSumary;
	}
	public void setOrderSumary(float orderSumary) {
		this.orderSumary = orderSumary;
	}
	public String getHandledTime() {
		return handledTime;
	}
	public void setHandledTime(String handledTime) {
		this.handledTime = handledTime;
	}
	public String getOrderArrivalTime() {
		return orderArrivalTime;
	}
	public void setOrderArrivalTime(String orderArrivalTime) {
		this.orderArrivalTime = orderArrivalTime;
	}
	public int getProviderId() {
		return providerId;
	}
	public void setProviderId(int providerId) {
		this.providerId = providerId;
	}
	public String getTraceTime() {
		return traceTime;
	}
	public void setTraceTime(String traceTime) {
		this.traceTime = traceTime;
	}
	public String getTraceDesc() {
		return traceDesc;
	}
	public void setTraceDesc(String traceDesc) {
		this.traceDesc = traceDesc;
	}
	public List<GoodsRealSimpleView> getGoods() {
		return goods;
	}
	public void setGoods(List<GoodsRealSimpleView> goods) {
		this.goods = goods;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
}

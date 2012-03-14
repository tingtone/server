package main.com.yourantao.aimeili.vo;

import java.util.List;

public class OrderView {
	private Integer orderId;
	private int orderHandled;
	//订单的金额由客户端自己完成
	//private Float orderMoney;
	private String handledTime;
	private String orderArrivalTime;
	//订单对应的供应商
	private int providerId;
	//订单追踪信息
	private String trackingTime;
	private String trackingDesc;
	//订单商品
	private List<GoodsRealSimpleView> goods;
	//订单收货人信息
	private String Name;
	private String Address;
	private String phoneNumber;
	
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public String getHandledTime() {
		return handledTime;
	}
	public void setHandledTime(String handledTime) {
		this.handledTime = handledTime;
	}
	public int getProviderId() {
		return providerId;
	}
	public void setProviderId(int providerId) {
		this.providerId = providerId;
	}
	public String getOrderArrivalTime() {
		return orderArrivalTime;
	}
	public void setOrderArrivalTime(String orderArrivalTime) {
		this.orderArrivalTime = orderArrivalTime;
	}
	public int getProvideId() {
		return providerId;
	}
	public void setProvideId(int providerId) {
		this.providerId = providerId;
	}
	public String getTrackingTime() {
		return trackingTime;
	}
	public void setTrackingTime(String trackingTime) {
		this.trackingTime = trackingTime;
	}
	public String getTrackingDesc() {
		return trackingDesc;
	}
	public void setTrackingDesc(String trackingDesc) {
		this.trackingDesc = trackingDesc;
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
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public void setOrderHandled(int orderHandled) {
		this.orderHandled = orderHandled;
	}
	public int getOrderHandled() {
		return orderHandled;
	}
	
}

package main.com.yourantao.aimeili.vo;

import java.util.List;

public class OrderView {
	private Integer orderId;
	//订单的金额由客户端自己完成
	private Double orderMoney;
	private String orderTime;
	private String orderArrivalTime;
	//订单对应的供应商
	private int provideId;
	//订单追踪信息
	private String trackingTime;
	private String trackingDesc;
	//订单商品
	private List<String> goodsNameList;
	private List<String> goodsPriceList;
	private List<String> goodsThumbList;
	private List<String> goodsCountList;
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
	public Double getOrderMoney() {
		return orderMoney;
	}
	public void setOrderMoney(Double orderMoney) {
		this.orderMoney = orderMoney;
	}
	public String getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	public String getOrderArrivalTime() {
		return orderArrivalTime;
	}
	public void setOrderArrivalTime(String orderArrivalTime) {
		this.orderArrivalTime = orderArrivalTime;
	}
	public int getProvideId() {
		return provideId;
	}
	public void setProvideId(int provideId) {
		this.provideId = provideId;
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
	public List<String> getGoodsNameList() {
		return goodsNameList;
	}
	public void setGoodsNameList(List<String> goodsNameList) {
		this.goodsNameList = goodsNameList;
	}
	public List<String> getGoodsPriceList() {
		return goodsPriceList;
	}
	public void setGoodsPriceList(List<String> goodsPriceList) {
		this.goodsPriceList = goodsPriceList;
	}
	public List<String> getGoodsThumbList() {
		return goodsThumbList;
	}
	public void setGoodsThumbList(List<String> goodsThumbList) {
		this.goodsThumbList = goodsThumbList;
	}
	public List<String> getGoodsCountList() {
		return goodsCountList;
	}
	public void setGoodsCountList(List<String> goodsCountList) {
		this.goodsCountList = goodsCountList;
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
	
}

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
	// 商品和物流信息一一对应
	private List<ArrayList<GoodsRealSimpleView>> goodsList = new ArrayList<ArrayList<GoodsRealSimpleView>>(
			);
	// 物流信息
	private List<OrderTraceView> traceList = new ArrayList<OrderTraceView>();

	// 收件人姓名
	private String Name;
	// 收件人地址
	private String Address;
	// 收件人手机
	private String mobile;

	// 自定的setter
	public void addOrderId(int orderId) {
		this.orderIdList.add(orderId);
	}
	// 自定义setter
	public void addGoodsList(ArrayList<GoodsRealSimpleView> goodsList) {
		this.goodsList.add(goodsList);
	}
	// 自定义setter
	public void addGoodsAndTraceList(ArrayList<GoodsRealSimpleView> goodsList,
			OrderTraceView traceView) {
		this.goodsList.add(goodsList);
		this.traceList.add(traceView);
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
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

	public void setHandled(int handled) {
		this.handled = handled;
	}

	public int getHandled() {
		return handled;
	}

	public void setHandleTime(String handleTime) {
		this.handleTime = handleTime;
	}

	public String getHandleTime() {
		return handleTime;
	}

	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}

	public String getAddTime() {
		return addTime;
	}

	public void setOrderIdList(List<Integer> orderIdList) {
		this.orderIdList = orderIdList;
	}

	public List<Integer> getOrderIdList() {
		return orderIdList;
	}

	public List<ArrayList<GoodsRealSimpleView>> getGoodsList() {
		return goodsList;
	}

	public void setGoodsList(List<ArrayList<GoodsRealSimpleView>> goodsList) {
		this.goodsList = goodsList;
	}

	public List<OrderTraceView> getTraceList() {
		return traceList;
	}

	public void setTraceList(List<OrderTraceView> traceList) {
		this.traceList = traceList;
	}

}

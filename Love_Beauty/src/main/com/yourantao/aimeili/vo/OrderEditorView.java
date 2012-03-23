package main.com.yourantao.aimeili.vo;

import java.util.ArrayList;
import java.util.List;

public class OrderEditorView {
	// 爱美丽订单编号
	private String orderNum;
	// 用户ID
	private int userId;
	// 处理状态
	private int handled;
	// 订单处理时间
	private String handleTime;
	// 订单提交时间
	private String addTime;
	// 订单ID
	private List<Integer> orderIdList = new ArrayList<Integer>();
	// 商品和物流信息一一对应
	private List<GoodsRealSimpleEditorView> orderGoodsList1;
	private List<GoodsRealSimpleEditorView> orderGoodsList2;
	private List<GoodsRealSimpleEditorView> orderGoodsList3;
	private List<GoodsRealSimpleEditorView> orderGoodsList4;
	private List<GoodsRealSimpleEditorView> orderGoodsList5;
	private List<GoodsRealSimpleEditorView> orderGoodsList6;

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

	public void setGoodsList(List<GoodsRealSimpleEditorView> orderGoodsList,
			int providerId) {
		switch (providerId) {
		case 1:
			this.orderGoodsList1 = orderGoodsList;
			break;
		case 2:
			this.orderGoodsList2 = orderGoodsList;
			break;
		case 3:
			this.orderGoodsList3 = orderGoodsList;
			break;
		case 4:
			this.orderGoodsList4 = orderGoodsList;
			break;
		case 5:
			this.orderGoodsList5 = orderGoodsList;
			break;
		case 6:
			this.orderGoodsList6 = orderGoodsList;
			break;
		}
	}

	// 自定义setter
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

	public List<GoodsRealSimpleEditorView> getOrderGoodsList1() {
		return orderGoodsList1;
	}

	public void setOrderGoodsList1(List<GoodsRealSimpleEditorView> orderGoodsList1) {
		this.orderGoodsList1 = orderGoodsList1;
	}

	public List<GoodsRealSimpleEditorView> getOrderGoodsList2() {
		return orderGoodsList2;
	}

	public void setOrderGoodsList2(List<GoodsRealSimpleEditorView> orderGoodsList2) {
		this.orderGoodsList2 = orderGoodsList2;
	}

	public List<GoodsRealSimpleEditorView> getOrderGoodsList3() {
		return orderGoodsList3;
	}

	public void setOrderGoodsList3(List<GoodsRealSimpleEditorView> orderGoodsList3) {
		this.orderGoodsList3 = orderGoodsList3;
	}

	public List<GoodsRealSimpleEditorView> getOrderGoodsList4() {
		return orderGoodsList4;
	}

	public void setOrderGoodsList4(List<GoodsRealSimpleEditorView> orderGoodsList4) {
		this.orderGoodsList4 = orderGoodsList4;
	}

	public List<GoodsRealSimpleEditorView> getOrderGoodsList5() {
		return orderGoodsList5;
	}

	public void setOrderGoodsList5(List<GoodsRealSimpleEditorView> orderGoodsList5) {
		this.orderGoodsList5 = orderGoodsList5;
	}

	public List<GoodsRealSimpleEditorView> getOrderGoodsList6() {
		return orderGoodsList6;
	}

	public void setOrderGoodsList6(List<GoodsRealSimpleEditorView> orderGoodsList6) {
		this.orderGoodsList6 = orderGoodsList6;
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

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return userId;
	}
}

package main.com.yourantao.aimeili.vo;

import java.util.ArrayList;
import java.util.List;

public class OrderEditorView {
	// 爱美丽订单编号
	private String orderNum;
	// 用户ID
	private int userId;
	// 订单ID
	private List<Integer> orderIdList = new ArrayList<Integer>(6);
	//
	private List<ArrayList<GoodsRealSimpleEditorView>> goodsList = new ArrayList<ArrayList<GoodsRealSimpleEditorView>>(
			6);
	// 收件人姓名
	private String name;
	// 收件人地址
	private String address;
	// 收件人手机
	private String mobile;
	//
	private int invoice;
	private int invoiceType;
	private String invoiceContent;
	private String invoiceName;
	private String paymentType;
	private String deliverType;
	private String deliverTime;

	// 自定的setter
	public void addGoodsList(ArrayList<GoodsRealSimpleEditorView> goodsList) {
		this.goodsList.add(goodsList);
	}

	public void addOrderId(int orderId) {
		this.orderIdList.add(orderId);
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
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

	public void setGoodsList(
			List<ArrayList<GoodsRealSimpleEditorView>> goodsList) {
		this.goodsList = goodsList;
	}

	public List<ArrayList<GoodsRealSimpleEditorView>> getGoodsList() {
		return goodsList;
	}

	public int getInvoice() {
		return invoice;
	}

	public void setInvoice(int invoice) {
		this.invoice = invoice;
	}

	public int getInvoiceType() {
		return invoiceType;
	}

	public void setInvoiceType(int invoiceType) {
		this.invoiceType = invoiceType;
	}

	public String getInvoiceContent() {
		return invoiceContent;
	}

	public void setInvoiceContent(String invoiceContent) {
		this.invoiceContent = invoiceContent;
	}

	public String getInvoiceName() {
		return invoiceName;
	}

	public void setInvoiceName(String invoiceName) {
		this.invoiceName = invoiceName;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getDeliverType() {
		return deliverType;
	}

	public void setDeliverType(String deliverType) {
		this.deliverType = deliverType;
	}

	public String getDeliverTime() {
		return deliverTime;
	}

	public void setDeliverTime(String deliverTime) {
		this.deliverTime = deliverTime;
	}

}

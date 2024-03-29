package main.com.yourantao.aimeili.bean;

import java.sql.Timestamp;

/**
 * Order entity. @author MyEclipse Persistence Tools
 */

public class Order implements java.io.Serializable {

	// Fields

	private Integer orderId;
	private Integer userId;
	private String orderNum;
	private Float orderSum;
	private Integer addressId;
	private Float postage;
	private String paymentType;
	private String deliverType;
	private String deliverTime;
	private Short invoice;
	private Timestamp addTime;
	private Short finish;
	private Integer providerId;
	private String relatedNum;
	private Short handled;
	private Timestamp handledTime;
	private Short invoiceType;
	private String invoiceContent;
	private String invoiceName;
	private String logistics;

	// Constructors

	/** default constructor */
	public Order() {
	}

	/** minimal constructor */
	public Order(Integer userId, Integer addressId, String paymentType,
			String deliverType, String deliverTime, Short invoice,
			Timestamp addTime, Short finish, Integer providerId, Short handled,
			Timestamp handledTime) {
		this.userId = userId;
		this.addressId = addressId;
		this.paymentType = paymentType;
		this.deliverType = deliverType;
		this.deliverTime = deliverTime;
		this.invoice = invoice;
		this.addTime = addTime;
		this.finish = finish;
		this.providerId = providerId;
		this.handled = handled;
		this.handledTime = handledTime;
	}

	/** full constructor */
	public Order(Integer userId, String orderNum, Float orderSum,
			Integer addressId, Float postage, String paymentType,
			String deliverType, String deliverTime, Short invoice,
			Timestamp addTime, Short finish, Integer providerId,
			String relatedNum, Short handled, Timestamp handledTime,
			Short invoiceType, String invoiceContent, String invoiceName,
			String logistics) {
		this.userId = userId;
		this.orderNum = orderNum;
		this.orderSum = orderSum;
		this.addressId = addressId;
		this.postage = postage;
		this.paymentType = paymentType;
		this.deliverType = deliverType;
		this.deliverTime = deliverTime;
		this.invoice = invoice;
		this.addTime = addTime;
		this.finish = finish;
		this.providerId = providerId;
		this.relatedNum = relatedNum;
		this.handled = handled;
		this.handledTime = handledTime;
		this.invoiceType = invoiceType;
		this.invoiceContent = invoiceContent;
		this.invoiceName = invoiceName;
		this.logistics = logistics;
	}

	// Property accessors

	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getOrderNum() {
		return this.orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public Float getOrderSum() {
		return this.orderSum;
	}

	public void setOrderSum(Float orderSum) {
		this.orderSum = orderSum;
	}

	public Integer getAddressId() {
		return this.addressId;
	}

	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}

	public Float getPostage() {
		return this.postage;
	}

	public void setPostage(Float postage) {
		this.postage = postage;
	}

	public String getPaymentType() {
		return this.paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getDeliverType() {
		return this.deliverType;
	}

	public void setDeliverType(String deliverType) {
		this.deliverType = deliverType;
	}

	public String getDeliverTime() {
		return this.deliverTime;
	}

	public void setDeliverTime(String deliverTime) {
		this.deliverTime = deliverTime;
	}

	public Short getInvoice() {
		return this.invoice;
	}

	public void setInvoice(Short invoice) {
		this.invoice = invoice;
	}

	public Timestamp getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Timestamp addTime) {
		this.addTime = addTime;
	}

	public Short getFinish() {
		return this.finish;
	}

	public void setFinish(Short finish) {
		this.finish = finish;
	}

	public Integer getProviderId() {
		return this.providerId;
	}

	public void setProviderId(Integer providerId) {
		this.providerId = providerId;
	}

	public String getRelatedNum() {
		return this.relatedNum;
	}

	public void setRelatedNum(String relatedNum) {
		this.relatedNum = relatedNum;
	}

	public Short getHandled() {
		return this.handled;
	}

	public void setHandled(Short handled) {
		this.handled = handled;
	}

	public Timestamp getHandledTime() {
		return this.handledTime;
	}

	public void setHandledTime(Timestamp handledTime) {
		this.handledTime = handledTime;
	}

	public Short getInvoiceType() {
		return this.invoiceType;
	}

	public void setInvoiceType(Short invoiceType) {
		this.invoiceType = invoiceType;
	}

	public String getInvoiceContent() {
		return this.invoiceContent;
	}

	public void setInvoiceContent(String invoiceContent) {
		this.invoiceContent = invoiceContent;
	}

	public String getInvoiceName() {
		return this.invoiceName;
	}

	public void setInvoiceName(String invoiceName) {
		this.invoiceName = invoiceName;
	}

	public String getLogistics() {
		return this.logistics;
	}

	public void setLogistics(String logistics) {
		this.logistics = logistics;
	}

}
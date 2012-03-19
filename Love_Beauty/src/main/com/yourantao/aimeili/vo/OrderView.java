package main.com.yourantao.aimeili.vo;

import java.util.List;

public class OrderView {
	//订单ID,不显示
	private Integer orderId;
	//爱美丽订单编号
	private String orderNum;
	//订单状态
	private String orderState;
	//商品和物流信息一一对应
	private List<GoodsRealSimpleView> orderGoodsList1;
	private List<GoodsRealSimpleView> orderGoodsList2;
	private List<GoodsRealSimpleView> orderGoodsList3;
	private List<GoodsRealSimpleView> orderGoodsList4;
	private List<GoodsRealSimpleView> orderGoodsList5;
	private List<GoodsRealSimpleView> orderGoodsList6;
	//物流信息
	private OrderTraceView traceView1;
	private OrderTraceView traceView2;
	private OrderTraceView traceView3;
	private OrderTraceView traceView4;
	private OrderTraceView traceView5;
	private OrderTraceView traceView6;
	//收件人姓名
	private String Name;
	//收件人地址
	private String Address;
	//收件人手机
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
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
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
	public List<GoodsRealSimpleView> getOrderGoodsList1() {
		return orderGoodsList1;
	}
	public void setOrderGoodsList1(List<GoodsRealSimpleView> orderGoodsList1) {
		this.orderGoodsList1 = orderGoodsList1;
	}
	public List<GoodsRealSimpleView> getOrderGoodsList2() {
		return orderGoodsList2;
	}
	public void setOrderGoodsList2(List<GoodsRealSimpleView> orderGoodsList2) {
		this.orderGoodsList2 = orderGoodsList2;
	}
	public List<GoodsRealSimpleView> getOrderGoodsList3() {
		return orderGoodsList3;
	}
	public void setOrderGoodsList3(List<GoodsRealSimpleView> orderGoodsList3) {
		this.orderGoodsList3 = orderGoodsList3;
	}
	public List<GoodsRealSimpleView> getOrderGoodsList4() {
		return orderGoodsList4;
	}
	public void setOrderGoodsList4(List<GoodsRealSimpleView> orderGoodsList4) {
		this.orderGoodsList4 = orderGoodsList4;
	}
	public List<GoodsRealSimpleView> getOrderGoodsList5() {
		return orderGoodsList5;
	}
	public void setOrderGoodsList5(List<GoodsRealSimpleView> orderGoodsList5) {
		this.orderGoodsList5 = orderGoodsList5;
	}
	public List<GoodsRealSimpleView> getOrderGoodsList6() {
		return orderGoodsList6;
	}
	public void setOrderGoodsList6(List<GoodsRealSimpleView> orderGoodsList6) {
		this.orderGoodsList6 = orderGoodsList6;
	}
	public OrderTraceView getTraceView1() {
		return traceView1;
	}
	public void setTraceView1(OrderTraceView traceView1) {
		this.traceView1 = traceView1;
	}
	public OrderTraceView getTraceView2() {
		return traceView2;
	}
	public void setTraceView2(OrderTraceView traceView2) {
		this.traceView2 = traceView2;
	}
	public OrderTraceView getTraceView3() {
		return traceView3;
	}
	public void setTraceView3(OrderTraceView traceView3) {
		this.traceView3 = traceView3;
	}
	public OrderTraceView getTraceView4() {
		return traceView4;
	}
	public void setTraceView4(OrderTraceView traceView4) {
		this.traceView4 = traceView4;
	}
	public OrderTraceView getTraceView5() {
		return traceView5;
	}
	public void setTraceView5(OrderTraceView traceView5) {
		this.traceView5 = traceView5;
	}
	public OrderTraceView getTraceView6() {
		return traceView6;
	}
	public void setTraceView6(OrderTraceView traceView6) {
		this.traceView6 = traceView6;
	}
	
}

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	Integer userId = Integer.valueOf(request.getParameter("uid"));
	String orderNum = request.getParameter("ono");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>订单详情</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<style type="text/css">
table {
	text-align: center;
	font-size: 15px;
	color: red;
	border: 1px solid purple;
}

table td {
	border: 1px solid blue;
}

table b {
	border: 1px solid blue;
}

table b input {
	width: 10px;
}
</style>
		<script src="jquery1.4.2.js" type="text/javascript">
</script>
		<script type="text/javascript">
/*function TransShopName(index) {
	var shopName;
	switch (index) {
	case 0:
		shopName = "";
		break;
	case 1:
		shopName = "";
		break;
	case 2:
		shopName = "";
		break;
	case 3:
		shopName = "";
		break;
	case 4:
		shopName = "";
		break;
	case 5:
		shopName = "";
		break;
	}
	return shopName;
}*/

function modifyQuantity(index) {
	var url = BASE_SERVER + "/order_modifyQuantityForEditor";
	var grid = $('#grid' + index).val();
	var oid = $('#oid' + index).val();
	var gcount = $('#count' + index).val();
	var params = {
		"grid" : grid,
		"oid" : oid,
		"gcount" : gcount
	};
	//alert(oid+";"+grid+";"+gcount);
	var result = "";
	$.ajax( {
		type : "POST",
		data : params,
		dataType : "json",
		url : url,
		success : function(json) {
			//alert("in modifyQuantity");
		if (json == null) {
			alert("json null");
		} else {
			alert(json.msg);
		}
	}
	});
}

function acceptDatabasePrice(index) {
	var flag = confirm("确认接受该商品的数据库价格");
	if (flag == false) {
		return;
	}
	var url = BASE_SERVER + "/order_acceptPriceForEditor";
	var grid = $('#grid' + index).val();
	var oid = $('#oid' + index).val();
	var params
= {
		"grid" : grid,
		"oid" : oid,
		"type" : 1
	};
	var result = "";
	$.ajax({
				type : "POST",
				data : params,
				dataType : "json",
				url : url,
				success : function(json) {
					if (json == null) {
						alert("操作失败");
					} else {
						$('#price'+index).empty();
						var newprice = $('#newprice'+index).text();
						$('#price'+index).append(newprice);
					}
				}
				});
}
function acceptWebPrice(index) {
	var flag = confirm("确认接受该商品的网站价格");
	if (flag == false) {
		return;
	}
	var url = BASE_SERVER + "/order_acceptPriceForEditor";
	var grid = $('#grid' + index).val();
	var oid = $('#oid' + index).val();
	var newprice = $('#nprice' + index).val();
	//alert(newprice);
	var params = {
		"grid" : grid,
		"oid" : oid,
		"type" : 2,
		"nprice" : newprice
	};
	var result = "";
	$.ajax({
				type : "POST",
				data : params,
				dataType : "json",
				url : url,
				success : function(json) {
					if (json == null) {
						alert("操作失败");
					} else {
						$('#price'+index).empty();
						var newprice = $('#nprice'+index).val();
						$('#price'+index).append(newprice);
					}
				}
				});
}
function deleteGoods(index){
	var flag = confirm("确认删除该商品");
	if(flag == false){
		return;
	}
	var url = BASE_SERVER + "/order_deleteGoodsForEditor";
	var grid = $('#grid'+index).val();
	var oid = $('#oid'+index).val();
	/*alert(grid);
	alert(oid);*/
	var params = {
		"grid" : grid,
		"oid" : oid,
	};
	var result = "";
	$.ajax({
				type : "POST",
				data : params,
				dataType : "json",
				url : url,
				success : function(json) {
					if (json == null) {
						alert("json null");
					} else {
						alert(json.msg);
						if(json.msg == 'done'){
							$('#div'+index).remove();
						}
					}
				}
				});
}
function deleteOrder(index){
	var flag = confirm("确认删除该订单");
	if(flag == false){
		return;
	}
	var url = BASE_SERVER + "/order_deleteOrderForEditor";
	var oid = $('#oid'+index).val();
	var params = {
		"oid" : oid,
	};
	var result = "";
	$.ajax({
				type : "POST",
				data : params,
				dataType : "json",
				url : url,
				success : function(json) {
					if (json == null) {
						alert("json null");
					} else {
						//alert(json.msg);
						if(json.msg == 'done'){
							$('#div'+index+'o').remove();
						}
					}
				}
				});
}
function getSpecificOrder(uid, ono) {
	var url = BASE_SERVER + "/order_getSpecificOrderForEditor";
	var params = {
		"uid" : uid,
		"ono" : ono,
		"otype" : 2
	};
	var result = "";
	$
			.ajax( {
				type : "POST",
				data : params,
				dataType : "json",
				url : url,
				success : function(json) {
					if (json == null) {
						alert("json null");
					} else {
					//alert("in get specific order");
						var index = 0;
						result += "<table>"
						result += "<tr><td>收件人姓名"+json.name+"</td><td>手机"+json.mobile+"</td><td>地址"+json.address+"<td></tr>";
						result += "<tr><td>付款方式:"+json.paymentType+"</td><td>送货方式:"+json.deliverType+"</td><td>送货时间:"+json.deliverTime+"<td></tr>";
						result += "</table>";
						if(json.invoice == 3){
							result += "发票类型"+json.invoiceType+";个人/单位名称"+json.invoiceName+";发票内容:"+json.invoiceContent;
						}
						//
						for ( var oIdx = 0; oIdx < json.goodsList.length; oIdx++) {
							var goodsList = json.goodsList[oIdx];
							result += "<div id='div"+oIdx+"'o>";
							result += "<hr size='5'>";
							result += "<form>";
							result += "<input type='hidden' name='ooid" + oIdx + "' value='"
									+ json.orderIdList[oIdx] + "'/>";
							result += "<input type='button' onclick='deleteOrder(" + oIdx
									+ ")' value='删除此订单'/>";
							result += "</form>";
							for ( var mIdx = 0; mIdx < goodsList.length; mIdx++) {
								result += "+++++++++++++++"+(mIdx+1) + "+++++++++++++++";
								result += "<div id=div"+index+">";
								result += "<form>";
								result += "<input id='oid"+index+"' type='hidden' name='oid"+index+"' value='"
										+ json.orderIdList[oIdx] + "'/>";
								result += "<input id='grid"+index+"' type='hidden' name='grid"+index+"' value='"
										+ goodsList[mIdx].goodsId + "'/>"
								result += "<table>";
								result += "<tr><td>商品名称:"
										+ goodsList[mIdx].goodsName
										+ "</td></tr>";
								result += "<tr><td><img src='"
										+ goodsList[mIdx].goodsThumb
										+ "'></td></tr>";
								result += "<tr><td>购买地址<a href='"
										+ goodsList[mIdx].goodsUrl
										+ "' target='_blank'>点击导向购买</a></td></tr>";
								
								result += "<tr><td>数量修改为<input id='count"+index+"' type='text' name='count"+index+"' value='"
										+ goodsList[mIdx].goodsCount
										+ "'/></td></tr>";
								result += "<tr><td>原价格:<label id='price"+index+"'>"
										+ goodsList[mIdx].goodsPrice + "</label> 数据库中价格<label id='newprice"+index+"'>"
										+ goodsList[mIdx].newGoodsPrice+"</label> ";
								result += "商城价格<input type='text' value='0' id='nprice"+index+"'/>"
										+ "</td></tr>";
								result += "<tr><td>";
								result += "<input type='button' onclick='modifyQuantity("+index+")' value='修改数量'/>";
								result += "<input type='button' onclick='acceptDatabasePrice("+index+")' value='接受数据库价格'/>";
								result += "<input type='button' onclick='acceptWebPrice("+index+")' value='接受网站价格'/>";
								result += "<input type='button' onclick='deleteGoods("+index+")' value='删除该商品'/>";
								result += "</td></tr>";
								result += "</table>";
								result += "</form>";
								result += "</div>";
								index++;
							}
							result += "</div>";
						}
					}
					$('#result').html(result.toString());
				}
			});
}
$(document).ready(function() {
	getSpecificOrder($('#uid').val(), $('#ono').val());
	
});
</script>
	</head>

	<body>
		<%@include file="/top.jsp"%>
		<input id="uid" type="hidden" name="uid" value="<%=userId%>" />
		<input id="ono" type="hidden" name="ono" value="<%=orderNum%>" />
		<div id="result"></div>
	</body>
</html>
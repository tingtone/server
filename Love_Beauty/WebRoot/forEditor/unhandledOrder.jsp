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
function addRelatedNum(oIdx) {
	var url = BASE_SERVER + "/order_addRelatedNumForEditor";
	var oid = $('#oid' + oIdx).val();
	var relatednum = $('#relatedNum' + oIdx).val();
	//alert(oid);
	//alert(relatednum);
	var params = {
		"oid" : oid,
		"relatednum" : relatednum
	};
	var result = "";
	$.ajax( {
		type : "POST",
		data : params,
		dataType : "json",
		url : url,
		success : function(json) {
			if (json == null) {
				alert("json null");
			} else {
				alert(json.msg);
			}
		}
	});
}
function TransShopName(index) {
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
}
function getSpecificOrder(uid, ono) {
	var url = BASE_SERVER + "/order_getSpecificOrderForEditor";
	var params = {
		"uid" : uid,
		"ono" : ono,
		"otype" : 2
	};
	var result = "";
	$.ajax( {
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
		result += "收件人姓名" + json.name + ";手机" + json.mobile + ";地址"
				+ json.address + "<br/>";
		result += "付款方式:" + json.paymentType + ";送货方式:" + json.deliverType
				+ ";送货时间:" + json.deliverTime + "<br/>";
		if (json.invoice == 3) {
			result += "发票类型" + json.invoiceType + ";个人/单位名称" + json.invoiceName
					+ ";发票内容:" + json.invoiceContent;
		}
		//
		for ( var oIdx = 0; oIdx < json.goodsList.length; oIdx++) {
			var goodsList = json.goodsList[oIdx];
			result += "<hr size='5'>";
			result += "<form>";
			result += "<input type='hidden' name='ooid" + oIdx + "' value='"
					+ json.orderIdList[oIdx] + "'/>";
			//result += "商城:" + TransShopName();
			result += "商城:" + oIdx;
			result += "商城订单编号:<input type='text' id='relatedNum" + oIdx + "'/>"
			result += "<input type='button' onclick='addRelatedNum(" + oIdx
					+ ")' value='设置订单号'/>";
			result += "</form>";

			for ( var mIdx = 0; mIdx < goodsList.length; mIdx++) {
				result += "+++++++++++++++" + (mIdx + 1) + "+++++++++++++++";
				result += "<div id=div" + index + ">";
				result += "<form>";
				result += "<input id='oid" + index
						+ "' type='hidden' name='oid" + index + "' value='"
						+ json.orderIdList[oIdx] + "'/>";
				result += "<input id='grid" + index
						+ "' type='hidden' name='grid" + index + "' value='"
						+ goodsList[mIdx].goodsId + "'/>"
				result += "<table>";
				result += "<tr><td>商品名称:" + goodsList[mIdx].goodsName
						+ "</td></tr>";
				result += "<tr><td><img src='" + goodsList[mIdx].goodsThumb
						+ "'></td></tr>";
				result += "<tr><td>购买地址<a href='" + goodsList[mIdx].goodsUrl
						+ "' target='_blank'>点击导向购买</a></td></tr>";

				result += "<tr><td>数量为<label id='count" + index
						+ "' name='count" + index + "'>"
						+ goodsList[mIdx].goodsCount + "</label></td></tr>";
				result += "<tr><td>原价格:<label id='price" + index + "'>"
						+ goodsList[mIdx].goodsPrice
						+ "</label>新价格<label id='newprice" + index + "'>"
						+ goodsList[mIdx].newGoodsPrice + "</label>"
						+ "</td></tr>";
				result += "</table>";
				result += "</form>";
				result += "</div>";
				index++;
			}
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
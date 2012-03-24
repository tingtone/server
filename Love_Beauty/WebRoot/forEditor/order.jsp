<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>订单管理页面</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<script src="jquery1.4.2.js" type="text/javascript">
</script>
		<script type="text/javascript">

function getUserInOrder(orderType) {
	var url = BASE_SERVER + "/order_getUserInOrder";
	var params = {
		"orderType" : orderType
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
						for ( var oIdx = 0; oIdx < json.length; oIdx++) {
							result += "<form>";
							/*result += "<input type='hidden' id='uid' name='uid' value='"
									+ json[oIdx].userId + "'/>";
							result += "<input type='hidden' id='ono' name='ono' value='"
									+ json[oIdx].orderNum + "'/>";*/
							result += "<input type='hidden' id='uid" + oIdx
									+ "' name='uid' value='"
									+ json[oIdx].userId + "'/>";
							result += "<input type='hidden' id='ono" + oIdx
									+ "' name='ono' value='"
									+ json[oIdx].orderNum + "'/>";
							result += "<table>"
							result += "<tr><td>用户编号<label value='"
									+ json[oIdx].userId + "'>"
									+ json[oIdx].userId + "</label></td></tr>";
							result += "<tr><td>订单号<label value='"
									+ json[oIdx].orderNum + "'>"
									+ json[oIdx].orderNum
									+ "</label></td></tr>";
							result += "</table>";
							/*result += "<input type='submit' value='查看详情'/>";*/
							result += "<input type='button' onclick='getDetail("
									+ oIdx + ")' value='查看详情'/>";
							result += "<input type='button' onclick='setHandled("
									+ oIdx + ")' value='电话确认'/>";
							result += "</form>";
						}
					}
					$('#result').html(result.toString());
				}
			});
}
function getDetail(oIdx) {
	var url = BASE_SERVER + "/forEditor/userorder.jsp" + "?uid="
			+ $('#uid' + oIdx).val() + "&ono=" + $('#ono' + oIdx).val();
	//alert(url);
	window.open(url, "", "");
}
function setHandled(oIdx) {
	var url = BASE_SERVER + "/order_setConfirmPhoneForEditor";
	var ono = $('#ono'+oIdx).val();
	//alert(ono);
	var params = {
		"ono" : ono 
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
$(document).ready(function() {
	getUserInOrder($('#orderType').val());
	$('#orderType').change(function() {
		getUserInOrder($('#orderType').val());
	});
});
</script>
	</head>

	<body>
		<%@include file="/top.jsp"%>
		<select id="orderType">
			<option value=1>
				管理员未电话确认的订单
			</option>
			<option value=2>
				管理员已电话确认的订单
			</option>
		</select>
		<div id="result"></div>
	</body>
</html>

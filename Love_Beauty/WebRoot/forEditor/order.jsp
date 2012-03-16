<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单后台接口</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
	.table{
		text-align: center;
		font-size: 15px;
		color: red;
		border: 1px solid purple;
	}
	.table td{
		border: 1px solid blue;
	}
	.table b{
		border: 1px solid blue;
	}
	.table b input{
		width: 10px;
	}
	
	</style>
	<script src="jquery1.4.2.js" type="text/javascript"></script>
	<script>
	function getOrders(ocid)
	{
		var url=BASE_SERVER+"/order_getOrdersForEditor";
		var params = {"ocid",ocid};
		var order="";
		$.ajax({
				type:"POST",
				data:params,
				dataType: "json",
				url: url,
				success: function(json) {
				if(json == null){
					alert("json null");
				}else{
					order = json;
				}
				$('#result').html(order.toString());
				}
			});
	}
	$(document).ready(function(){
	
			   GetTopic_Detail($('#ordercat').val());
			   $('#ordercat').change(function(){
				GetTopic_Detail($('#ordercat').val());
			   });
			   
       });
	</script>
</head>
  
  <body>
   <%@include file="/top.jsp"%>
 <table class="table" >
 <tbody>
 	<tr>
 		<td><a href=""></a></td>
 	</tr>
 	<tr>
 		<td>订单分类：
 		<select id="ordercat">
 			<option value="1">未处理订单</option>
  			<option value="2">待确认收货订单</option>
  			<option value="3">未完成订单</option>
    		<option value="4">历史</option>
			</select>
		</td>
 	</tr>
</tbody>
</table>
<div id="result">
</div>
</body>
</html>

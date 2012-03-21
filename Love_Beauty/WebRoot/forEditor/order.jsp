<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>获取/修改商铺信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="jquery1.4.2.js" type="text/javascript"></script>
	<script type="text/javascript">
	function GetOrders(ocid){
			var url=BASE_SERVER+"/order_getOrdersForEditor";
			//parameter name undefined
			var params = {"ocid":ocid};
			var provider="";
			//var topic="";
			$.ajax({
				type:"POST",
				data:params,
				dataType: "json",
				url: url,
				success: function(json) {

				if(json == null){
					alert("json null");
				}else{
					/*provider +="<form action='provider_updateProvider' enctype='multipart/form-data' method='post'>";
					provider += "<input type=hidden name='pid' value='" +json['providerId'] +"'>";
					provider += "<table border='1'>";
					provider += "<tr><td>商铺名称</td><td>" +json['providerName'] +"</td></tr>";
					provider += "<tr><td>缩略图像</td><td><img src='" +json['providerThumb'] +"'></td></tr>";
					provider += "<tr><td>更改缩略图</td><td><input type='file' name='newprovider_thumb'></td></tr>";
					provider += "<tr><td>商铺描述</td><td><input name='pdes' type='text' value='" +json['providerDescription'] + "'></td></tr>";
					provider += "<tr><td>商铺售后服务</td><td><input name='pservice' type='text' value='" +json['providerService'] + "'></td></tr>";
					provider += "<tr><td>商铺发货</td><td><input name='pdeliver' type='text' value='" +json['providerDeliver'] + "'></td></tr>";
					provider += "<tr><td><input type='submit' value='更新'></td><td></td></tr>";
					provider += "</tr></table></form>";*/
					provider += "orderId:"+json[0]['orderIdList'][0]+ ";";
					provider += "userId:"+json[0]['userId'] + ";";
					provider += "orderNum:"+json[0]['orderNum'] + ";";
					provider += "orderGoodsId:"+ json[0]['orderGoodsList1'][0].goodsId + ";";
					provider += "<br/>";
					/*for(var i=0;i<json.length;i++){
						provider += json[i]['orderId']+ ";";
						provider += json[i]['userId'] + ";";
						provider += json[i]['orderNum'] + ";";
						provider += "<br/>";
					}*/
				}
				$('#result').html(provider.toString());
				
				}
			});
	}
	$(document).ready(function(){
			GetOrders($('#ordercat').val());
			$('#ordercat').change(function(){
				GetOrders($('#ordercat').val());
			});
       });
	</script>
  </head>
  
<body>
	<%@include file="/top.jsp"%>
<!--	<a href="forEditor/providerLocations.jsp">增加可货到付款的地址</a> <br/>-->
	<select id="ordercat">
		<option value="1">待处理订单</option>
		<option value="2"> </option>
		<option value="3"> </option>
		<option value="4"> </option>
		<!--<option value="5">当当网</option>
		<option value="6">卓越网</option>
	--></select>
    <div id="result"></div>
</body>
</html>
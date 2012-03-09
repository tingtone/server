<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			String gid=request.getParameter("gid");
	String gname=request.getParameter("goodsName");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>商品对应的真实商品</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	.tabel{
		text-align: center;
		font-size: 15px;
		color: red;
		border: 4px solid gray;
		width: 600px;
	}
	.tabel td{
		border: 1px solid blue;
		margin: 0;
		padding: 0;
	}
	.tabel b{
		border: 1px solid blue;
	}
	.tabel b input{
		width: 10px;
	}
	
	</style>
		<script src="jquery1.4.2.js" type="text/javascript">
</script>
		<script type="text/javascript">

function transProvider(pid){

	if(pid=="1"){
		return  "no5";
	}else if(pid=="2"){
		return "lafaso";	
		}
		else if(pid=="3"){
		return "jumei";	
		}
		else if(pid=="4"){
		return "360buy";	
		}
		else if(pid=="5"){
		return "dangdang";	
		}
		else if(pid=="6"){
		return "amazon";	
		}
}


//通过gid获得商品对应关系
function GetGoodsMap(gid) {
	var url = BASE_SERVER+"/goods_getGoodsMapList";
	var params = {
		"gid" : gid
	};
	var goodsDetail = "";
	$.ajax( {
		type : "POST",
		data : params,
		dataType : "json",
		url : url,
		success : function(json) {
			if (json == null) {
				alert("json null");
			} else {
				for(var i=0;i<json.length;i++){
				goodsDetail+=(i+1)+"：";
						goodsDetail+="<form action='goods_updateGoods' enctype='multipart/form-data'>";
						goodsDetail+="<table class='tabel'><tbody><tr>"
						goodsDetail+="<tr><td>供应商："+transProvider(json[i]['providerId'])+"</td></tr>"
						goodsDetail+="<tr><td>商品名称："+json[i]['goodsName']+"  商品ID号："+json[i]['goodsRealId']+"</td></tr>";
						goodsDetail+="<tr><td>品牌名："+json[i]['brandName']+"  系列名："+json[i]['seriesName']+"</td></tr>";
						goodsDetail+="<tr><td>商品价格："+json[i]['goodsPrice']+"</td></tr>";
						goodsDetail+="<tr><td>商品分类名："+json[i]['categoryName']+"</td></tr>";
						goodsDetail+="<tr><td>商品缩略图：<a href='"+ json[i]['goodsUrl']+"' target='_blank'><img src='"+json[i]['goodsThumb']+"'/>点击查看</a></td></tr> ";
						goodsDetail+="<tr><td>商品细节图：<img src='"+json[i]['goodsImages'] +"'/></td></tr> ";
						goodsDetail+="<tr><td>商品评分："+json[i]['goodsScore']+"</td></tr> ";
						goodsDetail+="<tr><td>商品适用肤质："+json[i]['goodsForskin'] +"</td></tr> ";
						goodsDetail+="<tr><td>商品不适用肤质："+json[i]['goodsNotforskin'] +"</td></tr> ";
						goodsDetail+="<tr><td>商品需注意肤质："+json[i]['goodsNoticeforskin'] +"</td></tr> ";
						goodsDetail+="<tr><td>商品年龄范围："+json[i]['goodsAge']+"</td></tr> ";
						goodsDetail+="<tr><td>商品特点及成分："+json[i]['goodsDescription'] +"</td></tr> ";
						goodsDetail+="<tr><td>商品用法："+json[i]['goodsSpecification']+"</td></tr> ";
						goodsDetail+="<tr><td>商品添加时间："+json[i]['goodsAddTime']+"</td></tr> ";
						goodsDetail+="<tr><td>商品状态："+json[i]['goodsStatus']+"</td></tr> ";
						goodsDetail+="</tbody></table></form>";
					}
			}
			$('#real_goods_detail').html(goodsDetail.toString());
		}
	});
}

$(document).ready(function() {
	
	GetGoodsMap($('#goods_id').val());
});
</script>
	</head>

	<body>
		<%@include file="/top.jsp"%>
		<input id="goods_id" type="hidden" name="gid" value="<%=gid%>"/>商品名： <%=gname%><br/><br/>
		添加对应商品id号：<input type="text" name="real_gid">
	<div id="real_goods_detail">

 </div>
		
	</body>
</html>

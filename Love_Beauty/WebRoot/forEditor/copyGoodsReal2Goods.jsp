<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="main.com.yourantao.aimeili.conf.Constant" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品聚类处理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	.tabel{
		text-align: center;
		font-size: 15px;
		color: red;
		border: 1px solid purple;
	}
	.tabel td{
		border: 1px solid blue;
	}
	
	</style>
	<script src="jquery1.4.2.js" type="text/javascript"></script>
  </head>
  
  <body>
  <%@include file="/top.jsp"%>
1.复制goodsReal中的一个货商的商品到goods中：  	
<form action="goods_copyGoodsReal2Goods" enctype="multipart/form-data" method="post">
<select name="pid">
	<option value="1">no5</option>
	<option value="2">lafaso</option>
	<option value="3">jumei</option>
	<option value="4">360buy</option>
	<option value="5">dangdang</option>
	<option value="6">amazon</option>
</select>
 <input type="submit" value="确认"/>
 </form>
 
 
 2.更新全部的商品对应（goods，goodsreal--》goodsMap）：
 <form action="goods_updateGoodsMap" enctype="multipart/form-data" method="post">
 <input type="submit" value="全部更新"/>
 </form>
 
 3.心得评测与商品的对应（goodsExperience）：
 <form action="goods_updateGoodsExperience" enctype="multipart/form-data" method="post">
 <input type="submit" value="全部更新"/>
 </form>
  </body>
</html>

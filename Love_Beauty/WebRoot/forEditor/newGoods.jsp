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
    
    <title>商品插入</title>
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
		
	}
	.tabel td{
		border: 1px solid blue;
	}
	
	.forskin, .notforskin, .noticeskin ,.goodsage{
		margin-right:5px;
		background-color: #AACCEE;
	}
	
	</style>
	<script src="jquery1.4.2.js" type="text/javascript"></script>
	<script type="text/javascript">
   
 var flag;
 //获得子分类
function GetSubCategory(cid) {
	var url = BASE_SERVER+"/category_getSubCategories";
	var params = {
		"cid" : cid
	};
	var category = "";
	$.ajax( {
		type : "POST",
		data : params,
		dataType : "json",
		url : url,
		success : function(json) {
			if (json == null) {
				alert("json null");
			} else {
					category +="<option value='0'></option>";
				for ( var i = 0; i < json.length; i++) {
					category += "<option value='" + json[i]['categoryId']
							+ "'>" + json[i]['categoryName'] + "</option>";
				}
			}
			flag++;
			$('#category' + flag).html(category.toString());
			for ( var i = flag + 1; i <= 4; i++) {
				$('#category' + i).empty();
			}
		}
	});
}
	
//获得品牌
function GetBrands() {
	var url = "http://192.168.14.24:8080/Love_Beauty/brand_getBrands";
	var brand = "";
	$.ajax({
		type : "POST",
		dataType : "json",
		url : url,
		success : function(json) {
			if (json == null) {
				alert("json null");
			} else {
				brand +="<option value='0'></option>";
				for ( var i = 0; i < json.length; i++) {
					brand += "<option value='" + json[i]['brandId']+ "'>" + json[i]['brandName'] + "</option>";
				}
			}
			$('#brand').html(brand);
		}
	});
}
//获得系列
function GetSeries(bid) {
	var url = "http://192.168.14.24:8080/Love_Beauty/brand_getSeries";
	var series = "";
	var params = {
		"bid" : bid
	};
	$.ajax({
		type : "POST",
		data : params,
		dataType : "json",
		url : url,
		success : function(json) {
			if (json == null) {
				alert("json null");
			} else {
				for ( var i = 0; i < json.length; i++) {
					series += "<option value='" + json[i]['seriesId']+ "'>" + json[i]['seriesName'] + "</option>";
				}
			}
			$('#series').html(series);
		}
	});
}
	
	
	$(document).ready(function() {
	
	GetBrands();
	$('.category').change(function() {
		flag = $(this).attr('flag');
		var cid = $(this).val();
		GetSubCategory(cid);
	});
	
	$('#brand').change(function() {
		var bid = $(this).val();
		GetSeries(bid);
	});
	
	$('.forskin').click(function(){
		var str=$(this).text();
		if($('#goodsForskin').val()==""){
		$('#goodsForskin').val(str);
		}else if($('#goodsForskin').val().indexOf(str)<0){
		$('#goodsForskin').val($('#goodsForskin').val()+","+str);
		}
	});
	$('.notforskin').click(function(){
		var str=$(this).text();
		if($('#goodsNotforskin').val()==""){
		$('#goodsNotforskin').val(str);
		}
		else if($('#goodsNotforskin').val().indexOf(str)<0){
		$('#goodsNotforskin').val($('#goodsNotforskin').val()+","+str);
		}
	});
	$('.noticeskin').click(function(){
		var str=$(this).text();
		if($('#goodsNoticeforskin').val()==""){
		$('#goodsNoticeforskin').val(str);
		}else if($('#goodsNoticeforskin').val().indexOf(str)<0){
		$('#goodsNoticeforskin').val($('#goodsNoticeforskin').val()+","+str);
		}
	});
	
	$('.goodsage').click(function(){
		var str=$(this).text();
		if($('#goodsAge').val()==""){
		$('#goodsAge').val(str);
		}else if($('#goodsAge').val().indexOf(str)<0){
		$('#goodsAge').val($('#goodsAge').val()+","+str);
		}
	});
	
});
	</script>
  </head>
  
  <body>
  <%@include file="/top.jsp"%>
  	
<form action="goods_insertGoods" enctype="multipart/form-data" method="post">
 <table class="tabel" >
 <tbody>
 <tr>
 <td>
		一级分类：
						<select class="category" flag="1" id="category1" name="category1">
						<option value="0" selected="selected">
							</option>
							<option value="1">
								护肤
							</option>
							<option value="2">
								妆扮
							</option>
							<option value="3">
								美体
							</option>
							<option value="4">
								美发
							</option>
						</select>
					</td>
					<td>
						二级分类：
						<select class="category" flag="2" id="category2" name="category2">
						</select>
					</td>
					<td>
						三级分类：
						<select class="category" flag="3" id="category3" name="category3">
						</select>
					</td>
					<td>
						四级分类：
						<select class="category" flag="4" id="category4" name="category4">
						</select>
					</td>
 </tr>
 <tr><td>商品品牌：<select class="brand" id="brand" name="bid"></select></td>
 		<td>系列：<select class="series" id="series" name="sid"></select></td></tr>
 
 <tr><td>商品名称：<input name='goodsName' type='text' /></td></tr>
						<tr><td>商品缩略图：<input type='file' name='newGoods_thumb'></td></tr> 
						<tr><td>商品评分：<input name='goodsScore' type='text' /></td></tr> 
						<tr><td>商品适用肤质：<input id='goodsForskin' name='goodsForskin' type='text' /></td><td><span class='forskin'>干性</span><span class='forskin'>油性</span><span class='forskin'>混合性</span><span class='forskin'>中性</span><span class='forskin'>敏感性</span></td></tr> 
						<tr><td>商品不适用肤质：<input id='goodsNotforskin' name='goodsNotforskin' type='text' /></td><td><span class='notforskin'>干性</span><span class='notforskin'>油性</span><span class='notforskin'>混合性</span><span class='notforskin'>中性</span><span class='notforskin'>敏感性</span></td></tr> 
						<tr><td>商品需注意肤质：<input id='goodsNoticeforskin' name='goodsNoticeforskin' type='text'/></td><td><span class='noticeskin'>干性</span><span class='noticeskin'>油性</span><span class='noticeskin'>混合性</span><span class='noticeskin'>中性</span><span class='noticeskin'>敏感性</span></td></tr> 
						<tr><td>商品年龄范围：<input id='goodsAge' name='goodsAge' type='text'/></td><td><span class='goodsage'>20岁以下</span><span class='goodsage'>20-25岁</span><span class='goodsage'>26-30岁</span><span class='goodsage'>30-35岁</span><span class='goodsage'>36-40岁</span><span class='goodsage'>40岁以上</span></td></tr> 
						<tr><td>商品特点及成分：<input name='goodsDescription'  type='text' /></td></tr> 
						<tr><td>商品用法：<input name='goodsSpecification' type='text' /></td></tr> 
 <tr>
 <td><input name="submit" type="submit" value="确认添加"/></td>
 </tr>
 
 </tbody>
 </table>
 
 </form>
  </body>
</html>

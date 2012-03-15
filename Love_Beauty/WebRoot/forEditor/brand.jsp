<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="main.com.yourantao.aimeili.bean.Brand" %>
<%@ page import="main.com.yourantao.aimeili.bean.BrandDAO" %>
<%@ page import="org.hibernate.classic.Session" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>品牌页</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
	<script type="text/javascript">
   
	
//获得功效
function GetBrands() {
	var url = BASE_SERVER+"/brand_getBrands";
	var brand = "";
	$.ajax( {
		type : "POST",
		dataType : "json",
		url : url,
		success : function(json) {
			if (json == null) {
				alert("json null");
			} else {
					brand +="<option value='0'></option>";
				for ( var i = 0; i < json.length; i++) {
					brand += "<option value='" + json[i]['brandId']
							+ "'>" + json[i]['brandName'] + "</option>";
				}
			}
			$('#brand').html(brand.toString());
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

//功效细节
function GetBrandDetail(bid) {
	var url = BASE_SERVER+"/brand_getBrandDetail";
	var params = {
		"bid" : bid
	};
	var brand = "";
	$.ajax( {
		type : "POST",
		data : params,
		dataType : "json",
		url : url,
		success : function(json) {
			if (json == null) {
				alert("json null");
			} else {
					brand+="<table class='tabel'><tbody><tr>";
					brand+="<td><input type='hidden' name='bid' value='"+json['brandId']+"'/>品牌名: <input name='brand_name' value='"+json['brandName']+"'/></td><td>品牌别名: <input name='brand_alias' value='"+json['brandAlias']+"'/></td><td>品牌描述: <input name='brand_description' value='"+json['brandDescription']+"'/></td><td>品牌对应图片：<img src='"+json['brandImageUrl']+"'/>更改：<input type='file' name='brand_image'></td><td><input name='submit' type='submit' value='更新'/></td>" ;
					brand+="</tr></tbody></table>";
			$('#brand_detail').html(brand.toString());
			}
		}
	});
}
	
	$(document).ready(function(){
	
		GetBrands();
			 $('#brand').change(function() {
				var bid = $(this).val();
				GetSeries(bid);
				GetBrandDetail(bid);
			});
	});
			   
	</script>
  </head>
  
  <body>
  <%@include file="/top.jsp"%>
  <form action='brand_updateORinsertBrand' enctype='multipart/form-data' method='post'>
 <table class="tabel" >
 <tbody>
 <tr>
 <td>
					品牌:<select id="brand" name="bid">
						</select>
</td>
<td>系列：<select class="series" id="series" name="sid"></select></td>
 </tr>
  </tbody>
 </table>
 
<div id="brand_detail">
</div>
<br/><br/>
<div>
新增品牌：<br/>
品牌名: <input name='newBrand_name'/>品牌别名: <input name='newBrand_alias'/>品牌描述: <input name='newBrand_description'/>品牌对应图片：<input type='file' name='newBrand_image'><input name="submit" type="submit" value="添加"> 
</div>
</form>
  </body>
</html>

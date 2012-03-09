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
    
    <title>分类页</title>
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
				flag++;
			}
			$('#category' + flag).html(category.toString());
			for ( var i = flag + 1; i <= 4; i++) {
				$('#category' + i).empty();
			}
		}
	});
}

function GetCategoryDetail(cid) {
	var url = BASE_SERVER+"/category_getCategoryDetail";
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
					category+="<table class='tabel'><tbody><tr>";
					category+="<td><input type='hidden' name='cid' value='"+json['categoryId']+"'/>分类名: <input name='category_name' value='"+json['categoryName']+"'/></td><td>分类对应图片：<img src='"+json['categoryImageName']+"'/>更改：<input type='file' name='category_image'></td><td>分类描述：<input name='category_description' value='"+json['categoryDescription']+"'/></td><td><input name='submit' type='submit' value='更新'/></td>" ;
					category+="</tr></tbody></table>";
			$('#category_detail').html(category.toString());
			}
		}
	});
}
	
	$(document).ready(function(){
	
			 $('.category').change(function() {
				flag = $(this).attr('flag');
				var cid = $(this).val();
				GetSubCategory(cid);
				GetCategoryDetail(cid);
			});
			   
       });
	</script>
  </head>
  
  <body>
  <%@include file="/top.jsp"%>
  <form action='category_updateORinsertCategory' enctype='multipart/form-data' method='post'>
 <table class="tabel" >
 <tbody>
   <tr>
 </tr>
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
  </tbody>
 </table>
 
 <div id="category_detail">
</div>
<br/><br/><br/>
<div>
新增分类：<br/>
分类名: <input name='newcategory_name'/>分类对应图片：<input type='file' name='newCategory_image'>分类描述：<input name='newcategory_description' /> <input name="submit" type="submit" value="添加"> 
</div>
</form>
  </body>
</html>

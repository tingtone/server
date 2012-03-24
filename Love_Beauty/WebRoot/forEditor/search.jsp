<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>搜索的关键词和图</title>
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
   
	
//获得搜索词
function GetSearch() {
	var url = BASE_SERVER+"/search_getSearch";
	var search = "";
	$.ajax( {
		type : "POST",
		dataType : "json",
		url : url,
		success : function(json) {
			if (json == null) {
				alert("json null");
			} else {
					search +="<option value='0'></option>";
				for ( var i = 0; i < json.length; i++) {
					search += "<option value='" + json[i]['searchId']
							+ "'>" + json[i]['searchKeyword'] + "</option>";
				}
			}
			$('#search').html(search.toString());
		}
	});
}

//搜索词细节
function GetSearchDetail(search_id) {
	var url = BASE_SERVER+"/search_getSearchDetail";
	var params = {
		"search_id" : search_id
	};
	var search = "";
	$.ajax( {
		type : "POST",
		data : params,
		dataType : "json",
		url : url,
		success : function(json) {
			if (json == null) {
				alert("json null");
			} else {
					search+="<table class='tabel'><tbody><tr>";
					search+="<td><input type='hidden' name='search_id' value='"+json['searchId']+"'/>搜索词名: <input name='search_keyword' value='"+json['searchKeyword']+"'/></td><td>搜索词对应图片：<img src='"+json['searchImageUrl']+"'/>更改：<input type='file' name='search_image'></td><td><input name='submit' type='submit' value='更新'/></td>" ;
					search+="</tr></tbody></table>";
			$('#search_detail').html(search.toString());
			}
		}
	});
}
	
	$(document).ready(function(){
	
		GetSearch();
			 $('#search').change(function() {
				var search_id = $(this).val();
				GetSearchDetail(search_id);
			});
			   
       });
	</script>
  </head>
  
  <body>
  <%@include file="/top.jsp"%>
  <form action='search_updateORinsertSearch' enctype='multipart/form-data' method='post'>
 <table class="tabel" >
 <tbody>
 <tr>
 <td>
						搜索词：<select id="search" name="search">
						</select>
</td>
 </tr>
  </tbody>
 </table>
 
<div id="search_detail">
</div>
<br/><br/><br/>
<div>
新增搜索词：<br/>
搜索词名: <input name='newSearch_name'/>搜索词对应图片：<input type='file' name='newSearch_image'><input name="submit" type="submit" value="添加"> 
</div>
</form>
  </body>
</html>

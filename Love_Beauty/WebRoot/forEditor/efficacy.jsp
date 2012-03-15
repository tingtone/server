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
   
	
//获得功效
function GetEfficacy() {
	var url = BASE_SERVER+"/efficacy_getEfficacy";
	var efficacy = "";
	$.ajax( {
		type : "POST",
		dataType : "json",
		url : url,
		success : function(json) {
			if (json == null) {
				alert("json null");
			} else {
					efficacy +="<option value='0'></option>";
				for ( var i = 0; i < json.length; i++) {
					efficacy += "<option value='" + json[i]['efficacyId']
							+ "'>" + json[i]['efficacyName'] + "</option>";
				}
			}
			$('#efficacy').html(efficacy.toString());
		}
	});
}

//功效细节
function GetEfficacyDetail(eid) {
	var url = BASE_SERVER+"/efficacy_getEfficacyDetail";
	var params = {
		"eid" : eid
	};
	var efficacy = "";
	$.ajax( {
		type : "POST",
		data : params,
		dataType : "json",
		url : url,
		success : function(json) {
			if (json == null) {
				alert("json null");
			} else {
					efficacy+="<table class='tabel'><tbody><tr>";
					efficacy+="<td><input type='hidden' name='eid' value='"+json['efficacyId']+"'/>功效名: <input name='efficacy_name' value='"+json['efficacyName']+"'/></td><td>功效对应图片：<img src='"+json['efficacyImageUrl']+"'/>更改：<input type='file' name='efficacy_image'></td><td><input name='submit' type='submit' value='更新'/></td>" ;
					efficacy+="</tr></tbody></table>";
			$('#efficacy_detail').html(efficacy.toString());
			}
		}
	});
}
	
	$(document).ready(function(){
	
		GetEfficacy();
			 $('#efficacy').change(function() {
				var eid = $(this).val();
				GetEfficacyDetail(eid);
			});
			   
       });
	</script>
  </head>
  
  <body>
  <%@include file="/top.jsp"%>
  <form action='efficacy_updateORinsertEfficacy' enctype='multipart/form-data' method='post'>
 <table class="tabel" >
 <tbody>
 <tr>
 <td>
						功效：<select id="efficacy" name="efficacy">
						</select>
</td>
 </tr>
  </tbody>
 </table>
 
<div id="efficacy_detail">
</div>
<br/><br/><br/>
<div>
新增功效：<br/>
功效名: <input name='newEfficacy_name'/>功效对应图片：<input type='file' name='newEfficacy_image'><input name="submit" type="submit" value="添加"> 
</div>
</form>
  </body>
</html>

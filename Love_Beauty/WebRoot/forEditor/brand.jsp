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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>品牌页</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="jquery1.4.2.js" type="text/javascript"></script>
	<script type="text/javascript">
   
	function GetTopic(){
			var url=BASE_SERVER+"/topic_getTopic";
			var params = {"action":"get"};
			var topic="";
			$.ajax({
				type:"POST",
				data:params,
				dataType: "json",
				url: url,
				success: function(json) {
				if(json == null){
					alert("json null");
				}else{
					for(var i=0;i<json.length;i++){
						topic+="<option value='+json[i]['brandName']+'>"+json[i]['brandName']+"</option>";
					}
				}
				$('#topicname').html(topic.toString());
				}
			});
	}
	
	
	$(document).ready(function(){
	
			   GetTopic();
			   $('#topicname').change(function(){
				//   SetupTopic();
				   
			   });
       });
	</script>
  </head>
  
  <body>
  <%@include file="/top.jsp"%>
  <form action="topic">
  	新专题名：<input type="text" name="newtopic"/> 
  	
  	</form>
 <table border="1">
 <tbody>
 <tr>
 <td>专题名：</td><td><select id="topicname" name="newtopic"></select></td>
 </tr>
  <tr>
 <td>图片上传：</td><td><input name="newtopic" type="text"/></td>
 </tr>
 </tbody>
 </table>
  </body>
</html>

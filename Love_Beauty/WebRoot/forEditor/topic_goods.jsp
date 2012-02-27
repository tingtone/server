<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String topic_id=request.getParameter("topic_id");
String topic_name=request.getParameter("topic_name");
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
    
    <title>专题与商品的对应关系</title>
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
   
	function GetTopic(){
			var url="http://192.168.14.24:8080/Love_Beauty/topic_getTopic";
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
	
       });
	</script>
  </head>
  
  <body>
  <%@include file="/top.jsp"%>
  <form action="topic_goods">
  	<input type="hidden" name="topic_id" value="<%=topic_id%>"/>专题： <%=topic_name %><input name="submit" type="submit"  value="查看商品关系"/>
  	  新商品id:<input name="new_topic_id" type="text"/> <input name="submit" type="submit"  value="添加对应商品"/>  
  	</form>
 <table id="table">
 </table>
  </body>
</html>

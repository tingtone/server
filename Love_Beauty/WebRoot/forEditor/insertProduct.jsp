<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="main.com.yourantao.aimeili.server.BrandServer" %>
<%
BrandServer brandAction=new BrandServer(request);
String str=brandAction.getBrandList().toString();
out.println(str);



String page1=request.getParameter("page");
String num=request.getParameter("num");
String url=request.getRequestURL().toString();
String servletPath=request.getServletPath();
String URI=request.getRequestURI();
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
  </head>
  
  <body>
  <form action="wallapiall">
  	<button type="submit" >action！</button>
  </form>
  <br>  OK?
  <a href="jsontest.jsp">json测试</a>
  </body>
</html>

  


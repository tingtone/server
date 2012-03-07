<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="main.com.yourantao.aimeili.server.ProductServer" %>
<%
ProductServer productServer=new ProductServer(request);
String str=productServer.getGoodsList().toString();
out.println(str);


String page1=request.getParameter("page");
String num=request.getParameter("num");
String url=request.getRequestURL().toString();
String servletPath=request.getServletPath();
String URI=request.getRequestURI();
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
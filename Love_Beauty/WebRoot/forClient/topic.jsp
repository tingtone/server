<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="main.com.yourantao.aimeili.server.TopicServer"%>
<%
TopicServer topicServer=new TopicServer(request);
String str=topicServer.getTopicGoods();
out.println(str);

%>
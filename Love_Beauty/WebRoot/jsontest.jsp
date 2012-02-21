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


  <%
String str="[{\"PID\":\"27890\",\"num_iid\":\"15548420762\",\"nick\":\"h_lovez\",\"pic_url\":\"http://img04.taobaocdn.com/bao/uploaded/i4/T1t51QXjdaXXcWuuw9_102910.jpg_160x160.jpg\",\"detail_url\":\"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWbRkJfYlvumErUQeiq%2FlMUkD5tck88aV9FgpxSVPm7%2BJNmb5vMhrUw7ojF1%2BjtzmYIAbgX5vmAOM9rDH7sC1aby44zyS6LFzp3nB3FPLQiKA%3D%3D&p=mm_29213647_0_0&n=19\",\"title\":\"2012新款春装 MISS PAN同款 欧美风女装简约百搭拼色拼接长袖衬衫\",\"dapei\":\"\",\"price\":\"94.50\",\"cid\":\"162104\",\"yuanJia\":\"105.00\",\"xianJia\":\"94.50\",\"pinpai\":\"\",\"endTime\":\"02月22日12时\",\"original_pic\":\"http://img04.taobaocdn.com/bao/uploaded/i4/T1t51QXjdaXXcWuuw9_102910.jpg\",\"big_pic\":\"http://img04.taobaocdn.com/bao/uploaded/i4/T1t51QXjdaXXcWuuw9_102910.jpg_310x310.jpg\",\"small_pic\":\"http://img04.taobaocdn.com/bao/uploaded/i4/T1t51QXjdaXXcWuuw9_102910.jpg_80x80.jpg\",\"item_imgs_size\":{\"width\":\"108\",\"height\":\"160\",\"type\":\"2\"},\"dadakan\":\"true\",\"img_list\":[\"http://img04.taobaocdn.com/bao/uploaded/i4/T1t51QXjdaXXcWuuw9_102910.jpg_310x310.jpg\",\"http://img01.taobaocdn.com/bao/uploaded/i1/26373931/T2tbCmXotXXXXXXXXX_!!26373931.jpg_310x310.jpg\",\"http://img04.taobaocdn.com/bao/uploaded/i4/26373931/T2IYemXglaXXXXXXXX_!!26373931.jpg_310x310.jpg\",\"http://img03.taobaocdn.com/bao/uploaded/i3/26373931/T2pYamXh0aXXXXXXXX_!!26373931.jpg_310x310.jpg\"]}]";
out.println(str);
%> 
  


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

<% 
//String str="[{\"PID\":\"27890\",\"num_iid\":\"15548420762\",\"nick\":\"h_lovez\",\"pic_url\":\"http://img04.taobaocdn.com/bao/uploaded/i4/T1t51QXjdaXXcWuuw9_102910.jpg_160x160.jpg\",\"detail_url\":\"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWbRkJfYlvumErUQeiq%2FlMUkD5tck88aV9FgpxSVPm7%2BJNmb5vMhrUw7ojF1%2BjtzmYIAbgX5vmAOM9rDH7sC1aby44zyS6LFzp3nB3FPLQiKA%3D%3D&p=mm_29213647_0_0&n=19\",\"title\":\"2012新款春装 MISS PAN同款 欧美风女装简约百搭拼色拼接长袖衬衫\",\"dapei\":\"\",\"price\":\"94.50\",\"cid\":\"162104\",\"yuanJia\":\"105.00\",\"xianJia\":\"94.50\",\"pinpai\":\"\",\"endTime\":\"02月22日12时\",\"original_pic\":\"http://img04.taobaocdn.com/bao/uploaded/i4/T1t51QXjdaXXcWuuw9_102910.jpg\",\"big_pic\":\"http://img04.taobaocdn.com/bao/uploaded/i4/T1t51QXjdaXXcWuuw9_102910.jpg_310x310.jpg\",\"small_pic\":\"http://img04.taobaocdn.com/bao/uploaded/i4/T1t51QXjdaXXcWuuw9_102910.jpg_80x80.jpg\",\"item_imgs_size\":{\"width\":\"108\",\"height\":\"160\",\"type\":\"2\"},\"dadakan\":\"true\",\"img_list\":[\"http://img04.taobaocdn.com/bao/uploaded/i4/T1t51QXjdaXXcWuuw9_102910.jpg_310x310.jpg\",\"http://img01.taobaocdn.com/bao/uploaded/i1/26373931/T2tbCmXotXXXXXXXXX_!!26373931.jpg_310x310.jpg\",\"http://img04.taobaocdn.com/bao/uploaded/i4/26373931/T2IYemXglaXXXXXXXX_!!26373931.jpg_310x310.jpg\",\"http://img03.taobaocdn.com/bao/uploaded/i3/26373931/T2pYamXh0aXXXXXXXX_!!26373931.jpg_310x310.jpg\"]}]";
//out.println("path="+path);  //path=/Love_Beauty
//out.println("basePath="+basePath);  //basePath=http://127.0.0.1:8080/Love_Beauty/
//out.println("URI="+URI); //URI=/Love_Beauty/forClient/brand.jsp
//out.println("servletPath="+servletPath); //servletPath=/forClient/brand.jsp
//out.println("URL="+url); //URL=http://127.0.0.1:8080/Love_Beauty/forClient/brand.jsp 
//out.println("page="+page1);
//out.println("num="+num);

%> 
  


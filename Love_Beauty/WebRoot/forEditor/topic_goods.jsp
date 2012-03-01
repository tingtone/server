<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String tid=request.getParameter("tid");
String tname=request.getParameter("topic_name");
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
    
    <title>专题与商品的对应关系</title>
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
	div{
		border: 1px solid green;
	}
	
	</style>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="jquery1.4.2.js" type="text/javascript"></script>
	<script type="text/javascript">
   
	function GetTopicGoods(tid){
			var url="http://192.168.14.24:8080/Love_Beauty/topic_getTopicGoods";
			var params = {"tid":tid};
			var topicGoods="";
			var goodsDetail="";
			$.ajax({
				type:"POST",
				data:params,
				dataType: "json",
				url: url,
				success: function(json) {
				if(json == null){
					alert("json null");
				}else{
					 topicGoods+="<tbody>";
					for(var i=0;i<json.length;i++){
						var goodsId=json[i]['goods']['goodsId'];
						topicGoods+="<tr><form action='topic_updateTopicGoods' enctype='multipart/form-data'>";
						topicGoods+="<td>商品号：<input type='text' name='goods_id' value='"+goodsId+"'/>商品名: <input name='goods_name' value='"+json[i]['goods']['goodsName']+"'/></td><td><input name='submit' type='submit' value='前移'/><input name='submit' type='submit' value='后移'/><input name='submit' type='submit' value='删除'/><input type='button' gid='"+goodsId+"' onclick=\"$('#goods"+goodsId+"').show();\" value='显示商品详情' id='showGoods'/></td>" ;
						topicGoods+="</form></tr>";
						
						goodsDetail+="<div style='display:none;' id='goods"+goodsId+"'>";
						goodsDetail+="商品名称："+json[i]['goods']['goodsName'] +"<br/> ";
						goodsDetail+="商品缩略图：<img src='"+json[i]['goods']['goodsThumb']+"'/> <br/> ";
						goodsDetail+="商品细节图：<img src='"+json[i]['goods']['goodsImages'] +"'/><br/> ";
						goodsDetail+="商品评分："+json[i]['goods']['goodsScore'] +"<br/> ";
						goodsDetail+="商品适用肤质："+json[i]['goods']['goodsForskin'] +"<br/> ";
						goodsDetail+="商品不适用肤质："+json[i]['goods']['goodsNotforskin'] +"<br/> ";
						goodsDetail+="商品需注意肤质："+json[i]['goods']['goodsNoticeforskin'] +"<br/> ";
						goodsDetail+="商品年龄范围："+json[i]['goods']['goodsAge']+" <br/> ";
						goodsDetail+="商品特点及成分："+json[i]['goods']['goodsDescription'] +"<br/> ";
						goodsDetail+="商品用法："+json[i]['goods']['goodsSpecification']+" <br/> ";
						goodsDetail+="商品添加时间："+json[i]['goods']['goodsAddTime']+" <br/> ";
						goodsDetail+="商品状态："+json[i]['goods']['goodsStatus']+" <br/> ";
						goodsDetail+="</div>";
					}
					 topicGoods+="</tbody>";
				}
				$('#topic_goods').html(topicGoods.toString());
				$('#goods_detail').html(goodsDetail.toString());
				
				}
			});
	}
	
	
	$(document).ready(function(){
			GetTopicGoods($('#topic_id').val());
			
       });
	</script>
  </head>
  
  <body>
  <%@include file="/top.jsp"%>
  	<input id="topic_id" type="hidden" name="topic_id" value="<%=tid%>"/>专题： <%=tname %><br/>
  	商品id号：<input type="text" name="newGoods"/> <input type="button" value="新增对应商品"/>
  	
 <table class="tabel" id="topic_goods">
 </table>
 
 <div id="goods_detail" >
 
 </div>
  </body>
</html>

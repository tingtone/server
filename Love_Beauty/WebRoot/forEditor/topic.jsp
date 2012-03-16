<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>编辑专题页</title>
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
	.tabel b{
		border: 1px solid blue;
	}
	.tabel b input{
		width: 10px;
	}
	
	</style>
	<script src="jquery1.4.2.js" type="text/javascript"></script>
	<script type="text/javascript">
   
	/*
	 *删除的确认框
	 */
	function delete_confirm()   
  {   
  var r=confirm("确认删除");
  if (r==true)   
    {   
   //删除操作
   alert("删除");
    }   
  else   
    {   
     
    }   
  }   
	
	/*
    *通过大分类获得专题详细信息
    */
	function GetTopic_Detail(cid){
			var url=BASE_SERVER+"/topic_getTopicsOfCategory";
			var params = {"cid":cid};
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
					topic+="<form action='topic_updateTopic' enctype='multipart/form-data' method='post'>";
					topic+="<table class='tabel'><tbody><tr>";
					//topic+="<td><input type='hidden' name='tid' value='"+json[i]['topicId']+"'/>专题名: <input name='topic_name' value='"+json[i]['topicName']+"'/></td><td>专题关键词：<input name='topic_keywords' value='"+json[i]['topicKeywords']+"'/></td><td>专题缩略图：<img src='"+json[i]['topicThumb']+"'/>更改：<input type='file' name='newtopic_thumb'></td> <td>专题大图：<img src='"+json[i]['topicImages']+"'/>更改：<input type='file' name='newtopic_image'></td><td><input name='submit' type='submit' value='置顶'/><input name='submit' type='submit' value='后移'/><input name='submit' type='submit' value='删除'/><input name='submit' type='submit' value='更新'/><a target='_blank' href='forEditor/topic_goods.jsp?tid="+json[i]['topicId']+"&tname="+json[i]['topicName']+"'>对应商品</a></td>" ;
					if(i==0 &&json.length!=1){
						topic+="<td><input type='hidden' name='tid' value='"+json[i]['topicId']+"'/><input type='hidden' name='tid_exchange' value='"+json[i+1]['topicId']+"'/>专题名: <input name='topic_name' value='"+json[i]['topicName']+"'/></td><td>专题关键词：<input name='topic_keywords' value='"+json[i]['topicKeywords']+"'/></td><td>专题缩略图：<img src='"+json[i]['topicThumb']+"'/>更改：<input type='file' name='newtopic_thumb'></td> <td>专题大图：<img src='"+json[i]['topicImages']+"'/>更改：<input type='file' name='newtopic_image'></td><td><input name='submit' type='submit' value='后移'/><input name='submit' type='submit' value='删除'/><input name='submit' type='submit' value='更新'/><input name='submit' value='对应商品' type='submit'/></td>" ;
					}else if(i==json.length-1){
					topic+="<td><input type='hidden' name='tid' value='"+json[i]['topicId']+"'/>专题名: <input name='topic_name' value='"+json[i]['topicName']+"'/></td><td>专题关键词：<input name='topic_keywords' value='"+json[i]['topicKeywords']+"'/></td><td>专题缩略图：<img src='"+json[i]['topicThumb']+"'/>更改：<input type='file' name='newtopic_thumb'></td> <td>专题大图：<img src='"+json[i]['topicImages']+"'/>更改：<input type='file' name='newtopic_image'></td><td><input name='submit' type='submit' value='置顶'/><input name='submit' type='submit' value='删除'/><input name='submit' type='submit' value='更新'/><input name='submit' value='对应商品' type='submit'/></td>" ;
					}else{
					topic+="<td><input type='hidden' name='tid' value='"+json[i]['topicId']+"'/><input type='hidden' name='tid_exchange' value='"+json[i+1]['topicId']+"'/>专题名: <input name='topic_name' value='"+json[i]['topicName']+"'/></td><td>专题关键词：<input name='topic_keywords' value='"+json[i]['topicKeywords']+"'/></td><td>专题缩略图：<img src='"+json[i]['topicThumb']+"'/>更改：<input type='file' name='newtopic_thumb'></td> <td>专题大图：<img src='"+json[i]['topicImages']+"'/>更改：<input type='file' name='newtopic_image'></td><td><input name='submit' type='submit' value='置顶'/><input name='submit' type='submit' value='后移'/><input name='submit' type='submit' value='删除'/><input name='submit' type='submit' value='更新'/><input name='submit' value='对应商品' type='submit'/></td>" ;
					}
					topic+="</tr></tbody></table></form>";
					}
				}
				$('#topic_detail').html(topic.toString());
				}
			});
	}
	
	
	$(document).ready(function(){
	
			   GetTopic_Detail($('#maincla').val());
			   $('#maincla').change(function(){
				GetTopic_Detail($('#maincla').val());
			   });
			   
       });
	</script>
  </head>
  
  <body>
  <%@include file="/top.jsp"%>
 <table class="tabel" >
 <tbody>
   <tr>
 <td><a href="forEditor/newTopic.jsp">新加专题</a></td>
 </tr>
 <tr>
 <td>大分类：<select id="maincla">
 <option value="1">护肤</option>
  <option value="2">妆扮</option>
   <option value="3">美体</option>
    <option value="4">美发</option>
 </select></td>
 </tr>
  </tbody>
 </table>
 <div id="topic_detail">
</div>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="main.com.yourantao.aimeili.conf.Constant" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>专题插入</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
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
   
   /*
    *通过大分类获得专题名称
    */
	function GetTopic(cla){
			var url=BASE_SERVER+"/topic_getTopic";
			var params = {"cla":cla};
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
	
			   GetTopic($('#"maincla"').val());
			   $('#"maincla"').change(function(){
				GetTopic($('#"maincla"').val());
				   
			   });
			   
			   $('#newtopic').click(function(){
			   	location="newTopic.jsp";
			   
			   });
       });
	</script>
  </head>
  
  <body>
  <%@include file="/top.jsp"%>
  	
<form action="topic_insertTopic" enctype="multipart/form-data" method="post">
 <table class="tabel" >
 <tbody>
   <tr>
 <td>新专题名：<input type="text" name="topic_name"/></td><td>关键词（“，”隔开）：<input type="text" name="topic_keywords"/></td><td>新缩略图：<input type="file" name="newtopic_thumb"></td><td>新大图：<input type="file" name="newtopic_image"></td>
 </tr>
 <tr>
 <td>加入的分类：<select id="maincla" name="cid">
 <option value="1">护肤</option>
  <option value="2">妆扮</option>
   <option value="3">美体</option>
    <option value="4">美发</option>
 </td> <td><input id="add_submit" type="submit" value="确认添加"/></td>
 </tr>
 
 </tbody>
 </table>
 
 </form>
  </body>
</html>

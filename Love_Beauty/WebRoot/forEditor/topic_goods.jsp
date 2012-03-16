<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String tid=request.getParameter("tid");
String tname=request.getParameter("topic_name");
%>

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
			var url=BASE_SERVER+"/topic_getTopicGoods";
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
					for(var i=0;i<json.length;i++){
						var goodsId=json[i]['goods']['goodsId'];
						topicGoods+="<form action='topic_updateTopicGoods' enctype='multipart/form-data'>";
						topicGoods+="<table class='tabel'><tbody><tr>"
						if(i==0){topicGoods+="<td>商品号：<input type='text' name='goods_id' value='"+goodsId+"'/>商品名: <input name='goods_name' value='"+json[i]['goods']['goodsName']+"'/></td><td><input name='submit' type='submit' value='后移'/><input name='submit' type='submit' value='删除'/><input type='button' gid='"+goodsId+"' onclick=\"$('#goods"+goodsId+"').show();\" value='显示商品详情' id='showGoods'/></td>" ;
						}
						else if(i==json.length-1){topicGoods+="<td>商品号：<input type='text' name='goods_id' value='"+goodsId+"'/>商品名: <input name='goods_name' value='"+json[i]['goods']['goodsName']+"'/></td><td><input name='submit' type='submit' value='置顶'/><input name='submit' type='submit' value='删除'/><input type='button' gid='"+goodsId+"' onclick=\"$('#goods"+goodsId+"').show();\" value='显示商品详情' id='showGoods'/></td>" ;
						}
						else{topicGoods+="<td>商品号：<input type='text' name='goods_id' value='"+goodsId+"'/>商品名: <input name='goods_name' value='"+json[i]['goods']['goodsName']+"'/></td><td><input name='submit' type='submit' value='置顶'/><input name='submit' type='submit' value='后移'/><input name='submit' type='submit' value='删除'/><input type='button' gid='"+goodsId+"' onclick=\"$('#goods"+goodsId+"').show();\" value='显示商品详情' id='showGoods'/></td>" ;
						}
						topicGoods+="</tr></tbody></table></form>";
						
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
				}
				$('#goods_list').html(topicGoods.toString());
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
  	
 <div id="goods_list">
</div>
 
 <div id="goods_detail" >
 
 </div>
  </body>
</html>

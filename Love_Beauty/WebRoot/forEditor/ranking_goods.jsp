<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String rid=request.getParameter("rid");
String rname=request.getParameter("ranking_name");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    
    <title>排行榜商品</title>
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
   
	function GetRankingGoods(rid){
			var url=BASE_SERVER+"/goods_getGoodsListByRanking0";
			var params = {"rid":rid};
			var rankingGoods="";
			var goodsDetail="";
			$.ajax({
				type:"POST",
				data:params,
				dataType: "json",
				url: url,
				success: function(json) {
				if(json== null){
					rankingGoods="暂无排行商品";
				}else{
					for(var i=0;i<json.length;i++){
						var goodsId=json[i]['goodsView']['goodsId'];
						rankingGoods+="<form action='ranking_updateRankingGoods' enctype='multipart/form-data'>";
						rankingGoods+="<table class='tabel'><tbody><tr>";
						rankingGoods+="<input type='hidden' name='id' value='"+json[i]['ranking_id']+"'>";
						rankingGoods+="<input type='hidden' name='rid' value='"+$('#ranking_id').val()+"'/><input type='hidden' name='ranking_name' value='"+$('#ranking_name').text()+"'/></td>";
						if(i==0&&json.length!=1){rankingGoods+="<td>商品号：<input type='hidden' name='id_exchange' value='"+json[i+1]['ranking_id']+"'/><input type='text' name='gid' value='"+goodsId+"'/>商品名: <input name='goods_name' value='"+json[i]['goodsView']['goodsName']+"'/></td><td><input name='submit' type='submit' value='后移'/><input name='submit' type='submit' value='删除'/><input type='button' gid='"+goodsId+"' onclick=\"$('#goods"+goodsId+"').show();\" value='显示商品详情' id='showGoods'/></td>" ;
						}
						else if(i==json.length-1){rankingGoods+="<td>商品号：<input type='text' name='gid' value='"+goodsId+"'/>商品名: <input name='goods_name' value='"+json[i]['goodsView']['goodsName']+"'/></td><td><input name='submit' type='submit' value='置顶'/><input name='submit' type='submit' value='删除'/><input type='button' gid='"+goodsId+"' onclick=\"$('#goods"+goodsId+"').show();\" value='显示商品详情' id='showGoods'/></td>" ;
						}
						else{rankingGoods+="<td>商品号：<input type='hidden' name='id_exchange' value='"+json[i+1]['ranking_id']+"'/><input type='text' name='gid' value='"+goodsId+"'/>商品名: <input name='goods_name' value='"+json[i]['goodsView']['goodsName']+"'/></td><td><input name='submit' type='submit' value='置顶'/><input name='submit' type='submit' value='后移'/><input name='submit' type='submit' value='删除'/><input type='button' gid='"+goodsId+"' onclick=\"$('#goods"+goodsId+"').show();\" value='显示商品详情' id='showGoods'/></td>" ;
						}
						rankingGoods+="</tr></tbody></table></form>";
						
						goodsDetail+="<div style='display:none;' id='goods"+goodsId+"'>";
						goodsDetail+="商品名称："+json[i]['goodsView']['goodsName'] +"<br/> ";
						goodsDetail+="商品缩略图：<img src='"+json[i]['goodsView']['goodsThumb']+"'/> <br/> ";
						goodsDetail+="商品评分："+json[i]['goodsView']['goodsScore'] +"<br/> ";
						goodsDetail+="商品适用肤质："+json[i]['goodsView']['goodsForskin'] +"<br/> ";
						goodsDetail+="商品不适用肤质："+json[i]['goodsView']['goodsNotforskin'] +"<br/> ";
						goodsDetail+="商品需注意肤质："+json[i]['goodsView']['goodsNoticeforskin'] +"<br/> ";
						goodsDetail+="商品年龄范围："+json[i]['goodsView']['goodsAge']+" <br/> ";
						goodsDetail+="商品特点及成分："+json[i]['goodsView']['goodsDescription'] +"<br/> ";
						goodsDetail+="商品用法："+json[i]['goodsView']['goodsSpecification']+" <br/> ";
						goodsDetail+="商品添加时间："+json[i]['goodsView']['goodsAddTime']+" <br/> ";
						goodsDetail+="商品状态："+json[i]['goodsView']['goodsStatus']+" <br/> ";
						goodsDetail+="</div>";
					}
				}
				$('#goods_list').html(rankingGoods.toString());
				$('#goods_detail').html(goodsDetail.toString());
				
				}
			});
	}
	
	
	$(document).ready(function(){
			GetRankingGoods($('#ranking_id').val());
			
       });
	</script>
  </head>
  
  <body>
  <%@include file="/top.jsp"%>
  <form action='ranking_insertRankingGoods' enctype='multipart/form-data'>
  	<input id="ranking_id" type="hidden" name="rid" value="<%=rid%>"/>排行榜名：<span id="ranking_name"><%=rname%></span> <br/>
  	商品id号：<input type="text" name="gid"/> <input type="submit" value="新增对应商品"/>
  	</form>
  	
 <div id="goods_list">
</div>
 
 <div id="goods_detail" >
 
 </div>
  </body>
</html>

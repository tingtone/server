<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>排行榜</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<style type="text/css">
.tabel {
	text-align: center;
	font-size: 15px;
	color: red;
	border: 1px solid purple;
}

.tabel td {
	border: 1px solid blue;
}
</style>
		<script src="jquery1.4.2.js" type="text/javascript">
</script>
			<script type="text/javascript">
   
	/*
    *获得排行榜详细信息
    */
	function GetRanking_Detail(cid){
			var url=BASE_SERVER+"/ranking_getRanking";
			var params = {"cid":cid};
			var ranking="";
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
					ranking+="<form action='ranking_updateRanking' enctype='multipart/form-data' method='post'>";
					ranking+="<table class='tabel'><tbody><tr>";
					if(i==0 &&json.length!=1){
						ranking+="<td><input type='hidden' name='rid' value='"+json[i]['rankingId']+"'/><input type='hidden' name='rid_exchange' value='"+json[i+1]['rankingId']+"'/>排行榜名: <input name='ranking_name' value='"+json[i]['rankingName']+"'/></td><td>排行榜图：<img src='"+json[i]['rankingImageUrl']+"'/>更改：<input type='file' name='newranking_image'></td><td><input name='submit' type='submit' value='后移'/><input name='submit' type='submit' value='删除'/><input name='submit' type='submit' value='更新'/><input name='submit' value='对应商品' type='submit'/></td>" ;
					}else if(i==json.length-1){
					ranking+="<td><input type='hidden' name='rid' value='"+json[i]['rankingId']+"'/>排行榜名: <input name='ranking_name' value='"+json[i]['rankingName']+"'/></td><td>排行榜图：<img src='"+json[i]['rankingImageUrl']+"'/>更改：<input type='file' name='newranking_image'></td><td><input name='submit' type='submit' value='置顶'/><input name='submit' type='submit' value='删除'/><input name='submit' type='submit' value='更新'/><input name='submit' value='对应商品' type='submit'/></td>" ;
					}else{
					ranking+="<td><input type='hidden' name='rid' value='"+json[i]['rankingId']+"'/><input type='hidden' name='rid_exchange' value='"+json[i+1]['rankingId']+"'/>排行榜名: <input name='ranking_name' value='"+json[i]['rankingName']+"'/></td><td>排行榜图：<img src='"+json[i]['rankingImageUrl']+"'/>更改：<input type='file' name='newranking_image'></td><td><input name='submit' type='submit' value='置顶'/><input name='submit' type='submit' value='后移'/><input name='submit' type='submit' value='删除'/><input name='submit' type='submit' value='更新'/><input name='submit' value='对应商品' type='submit'/></td>" ;
					}
					ranking+="</tr></tbody></table></form>";
					}
				}
				$('#ranking_detail').html(ranking.toString());
				}
			});
	}
	
	
	$(document).ready(function(){
	
			   GetRanking_Detail($('#maincla').val());
			   $('#maincla').change(function(){
				GetRanking_Detail($('#maincla').val());
			   });
			   
       });
	</script>
  </head>
  
  <body>
  <%@include file="/top.jsp"%>
 <div id="ranking_detail">
</div>
			<br />
			<br />
			<form action='ranking_insertRanking' enctype='multipart/form-data' method='post'>
			<div>
				新增排行榜：
				<br />
				排行榜名:
				<input name='ranking_name' />
				排行榜对应图片：
				<input type='file' name='newRanking_image'>
				<input name="submit" type="submit" value="添加">
			</div>
		</form>
	</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
	String gid=request.getParameter("gid");
	String gname=request.getParameter("goodsName");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>商品细节图</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
		<script src="jquery1.4.2.js" type="text/javascript">
</script>
		<script type="text/javascript">

function GetGoodsImage(gid) {
	var url = "http://192.168.14.24:8080/Love_Beauty/goods_getGoodsImage";
	var params = {
		"gid" : gid
	};
	var goods_image = "";
	$.ajax( {
		type : "POST",
		data : params,
		dataType : "json",
		url : url,
		success : function(json) {
			if (json == null) {
				alert("json null");
			} else {
				for ( var i = 0; i < json.length; i++) {
					goods_image += "<img src='" + json[i]['categoryName'] + "'</option>";
				}
			}
			flag++;
			$('#category' + flag).html(category.toString());
			for ( var i = flag + 1; i <= 4; i++) {
				$('#category' + i).empty();
			}
		}
	});
}


$(document).ready(function() {
	
	GetGoodsImage($('#goods_id').val());

	});
});
</script>
	</head>

	<body>
		<%@include file="/top.jsp"%>
		<input id="goods_id" type="hidden" name="gid" value="<%=gid%>"/>商品名： <%=gname%><br/>
  		<input name="new_image" type="file" value="新增对应图片"/>
对应图片：		
<div id="goods_images">

 </div>
		
	</body>
</html>

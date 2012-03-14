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

		<title>商品</title>
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
	.forskin, .notforskin, .noticeskin, .goodsage{
		margin-right:5px;
		background-color: #AACCEE;
	}
	
	</style>
		<script src="jquery1.4.2.js" type="text/javascript">
</script>
		<script type="text/javascript">

var flag;
function GetSubCategory(cid) {
	var url = BASE_SERVER+"/category_getSubCategories";
	var params = {
		"cid" : cid
	};
	var category = "";
	$.ajax( {
		type : "POST",
		data : params,
		dataType : "json",
		url : url,
		success : function(json) {
			if (json == null) {
				alert("json null");
			} else {
					category +="<option value='0'></option>";
				for ( var i = 0; i < json.length; i++) {
					category += "<option value='" + json[i]['categoryId']
							+ "'>" + json[i]['categoryName'] + "</option>";
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

//通过cid获得商品详情
function GetGoods(cid) {
	var url = BASE_SERVER+"/goods_getGoodsListByCat";
	var params = {
		"cid" : cid
	};
	var goodsDetail = "";
	$.ajax( {
		type : "POST",
		data : params,
		dataType : "json",
		url : url,
		success : function(json) {
			if (json == null) {
				alert("json null");
			} else {
				for(var i=0;i<json.length;i++){
					goodsDetail+=(i+1)+"：";
						goodsDetail+="<form action='goods_updateGoods' enctype='multipart/form-data' method='post'>";
						goodsDetail+="<table class='tabel'><tbody><tr>"
						goodsDetail+="<input type='hidden' name='cid' value='"+cid+"'/><input type='hidden' name='gid' value='"+json[i]['goodsId']+"'/><input type='hidden' name='bid' value='"+json[i]['brandId']+"'/>";
						goodsDetail+="<tr><td>商品名称：<input name='goodsName' type='text' value='"+json[i]['goodsName']+"'/></td></tr>";
						goodsDetail+="<tr><td>商品品牌：<input name='goodsBrand' type='text' value='"+json[i]['goodsBrandName']+"'/>系列：<input name='goodsSeries' type='text' value='"+json[i]['goodsSeriesName']+"'/></td></tr>";
						goodsDetail+="<tr><td>商品缩略图：<img src='"+json[i]['goodsThumb']+"'/>更改：<input type='file' name='newGoods_thumb'></td></td></tr> ";
						goodsDetail+="<tr><td>商品评分：<input name='goodsScore' type='text' value='"+json[i]['goodsScore']+"'/></td></tr> ";
						goodsDetail+="<tr><td>商品适用肤质：<input id='goodsForskin"+i+"' name='goodsForskin' type='text' value='"+json[i]['goodsForskin'] +"'/><span class='forskin' i='"+i+"'>干性</span><span class='forskin' i='"+i+"'>油性</span><span class='forskin' i='"+i+"'>混合性</span><span class='forskin' i='"+i+"'>中性</span><span class='forskin' i='"+i+"'>敏感性</span></td></tr> ";
						goodsDetail+="<tr><td>商品不适用肤质：<input id='goodsNotforskin"+i+"' name='goodsNotforskin' type='text' value='"+json[i]['goodsNotforskin'] +"'/><span class='notforskin' i='"+i+"'>干性</span><span class='notforskin' i='"+i+"'>油性</span><span class='notforskin' i='"+i+"'>混合性</span><span class='notforskin' i='"+i+"'>中性</span><span class='notforskin' i='"+i+"'>敏感性</span></td></tr> ";
						goodsDetail+="<tr><td>商品需注意肤质：<input id='goodsNoticeforskin"+i+"' name='goodsNoticeforskin' type='text' value='"+json[i]['goodsNoticeforskin'] +"'/><span class='noticeskin' i='"+i+"'>干性</span><span class='noticeskin' i='"+i+"'>油性</span><span class='noticeskin' i='"+i+"'>混合性</span><span class='noticeskin' i='"+i+"'>中性</span><span class='noticeskin' i='"+i+"'>敏感性</span></td></tr> ";
						goodsDetail+="<tr><td>商品年龄范围：<input id='goodsAge"+i+"' name='goodsAge' type='text' value='"+json[i]['goodsAge']+"'/><span class='goodsage' i='"+i+"'>20岁以下</span><span class='goodsage' i='"+i+"'>20-25岁</span><span class='goodsage' i='"+i+"'>26-30岁</span><span class='goodsage' i='"+i+"'>30-35岁</span><span class='goodsage' i='"+i+"'>36-40岁</span><span class='goodsage' i='"+i+"'>40岁以上</span></td></tr> ";
						goodsDetail+="<tr><td>商品特点及成分：<input name='goodsDescription'  type='text' value='"+json[i]['goodsDescription'] +"'/></td></tr> ";
						goodsDetail+="<tr><td>商品用法：<input name='goodsSpecification' type='text' value='"+json[i]['goodsSpecification']+"'/></td></tr> ";
						goodsDetail+="<tr><td>商品状态：<input name='goodsStatus' type='text' value='"+json[i]['goodsStatus']+"'/></td></tr> ";
						goodsDetail+="<tr><td><input type='submit' name='submit' value='更新'/><input type='submit' name='submit' value='删除'/><input type='submit' name='submit' value='对应真实商品'/><input type='submit' name='submit' value='商品细节图'/></td></tr> ";
						goodsDetail+="</tbody></table></form>";
					}
			}
			$('#goods_detail').html(goodsDetail.toString());
			for ( var i = flag + 1; i <= 4; i++) {
				$('#category' + i).html("");
			}
		}
	});
}

$(document).ready(function() {
	
	$('.category').change(function() {
		flag = $(this).attr('flag');
		var cid = $(this).val();
		GetSubCategory(cid);
		GetGoods(cid);

	});
	
	$('.forskin').live("click",function(){
		var str=$(this).text();
		var i=$(this).attr('i');
		if($('#goodsForskin'+i).val()==""){
		$('#goodsForskin'+i).val(str);
		}else if($('#goodsForskin'+i).val().indexOf(str)<0){
		$('#goodsForskin'+i).val($('#goodsForskin'+i).val()+","+str);
		}
	});
	$('.notforskin').live("click",function(){
		var str=$(this).text();
		var i=$(this).attr('i');
		if($('#goodsNotforskin'+i).val()==""){
		$('#goodsNotforskin'+i).val(str);
		}
		else if($('#goodsNotforskin'+i).val().indexOf(str)<0){
		$('#goodsNotforskin'+i).val($('#goodsNotforskin'+i).val()+","+str);
		}
	});
	$('.noticeskin').live("click",function(){
		var str=$(this).text();
		var i=$(this).attr('i');
		if($('#goodsNoticeforskin'+i).val()==""){
		$('#goodsNoticeforskin'+i).val(str);
		}else if($('#goodsNoticeforskin'+i).val().indexOf(str)<0){
		$('#goodsNoticeforskin'+i).val($('#goodsNoticeforskin'+i).val()+","+str);
		}
	});
	
	$('.goodsage').live("click",function(){
		var str=$(this).text();
		var i=$(this).attr('i');
		if($('#goodsAge'+i).val()==""){
		$('#goodsAge'+i).val(str);
		}else if($('#goodsAge'+i).val().indexOf(str)<0){
		$('#goodsAge'+i).val($('#goodsAge'+i).val()+","+str);
		}
	});
	
});
</script>
	</head>

	<body>
		<%@include file="/top.jsp"%>
		<table border="1">
			<tbody>
				<tr>
					<td>
						一级分类：
						<select class="category" flag="1" id="category1">
						<option value="0" selected="selected">
							</option>
							<option value="1">
								护肤
							</option>
							<option value="2">
								妆扮
							</option>
							<option value="3">
								美体
							</option>
							<option value="4">
								美发
							</option>
						</select>
					</td>
					<td>
						二级分类：
						<select class="category" flag="2" id="category2">
						</select>
					</td>
					<td>
						三级分类：
						<select class="category" flag="3" id="category3">
						</select>
					</td>
					<td>
						四级分类：
						<select class="category" flag="4" id="category4">
						</select>
					</td>
				</tr>
				<tr>
					<td><a href="forEditor/newGoods.jsp" >新增商品</a></td>
				</tr>
			</tbody>
		</table>
		
<div id="goods_detail">
 </div>
		
	</body>
</html>

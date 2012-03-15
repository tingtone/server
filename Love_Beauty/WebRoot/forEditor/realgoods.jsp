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

		<title> 查看真实商品</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	.tabel{
		text-align: center;
		font-size: 15px;
		color: red;
		border: 4px solid gray;
		width: 600px;
	}
	.tabel td{
		border: 1px solid blue;
		margin: 0;
		padding: 0;
	}
	.tabel b{
		border: 1px solid blue;
	}
	.tabel b input{
		width: 10px;
	}
	img{
		border: 1px solid black;
	}
	
	</style>
		<script src="jquery1.4.2.js" type="text/javascript">
</script>
		<script type="text/javascript">

function transProvider(pid){

	if(pid=="1"){
		return  "no5";
	}else if(pid=="2"){
		return "lafaso";	
		}
		else if(pid=="3"){
		return "jumei";	
		}
		else if(pid=="4"){
		return "360buy";	
		}
		else if(pid=="5"){
		return "dangdang";	
		}
		else if(pid=="6"){
		return "amazon";	
		}
}


//通过gid获得商品对应关系
function GetRealGoodsListBySeries(bid,sid) {
	var url = BASE_SERVER+"/goods_GetRealGoodsListBySeries";
	var params = {
		"sid" : sid,
		"bid" : bid
	};
	var goodsDetail = "";
	$.ajax( {
		type : "POST",
		data : params,
		dataType : "json",
		url : url,
		success : function(json) {
			if (json == null ||json.length==0) {
				goodsDetail+="无数据";
			} else {
				for(var i=0;i<json.length;i++){
				var goodsimage=json[i]['goodsImages'];
				var goodsimagelist=unserialize(goodsimage);
				goodsDetail+=(i+1)+"：";
						goodsDetail+="<form action='goods_updateGoods' enctype='multipart/form-data'>";
						goodsDetail+="<table class='tabel'><tbody><tr>"
						goodsDetail+="<tr><td>供应商："+transProvider(json[i]['providerId'])+"</td></tr>"
						goodsDetail+="<tr><td>商品名称："+json[i]['goodsName']+"  商品ID号："+json[i]['goodsRealId']+"</td></tr>";
						goodsDetail+="<tr><td>品牌名："+json[i]['brandName']+"  系列名："+json[i]['seriesName']+"</td></tr>";
						goodsDetail+="<tr><td>商品价格："+json[i]['goodsPrice']+"</td></tr>";
						goodsDetail+="<tr><td>商品分类名："+json[i]['categoryName']+"</td></tr>";
						goodsDetail+="<tr><td>商品缩略图：<a href='"+ json[i]['goodsUrl']+"' target='_blank'><img src='"+json[i]['goodsThumb']+"'/>点击查看</a></td></tr> ";
						goodsDetail+="<tr><td>商品细节图：";
						for(var j=0;j<goodsimagelist.length;j++){
							goodsDetail+="<img src='"+goodsimagelist[j] +"'/>";
						}
						goodsDetail+="</td></tr>";
						goodsDetail+="<tr><td>商品评分："+json[i]['goodsScore']+"</td></tr> ";
						goodsDetail+="<tr><td>商品适用肤质："+json[i]['goodsForskin'] +"</td></tr> ";
						goodsDetail+="<tr><td>商品不适用肤质："+json[i]['goodsNotforskin'] +"</td></tr> ";
						goodsDetail+="<tr><td>商品需注意肤质："+json[i]['goodsNoticeforskin'] +"</td></tr> ";
						goodsDetail+="<tr><td>商品年龄范围："+json[i]['goodsAge']+"</td></tr> ";
						goodsDetail+="<tr><td>商品特点及成分："+json[i]['goodsDescription'] +"</td></tr> ";
						goodsDetail+="<tr><td>商品用法："+json[i]['goodsSpecification']+"</td></tr> ";
						goodsDetail+="<tr><td>商品添加时间："+json[i]['goodsAddTime']+"</td></tr> ";
						goodsDetail+="<tr><td>商品状态："+json[i]['goodsStatus']+"</td></tr> ";
						goodsDetail+="<tr><td><input rgid='"+json[i]['goodsRealId']+"' type='button' class='comment' value='查看评论'/></td></tr> ";
						goodsDetail+="<tr><td><div id='comment_"+json[i]['goodsRealId']+"'/></td></tr> ";
						goodsDetail+="</tbody></table></form>";
					}
			}
			$('#real_goods_detail').html(goodsDetail.toString());
		}
	});
}

   /* phpserializer.js - JavaScript to PHP serialize / unserialize class.
* 
* This class is designed to convert php variables to javascript
* and javascript variables to php with a php serialize unserialize
* compatible way.
*
* Copyright (C) 2006 Ma Bingyao <andot@ujn.edu.cn>
* Version: 3.0c
* LastModified: Jun 2, 2006
* This library is free.  You can redistribute it and/or modify it.
* http://www.coolcode.cn/?p=171
*/
 
 /*
function serialize(o) {
    var p = 0, sb = [], ht = [], hv = 1;
    function classname(o) {
        if (typeof(o) == "undefined" || typeof(o.constructor) == "undefined") return '';
        var c = o.constructor.toString();
        c = utf16to8(c.substr(0, c.indexOf('(')).replace(/(^/s*function/s*)|(/s*$)/ig, ''));
        return ((c == '') ? 'Object' : c);
    }
    function is_int(n) {
        var s = n.toString(), l = s.length;
        if (l > 11) return false;
        for (var i = (s.charAt(0) == '-') ? 1 : 0; i < l; i++) {
            switch (s.charAt(i)) {
                case '0':
                case '1':
                case '2':
                case '3':
                case '4':
                case '5':
                case '6':
                case '7':
                case '8':
                case '9': break;
                default : return false;
            }
        }
        return !(n < -2147483648 || n > 2147483647);
    }
    function in_ht(o) {
        for (k in ht) if (ht[k] === o) return k;
        return false;
    }
    function ser_null() {
        sb[p++] = 'N;';
    }
    function ser_boolean(b) {
        sb[p++] = (b ? 'b:1;' : 'b:0;');
    }
    function ser_integer(i) {
        sb[p++] = 'i:' + i + ';';
    }
    function ser_double(d) {
        if (d == Number.POSITIVE_INFINITY) d = 'INF';
        else if (d == Number.NEGATIVE_INFINITY) d = '-INF';
        sb[p++] = 'd:' + d + ';';
    }
    function ser_string(s) {
        var utf8 = utf16to8(s);
        sb[p++] = 's:' + utf8.length + ':"';
        sb[p++] = utf8;
        sb[p++] = '";';
    }
    function ser_array(a) {
        sb[p++] = 'a:';
        var lp = p;
        sb[p++] = 0;
        sb[p++] = ':{';
        for (var k in a) {
            if (typeof(a[k]) != 'function') {
                is_int(k) ? ser_integer(k) : ser_string(k);
                __serialize(a[k]);
                sb[lp]++;
            }
        }
        sb[p++] = '}';
    }
    function ser_object(o) {
        var cn = classname(o);
        if (cn == '') ser_null();
        else if (typeof(o.serialize) != 'function') {
            sb[p++] = 'O:' + cn.length + ':"';
            sb[p++] = cn;
            sb[p++] = '":';
            var lp = p;
            sb[p++] = 0;
            sb[p++] = ':{';
            if (typeof(o.__sleep) == 'function') {
                var a = o.__sleep();
                for (var kk in a) {
                    ser_string(a[kk]);
                    __serialize(o[a[kk]]);
                    sb[lp]++;
                }
            }
            else {
                for (var k in o) {
                    if (typeof(o[k]) != 'function') {
                        ser_string(k);
                        __serialize(o[k]);
                        sb[lp]++;
                    }
                }
            }
            sb[p++] = '}';
        }
        else {
            var cs = o.serialize();
            sb[p++] = 'C:' + cn.length + ':"';
            sb[p++] = cn;
            sb[p++] = '":' + cs.length + ':{';
            sb[p++] = cs;
            sb[p++] = "}";
        }
    }
    function ser_pointref(R) {
        sb[p++] = "R:" + R + ";";
    }
    function ser_ref(r) {
        sb[p++] = "r:" + r + ";";
    }
    function __serialize(o) {
        if (o == null || o.constructor == Function) {
            hv++;
            ser_null();
        }
        else switch (o.constructor) {
            case Boolean: {
                hv++;
                ser_boolean(o);
                break;
            }
            case Number: {
                hv++;
                is_int(o) ? ser_integer(o) : ser_double(o);
                break;
            }
            case String: {
                hv++;
                ser_string(o);
                break;
            }
            case Array: {
                var r = in_ht(o);
                if (r) {
                    ser_pointref(r);
                }
                else {
                    ht[hv++] = o;
                    ser_array(o);
                }
                break;
            }
            default: {
                var r = in_ht(o);
                if (r) {
                    hv++;
                    ser_ref(r);
                }
                else {
                    ht[hv++] = o;
                    ser_object(o);
                }
                break;
            }
        }
    }
    __serialize(o);
    return sb.join('');
}
*/
 
function unserialize(ss) {
    var p = 0, ht = [], hv = 1; r = null;
    function unser_null() {
        p++;
        return null;
    }
    function unser_boolean() {
        p++;
        var b = (ss.charAt(p++) == '1');
        p++;
        return b;
    }
    function unser_integer() {
        p++;
        var i = parseInt(ss.substring(p, p = ss.indexOf(';', p)));
        p++;
        return i;
    }
    function unser_double() {
        p++;
        var d = ss.substring(p, p = ss.indexOf(';', p));
        switch (d) {
            case 'INF': d = Number.POSITIVE_INFINITY; break;
            case '-INF': d = Number.NEGATIVE_INFINITY; break;
            default: d = parseFloat(d);
        }
        p++;
        return d;
    }
    function unser_string() {
        p++;
        var l = parseInt(ss.substring(p, p = ss.indexOf(':', p)));
        p += 2;
          //  var cn = utf8to16(ss.substring(p, p += l));
        var cn = ss.substring(p, p += l);        
        p += 2;
        return cn;
    }
    function unser_array() {
        p++;
        var n = parseInt(ss.substring(p, p = ss.indexOf(':', p)));
        p += 2;
        var a = [];
        ht[hv++] = a;
        for (var i = 0; i < n; i++) {
            var k;
            switch (ss.charAt(p++)) {
                case 'i': k = unser_integer(); break;
                case 's': k = unser_string(); break;
                case 'U': k = unser_unicode_string(); break;
                default: return false;
            }
            a[k] = __unserialize();
        }
        p++;
        return a;
    }
    function unser_object() {
        p++;
        var l = parseInt(ss.substring(p, p = ss.indexOf(':', p)));
        p += 2;
          //  var cn = utf8to16(ss.substring(p, p += l));
        var cn = ss.substring(p, p += l);
        p += 2;
        var n = parseInt(ss.substring(p, p = ss.indexOf(':', p)));
        p += 2;
        if (eval(['typeof(', cn, ') == "undefined"'].join(''))) {
            eval(['function ', cn, '(){}'].join(''));
        }
        var o = eval(['new ', cn, '()'].join(''));
        ht[hv++] = o;
        for (var i = 0; i < n; i++) {
            var k;
            switch (ss.charAt(p++)) {
                case 's': k = unser_string(); break;
                case 'U': k = unser_unicode_string(); break;
                default: return false;
            }
            if (k.charAt(0) == '/0') {
                k = k.substring(k.indexOf('/0', 1) + 1, k.length);
            }
            o[k] = __unserialize();
        }
        p++;
        if (typeof(o.__wakeup) == 'function') o.__wakeup();
        return o;
    }
    function unser_custom_object() {
        p++;
        var l = parseInt(ss.substring(p, p = ss.indexOf(':', p)));
        p += 2;
      //  var cn = utf8to16(ss.substring(p, p += l));
        var cn = ss.substring(p, p += l);
        p += 2;
        var n = parseInt(ss.substring(p, p = ss.indexOf(':', p)));
        p += 2;
        if (eval(['typeof(', cn, ') == "undefined"'].join(''))) {
            eval(['function ', cn, '(){}'].join(''));
        }
        var o = eval(['new ', cn, '()'].join(''));
        ht[hv++] = o;
        if (typeof(o.unserialize) != 'function') p += n;
        else o.unserialize(ss.substring(p, p += n));
        p++;
        return o;
    }
    function unser_unicode_string() {
        p++;
        var l = parseInt(ss.substring(p, p = ss.indexOf(':', p)));
        p += 2;
        var sb = [];
        for (i = 0; i < l; i++) {
            if ((sb[i] = ss.charAt(p++)) == '//') {
                sb[i] = String.fromCharCode(parseInt(ss.substring(p, p += 4), 16));
            }
        }
        p += 2;
        return sb.join('');
    }
    function unser_ref() {
        p++;
        var r = parseInt(ss.substring(p, p = ss.indexOf(';', p)));
        p++;
        return ht[r];
    }
    function __unserialize() {
        switch (ss.charAt(p++)) {
            case 'N': return ht[hv++] = unser_null();
            case 'b': return ht[hv++] = unser_boolean();
            case 'i': return ht[hv++] = unser_integer();
            case 'd': return ht[hv++] = unser_double();
            case 's': return ht[hv++] = unser_string();
            case 'U': return ht[hv++] = unser_unicode_string();
            case 'r': return ht[hv++] = unser_ref();
            case 'a': return unser_array();
            case 'O': return unser_object();
            case 'C': return unser_custom_object();
            case 'R': return unser_ref();
            default: return false;
        }
    }
    return __unserialize();
}

//获得品牌
function GetBrands() {
	var url = "http://192.168.14.24:8080/Love_Beauty/brand_getBrands";
	var brand = "";
	$.ajax({
		type : "POST",
		dataType : "json",
		url : url,
		success : function(json) {
			if (json == null) {
				alert("json null");
			} else {
				brand +="<option value='0'></option>";
				for ( var i = 0; i < json.length; i++) {
					brand += "<option value='" + json[i]['brandId']+ "'>" + json[i]['brandName'] + "</option>";
				}
			}
			$('#brand').html(brand);
		}
	});
}
//获得系列
function GetSeries(bid) {
	var url = "http://192.168.14.24:8080/Love_Beauty/brand_getSeries";
	var series = "";
	var params = {
		"bid" : bid
	};
	$.ajax({
		type : "POST",
		data : params,
		dataType : "json",
		url : url,
		success : function(json) {
			if (json == null) {
				alert("json null");
			} else {
				for ( var i = 0; i < json.length; i++) {
					series += "<option value='" + json[i]['seriesId']+ "'>" + json[i]['seriesName'] + "</option>";
				}
			}
			$('#series').html(series);
		}
	});
}

//获得商品评论
function GetRealGoodsComment(rgid) {
	var url = "http://192.168.14.24:8080/Love_Beauty/goods_getRealGoodsComment";
	var realGoodsComment = "";
	var params = {
		"rgid" : rgid
	};
	$.ajax({
		type : "POST",
		data : params,
		dataType : "json",
		url : url,
		success : function(json) {
			if (json == null) {
				alert("json null");
			} else {
			realGoodsComment +="<table border='1'><tbody>"
				for ( var i = 0; i < json.length; i++) {
					realGoodsComment +="<tr><td>评论用户：" + json[i]['commentator']+ "评论内容："+json[i]['commentContent']+"评论等级："+json[i]['commentLevel']+"</td></tr>";
				}
				realGoodsComment +="</tbody></table>"
			}
			$('#comment_'+rgid).html(realGoodsComment);
		}
	});
}


$(document).ready(function() {
	
	GetBrands();
	$('#brand').change(function() {
		var bid = $(this).val();
		GetSeries(bid);
	});
	$('#realgoods').click(function() {
		var bid = $('#brand').val();
		var sid = $('#series').val();
		GetRealGoodsListBySeries(bid,sid);
	});
	$('.comment').live("click",function(){
		var rgid=$(this).attr('rgid');
		GetRealGoodsComment(rgid);
	});
	
});
</script>
	</head>

	<body>
		<%@include file="/top.jsp"%>
		<table class="tabel" >
 <tbody>
 <tr><td>商品品牌：<select class="brand" id="brand" name="bid"></select></td>
 		<td>系列：<select class="series" id="series" name="sid"></select></td><td><input id="realgoods" type="button" value="查看该系列（品牌）真实商品"/></td></tr>
 		</tbody></table>
	<div id="real_goods_detail">

 </div>
		
	</body>
</html>

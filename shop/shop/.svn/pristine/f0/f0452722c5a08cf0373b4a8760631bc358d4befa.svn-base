<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<%@ include file="/public/head.jspf" %>
  	<script type="text/javascript">
  		//扩展新的函数，接受json格式，此方式支持jquery类直接调用，类函数
  		$.extend($.fn,{
  			max:function(a,b){
  				return a>b?a:b;
  			},
  			min:function(a,b){
  				return a<b?a:b;
  			}
  		});
  		alert($("#abc").max(2,3));
  		alert($("#abc").min(2,3));
  	</script>
  </head>
  	
  <body>
  		<input id="abc"/>
  </body>
</html>

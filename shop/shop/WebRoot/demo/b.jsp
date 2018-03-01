<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<%@ include file="/public/head.jspf" %>
  	<!-- 配置页面不缓存 -->
  	<% response.setHeader("cache-control", "no-store"); %>
  </head>
  	
  <body>
  		此页面采用了服务器端的方式设置了不缓存
  		<input type="text" value="xyz"/>
  		<a href="c.jsp">c.jsp</a>
  </body>
</html>

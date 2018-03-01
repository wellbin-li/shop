<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<%@ include file="/public/head.jspf" %>
  </head>
  
  <body>
   <a href="send_main_aindex.action">后台登录</a>
   <table width="700" border="0">
	  <!-- 大循环开始-->
	  <c:forEach items="${applicationScope.bigList}" var="list">
	  <!-- 显示当前类别名称 -->
	  <tr>
	  	<td colspan="4">${list[0].category.type}</td>
	  </tr>
	  <!-- 显示当前类别的商品信息 -->
	  <tr>
	    <td>
	   	 	<table width="100%" border="0">
	 			<tr>
	            	<!-- 小循环开始-->
	            	<c:forEach items="${list}" var="product">
	            	<td>
	                	<!--显示具体的商品信息-->
	                    <table width="100%" border="0">
	                      <tr>
	                        <td>
	                        	<!--图片-->
	                        	<img src="${shop}/image/${product.pic}">
	                        </td>
	                      </tr>
	                      <tr>
	                        <td>
	                        	<!--名称-->
	                        	商品名称：${product.name}
	                        </td>
	                      </tr>
	                      <tr>
	                        <td>
	                        	<!--价格-->
	                        	价格：${product.price}
	                        </td>
	                      </tr>
	                    </table>
	                    <!--商品信息结束-->
	                </td>
	                </c:forEach>
	                <!-- 小循结束始-->
	            </tr>    
			</table>
	    </td>
	  </tr>
	  </c:forEach>
	  <!-- 大循环结束-->
	</table>
  </body>
</html>

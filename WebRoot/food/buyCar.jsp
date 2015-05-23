<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>购物车</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	if ("${requestScope.msg}".length > 0) {
		alert("${requestScope.msg}");
	}
</script>
  </head>

  	<c:if test="${empty sessionScope.mycar}">
  		<p align="center" style="font-size: 25px">购物车中没有任何食物，<a href="${pageContext.request.contextPath}/index.jsp">回到主页购物</a></p>
  </c:if>
<c:if test="${not empty sessionScope.mycar}">
    <center>
    ${requestScope.msg }<br>
    
   <font face="微软雅黑" style="font-size: 25px"><p> 你的购物车中有以下食品:</p></font><br>
    
    <%-- 声明变量计算总价格 --%>
    <c:set var="sumPrice" value="0"></c:set>
    <font face="微软雅黑">
    <table width="85%" border="1" cellpadding="0" cellspacing="0">
    <tr><td>id</td><td>食品名称</td><td>食品价格</td><td>购买数量</td><td>小计</td><td>操作</td></tr>
   
    <c:forEach  items="${sessionScope.mycar}"  var="bc">
    <tr>
    	<td>${bc.value.id}</td>
				<td>${bc.value.name}</td>
				<td>${bc.value.price}</td>
				<td>${bc.value.buyCount}</td>
					<td>${bc.value.price*bc.value.buyCount}</td>
					<td><a href="${pageContext.request.contextPath}/servlet/FoodServlet?method=toBuy&foodId=${bc.value.id}&opera=cancel">取消购买</a>
					&nbsp;
					<a href="${pageContext.request.contextPath}/servlet/FoodServlet?method=toBuy&foodId=${bc.value.id}&opera=add">加一件</a>&nbsp;
					<a href="${pageContext.request.contextPath}/servlet/FoodServlet?method=toBuy&foodId=${bc.value.id}&opera=del">减一件</a>
					</td>
				</tr>
				<c:set  var="sumPrice" value="${sumPrice+bc.value.price*bc.value.buyCount}"></c:set>
				
    </c:forEach>
    
    <tr><td  colspan="4"  align="right">合计:</td><td colspan="2">  ${sumPrice} </td></tr>
    </table>
    </font>
    <font face="微软雅黑" style="font-size: 18px">
    <a href="${pageContext.request.contextPath}/servlet/OrderServlet?method=placeOrder&sumPrice=${sumPrice}">结账</a>&nbsp;
     
    	<a href="${pageContext.request.contextPath}/servlet/FoodServlet?method=giveup">放弃购买</a>
    	<a href="${pageContext.request.contextPath}/index.jsp">继续购物</a></font>
    </center>
 </c:if>
   <body>
  </body>
</html>

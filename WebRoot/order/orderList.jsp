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
    
    <title>订单管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <center>
  <font face="微软雅黑"><h2 style="font-size: 28px">订单管理</h2></font>
  <font face="微软雅黑" style="font-size: 18px">
    <table width="70%" border="1" cellpadding="0" cellspacing="0">
    	<tr><td>编号</td><td>订单号</td><td>订餐时间</td><td>订单状态</td><td>操作</td></tr>
    	<c:forEach items="${requestScope.orders}" var="order">
    	<tr>
    	<td>${order.id}</td>
    	<td>${order.orderId}</td><td>${order.time}</td>
    	
    	<td><c:if test="${order.status==0}">未送餐</c:if>
    	<c:if test="${order.status==1}">已送餐</c:if>
    	<c:if test="${order.status==2}">已确认</c:if>
    	</td>
    	
    	<td><c:if test="${order.status==1}"><a href="${pageContext.request.contextPath}/servlet/OrderServlet?method=change&id=${order.id}&status=2">确认收货</a></c:if>&nbsp;&nbsp;
    	<a href="${pageContext.request.contextPath}/servlet/OrderServlet?method=Orderdetails&orderId=${order.orderId}">查看详情</a></td>
    	</tr>
    	</c:forEach>
    </table>
    </font>
    <font face="微软雅黑" style="font-size: 22"><a href="${pageContext.request.contextPath}/index.jsp"><input type="button" value="返回"></a></font>
    </center>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body><center>
  <font face="微软雅黑"><h2 style="font-size: 35px">订单详情</h2></font>
  <br>
   <%-- 声明变量计算总数量和价格 --%>
    <c:set var="sumNum" value="0"></c:set>
    <c:set var="sumPrice" value="0"></c:set>
    <font face="微软雅黑">
   	<table width="70%" border="1" cellpadding="0" cellspacing="0">
   	<tr><td>订单编号</td><td>食物名字</td><td>食物类型</td><td>食物单价</td><td>购买数量</td><td>总计</td></tr>
   	<c:forEach items="${requestScope.orderLists }" var="orderList" varStatus="status">
   	<tr><c:if test="${status.first}"><td rowspan="${requestScope.size}">${orderList.listId}</td></c:if><td>${orderList.fname}</td>
   	<c:if test="${orderList.ftype == 1}">
							<td align="center">
								精美小炒
							</td>
						</c:if>
						<c:if test="${orderList.ftype == 2}">
							<td align="center">
								家常小菜
							</td>
						</c:if>
						<c:if test="${orderList.ftype == 3}">
							<td align="center">
								饭后甜品
							</td>
						</c:if>
						<c:if test="${orderList.ftype == 4}">
							<td align="center">
								特色饮料
							</td>
						</c:if>
   	<td>${orderList.fprice}元</td><td>${orderList.fcount}件</td><td>${orderList.ftotal}元</td></tr>
   	<c:set var="sumNum" value="${sumNum+orderList.fcount}"></c:set>
    <c:set var="sumPrice" value="${sumPrice+orderList.ftotal}"></c:set>
   	</c:forEach>
   	<tr><td colspan="4"  height="50px" align="center">合计:</td><td>${sumNum}件</td><td>${sumPrice}元</td></tr>
   	</table>
   	 </font>
   	<a href="javascript:history.go(-1);"><input type="button" value="返回"></a>
   	</center>
   	
  </body>
 
</html>

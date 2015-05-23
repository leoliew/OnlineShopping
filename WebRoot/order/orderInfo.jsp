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
    
    <title>订单信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/demo.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.6.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/Validform_v5.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.datePicker-min.js"></script>
<script type="text/javascript">
	$(function() {
		//$(".registerform").Validform();  //就这一行代码！;
		$(".foodForm").Validform({
			tiptype : 2
		});
	})
</script>
  </head>
  
  <body>
  
   <h1 align="left">订单信息</h1>
	<br>
	<form action="servlet/OrderServlet?method=confirmOrder" method="post"
		class="foodForm" name="updateUserForm">
		<table>
			<tr>
				<td><span style="color: red">订单号:</span>
				</td>
				<td>
					<label>${requestScope.orderId}</label>
					<input type="hidden" name="orderId" value="${requestScope.orderId}">
				</td>
				<td><div class="Validform_checktip"></div></td>
			</tr>
			<tr>
				<td>买家姓名:</td>
				<td><input type="text" name="realName" class="inputxt"
					value="${sessionScope.user.realName}" datatype="z2-4"
					nullmsg="请输入真实姓名" errormsg="中文名为2~4个中文字符！"></td>
				<td><div class="Validform_checktip"></div></td>
			</tr>
			<tr>
				<td>配送地址:</td>
				<td><textarea tip="请在这里输入您的地址!" altercss="gray" class="gray"
						value="" name="addr">${sessionScope.user.addr}</textarea></td>
				<td><div class="Validform_checktip"></div>
				</td>
			</tr>
			<tr>
			<tr>
				<td>联系电话:</td>
				<td><input type="text" class="inputxt" name="phone"
					value="${sessionScope.user.phone}" class="inputxt" datatype="m"
					errormsg="请输入您的手机号码！"" ></td>
				<td><div class="Validform_checktip"></div></td>
			</tr>
			
			
			<tr>
				<td><span>备注信息:</span>
				</td>
				<td><input type="text" class="inputxt"  name="notice"></td>
			</tr>
			<tr>
				<td><span style="color: red">实付款:</span>
				</td>
				<td><label>${requestScope.sumPrice}元</label><input type="hidden" name="sumPrice" value="${requestScope.sumPrice}"></td>
				<td><div class="Validform_checktip"></div></td>
			</tr>
			<tr>
				<td><input type="submit" value="确认"></td>
				<td><input type="reset" value="重置">&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath}/index.jsp?show=cart"><input
					type="button" value="返回"></a></td>
			</tr>
		</table>
	</form>
</body>
</html>

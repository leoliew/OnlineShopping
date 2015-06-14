<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>用户登录</title>

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
	<h1 style="font-size: 28px" align="left">用户登录</h1>
	<form action="servlet/UserServlet?method=login"  method="post" class="foodForm" name="loginForm">
		<table>
			<tr>
				<td>用户名:</td>
				<td><input type="text" name="userName" class="inputxt" datatype="s"
					nullmsg="请输入用户名！">
				</td>
				<td><div class="Validform_checktip"></div>
				</td>
			</tr>
			<tr>
				<td>密码:</td>
				<td><input type="password" name="password" class="inputxt" datatype="*"
					nullmsg="请输入密码！">
				</td>
				<td><div class="Validform_checktip"></div>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="登录">
				</td>
				<td><input type="reset" value="重置">
				<a  href="${pageContext.request.contextPath}/index.jsp"><input type="button" value="返回"></a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>

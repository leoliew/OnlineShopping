<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>修改用户信息</title>

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
	<h1 align="left">修改用户信息</h1>
	<br>
	<form action="servlet/UserServlet?method=update&id=${requestScope.user.id}" method="post"
		class="foodForm" name="updateUserForm">
		<table>
			<tr>
				<td><span style="color: red">用户名:</span>
				</td>
				<td><input type="text" name="userName" class="inputxt"
					value="${requestScope.user.userName}" readonly="readonly">
				</td>
				<td><div class="Validform_checktip"></div></td>
			</tr>
			<tr>
				<td>*真实姓名:</td>
				<td><input type="text" name="realName" class="inputxt"
					value="${requestScope.user.realName}" datatype="z2-4"
					nullmsg="请输入真实姓名" errormsg="中文名为2~4个中文字符！"></td>
				<td><div class="Validform_checktip"></div></td>
			</tr>
			<tr>
				<td>*性别: &nbsp;&nbsp;</td>
				<td><input type="radio" value="男" name="sex"  datatype="*" nullmsg="请选择性别"  
				 <c:if test="${requestScope.user.sex=='男'}">checked</c:if>
					errormsg="请选择性别！" />男 <input type="radio" value="女" name="sex" <c:if test="${requestScope.user.sex=='女'}">checked</c:if> />女</td>
				<td><div class="Validform_checktip"></div></td>
			</tr>
			<tr>
				<td>*移动电话:</td>
				<td><input type="text" class="inputxt" name="phone"
					value="${requestScope.user.phone}" class="inputxt" datatype="m"
					errormsg="请输入您的手机号码！"" ></td>
				<td><div class="Validform_checktip"></div></td>
			</tr>
			<tr>
				<td>*地址:</td>
				<td><textarea tip="请在这里输入您的地址!" altercss="gray" class="gray"
						value="" name="addr">${requestScope.user.addr}</textarea></td>
				<td><div class="Validform_checktip"></div>
				</td>
			</tr>
			<tr>
				<td>*QQ号:</td>
				<td><input type="text" class="inputxt" name="qq"
					value="${requestScope.user.qq}" datatype="n5-13" nullmsg="请输入QQ号码"
					errormsg="QQ号码至少为5位，最大为13位数字"></td>
				<td><div class="Validform_checktip"></div></td>
			</tr>
			<tr>
				<td><span style="color: red">所剩余额:</span>
				</td>
				<td><input type="text" class="inputxt" readonly="readonly"
					value="${requestScope.user.acount}" name="acount"></td>
				<td><div class="Validform_checktip"></div></td>
			</tr>
			<tr>
				<td><span style="color: red">注册时间:</span>
				</td>
				<td><input type="text" class="inputxt" readonly="readonly"
					value="${requestScope.user.regTime}"></td>
				<td><div class="Validform_checktip"></div></td>
			</tr>
			<tr>
				<td><input type="submit" value="修改"></td>
				<td><input type="reset" value="重置">&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath}/index.jsp"><input
					type="button" value="返回"></a></td>
			</tr>
		</table>
	</form>
</body>
</html>

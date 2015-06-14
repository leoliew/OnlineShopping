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

<title>注册用户</title>

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
		$(".foodForm").Validform({
			usePlugin : {
				datepicker : {
					format : "yyyy-mm-dd",//指定输出的时间格式;
					firstDayOfWeek : 1,//指定每周开始的日期，0、1-6 对应 周日、周一到周六;
					callback : function(date, obj) {//指定选择日期后的回调函数;
						//date:选中的日期;
						//obj:当前表单元素;
						$("#msgdemo2").text(date + " is selected");
					},
					//以上三个参数是在Validform插件内调用Datepicker时可传入的参数;
					//下面几个参数是Datepicker插件本身初始化时可接收的参数，还有更多请查看页面说明;
					clickInput : true,
					startDate : "1970-00-00",
					createButton : false
				}
			}
		});
	})
</script>
</head>
<center>
<body>
	<h1 align="center" style="font-size: 30px">用户注册</h1>
	<br>
	<form action="servlet/UserServlet?method=reg" method="post"
		class="foodForm" name="regForm">
		<table width="60%" >
			<tr>
				<td>*用户名:</td>
				<td><input type="text" name="userName" class="inputxt"
					ajaxurl="${pageContext.request.contextPath}/valid/validForm.jsp"
					datatype="s5-18" nullmsg="请输入用户名！" errormsg="用户名至少5个字符,最多18个字符！">
				</td>
				<td><div class="Validform_checktip"></div>
				</td>
			</tr>
			<tr>
				<td>*密码:</td>
				<td><input type="password" name="password" class="inputxt"
					datatype="*6-16" nullmsg="请设置密码！" errormsg="密码范围在6~16位之间！">
				</td>
				<td><div class="Validform_checktip"></div>
				</td>
			</tr>
			<tr>
				<td>*确认密码:</td>
				<td><input type="password" name="password2" class="inputxt"
					datatype="*" recheck="password" nullmsg="请再输入一次密码！"
					errormsg="您两次输入的账号密码不一致！">
				</td>
				<td><div class="Validform_checktip"></div>
				</td>
			</tr>
			<tr>
				<td>*真实姓名:</td>
				<td><input type="text" name="realName" class="inputxt"
					datatype="z2-4" nullmsg="请输入真实姓名" errormsg="中文名为2~4个中文字符！">
				</td>
				<td><div class="Validform_checktip"></div>
				</td>
			</tr>
			<tr>
				<td>*性别: &nbsp;&nbsp;</td>
				<td><input type="radio" value="男" name="sex" id="male"
					datatype="*" nullmsg="请选择性别" errormsg="请选择性别！" />男 <input
					type="radio" value="女" name="sex" id="female" />女</td>
				<div class="Validform_checktip"></div>
				</td>
			</tr>
			<tr>
				<td>*移动电话:</td>
				<td><input type="text" class="inputxt" name="phone"
					class="inputxt" datatype="m" errormsg="请输入您的手机号码！"" >
				</td>
				<td><div class="Validform_checktip"></div>
				</td>
			</tr>
			<tr>
				<td>*地址:</td>
				<td><textarea tip="请在这里输入您的地址!" altercss="gray" class="gray"
						value="" name="addr">请在这里输入您的地址!</textarea></td>
				<td><div class="Validform_checktip"></div>
				</td>
			</tr>
			<tr>
				<td>*QQ号:</td>
				<td><input type="text" class="inputxt" name="qq"
					datatype="n5-13" nullmsg="请输入QQ号码" errormsg="QQ号码至少为5位，最大为13位数字">
				</td>
				<td><div class="Validform_checktip"></div>
				</td>
			</tr>
			<tr>
				<td>上传头像:</td>
				<td><input type="file" class="inputxt" nullmsg="请选择图片"
					name="headImg">
				</td>
				<td><div class="Validform_checktip"></div>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="提交">
				</td>
				<td><input type="reset" value="重置">
				<a  href="${pageContext.request.contextPath}/index.jsp"><input type="button" value="返回"></a>
				</td>
			</tr>
		</table>
	</form>
</body>
</center>
</html>

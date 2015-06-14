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

<title>食物详情</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

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
<body>
	<center>
		<table width="70%">
			<tr>
				<td width="400px"><span
					style="font-size: 30; text-align: center;">${requestScope.food.name}</span>
					<img
					src="${pageContext.request.contextPath}/${requestScope.food.foodPic}"
					width="350" height="350"></td>
				<td>
						<table>
							<tr>
								<td width="130px">*食品名称:</td>
								<td width="200px">
									  <label>${requestScope.food.name}</label>
								</td>
								<td><div class="Validform_checktip"></div>
								</td>
							</tr>
							<tr>
								<td>*食品类型</td>
								<td><c:if test="${food.type == 1}">精美小炒</c:if><c:if
										test="${food.type == 2}">家常小菜</c:if> <c:if
										test="${food.type == 3}">饭后甜品</c:if> <c:if
										test="${food.type == 4}">特色饮料</c:if></td>
							</tr>
							<tr>
								<td>*食品价格:</td>
								<td>
									<label>${requestScope.food.price}</label>
								</td>
								<td><div class="Validform_checktip"></div>
								</td>
							</tr>
							<tr>
								<td>*是否可以团购:&nbsp;&nbsp;</td>
								<td>
									<c:if test="${requestScope.food.isGroup=='1'}">是</c:if>
									
									<c:if test="${requestScope.food.isGroup=='0'}">否</c:if>
								</td>
							</tr>
							
							<c:if test="${requestScope.food.isGroup==1}">
							<tr>
								<td>*团购价格:</td>
								<td>
									<label>${requestScope.food.groupPrice}</label>
								</td>
								<td><div class="Validform_checktip"></div>
								</td>
							</tr>
							<tr>
								<td>团购开始时间:</td>
								<td>
									<label>${requestScope.food.beginTime}</label>
								</td>
							</tr>
							<tr>
								<td>团购结束时间:</td>
								<td>
									<label>${requestScope.food.endTime}</label>
								</td>
							</tr>
							<tr>
								<td>*团购限量:</td>
								<td>
									<label>${requestScope.food.groupCount}</label>
								</td>
								<td><div class="Validform_checktip"></div>
								</td>
							</tr>
							</c:if>
							<tr>
								<td>食品详情:</td>
								<td>
								<label>${requestScope.food.details}</label>
								</td>
								<td><div class="Validform_checktip"></div>
								</td>
							</tr>
							<tr>
								<td><a
									href="${pageContext.request.contextPath}/index.jsp"><input
										type="button" value="返回">
								</a>
								</td>
							</tr>

						</table>
					</td>
			</tr>
		</table>
	</center>
</body>
</html>
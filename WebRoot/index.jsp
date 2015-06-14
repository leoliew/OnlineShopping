<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
a img {
	border: none;
}

.table_f {
	border-collapse: separate;
	border: 1px solid #C4E2FF;
	background: #E8FBFF;
	width: 100%;
}
</style>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<title>大众网团购</title>
<link type="text/css" rel="stylesheet" href="css/main.css" />
<link type="text/css"
	href="${pageContext.request.contextPath}/css/v128.css" rel="stylesheet">
<script type="text/javascript">
	if ("${requestScope.msg}".length > 0) {
		alert("${requestScope.msg}");
	}
</script>
</head>

<body>

	<table border="2" cellpadding="0" cellspacing="0" width="1025px"
		height="1300px" align="center" >
		<tr height="3%" bgcolor="#C4DE4C">
			<td align="center"><c:choose>
					<c:when test="${sessionScope.user==null}">
								<span style="font-size: 18;font-family: 微软雅黑">欢迎来到团购网! &nbsp;
		<a href="${pageContext.request.contextPath}/index.jsp?show=login">请登录</a> &nbsp;
		<a href="${pageContext.request.contextPath}/index.jsp?show=reg"> 快速注册</a></span>
					</c:when>
					<c:otherwise>
							<span style="font-size: 18;font-family: 微软雅黑">欢迎${sessionScope.user.userName}来到团购网!&nbsp;&nbsp;
							<a href="${pageContext.request.contextPath}/servlet/UserServlet?method=logout">退出登录</a></span>
		</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr height="20%">
			<td colspan="2" align="center"><img
				src="${pageContext.request.contextPath}/images/top.jpg" width="1020"
				height="300"></td>
		</tr>
		<tr height="5%">
			<td colspan="2">
				<div class="nav-wrap">
					<div class="cont">
						<ul class="nav logged">
							<li class="drop-box menu t-menu J_menu">
							<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
							<c:if test="${sessionScope.user!=null}">
							<li class=""><a href="${pageContext.request.contextPath}/servlet/UserServlet?method=toupdate&id=${sessionScope.user.id}"><span style="font-size: 20;font-family: 微软雅黑">修改信息</span>
							</a>
							</li>
							<c:choose>
							<c:when test="${sessionScope.user.level==0}">		
							<li class=""><a href="${pageContext.request.contextPath}/food/addFood.jsp"><span  style="font-size: 20;font-family: 微软雅黑">添加食物</span>
							</a>
							</li>
							<li class=""><a href="${pageContext.request.contextPath}/servlet/UserServlet?method=manage"><span  style="font-size: 20;font-family: 微软雅黑">管理用户</span>
							</a>
							</li>
							<li class=""><a href="${pageContext.request.contextPath}/servlet/OrderServlet?method=manage"><span  style="font-size: 20;font-family: 微软雅黑">管理订单</span>
							</a>
							</li>
							</c:when>
							<c:when test="${sessionScope.user.level==1}">
							<li class=""><a href="${pageContext.request.contextPath}/index.jsp?show=cart"><span  style="font-size: 20;font-family: 微软雅黑">购物车</span>
							</a>
							</li>
							<li class=""><a href="${pageContext.request.contextPath}/servlet/OrderServlet?method=listOrders&userId=${sessionScope.user.id}"><span  style="font-size: 20;font-family: 微软雅黑">管理订单</span>
							</a>
							</li>
							</c:when>
							</c:choose>
							<li class=""><a
								href="${pageContext.request.contextPath}/servlet/UserServlet?method=logout"><span  style="font-size: 20;font-family: 微软雅黑">注销</span>
							</a>
							</li>
							</c:if>
						</ul>
					</div>
				</div>
		</tr>
		<tr>
			<td valign="top" style="text-align: center;" >			
				<c:choose>
				<c:when test="${param.show=='login'}">
							<jsp:include page="user/login.jsp" />
						</c:when>
						<c:when test="${param.show=='reg'}">
							<jsp:include page="user/reg.jsp" />
						</c:when>
						<c:when test="${param.show=='updatefood'}">
							<jsp:include page="food/editFood.jsp" />
						</c:when>
						<c:when test="${param.show=='add'}">
							<jsp:include page="food/addFood.jsp" />
						</c:when>
						<c:when test="${param.show=='updateuser'}">
							<jsp:include page="user/user_update.jsp" />
						</c:when>
						<c:when test="${param.show=='showFood'}">
							<jsp:include page="food/showFood.jsp" />
						</c:when>
						<c:when test="${param.show=='cart'}">
							<jsp:include page="food/buyCar.jsp" />
						</c:when>
						<c:when test="${param.show=='pay'}">
							<jsp:include page="order/orderInfo.jsp" />
						</c:when>
						<c:when test="${param.show=='userorder'}">
							<jsp:include page="order/orderList.jsp" />
						</c:when>
						<c:when test="${param.show=='adminorder'}">
							<jsp:include page="order/manage_order.jsp" />
						</c:when>
						<c:when test="${param.show=='orderdetails'}">
							<jsp:include page="order/orderdetails.jsp" />
						</c:when>
						<c:when test="${param.show=='manageuser'}">
							<jsp:include page="user/manage_user.jsp" />
						</c:when>
						<c:otherwise>
							<jsp:include page="food/foods.jsp" />
						</c:otherwise>
					</c:choose>
					</td>
		</tr>
	</table>

</body>
</html>
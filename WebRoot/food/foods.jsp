<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${requestScope.foods == null}">
	<jsp:forward page="/servlet/FoodServlet?method=index" />
</c:if>
<font face="微软雅黑" >
<table>
	<tr>
		<th style="font-size: 25px"><a
			href="${pageContext.request.contextPath}/servlet/FoodServlet?method=index">全部</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<c:forEach items="${requestScope.types}" var="types"
				varStatus="status">
				<c:if test="${requestScope.tid==types.id}">
					<font color="red"> ${types.typeName}</font>
				</c:if>
				<c:if test="${requestScope.tid!=types.id}">
				<a
					href="${pageContext.request.contextPath}/servlet/FoodServlet?method=index&tid=${types.id}">${types.typeName}</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>
				</c:forEach></th>
	</tr>
</table>
</font>
<font  face="微软雅黑">
<table>
	<tr>
		<c:forEach items="${requestScope.foods}" var="foods"
			varStatus="status">
			<td>
				<table>
					<tr>
						<td colspan="2"><img
							src="${pageContext.request.contextPath}/${foods.foodPic}"
							height="300px" width="300px">
						</td>
					</tr>
					<tr>
						<td>${foods.name}</td>
						<td>${foods.price}元</td>
					</tr>
					<c:if test="${sessionScope.user.level == 0}">
						<tr>
							<td><a
								href="${pageContext.request.contextPath}/servlet/FoodServlet?method=toedit&fid=${foods.id}">修改</a>
							</td>
							<td><a
								href="javascript:Delete('${foods.name}','${foods.id}')">删除</a> <script
									type="text/javascript">
									function Delete(name, id) {
										if (window
												.confirm("确定删除<" + name + ">吗？")) {
											window.location.href = "${pageContext.request.contextPath}/servlet/FoodServlet?method=del&fid="+id;
										}
									}
								</script></td>
						</tr>
					</c:if>
					<c:if test="${sessionScope.user.level == 1}">
						<tr>
							<td><a
								href="${pageContext.request.contextPath}/servlet/FoodServlet?method=show&fid=${foods.id}">查看详情</a>
							</td>
							<td><a
								href="${pageContext.request.contextPath}/servlet/FoodServlet?method=toBuy&foodId=${foods.id}">购买</a>
							</td>
						</tr>
					</c:if>
				</table></td>
			<c:if test="${status.count mod 3 == 0}">
				<tr></tr>
			</c:if>
		</c:forEach>
	</tr>
</table>
</font>
<font face="微软雅黑" style="font-size: 18px">
食品总数:${requestScope.allCount}&nbsp;&nbsp;&nbsp;
当前页/总页数:${requestScope.currentPage}/${requestScope.totalPage}&nbsp;&nbsp;
<a
	href="${pageContext.request.contextPath}/servlet/FoodServlet?method=index&pageNo=1&tid=${requestScope.tid}">首页</a>
<c:if test="${requestScope.currentPage!=1}">
	<a
		href="${pageContext.request.contextPath}/servlet/FoodServlet?method=index&pageNo=${requestScope.currentPage-1}&tid=${requestScope.tid}">上一页</a>
</c:if>
<c:if test="${requestScope.currentPage!=requestScope.totalPage}">
	<a
		href="${pageContext.request.contextPath}/servlet/FoodServlet?method=index&pageNo=${requestScope.currentPage+1}&tid=${requestScope.tid}">下一页</a>
</c:if>
<a
	href="${pageContext.request.contextPath}/servlet/FoodServlet?method=index&pageNo=${requestScope.totalPage }&tid=${requestScope.tid}">末页</a>
</font>


<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
	<c:choose>
	<c:when test="${param.name=='userName'}">
	 <c:if test="${requestScope.vaild == null}">
    <jsp:forward page="/servlet/UserServlet?method=checkReg&userName=${param.param}"></jsp:forward>
    </c:if>
	</c:when>
	<c:when test="${param.name=='foodName'}">
		<c:if test="${requestScope.vaild == null}">
		 <jsp:forward page="/servlet/FoodServlet?method=checkFood&foodName=${param.param}"></jsp:forward>
		 </c:if>
	</c:when>
	</c:choose>
${requestScope.vaild}
   

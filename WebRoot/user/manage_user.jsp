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
    
    <title>用户管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/demo.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.6.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/Validform_v5.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.datePicker-min.js"></script>
	<script type="text/javascript">
	
	$(function(){
	//$(".registerform").Validform();  //就这一行代码！;
	$(".foodForm").Validform({
		tiptype:2
	});
	$(".foodForm").Validform({
		usePlugin:{
			datepicker:{
				format:"yyyy-mm-dd",//指定输出的时间格式;
				firstDayOfWeek:1,//指定每周开始的日期，0、1-6 对应 周日、周一到周六;
				callback:function(date,obj){//指定选择日期后的回调函数;
					//date:选中的日期;
					//obj:当前表单元素;
					$("#msgdemo2").text(date+" is selected");
				},
				//以上三个参数是在Validform插件内调用Datepicker时可传入的参数;
				//下面几个参数是Datepicker插件本身初始化时可接收的参数，还有更多请查看页面说明;
				clickInput:true,
				startDate:"1970-00-00",
				createButton:false
			}
		}
	});
	
})
	</script>
	
	 <script type="text/javascript">
	function recharge(id,index){
		var money = document.getElementsByName("money")[index].value;
		var patrn=/^\d*$/;
		if(money != "" ){
			if(patrn.test(money)){
				if (window.confirm("确定充值吗？")) {
					window.location.href = "${pageContext.request.contextPath}/servlet/UserServlet?method=recharge&id="+id+"&money="+money;
				}
			}else{
				alert("请输入正整数！");
			}
		}else{
			alert("请输入要充值的金额！");
		}
	}
</script>
  </head>
  <body>
  <center>
  <h2>用户管理</h2>
  
    <table width="70%" border="1" cellpadding="0" cellspacing="0">
    <tr><td>编号</td><td>用户名</td><td>姓名</td><td>性别</td><td>账户余额</td><td>等级</td><td width="50px">注册时间</td>
    <td width="20px">金额</td><td>充值</td></tr>
    <c:forEach items="${requestScope.userList}" var="user" varStatus="num">
    <tr><td>${user.id}</td><td>${user.userName}</td><td>${user.realName}</td>
    <td>${user.sex}</td><td>${user.acount}</td>
    <c:if test="${user.level==0}">
    <td><span style="color: red">管理员</span></td>
    </c:if>
     <c:if test="${user.level==1}">
    <td>普通用户</td>
    </c:if>
    <td width="10px">${user.regTime}</td><td><input type="text"   name="money"   size="5"></td>
    <td><input type="button" value="充值" onclick="javascript:recharge('${user.id}','${num.index}')"></td></tr>
    </c:forEach>
    </table>
 
    <a href="${pageContext.request.contextPath}/index.jsp"><input type="button" value="返回" ></a>
    </center>
  </body>
</html>

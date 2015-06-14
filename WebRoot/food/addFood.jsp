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
    
    <title>添加食品</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
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
<c:if test="${requestScope.types == null}">
	<jsp:forward page="/servlet/TypeServlet?method=findTypes" />
</c:if>
  </head>
  <body>
   <%--上传文件，必须是post提交,类型必须为enctype="multipart/form-data" 
  enctype="multipart/form-data",--%>
    	<form action ="servlet/FoodServlet?method=addFood"  method="post"  class="foodForm"  enctype="multipart/form-data">
    	<table> 	
    	<tr><td>*食品名称:</td><td><input type="text" name="foodName"  class="inputxt" 
    	ajaxurl="${pageContext.request.contextPath}/valid/validForm.jsp"
    	 datatype="s2-18"   nullmsg="请输入食品名！" errormsg="食品名称至少2个字符,最多18个字符"></td>
    	 <td><div class="Validform_checktip"></div></td>
    	</tr>
    	<tr><td>*食品类型</td><td><select name="typeId" >
    	<c:forEach items="${requestScope.types}" var="type">
    	<option value="${type.id}" >    	
    		${type.typeName}
    	</option>
    	</c:forEach>
    	</select></td></tr>
    	<tr><td>*食品价格:</td><td><input type="text" name="price"  class="inputxt" datatype="price"  nullmsg="请输入食品价格！" errormsg="请输入正确的价格，小数点后要有一位小数"></td>
    	<td><div class="Validform_checktip"></div></td></tr>
    	<tr><td>*是否可以团购:&nbsp;&nbsp; </td>
    	<td>是<input type="radio" name="isGroup"  value="1">&nbsp;
    	否<input type="radio" name="isGroup" value="0" checked="checked"></td></tr>
    	<tr><td>*团购价格:</td><td><input type="text" name="groupPrice"  class="inputxt" datatype="price"  nullmsg="请输入团购价格！" errormsg="请输入正确的价格，小数点后要有一位小数"></td><td><div class="Validform_checktip"></div></td></tr>
    	<tr><td>团购开始时间:</td><td><input type="text" name="beginTime"></td>
    	</tr>
    	<tr><td>团购结束时间:</td><td><input type="text" name="endTime"></td></tr>
    	<tr><td>*团购限量:</td><td><input type="text" name="groupCount"   class="inputxt" datatype="notZero"  nullmsg="请输入团购限量！" errormsg="请输入正确的数字格式"></td><td><div class="Validform_checktip"></div></td></tr>
    	<tr><td>食品详情:</td><td><textarea name="details" ></textarea></td>
    	<td><div class="Validform_checktip"></div></td></tr>
    	<tr><td>*食品图片:</td><td><input type="file" name="foodPic" class="inputxt"  nullmsg="请选择图片！" ></td><td><div class="Validform_checktip"></div></td></tr>
    	<tr><td><input type="submit" value="提交" ></td> <td><input type="reset" value="重置" >
    	<a  href="${pageContext.request.contextPath}/index.jsp"><input type="button" value="返回"></a>
    	</td></tr>
    	</table>
    	</form>
  </body>
</html>

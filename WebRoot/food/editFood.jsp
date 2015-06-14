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
    
    <title>编辑食物</title>
    
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
  </head>
  <body>
   <p>
     <%--上传文件，必须是post提交,类型必须为enctype="multipart/form-data" 
  enctype="multipart/form-data",--%>
<center>
<table width="90%" >
<tr>
<td width="400px">
			<span style="font-size: 30; text-align: center;" >${requestScope.food.name}</span>
    			<img src="${pageContext.request.contextPath}/${requestScope.food.foodPic}" width="350" height="350">
    			</td><td>				
<form action ="servlet/FoodServlet?method=editFood&id=${requestScope.food.id }"  method="post"  class="foodForm" >
    	<table> 	
    	<tr><td>*食品名称:</td><td><input type="text" name="foodName"  value="${requestScope.food.name}"  class="inputxt"  datatype="s2-18"   nullmsg="请输入食品名！" errormsg="食品名称至少2个字符,最多18个字符"></td>
    	 <td><div class="Validform_checktip"></div></td>
    	</tr>
    	<tr><td>*食品类型</td><td><select name="typeId"> 
							<option value="1" <c:if test="${food.type == 1}">selected</c:if>>精美小炒</option> 
							<option value="2" <c:if test="${food.type == 2}">selected</c:if>>家常小菜</option> 
							<option value="3" <c:if test="${food.type == 3}">selected</c:if>>饭后甜品</option> 
							<option value="4" <c:if test="${food.type == 4}">selected</c:if>>特色饮料</option> 
						</select>
						</td></tr>
    	<tr><td>*食品价格:</td><td><input type="text" name="price"   value="${requestScope.food.price}" class="inputxt" datatype="price"  nullmsg="请输入食品价格！" errormsg="请输入正确的价格，小数点后要有一位小数"></td>
    	<td><div class="Validform_checktip"></div></td></tr>
    	<tr><td>*是否可以团购:&nbsp;&nbsp; </td>
    	<td>
    	是<input type="radio" value="1" name="isGroup"  datatype="*" nullmsg="请选择是否可以团购"  <c:if test="${requestScope.food.isGroup=='1'}">checked</c:if>>
    	否<input type="radio" value="0" name="isGroup"  datatype="*" nullmsg="请选择是否可以团购"  <c:if test="${requestScope.food.isGroup=='0'}">checked</c:if>>
    	</td></tr>
    	<tr><td>*团购价格:</td><td><input type="text" name="groupPrice"  value="${requestScope.food.groupPrice}"  class="inputxt" datatype="price"  nullmsg="请输入团购价格！" errormsg="请输入正确的价格，小数点后要有一位小数"></td><td><div class="Validform_checktip"></div></td></tr>
    	<tr><td>团购开始时间:</td><td><input type="text"   value="${requestScope.food.beginTime}" name="beginTime"></td>
    	</tr>
    	<tr><td>团购结束时间:</td><td><input type="text"  value="${requestScope.food.endTime}" name="endTime"></td></tr>
    	<tr><td>*团购限量:</td><td><input type="text" name="groupCount"   value="${requestScope.food.groupCount}"  class="inputxt" datatype="notZero"  nullmsg="请输入团购限量！" errormsg="请输入正确的数字格式"></td><td><div class="Validform_checktip"></div></td></tr>
    	<tr><td>食品详情:</td><td><textarea tip="请在这里输入食品详情" altercss="gray"  value=""  class="gray" name="details" >${requestScope.food.details}</textarea></td>
    	<td><div class="Validform_checktip"></div></td></tr>
    	<tr><td><input type="submit" value="提交" ></td> <td><input type="reset" value="重置" >&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/index.jsp"><input type="button" value="返回" ></a></td></tr>

    	</table>
    	 </form>
 </td>
    			</tr>
    			</table>
    			</center>
  </body>
</html>
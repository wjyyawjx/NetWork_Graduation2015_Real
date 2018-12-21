<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <%
           request.setCharacterEncoding("UTF-8");
      %>
  <head>
  <form action="tianjia.jsp">
	 	<input type="submit"value="添加">
         </form>
    <base href="<%=basePath%>">
    <title>所有商品页面</title>
  </head>
 
  <body>
  <h1>管理系统</h1>
  <h1>${xiaoxi}</h1>
  <table  width="600" border="1" cellpadding="0" >
  		<tr>
  			<th>ID</th>
	  		<th>名字</th>
	  		<th>编号</th>
	  		<th>库存</th>
	  		<th>备注</th>
  		</tr>
     <c:forEach var="U" items="${userAll}"  > 
      <form action="UpdateServlet" method="post"> 
       <tr>
	       <td><input type="text" value="${k.id}" name="id" ></td>
	       <td><input type="text" value="${s.name}" name="name"></td>
	       <td><input type="text" value="${s.number}" name="number"></td>
	       <td><input type="text" value="${k.quantity}" name="quantity"></td>
	       <td><a href="DeleteServlet?id=${k.id}">删除</a>  <input type="submit" value="更新"/></td>
	   </tr>
    </form> 
    </c:forEach>  
    </table>
  </body>
</html>

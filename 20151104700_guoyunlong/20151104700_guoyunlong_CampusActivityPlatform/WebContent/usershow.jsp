<%@page import="com.neishida.bean.UserInformationBean"%>
<%@page import="java.util.List"%>
<%@page import="com.neishida.service.InforAddService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品信息列表</title>
<link href="../css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
  function check(){
    var mymessage=confirm("确定要删除吗？");  
    if(mymessage==true){
    
       return true;
    }  
    else if(mymessage==false){  
       return false;
    }   
    
  }
  
</script>
</head>

<body>  
<div align="right">
<h2>商品信息列表</h2>

<table>
  <tr>
    <td class="listTable" width="100">编号</td>
    <td class="listTable" width="100">商品名</td>
    <td class="listTable" width="100">价格</td>
    <td class="listTable" width="100">数量</td>
    <td id="profile"  width="200">图片</td>
    <td id="operate">操作</td>
  </tr>
<%
   session.removeAttribute("list");
   InforAddService user = new InforAddService();
   List<user> list = user.getAllStudent();
   session.setAttribute("list", list);
   for(user user:list){
 %>

  <tr>
   <td><%=user.getId() %> </td>
   <td><%=user.getName() %> </td>
   <td><%=user.getSex() %> </td>
   <td><%=user.getAge() %> </td>
   <td><%=user.getFileName() %> </td>
   <td>
   <a href="modifyStu1.jsp?id=<%=user.getId() %>">修改&nbsp;</a>
   <a href="../Delstu?id=<%=user.getId() %>" onclick="return check()">删除&nbsp;</a></td>
  </tr>
<%} %>




</table>

</body>
</html>
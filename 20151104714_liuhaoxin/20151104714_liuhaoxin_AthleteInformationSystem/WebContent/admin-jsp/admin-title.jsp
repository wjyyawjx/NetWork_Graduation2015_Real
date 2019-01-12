<%--  管理员的标题页面 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/style.css" type="text/css" media="all">
<title>Insert title here</title>
<%String name = (String) session.getAttribute("user");%>
</head>
<body>
	<table width="100%">
		<tr>
		<td style="width: 40%"></td>
		<td style="height: 40px;font-size: 40px;">运动会管理员后台</td>
		<td> <%=name%>管理员你好 
		<form target="_top" action="Exit" method="post">
		<button  type="submit" >退出</button></form></td>
		</tr>
	</table>
</body>
</html>
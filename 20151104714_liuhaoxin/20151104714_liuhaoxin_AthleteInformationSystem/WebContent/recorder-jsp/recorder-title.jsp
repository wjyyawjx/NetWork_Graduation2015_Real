<%--  记录员用户的标题页面 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/style5.css" type="text/css" media="all">
<title>Insert title here</title>

</head>
<body>
	<table width="100%">
		<tr>
		<td style="width: 40%"></td>
		<td style="height: 40px;font-size: 40px;">运动会记录员后台</td>
		<td> ${user}记录员你好 
		<form target="_top" action="../Exit" method="post">
		<button  type="submit" >退出</button></form></td>
		</tr>
	</table>
</body>
</html>
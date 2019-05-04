<%--  一般用户的留言页面 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<title>Insert title here</title>
</head>
<body>
	<form action="MessageAdd" method="post">
		<input style="width: 500px" type="text" name="message" placeholder="留言" required="">
		 <input style="width: 300px"  type="submit" value="添加留言">
	</form>
	<table border="2" cellpadding="0" cellspacing="0"
		style="font-size: 40px"  width="100%" height="100%">
		<thead>
			<tr>
				<th>用户</th>
				<th>留言</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${mes}" var="w">
				<tr align="center">
					<td>${w.username}</td>
					<td>${w.message}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
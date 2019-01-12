<%--  管理员用户查看管理所有的留言  --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../css/style.css" type="text/css" media="all">
<title>Insert title here</title>
</head>
<body>
	<table border="2" cellpadding="0" cellspacing="0"
		style="font-size: 40px" width="100%" height="100%">
		<thead>
			<tr>
				<th>用户</th>
				<th>留言</th>
				<th>删除留言</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${mes}" var="w">
				<tr align="center">
					<td>${w.username}</td>
					<td>${w.message}</td>
					<td><form action="AdminMessageDelete" method="post">
							<input type="hidden" name="mid" value=$w.mid}>
							 <input type="submit" style="width: 150px" value="删除">
						</form></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
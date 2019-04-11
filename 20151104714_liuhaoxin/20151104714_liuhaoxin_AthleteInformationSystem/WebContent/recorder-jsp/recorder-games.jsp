<%--  记录员查看自己管理的运动会 --%>
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
	<table border="2" cellpadding="0" cellspacing="0"
		style="font-size: 40px" width="100%" height="100%">
		<thead>
			<tr>
				<th>运动会名称</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th>信息管理</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${gambean}" var="w">
				<tr align="center">
					<td>${w.gamesname}</td>
					<td>${w.startTime}</td>
					<td>${w.stopTime}</td>
					<td>
					<form action="RecorderJump" method="post">
					<input type="hidden" name="sid" value=${w.sid}>
					<input type="submit" value="管理信息">
				</form></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
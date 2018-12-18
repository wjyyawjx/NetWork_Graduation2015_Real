<%--  记录员管理运动员信息 --%>
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
<form action="RecorderAdd" method="post">
		<input type="text" name="athletusername" placeholder="运动员名字" required="" >
		<input type="text" name="ranking" placeholder="排名" required="">
		<input type="text" name="results" placeholder="成绩" required="">
		<input type="text" name="events" placeholder="项目" required="">
		<input type="submit" value="添加">
</form>

<%-- 
	<table border="2" cellpadding="0" cellspacing="0"
		style="font-size: 40px" width="100%" height="100%">
		<thead>
			<tr>          
				<th>名字</th>
				<th>项目</th>
				<th>排名</th>
				<th>成绩</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${gambean}" var="w">
				<tr align="center">
					<td>${w.gamesname}</td>
					<td>${w.startTime}</td>
					<td>${w.stopTime}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>--%>
</body>
</html>
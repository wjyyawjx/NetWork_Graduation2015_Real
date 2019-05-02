<%--  记录员管理运动员信息 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/style.css" type="text/css" media="all">
<title>Insert title here</title>
</head>
<body>
	<form action="../RecorderJView">
		<input  type="submit"  style="width: 300px"  value="返回信息显示页面">
	</form>
<form action="../RecorderAdd" method="post">
		<input type="text" name="athletusername" placeholder="运动员名字" required="" >
		<input type="text" name="college" placeholder="学院" required="">
		<input type="text" name="theclass" placeholder="班级" required="">
		<input type="text" name="events" placeholder="项目" required="">
		<input type="text" name="results" placeholder="成绩" required="">
		<input type="text" name="ranking" placeholder="排名" required="">
		<input type="submit" value="添加">
</form>
</body>
</html>
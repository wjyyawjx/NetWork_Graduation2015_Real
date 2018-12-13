<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>首页</title>
</head>
<body>
<frameset cols="20%,80%" frameborder="1" border="1" noresize="noresize"
	name="frame">
	<frame name="list"
		src="${pageContext.request.contextPath}/golist.action" />
	<!--子窗口-->
	<frame name="main"
		src="${pageContext.request.contextPath}/index.action" />
</frameset>
</body>
</html>
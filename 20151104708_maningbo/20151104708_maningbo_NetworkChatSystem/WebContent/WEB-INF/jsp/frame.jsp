<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>首页</title>
</head>

<frameset cols="20%,80%" frameborder="1" border="1" noresize="noresize"
	name="frame">
	<frame name="list"
		src="${pageContext.request.contextPath}/golist.action" />
	<!--子窗口-->
	<frame name="main"
		src="${pageContext.request.contextPath}/index.action" />
</frameset>

</html>
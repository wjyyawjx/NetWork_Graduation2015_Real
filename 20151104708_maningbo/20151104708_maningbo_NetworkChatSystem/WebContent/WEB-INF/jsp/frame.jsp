<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>html框架</title>
</head>
<frameset cols="30%,70%" frameborder="1" border="1" noresize="noresize">
    <frame name="top" src="${pageContext.request.contextPath}/golist.action"/><!--子窗口-->
    <frame name="bottom" src="${pageContext.request.contextPath}/index.action"/>
</frameset>
</html>
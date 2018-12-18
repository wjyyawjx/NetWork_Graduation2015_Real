<%--  联系管理员页面，用于忘记密码和权限受限时联系管理员  --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<h1>联系管理员</h1>
<h2>请认真填写自己的用户名密码，和情况说明，已方便管理员处理</h2>
<form action="ContactManagementAdd" method="post">
		<input type="text" name="username"    placeholder="用户名"   required="" >
		<input type="text" name="phone"       placeholder="联系方式" required="">
		<input type="text" name="reason"      placeholder="情况说明" required="">		
		<input type="submit" value="提交信息">
</form>
</div>
</body>
</html>
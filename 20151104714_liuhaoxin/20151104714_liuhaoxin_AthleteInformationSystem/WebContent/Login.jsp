<%--  登录页面 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<title>Insert title here</title>
</head>

<body><br><br>
<h1>登录</h1>
<div class="container">
	<form action="Login" method="post">
		<input type="text" name="username" placeholder="用户名" required="" >
		<input type="password" name="pwd" placeholder="密码" required="">
				<input type="submit" value="登录">
	</form>
	<br>
	<form action="RegisterView">
		<input  type="submit"   value="没有账户，去注册一个">
	</form>
	<br>
	<form action="ContactManagement.jsp">
		<input  type="submit"   value="联系管理员">
	</form>
	</div>
</body>
</html>
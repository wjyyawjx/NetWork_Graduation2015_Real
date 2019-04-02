<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<style>
.login_input {
	padding: 5px;
	height: 20px;
	line-height: 20px;
	color: gray;
	width: 200px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
}
.login_name h3 {
	font-size: 16px;
	border-bottom: 1px dotted #02356f;
}
.login_button{background:#008ffd;border-radius:5px;width:80px;height:35px;line-heihgt:35px;display:block; margin-top:10px; color:white; border:none; font-family:microsoft yahei;cursor:pointer;}
</style>
</head>
<body>
<h3 align="center">用户注册</h3>
			<form action="RegisterServlet" method="post">
				<div align="center">
					用户名：<input name="username" id="username" type="text"
						class="login_input" />
				</div>
				<div align="center">
					密&nbsp;&nbsp;&nbsp;&nbsp;码：<input name="password" id="password"
						type="password" class="login_input" />
				</div>
				<div align="center">
					<input type="submit" class="login_button" value="添&nbsp;&nbsp;加"></input>
				</div>
			</form>
</body>
</html>
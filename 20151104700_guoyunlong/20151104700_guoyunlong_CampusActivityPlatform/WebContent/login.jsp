<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<style>
.login_input {
	padding: 5px;
	height: 40px;
	line-height: 20px;
	color: gray;
	width: 500px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
}
.login_name h3 {
	font-size: 16px;
	border-bottom: 1px dotted #02356f;
}
.login_button{background:#008ffd;border-radius:5px;width:180px;height:35px;line-heihgt:35px;display:block; margin-top:10px; color:white; border:none; font-family:microsoft yahei;cursor:pointer;}
</style>
</head>
<style type="text/css">    
     body{    
        background-image: url(img/5.jpg);    
        background-size:cover;  
     }    
 </style>
<body>
<h3 align="center">用户登录</h3>
			<form action="LoginServlet" method="post">
				<div align="center">
					用户名：<input name="username" id="userLogname" type="text"
						class="login_input" />
				</div>
				<div align="center">
					密&nbsp;&nbsp;&nbsp;&nbsp;码：<input name="pwd" id="userPwd"
						type="password" class="login_input" />
				</div>
				<div align="center">
					<input type="submit" class="login_button" value="登&nbsp;&nbsp;录"></input>
				</div>
			</form>
			<form action="register.jsp">
				<div align="center">
					<input type="submit" class="login_button" value="注&nbsp;&nbsp;册"></input>
				</div>
			</form>
			
</body>
</html>
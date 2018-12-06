<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="js/jquery-1.11.1.min.js"></script> 
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>	
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<!--side-bar-->
			<div class="col-sm-3 col-md-2 sidebar">
				<div class="logo">
					<a href="${pageContext.request.contextPath}/index.action"><img src="images/logo.png" alt="logo"/></a>
				</div>
				<div class="top-nav">
					<span class="menu-icon"><img src="images/menu-icon.png" alt=""/></span>	
					<div class="nav1">
						<ul class=" nav nav-sidebar">
							<li style="color: blue;font-size: 20px; font-weight: 600">当前用户：${userBean.userName}</li>
							<li class="active"><a href="${pageContext.request.contextPath}/index.action">首  页</a></li>
							<li><a href="${pageContext.request.contextPath}/friendlist.action">好友</a></li>
							<li><a href="${pageContext.request.contextPath}/addfriend.action">添加好友</a></li>
							<li><a href="${pageContext.request.contextPath}/chatroom.action">聊天室</a></li>
							<li><a href="${pageContext.request.contextPath}/personalinfo.action">个人信息</a></li>
							<li><a href="testmonials.html">修改密码</a></li>
							<li><a href="${pageContext.request.contextPath}/logout.action">退出登录</a></li>
						</ul> 
						<div class="social-icons">
							<ul>
								<li style="color: #d95459; font-size: 20px; font-weight: 600"><a href="${pageContext.request.contextPath}/login.action"></a>登陆</li>
								<li style="color: #d95459; font-size: 20px; font-weight: 600"><a href="${pageContext.request.contextPath}/register.action" class="be"></a>注册</li>
							</ul>	
						</div>						
					</div>	
				</div>
				</div>
			<!--//side-bar-->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<!--main-text-->
				<div class="main-text">
					<div class="welcome">
						<h3>个人信息</h3>
						<div class="col-md-4 welcome-left">
							<a style="font-size: 25px;float: right">用户名：</a>
							<br>
							<hr>
							<a style="font-size: 25px;float: right">性别：</a>
							<br>
							<hr>
							<a style="font-size: 25px;float: right">手机号：</a>
							<br>
							<hr>
							<a style="font-size: 25px;float: right">邮箱：</a>
							<br>
							<hr>
						</div>
						<div class="col-md-8 welcome-right">
								<a style="font-size: 25px;float: left">${userBean.userName}</a>
							<br>
							<hr>
							<a style="font-size: 25px;float: left">${userBean.gender}</a>
							<br>
							<hr>
							<a style="font-size: 25px;float: left">${userBean.phone}</a>
							<br>
							<hr>
							<a style="font-size: 25px;float: left">${userBean.email}</a>
							<br>
							<hr>
						</div>
					</div>				
					</div>
				</div>
			</div>
		</div>	
    <script src="js/bootstrap.js"> </script>
</body>
</html>
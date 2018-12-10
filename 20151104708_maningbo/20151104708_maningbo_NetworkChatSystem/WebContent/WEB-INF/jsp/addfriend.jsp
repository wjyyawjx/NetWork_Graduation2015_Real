<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>添加好友</title>
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
					<a href="index.html"><img src="images/logo.png" alt="logo"/></a>
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
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main about-main">
				<div class="contact">				
					<div class="contact-grids">
						<div class="col-md-4 address">
							<h3>Contact Info</h3>
							<p class="cnt-p">Lorem ipsum dolor sit amet, consectetur adipisicing elit,sheets containing Lorem Ipsum passages sed do </p>
							<p>Eiusmod Tempor inc</p>
							<p>9560 St Dolor,London</p>
							<p>Telephone : +2 800 544 6035</p>
							<p>FAX : +1 800 889 4444</p>
							<p>Email : <a href="mailto:example@mail.com">mail@example.com</a></p>
						</div>
						<div class="col-md-8 contact-form">
							<h3>添加好友</h3>
							<form action="${pageContext.request.contextPath}/addfriend.action" method="post">
								<label>请输入您要搜索的用户名：</label>
								<input type="text" name="friend_2" id="friend_2" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
								<label>${msg}</label>
								<input type="submit" value="Submit" >
							</form>
						</div>
					</div>				
				</div>
			</div>
		</div>
	</div>
    <script src="js/bootstrap.js"> </script>
</body>
</html>
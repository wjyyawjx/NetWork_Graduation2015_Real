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
			<div >
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
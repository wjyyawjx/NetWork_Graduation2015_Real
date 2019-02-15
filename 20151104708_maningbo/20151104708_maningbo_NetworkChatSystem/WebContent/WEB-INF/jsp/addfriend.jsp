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
			<div>
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
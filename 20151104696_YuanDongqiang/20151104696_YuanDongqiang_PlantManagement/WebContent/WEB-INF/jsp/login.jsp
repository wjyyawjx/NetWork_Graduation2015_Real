<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-select.css">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/menu_sideslide.css"
	type="text/css" media="all">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Resale Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<link href='//fonts.googleapis.com/css?family=Ubuntu+Condensed'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-select.js"></script>
<script>
	
</script>
<!-- language-select -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.leanModal.min.js"></script>
<link href="${pageContext.request.contextPath}/css/jquery.uls.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/jquery.uls.grid.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/jquery.uls.lcd.css"
	rel="stylesheet" />
<!-- Source -->
<script src="${pageContext.request.contextPath}/js/jquery.uls.data.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.uls.data.utils.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.uls.lcd.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.uls.languagefilter.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.uls.regionfilter.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.uls.core.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
	
</script>
<script>
	//判断是登陆账号和密码是否为空
	function check() {
		var usercode = $("#usercode").val();
		var password = $("#password").val();
		if (usercode == "" || password == "") {
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<header>
	<div class="w3ls-header">
		<div class="w3ls-header-right">
			<ul>
				<li class="dropdown head-dpdn"><a
					href="${pageContext.request.contextPath }/register.action"
					aria-expanded="false"><i class="fa fa-user" aria-hidden="true"></i>
						注册</a></li>
				<li class="dropdown head-dpdn"><a
					href="${pageContext.request.contextPath }/help.action"><i
						class="fa fa-question-circle" aria-hidden="true"></i> 帮助</a></li>
			</ul>
		</div>
		<h1>
			<a href="${pageContext.request.contextPath }/index.action"><img
				src="img/core-img/logo.png" alt=""></a>
		</h1>
		<div class="clearfix"></div>
	</div>

	</header>
	<section>
	<div id="agileits-sign-in-page" class="sign-in-wrapper">
		<div class="agileinfo_signin">
			<h3>登陆</h3>
			<form action="${pageContext.request.contextPath }/login.action"
				method="post" onsubmit="return check()">
				<input type="text" name="usercode" id="usercode" placeholder="账号"
					required=""> <input type="password" name="password"
					id="password" placeholder="密码" required=""> <input
					type="submit" value="登陆">
				<div class="forgot-grid">
					<label class="checkbox"><input type="checkbox"
						name="rememberMe" id="rememberMe" onclick="remember();">记住密码</label>
					<div class="forgot">
						<a href="#" data-toggle="modal" data-target="#myModal2">忘记密码？</a>
					</div>
					<div class="clearfix"></div>
				</div>
			</form>
			<h6>
				没有账户？ <a href="${pageContext.request.contextPath }/register.action">注册</a>
			</h6>
		</div>
	</div>
	</section>
	<footer>
	<div class="agileits-footer-bottom text-center">
		<div class="container">
			<div class="w3-footer-logo">
				<h1>
					<a href="${pageContext.request.contextPath }/index.action"><img
						src="img/core-img/logo.png" alt=""></a>
				</h1>
			</div>
			<div class="w3-footer-social-icons">
				<ul>
					<li><a class="facebook" href="#"><i class="fa fa-facebook"
							aria-hidden="true"></i><span>Facebook</span></a></li>
					<li><a class="twitter" href="#"><i class="fa fa-twitter"
							aria-hidden="true"></i><span>Twitter</span></a></li>
					<li><a class="flickr" href="#"><i class="fa fa-flickr"
							aria-hidden="true"></i><span>Flickr</span></a></li>
					<li><a class="googleplus" href="#"><i
							class="fa fa-google-plus" aria-hidden="true"></i><span>Google+</span></a></li>
					<li><a class="dribbble" href="#"><i class="fa fa-dribbble"
							aria-hidden="true"></i><span>Dribbble</span></a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	</footer>
</body>
<script src="${pageContext.request.contextPath}/js/classie.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/move-top.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/easing.js"></script>
</html>
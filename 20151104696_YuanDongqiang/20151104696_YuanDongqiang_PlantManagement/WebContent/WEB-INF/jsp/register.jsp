<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-select.css">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu_sideslide.css" type="text/css" media="all">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Resale Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<link href='//fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-select.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.leanModal.min.js"></script>
<link href="${pageContext.request.contextPath}/css/jquery.uls.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/jquery.uls.grid.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/jquery.uls.lcd.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/js/jquery.uls.data.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.uls.data.utils.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.uls.lcd.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.uls.languagefilter.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.uls.regionfilter.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.uls.core.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
	
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ajax.js"></script>
<script>
	function lostcode() {
		var usercode = $("#u_code").val();
		if (usercode != null) {
			fajax("${pageContext.request.contextPath }/registercode.action?usercode=" + usercode, null, function(data) {
						if (data.status == "error") {
							alert("该账号已被注册！！请重新输入");
							return false;
						} else {
							return true;
						}
					})
		}
	}
	function lostemail() {
		var u_email = $("#u_email").val();
		if (u_email != null) {
			alert(u_email);
			fajax("${pageContext.request.contextPath }/registeremail.action?u_email=" + u_email, null, function(data) {
						if (data.status == "error") {
							alert("该邮箱已被注册！！请重新输入");
							return false;
						} else {
							return true;
						}
					})
		}
	}
	function lostpwd(){
		var password = $("#u_pwd").val();
		var password1 = $("#password1").val();
		if (password != password1) {
			alert("两次密码不一致!!!");
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
				<li class="dropdown head-dpdn"><a href="login.jsp"
					aria-expanded="false"><i class="fa fa-user" aria-hidden="true"></i>
						<%
							if (session.getAttribute("USER_SESSION") != null) {
						%>
						${USER_SESSION.username} <%
					 	} else {
 						%> 登陆<%
					 	}
						 %></a></li>
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
			<h3>注册</h3>
			<form action="${pageContext.request.contextPath }/add.action" method="post">
				<input type="text" name="u_code" id="u_code" placeholder="请输入账号" required="" onblur="lostcode()"> 
				<input type="text" name="u_name" id="u_name" placeholder="请输入用户名" required="">
				<input type="email" name="u_email" id="u_email" placeholder="请输入邮箱"required="" onblur="lostemail()"> 
				<input type="password" name="u_pwd" id="u_pwd" placeholder="请输入密码" required="">
				<input type="password" name="password1" id="password1" placeholder="请再次输入密码" required="" onblur="lostpwd()">
				<div class="signin-rit">
					<span class="agree-checkbox"> <label class="checkbox">
							<input type="checkbox" name="checkbox">我同意 <a
							class="w3layouts-t" href="terms.html" target="_blank">使用条款</a> 和 
							<a class="w3layouts-t" href="privacy.html"
							target="_blank"> 隐私政策</a>
					</label>
					</span>
				</div>
				<input type="submit" value="注册">
			</form>
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
<script src="js/classie.js"></script>
<script src="js/main.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
</html>
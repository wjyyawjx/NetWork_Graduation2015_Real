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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu_sideslide.css" type="text/css"media="all">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Resale Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<link href='//fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
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
<script src=
       "${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ajax.js"></script>
<script>
function check(){
	var usercode = $("#code").val();
	var password = $("#password").val();
	var password1 = $("#password1").val();
	if(password!=password1){
		alert("两次密码不一致!!!");
		return false;
	}else {
		fajax("${pageContext.request.contextPath }/judgeCode.action?usercode="+usercode,null, function(data) {
			if (data.status == "ok") {
				alert("注册成功");
				return true;
			}
			else{
				alert("该账号已被注册！！请重新输入");
				return false;
			}
		})
	}
}
</script>
</head>
<body>
	<div class="agiletopbar">
		<div class="wthreenavigation">
			<div class="menu-wrap">
				<nav class="menu">
				<div class="icon-list">
					<a href="${pageContext.request.contextPath }/categories.action?id=2">
					<i class="fa fa-fw fa-mobile"></i><span>移动</span></a>
					<a href="${pageContext.request.contextPath }/categories.action?id=3">
					<i class="fa fa-fw fa-laptop"></i><span>电子产品和电器</span></a> 
					<a href="${pageContext.request.contextPath }/categories.action?id=4">
					<i class="fa fa-fw fa-car"></i><span>汽车</span></a>
					<a href="${pageContext.request.contextPath }/categories.action?id=1">
					<i class="fa fa-fw fa-motorcycle"></i><span>自行车</span></a>
					<a href="${pageContext.request.contextPath }/categories.action?id=5">
					<i class="fa fa-fw fa-paw"></i><span>宠物</span></a>
					<a href="${pageContext.request.contextPath }/categories.action?id=6">
					<i class="fa fa-fw fa-book"></i><span>书</span></a> 
					<a href="${pageContext.request.contextPath }/categories.action?id=7">
					<i class="fa fa-fw fa-asterisk"></i><span>时尚</span></a> 
					<a href="${pageContext.request.contextPath }/categories.action?id=8">
					<i class="fa fa-fw fa-asterisk"></i><span>儿童</span></a>
				</div>
				</nav>
				<button class="close-button" id="close-button">关闭菜单</button>
			</div>
			<button class="menu-button" id="open-button"></button>
		</div>
		<div class="clearfix"></div>
	</div>
	<header>
	<div class="w3ls-header">
		<div class="w3ls-header-right">
			<ul>
				<li class="dropdown head-dpdn"><a href="login.jsp"
					aria-expanded="false"><i class="fa fa-user" aria-hidden="true"></i>
						<%if(session.getAttribute("USER_SESSION") != null){ %>
					${USER_SESSION.username} <%}else{ %>
						登陆<%} %></a></li>
				<li class="dropdown head-dpdn"><a href="${pageContext.request.contextPath }/help.action"><i
						class="fa fa-question-circle" aria-hidden="true"></i> 帮助</a></li>
			</ul>
		</div>

		<div class="clearfix"></div>
	</div>
	<div class="container">
		<div class="agile-its-header">
			<div class="logo">
				<h1>
					<a href="${pageContext.request.contextPath }/index.action">主页</a>
				</h1>
			</div>
			<div class="agileits_search">
				<form action="#" method="post">
					<input name="Search" type="text"
						placeholder="今天能为您做些什么?" required=" "> <select
						id="agileinfo_search" name="agileinfo_search" required="">
						<option value="">所有类别</option>
						<option value="Mobiles">移动</option>
						<option value="Electronics & Appliances">电子产品和电器</option>
						<option value="Cars">汽车</option>
						<option value="Bikes">自行车</option>
						<option value="Furnitures">宠物</option>
						<option value="Books, Sports & Hobbies">书</option>
						<option value="Fashion">时尚</option>
						<option value="Kids">儿童</option>
					</select>
					<button type="submit" class="btn btn-default"
						aria-label="Left Align">
						<i class="fa fa-search" aria-hidden="true"> </i>
					</button>
				</form>
				<a class="post-w3layouts-ad" href="${pageContext.request.contextPath }/post.action">免费发布广告</a>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	</header>
	<section>
	<div id="agileits-sign-in-page" class="sign-in-wrapper">
		<div class="agileinfo_signin">
			<h3>注册</h3>
			<form action="${pageContext.request.contextPath }/add.action" method="post"
												 onsubmit="return check()">
				<input type="text" name="code" id="code"placeholder="请输入账号" required="">
				<input type="text" name="username" id="username"placeholder="请输入用户名" required="">
				<input type="email" name="email" id="email" placeholder="请输入邮箱" required=""> 
				<input type="tel" name="phone" id ="phone" placeholder="请输入电话" required="">
				<input type="password" name="password" id="password" placeholder="请输入密码" required=""> 
				<input type="password" name="password1" id="password1" placeholder="请再次输入密码" required="">
				<div class="signin-rit">
					<span class="agree-checkbox"> 
						<label class="checkbox">
							<input type="checkbox" name="checkbox">I agree to your 
							<a class="w3layouts-t" href="terms.html" target="_blank">Terms of Use</a> 
							and <a class="w3layouts-t" href="privacy.html" target="_blank">
							Privacy Policy</a></label>
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
					<a href="${pageContext.request.contextPath }/index.action">交易网</a>
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
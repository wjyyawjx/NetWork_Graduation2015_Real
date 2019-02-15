<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>帮助</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-select.css">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/menu_sideslide.css" type="text/css" media="all">
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
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/bootstrap-select.js"></script>
<script type="text/javascript" src="js/jquery.leanModal.min.js"></script>
<link href="css/jquery.uls.css" rel="stylesheet" />
<link href="css/jquery.uls.grid.css" rel="stylesheet" />
<link href="css/jquery.uls.lcd.css" rel="stylesheet" />
<script src="js/jquery.uls.data.js"></script>
<script src="js/jquery.uls.data.utils.js"></script>
<script src="js/jquery.uls.lcd.js"></script>
<script src="js/jquery.uls.languagefilter.js"></script>
<script src="js/jquery.uls.regionfilter.js"></script>
<script src="js/jquery.uls.core.js"></script>
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
				<li class="dropdown head-dpdn"><a
					href="${pageContext.request.contextPath }/register.action"
					aria-expanded="false"><i class="fa fa-user" aria-hidden="true"></i>
						注册</a></li>
				<li class="dropdown head-dpdn"><a
					href="${pageContext.request.contextPath }/help.action"><i
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
					<input name="Search" type="text" placeholder="今天能为您做些什么?"
						required=" "> <select id="agileinfo_search"
						name="agileinfo_search" required="">
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
	<div class="w3layouts-breadcrumbs text-center">
		<div class="container">
			<span class="agile-breadcrumbs"><a href="${pageContext.request.contextPath }/index.action"><i
					class="fa fa-home home_1"></i></a> / <span>Help</span></span>
		</div>
	</div>
	<div class="faq main-grid-border">
		<div class="container">
			<div class="wthree-help">
				<h3>他可以帮你</h3>
				<form action="#" method="get">
					<textarea placeholder="你的问题" name="Message" required=""></textarea>
					<input type="submit" value="发送">
				</form>
			</div>
			<h2 class="w3-head">常见问题</h2>
			<dl class="faq-list">
				<dt class="faq-list_h">
					<h4 class="marker">Q?</h4>
					<h5 class="marker_head">这是所有人都犯过的错误吗?</h5>
				</dt>
				<dd>
					<h4 class="marker1">A.</h4>
					<p class="m_13">这是一种很好的方法，它可以让你的身体变得更健康。我的朋友，我的朋友。这是一种很好的方法，它可以让你的身体变得更健康。Donec
						porta是一群暴民。这是我的朋友，他是我的朋友。我的朋友，我的朋友，我的朋友，我的朋友。你是我的朋友，我是你的朋友。这是一种很有价值的东西。这是一种很好的方法。这是一个精英的选择。带着一个带薪假期。我的名字叫阿利克。这是我的朋友，我的朋友。</p>
				</dd>
				<dt class="faq-list_h">
					<h4 class="marker">Q?</h4>
					<h5 class="marker_head">但是，我必须向你解释一下，这种谴责的错误想法是怎么来的?</h5>
				</dt>
				<dd>
					<h4 class="marker">A.</h4>
					<p class="m_13">这是我的名字。Aliquarat volutpat。Duis ac
						turpis。这是一种自由的生活方式，它是一种自由的生活方式。Vivamus eget nibh。你的名字叫leo vel
						metus。Nulla facilisi。这是我的名字。</p>
				</dd>
			</dl>

		</div>
	</div>
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
	<script src="js/classie.js"></script>
	<script src="js/main.js"></script>
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
</body>
</html>
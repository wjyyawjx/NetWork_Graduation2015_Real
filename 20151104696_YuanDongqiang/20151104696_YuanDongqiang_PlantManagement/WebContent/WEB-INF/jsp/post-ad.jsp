<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<!-- bootstrap-CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/bootstrap-select.css">
<!-- bootstrap-select-CSS -->
<link href="${pageContext.request.contextPath }/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<!-- style.css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/font-awesome.min.css" />
<!-- fontawesome-CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/menu_sideslide.css"
	type="text/css" media="all">
<!-- Navigation-CSS -->
<!-- meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Resale Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<link href='//fonts.googleapis.com/css?family=Ubuntu+Condensed'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap-select.js"></script>
<script>
	$(document).ready(function() {
		var mySelect = $('#first-disabled2');

		$('#special').on('click', function() {
			mySelect.find('option:selected').prop('disabled', true);
			mySelect.selectpicker('refresh');
		});

		$('#special2').on('click', function() {
			mySelect.find('option:disabled').prop('disabled', false);
			mySelect.selectpicker('refresh');
		});

		$('#basic2').selectpicker({
			liveSearch : true,
			maxOptions : 1
		});
	});
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.leanModal.min.js"></script>
<link href="${pageContext.request.contextPath }/css/jquery.uls.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/jquery.uls.grid.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/jquery.uls.lcd.css"
	rel="stylesheet" />
<script src="${pageContext.request.contextPath }/js/jquery.uls.data.js"></script>
<script
	src="${pageContext.request.contextPath }/js/jquery.uls.data.utils.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.uls.lcd.js"></script>
<script
	src="${pageContext.request.contextPath }/js/jquery.uls.languagefilter.js"></script>
<script
	src="${pageContext.request.contextPath }/js/jquery.uls.regionfilter.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.uls.core.js"></script>
<script>
	$(document).ready(function() {
		$('.uls-trigger').uls({
			onSelect : function(language) {
				var languageName = $.uls.data.getAutonym(language);
				$('.uls-trigger').text(languageName);
			},
			quickList : [ 'en', 'hi', 'he', 'ml', 'ta', 'fr' ]
		//FIXME
		});
	});
</script>
</head>
<body>
	<div class="agiletopbar">
		<div class="wthreenavigation">
			<div class="menu-wrap">
				<nav class="menu">
				<div class="icon-list">
					<a
						href="${pageContext.request.contextPath }/categories.action?id=2">
						<i class="fa fa-fw fa-mobile"></i><span>移动</span>
					</a> <a
						href="${pageContext.request.contextPath }/categories.action?id=3">
						<i class="fa fa-fw fa-laptop"></i><span>电子产品和电器</span>
					</a> <a
						href="${pageContext.request.contextPath }/categories.action?id=4">
						<i class="fa fa-fw fa-car"></i><span>汽车</span>
					</a> <a
						href="${pageContext.request.contextPath }/categories.action?id=1">
						<i class="fa fa-fw fa-motorcycle"></i><span>自行车</span>
					</a> <a
						href="${pageContext.request.contextPath }/categories.action?id=5">
						<i class="fa fa-fw fa-paw"></i><span>宠物</span>
					</a> <a
						href="${pageContext.request.contextPath }/categories.action?id=6">
						<i class="fa fa-fw fa-book"></i><span>书</span>
					</a> <a
						href="${pageContext.request.contextPath }/categories.action?id=7">
						<i class="fa fa-fw fa-asterisk"></i><span>时尚</span>
					</a> <a
						href="${pageContext.request.contextPath }/categories.action?id=8">
						<i class="fa fa-fw fa-asterisk"></i><span>儿童</span>
					</a>
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
				<li class="dropdown head-dpdn"><a href="login.jsp"
					aria-expanded="false"><i class="fa fa-globe" aria-hidden="true"></i>
						我的商品</a></li>
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
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	</header>
	<div class="w3layouts-breadcrumbs text-center">
		<div class="container">
			<span class="agile-breadcrumbs"><a
				href="${pageContext.request.contextPath }/index.action"><i
					class="fa fa-home home_1"></i></a> / <span>Post your Ad</span></span>
		</div>
	</div>
	<div class="submit-ad main-grid-border">
		<div class="container">
			<h2 class="w3-head">发布一个广告</h2>
			<div class="post-ad-form">
				<form action="${pageContext.request.contextPath }/additems.action">
					<label>选择类别 <span>*</span></label> <select id="category"
						name="category" class="">
						<option>选择类别</option>
						<option>移动</option>
						<option>电子产品和家用电器</option>
						<option>汽车</option>
						<option>自行车</option>
						<option>宠物</option>
						<option>书，运动和爱好</option>
						<option>时尚</option>
						<option>儿童</option>
					</select>
					<div class="clearfix"></div>
					<label>商品标题 <span>*</span></label> <input type="text" class="phone"
						id="name" name="name" placeholder="">
					<div class="clearfix"></div>
					<label>商品描述 <span>*</span></label>
					<textarea class="mess" id="title" name="title"
						placeholder="Write few lines about your product"></textarea>
					<div class="clearfix"></div>
					<label>商品价格 <span>*</span></label> <input type="text" class="phone"
						id="money" name="money" placeholder="">
					<div class="clearfix"></div>
					<label>商品数量 <span>*</span></label> <input type="text" class="phone"
						id="sum" name="sum" placeholder="">
					<div class="clearfix"></div>
					<div class="upload-ad-photos">
						<label>广告中的照片 :</label>
						<div class="photos-upload-view">
							<input type="hidden" id="MAX_FILE_SIZE" name="MAX_FILE_SIZE"
								value="300000" />
							<div>
								<input type="file" id="fileselect" name="fileselect"
									multiple="multiple" />
								<div id="filedrag">或者在这里删除文件</div>
							</div>
							<div id="messages">
								<p>状态信息</p>
							</div>
						</div>
						<div class="clearfix"></div>
						<script src="js/filedrag.js"></script>
					</div>
					<div class="personal-details">
						<p class="post-terms">
							By clicking <strong>post Button</strong> you accept our <a
								href="terms.html" target="_blank">Terms of Use </a> and <a
								href="privacy.html" target="_blank">Privacy Policy</a>
						</p>

						<div class="clearfix"></div>

					</div>
					<input type="submit" value="添加">
				</form>
			</div>
		</div>
	</div>
	<footer>
	<div class="agileits-footer-bottom text-center">
		<div class="container">
			<div class="w3-footer-logo">
				<h1>
					<a href="${pageContext.request.contextPath }/index.actionl"><img
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
<!-- Navigation-JavaScript -->
<script src="js/classie.js"></script>
<script src="js/main.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$().UItoTop({
			easingType : 'easeOutQuart'
		});
	});
</script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>
</html>
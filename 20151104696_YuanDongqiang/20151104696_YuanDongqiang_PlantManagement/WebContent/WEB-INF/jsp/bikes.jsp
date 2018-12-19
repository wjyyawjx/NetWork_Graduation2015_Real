<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bikes</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/flexslider.css"
	type="text/css" media="screen" />
<!-- flexslider-CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
<!-- fontawesome-CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/menu_sideslide.css"
	type="text/css" media="all">
<!-- Navigation-CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<!-- bootstrap-CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-select.css">
<!-- bootstrap-select-CSS -->
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<!-- style.css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/jquery-ui1.css">
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.leanModal.min.js"></script>
<link href="${pageContext.request.contextPath}/css/jquery.uls.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/jquery.uls.grid.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/jquery.uls.lcd.css"
	rel="stylesheet" />
<script src="${pageContext.request.contextPath}/js/jquery.uls.data.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.uls.data.utils.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.uls.lcd.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.uls.languagefilter.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.uls.regionfilter.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.uls.core.js"></script>
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
<script src="${pageContext.request.contextPath}/js/tabs.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				var elem = $('#container ul');
				$('#viewcontrols a').on(
						'click',
						function(e) {
							if ($(this).hasClass('gridview')) {
								elem.fadeOut(1000, function() {
									$('#container ul').removeClass('list')
											.addClass('grid');
									$('#viewcontrols').removeClass(
											'view-controls-list').addClass(
											'view-controls-grid');
									$('#viewcontrols .gridview').addClass(
											'active');
									$('#viewcontrols .listview').removeClass(
											'active');
									elem.fadeIn(1000);
								});
							} else if ($(this).hasClass('listview')) {
								elem.fadeOut(1000, function() {
									$('#container ul').removeClass('grid')
											.addClass('list');
									$('#viewcontrols').removeClass(
											'view-controls-grid').addClass(
											'view-controls-list');
									$('#viewcontrols .gridview').removeClass(
											'active');
									$('#viewcontrols .listview').addClass(
											'active');
									elem.fadeIn(1000);
								});
							}
						});
			});
</script>
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
				<a class="post-w3layouts-ad"
					href="${pageContext.request.contextPath }/post.action">免费发布广告</a>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	</header>
	<div class="w3layouts-breadcrumbs text-center">
		<div class="container">
			<span class="agile-breadcrumbs"> <a
				href="${pageContext.request.contextPath }/index.action"><i
					class="fa fa-home home_1"></i></a> / <a href="categories.html">Categories</a>
				/ <span>Bikes</span></span>
		</div>
	</div>
	<div class="total-ads main-grid-border">
		<div class="container">
			<div class="ads-grid">
				<div class="side-bar col-md-3">
					<div class="search-hotel">
						<h3 class="agileits-sear-head">名称包含</h3>
						<form>
							<input type="text" value="Product name..."
								onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Product name...';}"
								required=""> <input type="submit" value=" ">
						</form>
					</div>
					<div class="w3ls-featured-ads">
						<h2 class="sear-head fer">特色的广告</h2>
						<c:forEach items="${read }" var="read">
							<div class="w3l-featured-ad">
								<a href="${pageContext.request.contextPath }/showAll.action?id=${read.id }">
									<div class="w3-featured-ad-left">
										<img src="${read.image}" title="ad image" alt="" />
									</div>
									<div class="w3-featured-ad-right">
										<h4>${read.name}</h4>
										<p>$${read.money}</p>
									</div>
									<div class="clearfix"></div>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="agileinfo-ads-display col-md-9">
					<div class="wrapper">
						<div class="bs-example bs-example-tabs" role="tabpanel"
							data-example-id="togglable-tabs">
							<ul id="myTab" class="nav nav-tabs nav-tabs-responsive"
								role="tablist">
								<li role="presentation" class="active"><a href="#home"
									id="home-tab" role="tab" data-toggle="tab" aria-controls="home"
									aria-expanded="true"> <span class="text">所有的广告</span>
								</a></li>
							</ul>
							<div id="myTabContent" class="tab-content">
								<div role="tabpanel" class="tab-pane fade in active" id="home"
									aria-labelledby="home-tab">
									<div>
										<div id="container">
											<div class="view-controls-list" id="viewcontrols">
											<label>试图 :</label>
												<a class="listview active"><i class="glyphicon glyphicon-th-list"></i></a>
												<a class="gridview"><i class="glyphicon glyphicon-th"></i></a>
											</div>
											<div class="clearfix"></div>
											<ul class="list">
												<c:forEach items="${fromType }" var="list">
													<a href="${pageContext.request.contextPath }/showAll.action?id=${list.id }">
														<li><img src="${list.image}" title="" alt="" /> <section
																class="list-left">
															<h5 class="title">${list.name}</h5>
															<span class="adprice">$ ${list.money}</span>
															<p class="catpath">Motorcycles » Bajaj</p>
															</section> <section class="list-right"> <span
																class="date">Today, 17:55</span> <span class="cityname">City
																name</span> </section>
															<div class="clearfix"></div></li>
													</a>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
								<div role="tabpanel" class="tab-pane fade" id="profile"
									aria-labelledby="profile-tab">
									<div>
										<div id="container">
											
											<div class="clearfix"></div>
											<ul class="list">
												<c:forEach items="${list }" var="list">
													<a href="single.html"> <c:forEach items="${list }"
															var="list">
															<li><img src="images/bk1.jpg" title="" alt="" /> <section
																	class="list-left">
																<h5 class="title">There are many variations of
																	passages of Lorem Ipsum</h5>
																<span class="adprice">$290</span>
																<p class="catpath">Motorcycles » Bajaj</p>
																</section> <section class="list-right"> <span
																	class="date">Today, 17:55</span> <span class="cityname">City
																	name</span> </section>
																<div class="clearfix"></div></li>
														</c:forEach>
													</a>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
								<ul class="pagination pagination-sm">
									<li><a href="#">Prev</a></li>
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">6</a></li>
									<li><a href="#">7</a></li>
									<li><a href="#">8</a></li>
									<li><a href="#">Next</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
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
<script src="${pageContext.request.contextPath}/js/classie.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$().UItoTop({
			easingType : 'easeOutQuart'
		});
	});
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/move-top.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/easing.js"></script>
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
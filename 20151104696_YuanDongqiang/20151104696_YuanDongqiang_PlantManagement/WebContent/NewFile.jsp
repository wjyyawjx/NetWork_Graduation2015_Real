<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<title>二手交易网</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"><!-- bootstrap-CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-select.css"><!-- bootstrap-select-CSS -->
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="all" /><!-- style.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/flexslider.css" type="text/css" media="screen" /><!-- flexslider-CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" /><!-- fontawesome-CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu_sideslide.css" type="text/css" media="all"><!-- Navigation-CSS -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Resale Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<link href='//fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
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
		<div class="slider">
			<ul class="rslides" id="slider">
				<li>
					<div class="w3ls-slide-text">
						<h3>在网上销售或做广告</h3>
						<a href="${pageContext.request.contextPath }/categories.action?id=1  " class="w3layouts-explore-all">浏览所有类别</a>
					</div>
				</li>
			</ul>
		</div>
		<div class="main-content">
			<div class="w3-categories">
				<h3>浏览类别</h3>
				<div class="container">
					<div class="col-md-3">
						<div class="focus-grid w3layouts-boder1">
							<a class="btn-8" href="${pageContext.request.contextPath }/categories.action?id=2">
								<div class="focus-border">
									<div class="focus-layout">
										<div class="focus-image"><i class="fa fa-mobile"></i></div>
										<h4 class="clrchg">移动</h4>
									</div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-md-3">
						<div class="focus-grid w3layouts-boder2">	
						<a class="btn-8" href="${pageContext.request.contextPath }/categories.action?id=3">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i class="fa fa-laptop"></i></div>
									<h4 class="clrchg"> 电子产品及电器</h4>
								</div>
							</div>
						</a>
					</div>
					</div>
					<div class="col-md-3">
					<div class="focus-grid w3layouts-boder3">
						<a class="btn-8" href="${pageContext.request.contextPath }/categories.action?id=4">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i class="fa fa-car"></i></div>
									<h4 class="clrchg">汽车</h4>
								</div>
							</div>
						</a>
					</div>	
					</div>
					<div class="col-md-3">
					<div class="focus-grid w3layouts-boder4">
						<a class="btn-8" href="${pageContext.request.contextPath }/categories.action?id=1">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i class="fa fa-motorcycle"></i></div>
									<h4 class="clrchg">自行车</h4>
								</div>
							</div>
						</a>
					</div>	
					</div>
					<div class="col-md-3">
					<div class="focus-grid w3layouts-boder9">
						<a class="btn-8" href="${pageContext.request.contextPath }/categories.action?id=8">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i class="fa fa-gamepad"></i></div>
									<h4 class="clrchg">儿童</h4>
								</div>
							</div>
						</a>
					</div>	
					</div>
					<div class="col-md-3">
					<div class="focus-grid w3layouts-boder6">
						<a class="btn-8" href="${pageContext.request.contextPath }/categories.action?id=5">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i class="fa fa-paw"></i></div>
									<h4 class="clrchg">宠物</h4>
								</div>
							</div>
						</a>
					</div>	
					</div>
					<div class="col-md-3">
					<div class="focus-grid w3layouts-boder7">
						<a class="btn-8" href="${pageContext.request.contextPath }/categories.action?id=6">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i class="fa fa-book"></i></div>
									<h4 class="clrchg">书，运动和爱好</h4>
								</div>
							</div>
						</a>
					</div>	
					</div>
					<div class="col-md-3">
					<div class="focus-grid w3layouts-boder8">
						<a class="btn-8" href="${pageContext.request.contextPath }/categories.action?id=7">
							<div class="focus-border">
								<div class="focus-layout">
									<div class="focus-image"><i class="fa fa-asterisk"></i></div>
									<h4 class="clrchg">时尚</h4>
								</div>
							</div>
						</a>
					</div>	
					</div>
				</div>
			</div>
			<div class="w3l-popular-ads">  
				<h3>最受欢迎的广告</h3>
				 <div class="w3l-popular-ads-info">
					<div class="col-md-4 w3ls-portfolio-left">
						<div class="portfolio-img event-img">
							<img src="images/ad1.jpg" class="img-responsive" alt=""/>
							<div class="over-image"></div>
						</div>
						<div class="portfolio-description">
						   <h4><a href="cars.html">最新的汽车</a></h4>
						   <p>Suspendisse placerat mattis arcu nec por</p>
							<a href="cars.html">
								<span>探索</span>
							</a>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="col-md-4 w3ls-portfolio-left">
						<div class="portfolio-img event-img">
							<img src="images/ad2.jpg" class="img-responsive" alt=""/>
							 <div class="over-image"></div>
						</div>
						<div class="portfolio-description">
						   <h4><a href="real-estate.html">公寓出售</a></h4>
						   <p>Suspendisse placerat mattis arcu nec por</p>
							<a href="real-estate.html">
								<span>探索</span>
							</a>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="col-md-4 w3ls-portfolio-left">
						<div class="portfolio-img event-img">
							<img src="images/ad3.jpg" class="img-responsive" alt=""/>
							 <div class="over-image"></div>
						</div>
						<div class="portfolio-description">
						   <h4><a href="jobs.html">业务流程外包工作</a></h4>
						   <p>Suspendisse placerat mattis arcu nec por</p>
							<a href="jobs.html">
								<span>探索</span>
							</a>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="col-md-4 w3ls-portfolio-left">
						<div class="portfolio-img event-img">
							<img src="images/ad4.jpg" class="img-responsive" alt=""/>
							 <div class="over-image"></div>
						</div>
						<div class="portfolio-description">
						   <h4><a href="electronics-appliances.html">配件</a></h4>
						   <p>Suspendisse placerat mattis arcu nec por</p>
							<a href="electronics-appliances.html">
								<span>探索</span>
							</a>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="col-md-4 w3ls-portfolio-left">
						<div class="portfolio-img event-img">
							<img src="images/ad5.jpg" class="img-responsive" alt=""/>
							 <div class="over-image"></div>
						</div>
						<div class="portfolio-description">
						   <h4><a href="furnitures.html">家用电器</a></h4>
						   <p>Suspendisse placerat mattis arcu nec por</p>
							<a href="furnitures.html">
								<span>探索</span>
							</a>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="col-md-4 w3ls-portfolio-left">
						<div class="portfolio-img event-img">
							<img src="images/ad6.jpg" class="img-responsive" alt=""/>
							 <div class="over-image"></div>
						</div>
						<div class="portfolio-description">
						   <h4><a href="fashion.html">服装</a></h4>
						   <p>Suspendisse placerat mattis arcu nec por</p>
							<a href="fashion.html">
								<span>探索</span>
							</a>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="clearfix"> </div>
				 </div>
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
		<script type="text/javascript" src="js/main.js"></script>
		<script type="text/javascript" src="js/classie.js"></script>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script src="js/bootstrap.js"></script>
		<script src="js/bootstrap-select.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.leanModal.min.js"></script>
		<link href="${pageContext.request.contextPath}/css/jquery.uls.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/css/jquery.uls.grid.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/css/jquery.uls.lcd.css" rel="stylesheet"/>
		<!-- Source -->
		<script src="${pageContext.request.contextPath}/js/jquery.uls.data.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.uls.data.utils.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.uls.lcd.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.uls.languagefilter.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.uls.regionfilter.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.uls.core.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.flexisel.js"></script><!-- flexisel-js -->	
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/move-top.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/easing.js"></script>
</body>		
</html>
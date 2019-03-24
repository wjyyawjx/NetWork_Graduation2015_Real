<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>植物培养</title>
<link rel="icon"
	href="${pageContext.request.contextPath}/img/core-img/favicon.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/style.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/ajax.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(function(){
		fajax("${pageContext.request.contextPath }/JZIndex.action", null,
				function(data) {
					if (data.status == "ok") {
						if (<%=session.getAttribute("KEY")%>！=1){
							location.replace(document.referrer);
						}
					}
					return true;
				})
	})
</script>
</head>
<body>
	<!-- Preloader -->
	<div class="preloader d-flex align-items-center justify-content-center">
		<div class="preloader-circle"></div>
		<div class="preloader-img">
			<img src="img/core-img/leaf.png" alt="">
		</div>
	</div>
	<header class="header-area">
	<div class="top-header-area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div
						class="top-header-content d-flex align-items-center justify-content-between">
						<div class="top-header-meta">
							<a href="#"> <i class="fa fa-envelope-o" aria-hidden="true"></i>
								<span>邮箱:Ydq7543@hotmail.com</span>
							</a> <a href="#"> <i class="fa fa-phone" aria-hidden="true"></i>
								<span>电话: +1 234 122 122</span>
							</a>
						</div>
						<div class="top-header-meta d-flex" id="login">
							<div class="login">
								<a href="${pageContext.request.contextPath }/TZlogin.action"
									aria-expanded="false"><i class="fa fa-user"></i> <%
 	if (session.getAttribute("USER_SESSION") != null) {
 %> ${USER_SESSION.u_name} <%
 	} else {
 %> 未登陆 <%
 	}
 %> </a>
							</div>
							<%
								if (session.getAttribute("USER_SESSION") != null) {
							%>
							<div class="cart">
								<a href="${pageContext.request.contextPath }/logout.action">
									<i class="fa fa-question-circle" aria-hidden="true"></i> 退出登陆
								</a>
							</div>
							<%
								}
							%>
							<div class="cart">
								<a href="${pageContext.request.contextPath }/help.action"> <i
									class="fa fa-question-circle" aria-hidden="true"></i> 帮助
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="alazea-main-menu">
		<div class="classy-nav-container breakpoint-off">
			<div class="container">
				<!-- Menu -->
				<nav class="classy-navbar justify-content-between" id="alazeaNav">
				<!-- Nav Brand --> <a href="index.jsp" class="nav-brand"><img
					src="img/core-img/logo.png" alt=""></a>
				<div class="classy-navbar-toggler">
					<span class="navbarToggler"><span></span><span></span><span></span></span>
				</div>
				<!-- Menu -->
				<div class="classy-menu">
					<!-- Close Button -->
					<div class="classycloseIcon">
						<div class="cross-wrap">
							<span class="top"></span><span class="bottom"></span>
						</div>
					</div>
					<!-- Navbar Start -->
					<div class="classynav">
						<ul>
							<li><a href="index.html">主页</a></li>
							<li><a href="about.html">关于我们</a></li>
							<li><a href="#">页面</a>
								<ul class="dropdown">
									<li><a href="index.html">主页</a></li>
									<li><a href="about.html">关于我们</a></li>
									<li><a href="shop.html">购买</a>
										<ul class="dropdown">
											<li><a href="shop.html">购买</a></li>
											<li><a href="shop-details.html">商店 细节</a></li>
											<li><a href="cart.html">购物车</a></li>
											<li><a href="checkout.html">结帐</a></li>
										</ul></li>
									<li><a href="portfolio.html">投资组合</a>
										<ul class="dropdown">
											<li><a href="portfolio.html">投资组合</a></li>
											<li><a href="single-portfolio.html">投资组合细节</a></li>
										</ul></li>
									<li><a href="blog.html">博客</a>
										<ul class="dropdown">
											<li><a href="blog.html">博客</a></li>
											<li><a href="single-post.html">博客 细节</a></li>
										</ul></li>
									<li><a href="contact.html">联系</a></li>
								</ul></li>
							<li><a href="shop.html">店铺</a></li>
							<li><a href="portfolio.html">投资组合</a></li>
							<li><a href="contact.html">联系</a></li>
						</ul>

						<!-- Search Icon -->
						<div id="searchIcon">
							<i class="fa fa-search" aria-hidden="true"></i>
						</div>

					</div>
					<!-- Navbar End -->
				</div>
				</nav>

				<!-- Search Form -->
				<div class="search-form">
					<form action="#" method="get">
						<input type="search" name="search" id="search"
							placeholder="输入关键字,按回车……">
						<button type="submit" class="d-none"></button>
					</form>
					<!-- Close Icon -->
					<div class="closeIcon">
						<i class="fa fa-times" aria-hidden="true"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	</header>
	<!-- ##### Header Area End ##### -->

	<!-- ##### Hero Area Start ##### -->
	<section class="hero-area">
	<div class="hero-post-slides owl-carousel">

		<!-- Single Hero Post -->
		<div class="single-hero-post bg-overlay">
			<!-- Post Image -->
			<div class="slide-img bg-img"
				style="background-image: url(img/bg-img/1.jpg);"></div>
			<div class="container h-100">
				<div class="row h-100 align-items-center">
					<div class="col-12">
						<!-- Post Content -->
						<div class="hero-slides-content text-center">
							<h2>存在于天气和周围的光线中的绿色植物</h2>
							<p></p>
							<div class="welcome-btn-group">
								<a href="#" class="btn alazea-btn mr-30">开始使用</a> <a href="#"
									class="btn alazea-btn active">联系我们</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Single Hero Post -->
		<div class="single-hero-post bg-overlay">
			<!-- Post Image -->
			<div class="slide-img bg-img"
				style="background-image: url(img/bg-img/2.jpg);"></div>
			<div class="container h-100">
				<div class="row h-100 align-items-center">
					<div class="col-12">
						<!-- Post Content -->
						<div class="hero-slides-content text-center">
							<h2>存在于天气和周围的光线中的绿色植物</h2>
							<p></p>
							<div class="welcome-btn-group">
								<a href="#" class="btn alazea-btn mr-30">开始</a> <a href="#"
									class="btn alazea-btn active">联系我们</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	</section>
	<!-- ##### Hero Area End ##### -->

	<!-- ##### Service Area Start ##### -->
	<section class="our-services-area bg-gray section-padding-100-0">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<!-- Section Heading -->
				<div class="section-heading text-center">
					<h2>我们的服务</h2>
					<p>我们为您提供最完善的服务。</p>
				</div>
			</div>
		</div>

		<div class="row justify-content-between">
			<div class="col-12 col-lg-5">
				<div class="alazea-service-area mb-100">

					<!-- Single Service Area -->
					<div
						class="single-service-area d-flex align-items-center wow fadeInUp"
						data-wow-delay="100ms">
						<!-- Icon -->
						<div class="service-icon mr-30">
							<img src="img/core-img/s1.png" alt="">
						</div>
						<!-- Content -->
						<div class="service-content">
							<h5>植物保健</h5>
							<p></p>
						</div>
					</div>

					<!-- Single Service Area -->
					<div
						class="single-service-area d-flex align-items-center wow fadeInUp"
						data-wow-delay="300ms">
						<!-- Icon -->
						<div class="service-icon mr-30">
							<img src="img/core-img/s2.png" alt="">
						</div>
						<!-- Content -->
						<div class="service-content">
							<h5>压力清洗</h5>
							<p></p>
						</div>
					</div>

					<!-- Single Service Area -->
					<div
						class="single-service-area d-flex align-items-center wow fadeInUp"
						data-wow-delay="500ms">
						<!-- Icon -->
						<div class="service-icon mr-30">
							<img src="img/core-img/s3.png" alt="">
						</div>
						<!-- Content -->
						<div class="service-content">
							<h5>树服务,修剪</h5>
							<p></p>
						</div>
					</div>

				</div>
			</div>

			<div class="col-12 col-lg-6">
				<div class="alazea-video-area bg-overlay mb-100">
					<img src="img/bg-img/23.jpg" alt=""> <a
						href="http://www.youtube.com/watch?v=7HKoqNJtMTQ"
						class="video-icon"> <i class="fa fa-play" aria-hidden="true"></i>
					</a>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- ##### Service Area End ##### -->

	<!-- ##### About Area Start ##### -->
	<section class="about-us-area section-padding-100-0">
	<div class="container">
		<div class="row justify-content-between">
			<div class="col-12 col-lg-5">
				<!-- Section Heading -->
				<div class="section-heading">
					<h2>关于我们</h2>
					<p>我们在工厂服务领域处于领先地位。</p>
				</div>
				<p>我们主要致力于植物的介绍和植物的相关习性的介绍，通过我们的网站主要可以查看各类植物的信息以及养护的相关知识，
					我们不求最好只求更好。</p>

				<!-- Progress Bar Content Area -->
				<div class="alazea-progress-bar mb-50">
					<!-- Single Progress Bar -->
					<div class="single_progress_bar">
						<p>办公室植物</p>
						<div id="bar1" class="barfiller">
							<div class="tipWrap">
								<span class="tip"></span>
							</div>
							<span class="fill" data-percentage="80"></span>
						</div>
					</div>

					<!-- Single Progress Bar -->
					<div class="single_progress_bar">
						<p>现场经理</p>
						<div id="bar2" class="barfiller">
							<div class="tipWrap">
								<span class="tip"></span>
							</div>
							<span class="fill" data-percentage="70"></span>
						</div>
					</div>

					<!-- Single Progress Bar -->
					<div class="single_progress_bar">
						<p>景观设计</p>
						<div id="bar3" class="barfiller">
							<div class="tipWrap">
								<span class="tip"></span>
							</div>
							<span class="fill" data-percentage="85"></span>
						</div>
					</div>

					<!-- Single Progress Bar -->
					<div class="single_progress_bar">
						<p>花园护理</p>
						<div id="bar4" class="barfiller">
							<div class="tipWrap">
								<span class="tip"></span>
							</div>
							<span class="fill" data-percentage="65"></span>
						</div>
					</div>
				</div>
			</div>

			<div class="col-12 col-lg-6">
				<div class="alazea-benefits-area">
					<div class="row">
						<!-- Single Benefits Area -->
						<div class="col-12 col-sm-6">
							<div class="single-benefits-area">
								<img src="img/core-img/b1.png" alt="">
								<h5>质量的产品</h5>
								<p>我们拥有质量最好的参产品
									，本平台所出售的产品可保证质量</p>
							</div>
						</div>

						<!-- Single Benefits Area -->
						<div class="col-12 col-sm-6">
							<div class="single-benefits-area">
								<img src="img/core-img/b2.png" alt="">
								<h5>完善的服务</h5>
								<p>我们有最好的服务，
									通过我们的服务让你宾至如归。</p>
							</div>
						</div>

						<!-- Single Benefits Area -->
						<div class="col-12 col-sm-6">
							<div class="single-benefits-area">
								<img src="img/core-img/b3.png" alt="">
								<h5>100% 自然</h5>
								<p>我们的植物都是百分之百的纯天然植物，
									无公害，每颗都是经过精心培养的。</p>
							</div>
						</div>

						<!-- Single Benefits Area -->
						<div class="col-12 col-sm-6">
							<div class="single-benefits-area">
								<img src="img/core-img/b4.png" alt="">
								<h5>环境友好型</h5>
								<p>植物生长的环境属于大自然，
									还原大自然的生长环境。</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="border-line"></div>
			</div>
		</div>
	</div>
	</section>
	<!-- ##### About Area End ##### -->

	<!-- ##### Portfolio Area Start ##### -->
	<section class="alazea-portfolio-area section-padding-100-0">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<!-- Section Heading -->
				<div class="section-heading text-center">
					<h2>我们的投资组合</h2>
					<p>我们把所有的经验和努力都用于创造</p>
				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<div class="alazea-portfolio-filter">
					<div class="portfolio-filter">
						<button class="btn active" data-filter="*">全部</button>
						<button class="btn" data-filter=".garden">花园设计</button>
						<button class="btn" data-filter=".home-design">家设计</button>
						<button class="btn" data-filter=".office-design">办公室设计</button>
					</div>
				</div>
			</div>
		</div>

		<div class="row alazea-portfolio">

			<!-- Single Portfolio Area -->
			<div
				class="col-12 col-sm-6 col-lg-3 single_portfolio_item design home-design wow fadeInUp"
				data-wow-delay="100ms">
				<!-- Portfolio Thumbnail -->
				<div class="portfolio-thumbnail bg-img"
					style="background-image: url(img/bg-img/16.jpg);"></div>
				<!-- Portfolio Hover Text -->
				<div class="portfolio-hover-overlay">
					<a href="img/bg-img/16.jpg"
						class="portfolio-img d-flex align-items-center justify-content-center"
						title="Portfolio 1">
						<div class="port-hover-text">
							<h3>最小的鲜花店</h3>
							<h5>办公室植物</h5>
						</div>
					</a>
				</div>
			</div>

			<!-- Single Portfolio Area -->
			<div
				class="col-12 col-sm-6 col-lg-3 single_portfolio_item garden wow fadeInUp"
				data-wow-delay="200ms">
				<!-- Portfolio Thumbnail -->
				<div class="portfolio-thumbnail bg-img"
					style="background-image: url(img/bg-img/17.jpg);"></div>
				<!-- Portfolio Hover Text -->
				<div class="portfolio-hover-overlay">
					<a href="img/bg-img/17.jpg"
						class="portfolio-img d-flex align-items-center justify-content-center"
						title="Portfolio 2">
						<div class="port-hover-text">
							<h3>最小的鲜花店</h3>
							<h5>办公室植物</h5>
						</div>
					</a>
				</div>
			</div>

			<!-- Single Portfolio Area -->
			<div
				class="col-12 col-sm-6 col-lg-3 single_portfolio_item garden design wow fadeInUp"
				data-wow-delay="300ms">
				<!-- Portfolio Thumbnail -->
				<div class="portfolio-thumbnail bg-img"
					style="background-image: url(img/bg-img/18.jpg);"></div>
				<!-- Portfolio Hover Text -->
				<div class="portfolio-hover-overlay">
					<a href="img/bg-img/18.jpg"
						class="portfolio-img d-flex align-items-center justify-content-center"
						title="Portfolio 3">
						<div class="port-hover-text">
							<h3>最小的鲜花店</h3>
							<h5>办公室植物</h5>
						</div>
					</a>
				</div>
			</div>

			<!-- Single Portfolio Area -->
			<div
				class="col-12 col-sm-6 col-lg-3 single_portfolio_item garden office-design wow fadeInUp"
				data-wow-delay="400ms">
				<!-- Portfolio Thumbnail -->
				<div class="portfolio-thumbnail bg-img"
					style="background-image: url(img/bg-img/19.jpg);"></div>
				<!-- Portfolio Hover Text -->
				<div class="portfolio-hover-overlay">
					<a href="img/bg-img/19.jpg"
						class="portfolio-img d-flex align-items-center justify-content-center"
						title="Portfolio 4">
						<div class="port-hover-text">
							<h3>最小的鲜花店</h3>
							<h5>办公室植物</h5>
						</div>
					</a>
				</div>
			</div>

			<!-- Single Portfolio Area -->
			<div
				class="col-12 col-sm-6 col-lg-3 single_portfolio_item design office-design wow fadeInUp"
				data-wow-delay="100ms">
				<!-- Portfolio Thumbnail -->
				<div class="portfolio-thumbnail bg-img"
					style="background-image: url(img/bg-img/20.jpg);"></div>
				<!-- Portfolio Hover Text -->
				<div class="portfolio-hover-overlay">
					<a href="img/bg-img/20.jpg"
						class="portfolio-img d-flex align-items-center justify-content-center"
						title="Portfolio 5">
						<div class="port-hover-text">
							<h3>最小的鲜花店</h3>
							<h5>办公室植物</h5>
						</div>
					</a>
				</div>
			</div>

			<!-- Single Portfolio Area -->
			<div
				class="col-12 col-sm-6 col-lg-3 single_portfolio_item garden wow fadeInUp"
				data-wow-delay="200ms">
				<!-- Portfolio Thumbnail -->
				<div class="portfolio-thumbnail bg-img"
					style="background-image: url(img/bg-img/21.jpg);"></div>
				<!-- Portfolio Hover Text -->
				<div class="portfolio-hover-overlay">
					<a href="img/bg-img/21.jpg"
						class="portfolio-img d-flex align-items-center justify-content-center"
						title="Portfolio 6">
						<div class="port-hover-text">
							<h3>最小的鲜花店</h3>
							<h5>办公室植物</h5>
						</div>
					</a>
				</div>
			</div>

			<!-- Single Portfolio Area -->
			<div
				class="col-12 col-lg-6 single_portfolio_item home-design wow fadeInUp"
				data-wow-delay="300ms">
				<!-- Portfolio Thumbnail -->
				<div class="portfolio-thumbnail bg-img"
					style="background-image: url(img/bg-img/22.jpg);"></div>
				<!-- Portfolio Hover Text -->
				<div class="portfolio-hover-overlay">
					<a href="img/bg-img/22.jpg"
						class="portfolio-img d-flex align-items-center justify-content-center"
						title="Portfolio 7">
						<div class="port-hover-text">
							<h3>最小的鲜花店</h3>
							<h5>办公室植物</h5>
						</div>
					</a>
				</div>
			</div>

		</div>
	</div>
	</section>
	<!-- ##### Portfolio Area End ##### -->

	<!-- ##### Subscribe Area Start ##### -->
	<section class="subscribe-newsletter-area"
		style="background-image: url(img/bg-img/subscribe.png);">
	<div class="container">
		<div class="row align-items-center justify-content-between">
			<div class="col-12 col-lg-5">
				<!-- Section Heading -->
				<div class="section-heading mb-0">
					<h2>加入通讯</h2>
					<p>订阅我们的通讯，先打九折购买</p>
				</div>
			</div>
			<div class="col-12 col-lg-6">
				<div class="subscribe-form">
					<form action="#" method="get">
						<input type="email" name="subscribe-email" id="subscribeEmail"
							placeholder="输入您的邮箱">
						<button type="submit" class="btn alazea-btn">订阅</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Subscribe Side Thumbnail -->
	<div class="subscribe-side-thumb wow fadeInUp" data-wow-delay="500ms">
		<img class="first-img" src="img/core-img/leaf.png" alt="">
	</div>
	</section>
	<!-- ##### Subscribe Area End ##### -->

	<!-- ##### Contact Area Start ##### -->
	<section class="contact-area section-padding-100-0">
	<div class="container">
		<div class="row align-items-center justify-content-between">
			<div class="col-12 col-lg-5">
				<!-- Section Heading -->
				<div class="section-heading">
					<h2>与我们取得联系</h2>
					<p>请给我们发个消息，我们会及时处理。</p>
				</div>
				<!-- Contact Form Area -->
				<div class="contact-form-area mb-100">
					<form action="#" method="post">
						<div class="row">
							<div class="col-12 col-sm-6">
								<div class="form-group">
									<input type="text" class="form-control" id="contact-name"
										placeholder="您的名字">
								</div>
							</div>
							<div class="col-12 col-sm-6">
								<div class="form-group">
									<input type="email" class="form-control" id="contact-email"
										placeholder="您的邮箱">
								</div>
							</div>
							<div class="col-12">
								<div class="form-group">
									<input type="text" class="form-control" id="contact-subject"
										placeholder="主题">
								</div>
							</div>
							<div class="col-12">
								<div class="form-group">
									<textarea class="form-control" name="message" id="message"
										cols="30" rows="10" placeholder="主要内容"></textarea>
								</div>
							</div>
							<div class="col-12">
								<button type="submit" class="btn alazea-btn mt-15">发送消息</button>
							</div>
						</div>
					</form>
				</div>
			</div>

			<div class="col-12 col-lg-6">
				<!-- Google Maps -->
				<div class="map-area mb-100"></div>
			</div>
		</div>
	</div>
	</section>
	<!-- ##### Contact Area End ##### -->

	<!-- ##### Footer Area Start ##### -->
	<footer class="footer-area bg-img"
		style="background-image: url(img/bg-img/3.jpg);"> <!-- Main Footer Area -->
	<div class="main-footer-area">
		<div class="container">
			<div class="row">

				<!-- Single Footer Widget -->
				<div class="col-12 col-sm-6 col-lg-3">
					<div class="single-footer-widget">
						<div class="footer-logo mb-30">
							<a href="#"><img src="img/core-img/logo.png" alt=""></a>
						</div>
						<p>网站的主要连接，转发网站。</p>
						<div class="social-info">
							<a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
							<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
							<a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
							<a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
							<a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
						</div>
					</div>
				</div>

				<!-- Single Footer Widget -->
				<div class="col-12 col-sm-6 col-lg-3">
					<div class="single-footer-widget">
						<div class="widget-title">
							<h5>快速链接</h5>
						</div>
						<nav class="widget-nav">
						<ul>
							<li><a href="#">常见问题</a></li>
							<li><a href="#">消息</a></li>
							<li><a href="#">返回</a></li>
							<li><a href="#">做广告</a></li>
							<li><a href="#">航运</a></li>
							<li><a href="#">职业生涯</a></li>
						</ul>
						</nav>
					</div>
				</div>

				<!-- Single Footer Widget -->
				<div class="col-12 col-sm-6 col-lg-3">
					<div class="single-footer-widget">
						<div class="widget-title">
							<h5>联系</h5>
						</div>

						<div class="contact-information">
							<p>
								<span>地址:</span> 内蒙古师范大学
							</p>
							<p>
								<span>电话:</span> +1 234 122 122
							</p>
							<p>
								<span>Email:</span> Yqd7543@hotmail.com
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer Bottom Area -->
	<div class="footer-bottom-area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="border-line"></div>
				</div>
				<!-- Copywrite Text -->
				<div class="col-12 col-md-6">
					<div class="copywrite-text">
						<p>
							&copy; 版权 &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							- 本人保留所有权利

						</p>
					</div>
				</div>
				<!-- Footer Nav -->
				<div class="col-12 col-md-6">
					<div class="footer-nav">
						<nav>
						<ul>
							<li><a href="#">主页</a></li>
							<li><a href="#">关于我们</a></li>
							<li><a href="#">服务</a></li>
							<li><a href="#">投资组合</a></li>
							<li><a href="#">博客</a></li>
							<li><a href="#">联系</a></li>
						</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	</footer>
	<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<script src="js/bootstrap/popper.min.js"></script>
	<script src="js/bootstrap/bootstrap.min.js"></script>
	<script src="js/plugins/plugins.js"></script>
	<script src="js/active.js"></script>
</body>

</html>
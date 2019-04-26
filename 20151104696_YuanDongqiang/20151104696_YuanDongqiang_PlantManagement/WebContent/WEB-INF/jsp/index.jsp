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
<script type="text/javascript">
	function judge() {
		alert("请进行登陆后，进行消息上传");
		return false;
	}
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
							<div class="top-header-meta d-flex">
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
									<a href="${pageContext.request.contextPath }/help.action">
										<i class="fa fa-question-circle" aria-hidden="true"></i> 帮助
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
								<a href="#admin" class="btn alazea-btn mr-30">开始使用</a>
								<%
									if (session.getAttribute("USER_SESSION") != null) {
								%>
								<a href="${pageContext.request.contextPath }/addMessage.action"
									class="btn alazea-btn active">上传信息</a>
								<%
									} else {
								%>
								<a href="#" onclick="judge()" class="btn alazea-btn active">上传信息</a>
								<%
									}
								%>
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
								<a href="#admin" class="btn alazea-btn mr-30">开始使用</a>
								<%
									if (session.getAttribute("USER_SESSION") != null) {
								%>
								<a href="${pageContext.request.contextPath }/addMessage.action"
									class="btn alazea-btn active">上传信息</a>
								<%
									} else {
								%>
								<a href="#" onclick="judge()" class="btn alazea-btn active">上传信息</a>
								<%
									}
								%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	</section>
	<!-- ##### Hero Area End ##### -->

	<!-- ##### Portfolio Area Start ##### -->
	<section class="alazea-portfolio-area section-padding-100-0">
	<div id="admin" class="container">
		<div class="row">
			<div class="col-12">
				<!-- Section Heading -->
				<div class="section-heading text-center">
					<h2>植物的主要分类</h2>
					<p>我们把植物进行简单的分类，使我们方便查找。</p>
				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<div class="alazea-portfolio-filter">
					<div class="portfolio-filter">
						<a href="${pageContext.request.contextPath }/plan.action?id=0">
						<button class="btn active" data-filter="*">全部种类</button></a>
						<a href="${pageContext.request.contextPath }/plan.action?id=1">
						<button class="btn" data-filter=".garden">喜阳植物</button></a>
						<a href="${pageContext.request.contextPath }/plan.action?id=2">
						<button class="btn" data-filter=".home-design">喜阴植物</button></a>
						<a href="${pageContext.request.contextPath }/plan.action?id=3">
						<button class="btn" data-filter=".office-design">多年生植物</button></a>
						<a href="${pageContext.request.contextPath }/plan.action?id=4">
						<button class="btn" data-filter=".office-design">一年生植物</button></a>
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
					<a href="${pageContext.request.contextPath }/plan.action?id=1">
						<div class="port-hover-text"
							style="width: 100%; height: 100%; margin-top: 50%;">
							<h3 style="maigin-top: 80px;">生长在阳光充足环境下。</h3>
							<h5>喜阳植物</h5>
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
					<a href="${pageContext.request.contextPath }/plan.action?id=2">
						<div class="port-hover-text"
							style="width: 100%; height: 100%; margin-top: 50%;">
							<h3>喜欢在阴暗的环境下生长</h3>
							<h5>喜阴植物</h5>
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
					<a href="${pageContext.request.contextPath }/plan.action?id=3">
						<div class="port-hover-text"
							style="width: 100%; height: 100%; margin-top: 50%;">
							<h3>寿命在两年以上的植物。</h3>
							<h5>多年生植物</h5>
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
					<a href="${pageContext.request.contextPath }/plan.action?id=4">
						<div class="port-hover-text"
							style="width: 100%; height: 100%; margin-top: 50%;">
							<h3>生命周期为一年的植物。</h3>
							<h5>一年生植物</h5>
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
					<a href="${pageContext.request.contextPath }/plan.action?id=5">
						<div class="port-hover-text"
							style="width: 100%; height: 100%; margin-top: 50%;">
							<h3>常年不落也植物。</h3>
							<h5>常绿植物</h5>
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
					<a href="${pageContext.request.contextPath }/plan.action?id=6">
						<div class="port-hover-text"
							style="width: 100%; height: 100%; margin-top: 50%;">
							<h3>植物会在一段时间落叶。</h3>
							<h5>非常绿植物</h5>
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
					<a href="${pageContext.request.contextPath }/plan.action?id=0">
						<div class="port-hover-text"
							style="width: 100%; height: 100%; margin-top: 25%;">
							<h2>全部种类</h2>
						</div>
					</a>
				</div>
			</div>

		</div>
	</div>
	</section>
	<!-- ##### Portfolio Area End ##### -->

	<!-- ##### Subscribe Area Start ##### -->
	<section class="subscribe-newsletter-area"> </section>


	<!-- ##### Footer Area Start ##### -->
	<footer class="footer-area bg-img"
		style="background-image: url(img/bg-img/3.jpg);"> <!-- Main Footer Area -->
	<div class="main-footer-area">
		<div class="container">
			<div class="row">

				<!-- Single Footer Widget -->
				<div class="col-12 col-sm-6 col-lg-3" st>
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
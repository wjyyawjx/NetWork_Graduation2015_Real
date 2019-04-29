<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>植物详细信息</title>

<link rel="icon" href="img/core-img/favicon.ico">

<link rel="stylesheet" href="style.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/ajax.js"></script>
<script type="text/javascript">
	function message(id) {
		var message = $("#comments").val();
		var req_data = {};
		req_data["text"] = message;
		req_data["id"] = id;
		if (message != null){
			fajax("${pageContext.request.contextPath }/message.action", req_data, function(data) {
				if (data.status != "ok") {
					return false;
				}
			})
		}
		document.getElementById("comments").value="";
		return true;
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

	<!-- ##### Header Area Start ##### -->
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

	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(img/bg-img/24.jpg);">
			<h2>植物详细信息</h2>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->

	<!-- ##### Single Product Details Area Start ##### -->
	<section class="single_product_details_area mb-50"> <c:forEach
		items="${planmore }" var="planmore">
		<div class="produts-details--content mb-50">
			<div class="container">
				<div class="row justify-content-between">

					<div class="col-12 col-md-6 col-lg-5">
						<div class="single_product_thumb">
							<div id="product_details_slider" class="carousel slide"
								data-ride="carousel">
								<div class="carousel-inner">
									<div class="carousel-item active">
										<a class="product-img" href="img/bg-img/49.jpg"
											title="Product Image"> <img class="d-block w-100"
											src="${planmore.p_img }" alt="1">
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-12 col-md-6">
						<div class="single_product_desc">
							<h4 class="title">${planmore.p_name }</h4>
							<div class="short_overview">
								<p>${planmore.p_form }</p>
							</div>
							<div class="products--meta">
								<p>
									<span>上传用户:</span> <span>${user.u_name}</span>
								</p>
								<p>
									<span>植物喜好:</span> <span>${type.t_name } </span>
								</p>
								<p>
									<span>浇水频率:</span> <span>${planmore.p_water} </span>
								</p>
								<p>
									<span>植物分布:</span> <span>${planmore.p_place}</span>
								</p>
								<p>
									<span>繁殖方式:</span> <span>${planmore.p_breeding}</span>
								</p>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="product_details_tab clearfix">
						<!-- Tabs -->
						<ul class="nav nav-tabs" role="tablist" id="product-details-tab">
							<li class="nav-item"><a href="#description"
								class="nav-link active" data-toggle="tab" role="tab">植物形态特征</a>
							</li>
							<li class="nav-item"><a href="#addi-info" class="nav-link"
								data-toggle="tab" role="tab">培养技巧</a></li>
							<li class="nav-item"><a href="#reviews" class="nav-link"
								data-toggle="tab" role="tab">相关留言 <span class="text-muted">(${MessMany })</span></a>
							</li>
						</ul>
						<!-- Tab Content -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade show active"
								id="description">
								<div class="description_area">
									<p>${planmore.p_form}</p>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="addi-info">
								<div class="additional_info_area">
									<p>${planmore.p_message}</p>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="reviews">
								<div class="submit_a_review_area mt-50">
									<h4>留言区</h4>
									<div class="row">
										<div class="cmt-list">
											<c:forEach items="${message }" var="message">
												<p>
													<span class="data-name">${message.u_name}</span><span> ： </span>
												</p>
												<p>	
													 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span> ${message.m_text} </span>  ${message.m_time}
												</p>
											</c:forEach>
										</div>
										<div class="col-12">
											<div class="form-group">
												<label for="comments">分享您的经验</label>
												<textarea class="form-control" id="comments" rows="5"
													data-max-length="150"></textarea>
											</div>
										</div>
										<div class="col-12">
											<button type="submit" class="btn alazea-btn"
												onclick="message(${planmore.p_id})">发送</button>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach> </section>
	<!-- ##### Single Product Details Area End ##### -->

	<!-- ##### Related Product Area Start ##### -->
	<!-- ##### Related Product Area End ##### -->

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
	<!-- ##### Footer Area End ##### -->
	<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<script src="js/bootstrap/popper.min.js"></script>
	<script src="js/bootstrap/bootstrap.min.js"></script>
	<script src="js/plugins/plugins.js"></script>
	<script src="js/active.js"></script>
</body>
</html>
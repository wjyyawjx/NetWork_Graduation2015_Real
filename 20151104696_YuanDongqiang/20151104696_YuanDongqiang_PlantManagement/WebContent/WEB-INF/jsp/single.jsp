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
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>植物详细信息</title>

<!-- Favicon -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="style.css">

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
	<section class="single_product_details_area mb-50">
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
										src="img/bg-img/49.jpg" alt="1">
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-12 col-md-6">
					<div class="single_product_desc">
						<h4 class="title">Recuerdos Plant</h4>
						<h4 class="price">$9.99</h4>
						<div class="short_overview">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Phasellus pellem malesuada in nibh selama euismod. Curabitur a
								rhoncus dui. Nunc lobortis cursus magna utrum faucibus. Vivamus
								justo nibh, pharetra non risus accumsan, tincidunt suscipit leo.</p>
						</div>

						<div class="cart--area d-flex flex-wrap align-items-center">
							<!-- Add to Cart Form -->
							<form class="cart clearfix d-flex align-items-center"
								method="post">
								<div class="quantity">
									<span class="qty-minus"
										onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i
										class="fa fa-minus" aria-hidden="true"></i></span> <input
										type="number" class="qty-text" id="qty" step="1" min="1"
										max="12" name="quantity" value="1"> <span
										class="qty-plus"
										onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i
										class="fa fa-plus" aria-hidden="true"></i></span>
								</div>
								<button type="submit" name="addtocart" value="5"
									class="btn alazea-btn ml-15">Add to cart</button>
							</form>
							<!-- Wishlist & Compare -->
							<div class="wishlist-compare d-flex flex-wrap align-items-center">
								<a href="#" class="wishlist-btn ml-15"><i
									class="icon_heart_alt"></i></a> <a href="#"
									class="compare-btn ml-15"><i class="arrow_left-right_alt"></i></a>
							</div>
						</div>

						<div class="products--meta">
							<p>
								<span>SKU:</span> <span>CT201807</span>
							</p>
							<p>
								<span>Category:</span> <span>Outdoor Plants</span>
							</p>
							<p>
								<span>Tags:</span> <span>plants, green, cactus </span>
							</p>
							<p>
								<span>Share on:</span> <span> <a href="#"><i
										class="fa fa-facebook"></i></a> <a href="#"><i
										class="fa fa-twitter"></i></a> <a href="#"><i
										class="fa fa-pinterest"></i></a> <a href="#"><i
										class="fa fa-google-plus"></i></a>
								</span>
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
							class="nav-link active" data-toggle="tab" role="tab">Description</a>
						</li>
						<li class="nav-item"><a href="#addi-info" class="nav-link"
							data-toggle="tab" role="tab">Additional Information</a></li>
						<li class="nav-item"><a href="#reviews" class="nav-link"
							data-toggle="tab" role="tab">Reviews <span class="text-muted">(1)</span></a>
						</li>
					</ul>
					<!-- Tab Content -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane fade show active"
							id="description">
							<div class="description_area">
								<p>Sed a facilisis orci. Curabitur magna urna, varius
									placerat placerat sodales, pretium vitae orci. Aliquam erat
									volutpat. Cras sit amet suscipit magna. Quisque turpis odio,
									facilisis vel eleifend eu, dignissim ac odio.</p>
								<p>Interdum et malesuada fames ac ante ipsum primis in
									faucibus. In scelerisque augue at the moment mattis. Proin
									vitae arcu sit amet justo sollicitudin tincidunt sit amet ut
									velit.Proin placerat vel augue eget euismod. Phasellus cursus
									orci eu tellus vestibulum, vestibulum urna accumsan. Vestibulum
									ut ullamcorper sapien. Pellentesque molestie, est ac vestibulum
									eleifend, lorem ipsum mollis ipsum.</p>
							</div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="addi-info">
							<div class="additional_info_area">
								<p>
									What should I do if I receive a damaged parcel? <br> <span>Lorem
										ipsum dolor sit amet, consectetur adipisicing elit.
										Reprehenderit impedit similique qui, itaque delectus labore.</span>
								</p>
								<p>
									I have received my order but the wrong item was delivered to
									me. <br> <span>Lorem ipsum dolor sit amet,
										consectetur adipisicing elit. Facilis quam voluptatum beatae
										harum tempore, ab?</span>
								</p>
								<p>
									Product Receipt and Acceptance Confirmation Process <br> <span>Lorem
										ipsum dolor sit amet, consectetur adipisicing elit. Dolorum
										ducimus, temporibus soluta impedit minus rerum?</span>
								</p>
								<p>
									How do I cancel my order? <br> <span>Lorem ipsum
										dolor sit amet, consectetur adipisicing elit. Nostrum eius
										eum, minima!</span>
								</p>
							</div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="reviews">
							<div class="reviews_area">
								<ul>
									<li>
										<div class="single_user_review mb-15">
											<div class="review-rating">
												<i class="fa fa-star" aria-hidden="true"></i> <i
													class="fa fa-star" aria-hidden="true"></i> <i
													class="fa fa-star" aria-hidden="true"></i> <i
													class="fa fa-star" aria-hidden="true"></i> <i
													class="fa fa-star" aria-hidden="true"></i> <span>for
													Quality</span>
											</div>
											<div class="review-details">
												<p>
													by <a href="#">Colorlib</a> on <span>12 Sep 2018</span>
												</p>
											</div>
										</div>
										<div class="single_user_review mb-15">
											<div class="review-rating">
												<i class="fa fa-star" aria-hidden="true"></i> <i
													class="fa fa-star" aria-hidden="true"></i> <i
													class="fa fa-star" aria-hidden="true"></i> <i
													class="fa fa-star" aria-hidden="true"></i> <i
													class="fa fa-star" aria-hidden="true"></i> <span>for
													Design</span>
											</div>
											<div class="review-details">
												<p>
													by <a href="#">Colorlib</a> on <span>12 Sep 2018</span>
												</p>
											</div>
										</div>
										<div class="single_user_review">
											<div class="review-rating">
												<i class="fa fa-star" aria-hidden="true"></i> <i
													class="fa fa-star" aria-hidden="true"></i> <i
													class="fa fa-star" aria-hidden="true"></i> <i
													class="fa fa-star" aria-hidden="true"></i> <i
													class="fa fa-star" aria-hidden="true"></i> <span>for
													Value</span>
											</div>
											<div class="review-details">
												<p>
													by <a href="#">Colorlib</a> on <span>12 Sep 2018</span>
												</p>
											</div>
										</div>
									</li>
								</ul>
							</div>

							<div class="submit_a_review_area mt-50">
								<h4>Submit A Review</h4>
								<form action="#" method="post">
									<div class="row">
										<div class="col-12">
											<div class="form-group d-flex align-items-center">
												<span class="mr-15">Your Ratings:</span>
												<div class="stars">
													<input type="radio" name="star" class="star-1" id="star-1">
													<label class="star-1" for="star-1">1</label> <input
														type="radio" name="star" class="star-2" id="star-2">
													<label class="star-2" for="star-2">2</label> <input
														type="radio" name="star" class="star-3" id="star-3">
													<label class="star-3" for="star-3">3</label> <input
														type="radio" name="star" class="star-4" id="star-4">
													<label class="star-4" for="star-4">4</label> <input
														type="radio" name="star" class="star-5" id="star-5">
													<label class="star-5" for="star-5">5</label> <span></span>
												</div>
											</div>
										</div>
										<div class="col-12 col-md-6">
											<div class="form-group">
												<label for="name">Nickname</label> <input type="email"
													class="form-control" id="name" placeholder="Nazrul">
											</div>
										</div>
										<div class="col-12 col-md-6">
											<div class="form-group">
												<label for="options">Reason for your rating</label> <select
													class="form-control" id="options">
													<option>Quality</option>
													<option>Value</option>
													<option>Design</option>
													<option>Price</option>
													<option>Others</option>
												</select>
											</div>
										</div>
										<div class="col-12">
											<div class="form-group">
												<label for="comments">Comments</label>
												<textarea class="form-control" id="comments" rows="5"
													data-max-length="150"></textarea>
											</div>
										</div>
										<div class="col-12">
											<button type="submit" class="btn alazea-btn">Submit
												Your Review</button>
										</div>
									</div>
								</form>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- ##### Single Product Details Area End ##### -->

	<!-- ##### Related Product Area Start ##### -->
	<div class="related-products-area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<!-- Section Heading -->
					<div class="section-heading text-center">
						<h2>Related Products</h2>
					</div>
				</div>
			</div>

			<div class="row">

				<!-- Single Product Area -->
				<div class="col-12 col-sm-6 col-lg-3">
					<div class="single-product-area mb-100">
						<!-- Product Image -->
						<div class="product-img">
							<a href="shop-details.html"><img src="img/bg-img/40.png"
								alt=""></a>
							<!-- Product Tag -->
							<div class="product-tag">
								<a href="#">Hot</a>
							</div>
							<div class="product-meta d-flex">
								<a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
								<a href="cart.html" class="add-to-cart-btn">Add to cart</a> <a
									href="#" class="compare-btn"><i
									class="arrow_left-right_alt"></i></a>
							</div>
						</div>
						<!-- Product Info -->
						<div class="product-info mt-15 text-center">
							<a href="shop-details.html">
								<p>Cactus Flower</p>
							</a>
							<h6>$10.99</h6>
						</div>
					</div>
				</div>

				<!-- Single Product Area -->
				<div class="col-12 col-sm-6 col-lg-3">
					<div class="single-product-area mb-100">
						<!-- Product Image -->
						<div class="product-img">
							<a href="shop-details.html"><img src="img/bg-img/41.png"
								alt=""></a>
							<div class="product-meta d-flex">
								<a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
								<a href="cart.html" class="add-to-cart-btn">Add to cart</a> <a
									href="#" class="compare-btn"><i
									class="arrow_left-right_alt"></i></a>
							</div>
						</div>
						<!-- Product Info -->
						<div class="product-info mt-15 text-center">
							<a href="shop-details.html">
								<p>Cactus Flower</p>
							</a>
							<h6>$10.99</h6>
						</div>
					</div>
				</div>

				<!-- Single Product Area -->
				<div class="col-12 col-sm-6 col-lg-3">
					<div class="single-product-area mb-100">
						<!-- Product Image -->
						<div class="product-img">
							<a href="shop-details.html"><img src="img/bg-img/42.png"
								alt=""></a>
							<div class="product-meta d-flex">
								<a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
								<a href="cart.html" class="add-to-cart-btn">Add to cart</a> <a
									href="#" class="compare-btn"><i
									class="arrow_left-right_alt"></i></a>
							</div>
						</div>
						<!-- Product Info -->
						<div class="product-info mt-15 text-center">
							<a href="shop-details.html">
								<p>Cactus Flower</p>
							</a>
							<h6>$10.99</h6>
						</div>
					</div>
				</div>

				<!-- Single Product Area -->
				<div class="col-12 col-sm-6 col-lg-3">
					<div class="single-product-area mb-100">
						<!-- Product Image -->
						<div class="product-img">
							<a href="shop-details.html"><img src="img/bg-img/43.png"
								alt=""></a>
							<!-- Product Tag -->
							<div class="product-tag sale-tag">
								<a href="#">Hot</a>
							</div>
							<div class="product-meta d-flex">
								<a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
								<a href="cart.html" class="add-to-cart-btn">Add to cart</a> <a
									href="#" class="compare-btn"><i
									class="arrow_left-right_alt"></i></a>
							</div>
						</div>
						<!-- Product Info -->
						<div class="product-info mt-15 text-center">
							<a href="shop-details.html">
								<p>Cactus Flower</p>
							</a>
							<h6>$10.99</h6>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
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
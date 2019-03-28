<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->

<!-- Head BEGIN -->
<head>
<meta charset="utf-8">
<title>商品信息</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<meta content="Metronic Shop UI description" name="description">
<meta content="Metronic Shop UI keywords" name="keywords">
<meta content="keenthemes" name="author">

<meta property="og:site_name" content="-CUSTOMER VALUE-">
<meta property="og:title" content="-CUSTOMER VALUE-">
<meta property="og:description" content="-CUSTOMER VALUE-">
<meta property="og:type" content="website">
<meta property="og:image" content="-CUSTOMER VALUE-">
<!-- link to image for socio -->
<meta property="og:url" content="-CUSTOMER VALUE-">

<link rel="shortcut icon" href="favicon.ico">

<!-- Fonts START -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all"
	rel="stylesheet" type="text/css">
<!-- Fonts END -->

<!-- Global styles START -->
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/bootstrap-detail.min.css" rel="stylesheet">
<!-- Global styles END -->

<!-- Page level plugin styles START -->
<link href="css/jquery.fancybox.css" rel="stylesheet">
<link href="css/owl.carousel.css" rel="stylesheet">
<link href="css/uniform.default.css" rel="stylesheet" type="text/css">
<link
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"
	rel="stylesheet" type="text/css">
<!-- for slider-range -->
<link href="css/rateit.css" rel="stylesheet" type="text/css">
<!-- Page level plugin styles END -->

<!-- Theme styles START -->
<link href="css/components.css" rel="stylesheet">
<link href="css/style_shop.css" rel="stylesheet">
<link href="css/style-shop.css" rel="stylesheet" type="text/css">
<link href="css/style-responsive.css" rel="stylesheet">
<link href="css/red.css" rel="stylesheet" id="style-color">
<link href="css/custom.css" rel="stylesheet">
<!-- Theme styles END -->
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="ecommerce">


	<!-- BEGIN CONTENT -->
	<div class="col-md-9 col-sm-7">
		<div class="product-page">
			<div class="row">
				<div class="col-md-6 col-sm-6">
					<div class="product-main-image" style="width: 200px;height: 200px">

						<img
							src="${GOODS_SESSION.l_image}"
							alt="${GOODS_SESSION.l_name}" class="img-responsive"
							data-BigImgsrc="${GOODS_SESSION.l_image}">
					</div>
					<!-- <div class="product-other-images">
                    <a href="assets/pages/img/products/model3.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="assets/pages/img/products/model3.jpg"></a>
                    <a href="assets/pages/img/products/model4.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="assets/pages/img/products/model4.jpg"></a>
                    <a href="assets/pages/img/products/model5.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="assets/pages/img/products/model5.jpg"></a>
                  </div> -->
				</div>
				<div class="col-md-6 col-sm-6">
					<h1>商品信息</h1>
					<div class="price-availability-block clearfix">
						<div class="price">
							<strong><span>$</span>${GOODS_SESSION.l_price}.00元</strong>

						</div>
						<!--  <div class="availability">
                      Availability: <strong>In Stock</strong>
                    </div> -->
					</div>
					<!-- <div class="description">
                    <p>Lorem ipsum dolor ut sit ame dolore  adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat 
Nostrud duis molestie at dolore.</p>
                  </div> -->
					<div class="product-page-options">
						<div class="pull-left">
							<label class="control-label">名字：${GOODS_SESSION.l_name}</label>

						</div>
						<div class="pull-left">
							<label class="control-label">类型：${GOODS_SESSION.l_type}</label>

						</div>
					</div>
					<div class="product-page-cart">

						<button class="btn btn-primary" type="submit">点击购买</button>
					</div>
					<!-- <div class="review">
                    <input type="range" value="4" step="0.25" id="backing4">
                    <div class="rateit" data-rateit-backingfld="#backing4" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
                    </div>
                    <a href="javascript:;">7 reviews</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:;">Write a review</a>
                  </div> -->
					<ul class="social-icons">
						<li><a class="facebook" data-original-title="facebook"
							href="javascript:;"></a></li>
						<li><a class="twitter" data-original-title="twitter"
							href="javascript:;"></a></li>
						<li><a class="googleplus" data-original-title="googleplus"
							href="javascript:;"></a></li>
						<li><a class="evernote" data-original-title="evernote"
							href="javascript:;"></a></li>
						<li><a class="tumblr" data-original-title="tumblr"
							href="javascript:;"></a></li>
					</ul>
				</div>

				 <div class="product-page-content">
					<ul id="myTab" class="nav nav-tabs">
						<!-- <li><a href="#Description" data-toggle="tab">Description</a></li> -->
						<li><a href="#Information" data-toggle="tab">商品信息</a></li>
						<li class="active"><a href="#Reviews" data-toggle="tab">评价信息</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade" id="Description">
							<p>商品的详细信息</p>
						</div>
						<div class="tab-pane fade" id="Information">
							<table class="datasheet">
								<tr>
									<th colspan="2">！请仔细阅读数据表！</th>
								</tr>
								<tr>
									<td class="datasheet-features-type">租赁起始时间：</td>
									<td>${GOODS_SESSION.l_out_time}</td>
								</tr>
								<tr>
									<td class="datasheet-features-type">租赁截至时间：</td>
									<td>${GOODS_SESSION.l_in_time}</td>
								</tr>
								<tr>
									<td class="datasheet-features-type">提示：</td>
									<td>请即使归还物品，以营造良好的租赁环境！</td>
								</tr>
								<tr>
									<td class="datasheet-features-type">地址：</td>
									<td>${GOODS_SESSION.l_addr}</td>
								</tr>
								<tr>
									<td class="datasheet-features-type">描述：</td>
									<td>${GOODS_SESSION.l_info}</td>
								</tr>
							</table>
						</div>
						<div class="tab-pane fade in active" id="Reviews">
							<!--<p>There are no reviews for this product.</p>-->
							<div class="review-item clearfix">
								<div class="review-item-submitted">
									<strong>Bob</strong> <em>30/12/2013 - 07:37</em>
									<div class="rateit" data-rateit-value="5"
										data-rateit-ispreset="true" data-rateit-readonly="true"></div>
								</div>
								<div class="review-item-content">
									<p>Sed velit quam, auctor id semper a, hendrerit eget
										justo. Cum sociis natoque penatibus et magnis dis parturient
										montes, nascetur ridiculus mus. Duis vel arcu pulvinar dolor
										tempus feugiat id in orci. Phasellus sed erat leo. Donec
										luctus, justo eget ultricies tristique, enim mauris bibendum
										orci, a sodales lectus purus ut lorem.</p>
								</div>
							</div>


							<!-- BEGIN FORM-->
							<form action="#" class="reviews-form" role="form">
								<h2>评价信息</h2>
								<div class="form-group">
									<label for="name">Name <span class="require">*</span></label> <input
										type="text" class="form-control" id="name">
								</div>
								<div class="form-group">
									<label for="email">Email</label> <input type="text"
										class="form-control" id="email">
								</div>
								<div class="form-group">
									<label for="review">Review <span class="require">*</span></label>
									<textarea class="form-control" rows="8" id="review"></textarea>
								</div>
								<!-- 满意度的div -->
								<!-- <div class="form-group">
									<label for="email">Rating</label> <input type="range" value="4"
										step="0.25" id="backing5">
									<div class="rateit" data-rateit-backingfld="#backing5"
										data-rateit-resetable="false" data-rateit-ispreset="true"
										data-rateit-min="0" data-rateit-max="5"></div>
								</div> -->
								<div class="padding-top-20">
									<button type="submit" class="btn btn-primary">提交</button>
								</div>
							</form>
							<!-- END FORM-->
						</div>
					</div>
				</div> 
				
				
				
				
				

				<div class="sticker sticker-sale"></div>
			</div>
		</div>
	</div>
	<!-- END CONTENT -->

	<script src="js/respond.min.js"></script>

	<script src="js/jquery.min.shop.js" type="text/javascript"></script>
	<script src="js/jquery-migrate.min.js"
		type="text/javascript"></script>
	<script src="js/bootstrap.min.js"
		type="text/javascript"></script>
	<script src="js/back-to-top.js"
		type="text/javascript"></script>
	<script src="js/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<!-- END CORE PLUGINS -->

	<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
	<script src="js/jquery.fancybox.pack.js"
		type="text/javascript"></script>
	<!-- pop up -->
	<script src="js/owl.carousel.min.js"
		type="text/javascript"></script>
	<!-- slider for products -->
	<script src='js/jquery.zoom.min.js'
		type="text/javascript"></script>
	<!-- product zoom -->
	<script src="js/bootstrap.touchspin.js"
		type="text/javascript"></script>
	<!-- Quantity -->
	<script src="js/jquery.uniform.min.js"
		type="text/javascript"></script>
	<script src="js/jquery.rateit.js"
		type="text/javascript"></script>

	<script src="js/layout.js" type="text/javascript"></script>
	<script type="text/javascript">
		jQuery(document).ready(function() {
			Layout.init();
			Layout.initOWL();
			Layout.initTwitter();
			Layout.initImageZoom();
			Layout.initTouchspin();
			Layout.initUniform();
		});
	</script>
	<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
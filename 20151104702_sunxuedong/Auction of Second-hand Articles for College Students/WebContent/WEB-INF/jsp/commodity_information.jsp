<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="bs" uri="http://bs.com/common/"%>
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

<style>
.box {
	width: 50%;
	margin-top: 10%;
	margin: auto;
	padding: 28px;
	height: 600px;
	border: 1px #111 solid;
	display: none; /* 默认对话框隐藏 */
}

.box.show {
	display: block;
}

.box .x {
	font-size: 18px;
	text-align: right;
	display: block;
}

.box input {
	width: 80%;
	font-size: 18px;
	margin-top: 18px;
}
</style>
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="ecommerce">


	<!-- BEGIN CONTENT -->
	<div class="col-md-9 col-sm-7">
		<div class="product-page">
			<div class="row">
				<div class="col-md-6 col-sm-6"></div>
				<form action="${pageContext.request.contextPath }/addToMyGoods.action"
					method="post">
					<div class="col-md-6 col-sm-6">
						<h1>商品信息</h1>
						<div class="product-main-image"
							style="width: 200px; height: 200px">

							<img src="${GOODS_SESSION.l_image}" alt="${GOODS_SESSION.l_name}"
								class="img-responsive" data-BigImgsrc="${GOODS_SESSION.l_image}">
						</div>
						<div class="price-availability-block clearfix">
							<div class="price">
								<strong><span>$</span>${GOODS_SESSION.l_price}.00元</strong>

							</div>

						</div>


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

					</div>
				</form>

				<script type="text/javascript">
					function showpjxx() {
						var LyBtn = document.getElementById("PJXX");
						var lDiv = document.getElementById("pingjia");
						if (lDiv.style.display == "block") {
							lDiv.style.display = "none";

						} else {
							lDiv.style.display = 'block';
						}
					}
					function showspxx() {
						var SpBtn = document.getElementById("SPXX");
						var sDiv = document.getElementById("informations");
						if (sDiv.style.display == "block") {
							sDiv.style.display = "none";

						} else {
							sDiv.style.display = 'block';
						}

					}
				</script>
				<div class="product-page-content">
					<table border="1px">
						<tr>

							<td><a href="#Information" data-toggle="tab"><input
									type="button" id="SPXX" value="商品信息" onclick="showspxx()"></a></td>
							<td><a href="#Reviews" data-toggle="tab"><input
									type="button" id="PJXX" value="评价信息" onclick="showpjxx()"></a></td>
							<td><a href="#Liuyan" data-toggle="tab"><input
									type="button" value="我要留言" onClick="msgbox(1)"></a></td>
						</tr>
					</table>
					<script>
						function msgbox(n) {
							document.getElementById('inputbox').style.display = n ? 'block'
									: 'none'; /* 点击按钮打开/关闭 对话框 */
						}
					</script>


					<div id="myTabContent" class="tab-content">
						<div id="informations" style="display: none">
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
						</div>
						<div class="tab-pane fade in active" id="Reviews">

							<div class="review-item clearfix" style="display: none"
								id="pingjia">

								<form
									action="${pageContext.request.contextPath }/findeval.action"
									method="post">
									<div class="review-item-submitted">
										<p>商品的评价信息</p>
										<strong>bob</strong> <em>这里是评价信息</em>
										<div class="rateit" data-rateit-value="5"
											data-rateit-ispreset="true" data-rateit-readonly="true">2018-04-01</div>
										<div style="display: none">
											商品ID：<input id="l_id" name="l_id" value="${GOODS_SESSION.id}">
										</div>
										<input type="submit" value="查看更多评价" align="right">
									</div>

								</form>

							</div>

							<!-- BEGIN FORM-->
							<div id='inputbox' class="box">
								<form
									action="${pageContext.request.contextPath }/addreview.action"
									method="post" class="reviews-form" role="form"
									enctype="multipart/form-data" onsubmit="return check()"
									name="date" id="form1">
									<a class='x' href='' ; onclick="msgbox(0); return false;">关闭</a>
									<h2>评价信息</h2>
									<div class="form-group">
										<label for="l_id">商品ID：&nbsp</label> <input type="text"
											class="form-control" id="l_id" name="l_id"
											value="${GOODS_SESSION.id}" readonly="true">
									</div>
									<div class="form-group">
										<label for="u_name">姓名：&nbsp&nbsp<span class="require">*</span></label>
										<input type="text" class="form-control" id="u_name"
											name="u_name" value="${USER_SESSION.username}"
											readonly="true">
									</div>
									<div class="form-group">
										<label for="email">Email：<span class="require">*</span></label>
										<input type="text" class="form-control" id="email"
											name="email">
									</div>
									<div class="form-group">
										<label for="review">Review <span class="require">*</span></label>
										<textarea class="form-control" rows="8" id="information"
											name="information"></textarea>
									</div>


									<div class="form-group">
										<label for="p_time" class="am-u-sm-3 am-form-label">评价时间:</label>
										<div class="am-u-sm-9">

											<input id="p_time" name="p_time" type="text" value=""
												readonly="true" />
										</div>
									</div>
									<script language="javascript" type="text/javascript">
										function shijian() {
											var D = new Date();
											var yy = D.getFullYear();
											var mm = D.getMonth() + 1;
											var dd = D.getDate();

											var time = yy + "-" + mm + "-" + dd;
											document.getElementById("p_time").value = time;
											setTimeout("shijian()", 1000);
										}
										shijian();
									</script>
									<div class="padding-top-20">
										<button type="submit" class="btn btn-primary">提交</button>

									</div>
								</form>
							</div>
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
	<script src="js/jquery-migrate.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/back-to-top.js" type="text/javascript"></script>
	<script src="js/jquery.slimscroll.min.js" type="text/javascript"></script>
	<!-- END CORE PLUGINS -->

	<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
	<script src="js/jquery.fancybox.pack.js" type="text/javascript"></script>
	<!-- pop up -->
	<script src="js/owl.carousel.min.js" type="text/javascript"></script>
	<!-- slider for products -->
	<script src='js/jquery.zoom.min.js' type="text/javascript"></script>
	<!-- product zoom -->
	<script src="js/bootstrap.touchspin.js" type="text/javascript"></script>
	<!-- Quantity -->
	<script src="js/jquery.uniform.min.js" type="text/javascript"></script>
	<script src="js/jquery.rateit.js" type="text/javascript"></script>

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
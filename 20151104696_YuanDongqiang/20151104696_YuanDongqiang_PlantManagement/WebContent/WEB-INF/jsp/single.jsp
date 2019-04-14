<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>详细信息</title>
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
<!-- //meta tags -->
<!--fonts-->
<link href='//fonts.googleapis.com/css?family=Ubuntu+Condensed'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
<!--//fonts-->
<!-- js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<!-- js -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
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
<!-- language-select -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.leanModal.min.js"></script>
<link href="${pageContext.request.contextPath }/css/jquery.uls.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/jquery.uls.grid.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/jquery.uls.lcd.css"
	rel="stylesheet" />
<!-- Source -->
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
<!-- //language-select -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/flexslider.css"
	media="screen" />
<!-- flexslider css -->
</head>
<body>
	<header>
	<div class="w3ls-header">
		<div class="w3ls-header-right">
			<ul>
				<li class="dropdown head-dpdn"><a href="login.jsp"
					aria-expanded="false"><i class="fa fa-user" aria-hidden="true"></i>
						${USER_SESSION.u_name}</a></li>
				<li class="dropdown head-dpdn"><a
					href="${pageContext.request.contextPath }/help.action"><i
						class="fa fa-question-circle" aria-hidden="true"></i> 帮助</a></li>
			</ul>
		</div>
		<h1>
			<a href="${pageContext.request.contextPath }/index.action"><img
				src="img/core-img/logo.png" alt=""></a>
		</h1>
		<div class="clearfix"></div>
	</div>
	</header>
	<div class="single-page main-grid-border">
		<div class="container">
			<div class="product-desc">
				<div class="col-md-7 product-view">
					<h2>${items.name }</h2>
					<p>
						<i class="glyphicon glyphicon-map-marker"></i><a href="#">state</a>,
						<a href="#">city</a>| Added at 06:55 pm, Ad ID: ${items.user }
					</p>
					<div class="flexslider">
						<ul class="slides">
							<li data-thumb="${items.image }"><img src="${items.image }" />
							</li>
							<li data-thumb="${items.image }"><img src="${items.image }" />
							</li>
							<li data-thumb="images/ss3.jpg"><img src="images/ss3.jpg" />
							</li>
							<li data-thumb="images/ss4.jpg"><img src="images/ss4.jpg" />
							</li>
						</ul>
					</div>
					<script defer src="js/jquery.flexslider.js"></script>
					<!-- //FlexSlider -->
					<div class="product-details">
						<h4>
							<span class="w3layouts-agileinfo">介绍：</span> :
							<p>${items.thing }</p>
							<div class="clearfix"></div>
						</h4>

					</div>
				</div>
			</div>
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
</body>
</html>
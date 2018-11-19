<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login</title>
<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<!--theme-style-->
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Shopin Responsive web template, Bootstrap Web Templates, Flat Web Templates, AndroId Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--theme-style-->
<link href="<%=basePath%>css/style4.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<script src="<%=basePath%>js/jquery.min.js"></script>
<!--- start-rate---->
<script src="<%=basePath%>js/jstarbox.js"></script>
	<link rel="stylesheet" href="<%=basePath%>css/jstarbox.css" type="text/css" media="screen" charset="utf-8" />
		<script type="text/javascript">
			jQuery(function() {
			jQuery('.starbox').each(function() {
				var starbox = jQuery(this);
					starbox.starbox({
					average: starbox.attr('data-start-value'),
					changeable: starbox.hasClass('unchangeable') ? false : starbox.hasClass('clickonce') ? 'once' : true,
					ghosting: starbox.hasClass('ghosting'),
					autoUpdateAverage: starbox.hasClass('autoupdate'),
					buttons: starbox.hasClass('smooth') ? false : starbox.attr('data-button-count') || 5,
					stars: starbox.attr('data-star-count') || 5
					}).bind('starbox-value-changed', function(event, value) {
					if(starbox.hasClass('random')) {
					var val = Math.random();
					starbox.next().text(' '+val);
					return val;
					} 
				})
			});
		});
		</script>
		
	<script>
		function check(){
			var email = $("#email").val();
			var userPass = $("#userPass").val();
			if(email==""||userPass==""){
				alert("账号密码为空");
				return false;
			}
			return true;
		}
	</script>
<!---//End-rate---->
</head>
<body>

<!--header-->
<div class="header">
<div class="container">
		<div class="head">
			<div class=" logo">
				<a href="jsp/index.jsp"><img src="images/logo.png" alt=""></a>	
			</div>
		</div>
	</div>
	<div class="header-top">
		<div class="container">
		<div class="col-sm-5 col-md-offset-2  header-login">
					<ul >
						<li><a href="${pageContext.request.contextPath}/login.action">Login</a></li>
						<li><a href="${pageContext.request.contextPath}/register.action">Register</a></li>
						<li><a href="${pageContext.request.contextPath}/checkout.action">Checkout</a></li>
						<li><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						您好:${userBean.userName}</a></li>
					</ul>
				</div>
				<div class="clearfix"> </div>
		</div>
		</div>
		<div class="container">
			<div class="head-top">
		 <div class="col-sm-8 col-md-offset-2 h_menu4">
				<nav class="navbar nav_bottom" role="navigation">
  <div class="navbar-header nav_2">
      <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
     
   </div> 
   <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
        <ul class="nav navbar-nav nav_1">
            <li><a class="color" href="${pageContext.request.contextPath}/index.action">Home</a></li>
            
    		<li class="dropdown mega-dropdown active">
			    <a class="color1" href="${pageContext.request.contextPath}/product.action" >Car</a>							
			</li>
			<li class="dropdown mega-dropdown active">
			    <a class="color2" href="${pageContext.request.contextPath}/product.action" >Phone</span></a>					
			</li>
			<li><a class="color3" href="${pageContext.request.contextPath}/product.action">Commodity</a></li>
			<li><a class="color4" href="${pageContext.request.contextPath}/product.action">Clothes</a></li>
            <li><a class="color5" href="${pageContext.request.contextPath}/product.action">shoes</a></li>
        </ul>
     </div><!-- /.navbar-collapse -->

</nav>
			</div>
			<div class="col-sm-2 search-right">
				<ul class="heart">
				<li>
				<a href="wishlist.jsp" >
				<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
				</a></li>
				<li><a class="play-icon popup-with-zoom-anim" href="#small-dialog"><i class="glyphicon glyphicon-search"> </i></a></li>
					</ul>
					<div class="cart box_1">
						<a href="${pageContext.request.contextPath}/checkout.action">
						<h3> <div class="total">
							<span class="simpleCart_total"></span></div>
							<img src="<%=basePath%>images/cart.png" alt=""/></h3>
						</a>
						<p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>

					</div>
					<div class="clearfix"> </div>
					
						<!----->

						<!---pop-up-box---->					  
			<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
			<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
			<!---//pop-up-box---->
			<div id="small-dialog" class="mfp-hide">
				<div class="search-top">
					<div class="login-search">
						<input type="submit" value="">
						<input type="text" value="Search.." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search..';}">		
					</div>
					<p>Shopin</p>
				</div>				
			</div>
		 <script>
			$(document).ready(function() {
			$('.popup-with-zoom-anim').magnificPopup({
			type: 'inline',
			fixedContentPos: false,
			fixedBgPos: true,
			overflowY: 'auto',
			closeBtnInside: true,
			preloader: false,
			midClick: true,
			removalDelay: 300,
			mainClass: 'my-mfp-zoom-in'
			});
																						
			});
		</script>		
						<!----->
			</div>
			<div class="clearfix"></div>
		</div>	
	</div>	
</div>
<!--banner-->
<div class="banner-top">
	<div class="container">
		<h1>Login</h1>
		<em></em>
		<h2><a href="${pageContext.request.contextPath}/index.action">Home</a><label>/</label>Login</a></h2>
	</div>
</div>
<!--login-->
<div class="container">
		<div class="login">
		
			<form action="${pageContext.request.contextPath}/login.action" method="post" onsubmit="return check()">
			<div class="col-md-6 login-do">
				<div class="login-mail">
					<input type="text" placeholder="Email" required="" id="email" name="email">
					<i  class="glyphicon glyphicon-envelope"></i>
				</div>
				<div class="login-mail">
					<input type="password" placeholder="Password" required="" id="userPass" name="userPass">
					<i class="glyphicon glyphicon-lock"></i>
				</div>
				   <a class="news-letter " href="#">
						 <label class="checkbox1"><input type="checkbox" name="checkbox" ><i> </i>Forget Password</label>
					   </a>
				<label class="hvr-skew-backward">
					<input type="submit" value="login">
				</label>
			</div>
			<div class="col-md-6 login-right">
				 <h3>Completely Free Account</h3>
				 
				 <p>Pellentesque neque leo, dictum sit amet accumsan non, dignissim ac mauris. Mauris rhoncus, lectus tincidunt tempus aliquam, odio 
				 libero tincidunt metus, sed euismod elit enim ut mi. Nulla porttitor et dolor sed condimentum. Praesent porttitor lorem dui, in pulvinar enim rhoncus vitae. Curabitur tincidunt, turpis ac lobortis hendrerit, ex elit vestibulum est, at faucibus erat ligula non neque.</p>
				<a href="${pageContext.request.contextPath}/register.action" class=" hvr-skew-backward">Register</a>

			</div>
			
			<div class="clearfix"> </div>
			</form>
		</div>

</div>

<!--//login-->

			<!--brand-->
		<div class="container">
			<div class="brand">
				<div class="col-md-3 brand-grid">
					<img src="${pageContext.request.contextPath}/images/ic.png" class="img-responsive" alt="">
				</div>
				<div class="col-md-3 brand-grid">
					<img src="${pageContext.request.contextPath}/images/ic1.png" class="img-responsive" alt="">
				</div>
				<div class="col-md-3 brand-grid">
					<img src="${pageContext.request.contextPath}/images/ic2.png" class="img-responsive" alt="">
				</div>
				<div class="col-md-3 brand-grid">
					<img src="<%=basePath%>images/ic3.png" class="img-responsive" alt="">
				</div>
				<div class="clearfix"></div>
			</div>
			</div>
			<!--//brand-->
			</div>
			
		</div>
	<!--//content-->
		<!--//footer-->
	<div class="footer">
	<div class="footer-middle">
				<div class="container">
					<div class="col-md-3 footer-middle-in">
						<a href="${pageContext.request.contextPath}/index.action"><img src="images/log.png" alt=""></a>
						<p>Suspendisse sed accumsan risus. Curabitur rhoncus, elit vel tincidunt elementum, nunc urna tristique nisi, in interdum libero magna tristique ante. adipiscing varius. Vestibulum dolor lorem.</p>
					</div>
					
					<div class="col-md-3 footer-middle-in">
						<h6>Information</h6>
						<ul class=" in">
							<li><a href="${pageContext.request.contextPath}/index.action">About</a></li>
							<li><a href="${pageContext.request.contextPath}/index.action">Contact Us</a></li>
							<li><a href="${pageContext.request.contextPath}/index.action">Returns</a></li>
							<li><a href="${pageContext.request.contextPath}/index.action">Site Map</a></li>
						</ul>
						<ul class="in in1">
							<li><a href="${pageContext.request.contextPath}/index.action">Order History</a></li>
							<li><a href="${pageContext.request.contextPath}/index.action">Wish List</a></li>
							<li><a href="login.jsp">Login</a></li>
						</ul>
						<div class="clearfix"></div>
					</div>
					<div class="col-md-3 footer-middle-in">
						<h6>Tags</h6>
						<ul class="tag-in">
							<li><a href="${pageContext.request.contextPath}/index.action">Lorem</a></li>
							<li><a href="${pageContext.request.contextPath}/index.action">Sed</a></li>
							<li><a href="${pageContext.request.contextPath}/index.action">Ipsum</a></li>
							<li><a href="${pageContext.request.contextPath}/index.action">Contrary</a></li>
							<li><a href="${pageContext.request.contextPath}/index.action">Chunk</a></li>
							<li><a href="${pageContext.request.contextPath}/index.action">Amet</a></li>
							<li><a href="${pageContext.request.contextPath}/index.action">Omnis</a></li>
						</ul>
					</div>
					<div class="col-md-3 footer-middle-in">
						<h6>Newsletter</h6>
						<span>Sign up for News Letter</span>
							<form>
								<input type="text" value="Enter your E-mail" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='Enter your E-mail';}">
								<input type="submit" value="Subscribe">	
							</form>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
			<div class="footer-bottom">
				<div class="container">
					<ul class="footer-bottom-top">
						<li><a href="${pageContext.request.contextPath}/index.action"><img src="<%=basePath%>images/f1.png" class="img-responsive" alt=""></a></li>
						<li><a href="${pageContext.request.contextPath}/index.action"><img src="<%=basePath%>images/f2.png" class="img-responsive" alt=""></a></li>
						<li><a href="${pageContext.request.contextPath}/index.action"><img src="${pageContext.request.contextPath}/images/f3.png" class="img-responsive" alt=""></a></li>
					</ul>
					<p class="footer-class">Copyright &copy; 2016.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		<!--//footer-->

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

	<script src="js/simpleCart.min.js"> </script>
<!-- slide -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>
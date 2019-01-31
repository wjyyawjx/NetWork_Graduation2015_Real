<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>主页</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Gato Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />	
<script src="js/jquery.min.js"> </script>
<!--webfonts-->
 <link href='http://fonts.useso.com/css?family=Raleway:400,100,200,300,500,600,700|Cinzel+Decorative:400,700' rel='stylesheet' type='text/css'>
<!--//webfonts-->
</head>
<body>
	<!--start-home-->
	<div id="home" class="header">
		<div class="header-bottom">
			<div class="container">
				<div class="logo">
					<a><h1>Gat<span>o</span></h1></a>
				</div>
				<span class="menu"></span>
				<div class="top-menu">
					<ul>
					<nav>
						<li><a href="${pageContext.request.contextPath}/index.action">全部商品</a></li> 
						<li><a href="${pageContext.request.contextPath}/mygoods.action">我的商品</a></li>
						<li><a href="${pageContext.request.contextPath}/upload.action">上传商品</a></li> 
						<li><a href="#">用户名:${UESR_SESSION.u_name}</a></li>					
						<li><a href="${pageContext.request.contextPath}/logout.action">退出登录</a></li>
						<form action="${pageContext.request.contextPath}/selectgoods.action">
						       <select name="c_type" id="c_type">
						         <option value="植物">植物</option>
						         <option value="其它">其它</option>
						         <option value="动物" selected="selected">动物</option>
		                       </select>
						       <input type="submit" value="搜索" />    
						 </form>
						
					</nav>
					</ul>
				</div>
				<!-- script for menu -->
				<script>
				$( "span.menu" ).click(function() {
				  $( ".top-menu" ).slideToggle( "slow", function() {
				    // Animation complete.
				  });
				});
			</script>
			<!-- script for menu -->
				<div class="clearfix"></div>
			</div>
		</div>

	<div class="banner two">
		<div class="container">	
		<div class="pag-nav">
				<ul class="p-list">
					<li class="act"></li>
				</ul>
			</div>

		</div>   
	</div>
	</div>
</div>
<!--gallery-->
	<div class="gallery services">
		<div class="container">
				<div class="port-head">
				   <h3>商品</h3>
			  	</div>
			<div class="portfolio-bottom">
				<div class="gallery-one two">
				   <c:forEach items="${list}" var="listuser">
					<div class="col-md-3 gallery-left two"> 
						<a href="${pageContext.request.contextPath}/updategoods.action?c_id=${listuser.c_id}" title="描述：${listuser.c_des}  价格：${listuser.c_price}元">
								<img  src="${listuser.c_img}" alt="" class="img-responsive zoom-img"/>
						</a>
					</div>
					</c:forEach>
					
				</div>
			</div>
		</div>
	</div>
	<!--swipebox -->	
			<link rel="stylesheet" href="css/swipebox.css">
				<script src="js/jquery.swipebox.min.js"></script> 
				<script type="text/javascript">
					jQuery(function($) {
						$(".swipebox").swipebox();
					});
				</script>
			<!--//swipebox Ends -->

<!----family--->
	<div class="c-family">
		<div class="container">
		       <div class="family-top">
			    <h3>我的网站</h3>
				   <p>网站模板来自模板之家</p>
				   <a class="read two" href="#">评论</a>
			   </div>
		</div>
	</div>
<!---- footer --->
			<div class="footer text-center">
				<div class="container">
					<div class="footer-grids">
						<div class="col-md-6 footer-text">  
							<h3>About Us</h3>
							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry's standard dummy text ever since, Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry's standard dummy text ever since, Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
							<a class="read" href="single.html">Read More</a>
						</div>
						<div class="col-md-6 footer-info">
							<h3>Get In Touch</h3>
							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry's standard dummy text ever since, </p>
							<div class="support">
							   <input type="text" class="text" value="Enter email..." onfocus="this.value = '';" onblur="if (this.value == 'Enter email...') {this.value = 'Enter email...';}">
							   <input type="submit" value="SUBSCRIBE" class="botton">
							</div>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
			<!--start-smoth-scrolling-->
			<script type="text/javascript">
								jQuery(document).ready(function($) {
									$(".scroll").click(function(event){		
										event.preventDefault();
										$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
									});
								});
								</script>
							<!--start-smoth-scrolling-->
						<script type="text/javascript">
									$(document).ready(function() {
										/*
										var defaults = {
								  			containerID: 'toTop', // fading element id
											containerHoverID: 'toTopHover', // fading element hover id
											scrollSpeed: 1200,
											easingType: 'linear' 
								 		};
										*/
										
										$().UItoTop({ easingType: 'easeOutQuart' });
										
									});
								</script>
		<a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

</body>
</html>
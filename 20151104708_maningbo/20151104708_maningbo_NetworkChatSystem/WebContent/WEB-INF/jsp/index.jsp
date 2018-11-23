<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<!--web-font-->
<link href='http://fonts.useso.com/css?family=Marvel:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<!--//web-font-->
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Plot Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->
<!-- js -->
<script src="js/jquery-1.11.1.min.js"></script> 
<!-- //js -->	
<!-- start-smoth-scrolling-->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>	
<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
</script>
<!--//end-smoth-scrolling-->
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<!--side-bar-->
			<div class="col-sm-3 col-md-2 sidebar">
				<div class="logo">
					<a href="${pageContext.request.contextPath}/index.action"><img src="images/logo.png" alt="logo"/></a>
				</div>
				<div class="top-nav">
					<span class="menu-icon"><img src="images/menu-icon.png" alt=""/></span>	
					<div class="nav1">
						<ul class=" nav nav-sidebar">
							<li style="color: blue;font-size: 20px; font-weight: 600">当前用户：${userBean.email}</li>
							<li class="active"><a href="${pageContext.request.contextPath}/index.action">首  页</a></li>
							<li><a href="about.html">好友</a></li>
							<li><a href="services.html">聊天室</a></li>
							<li><a href="gallery.html">个人信息</a></li>
							<li><a href="testmonials.html">修改密码</a></li>
							<li><a href="c${pageContext.request.contextPath}/login.action">退出登录</a></li>
						</ul> 
						<div class="social-icons">
							<ul>
								<li style="color: #d95459; font-size: 20px; font-weight: 600"><a href="${pageContext.request.contextPath}/login.action"></a>登陆</li>
								<li style="color: #d95459; font-size: 20px; font-weight: 600"><a href="${pageContext.request.contextPath}/register.action" class="be"></a>注册</li>
							</ul>	
						</div>						
					</div>	
					<!-- script-for-menu -->
						 <script>
						   $( "span.menu-icon" ).click(function() {
							 $( ".nav1" ).slideToggle( 300, function() {
							 // Animation complete.
							  });
							 });
						</script>
						<!-- /script-for-menu -->
				</div>
				</div>
			<!--//side-bar-->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<!--banner-->
				<div class="banner">
					<div class="jumbotron banner-text">
						<h2>Lorem Ipsum</h2>
						<p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
						<a class="btn btn-primary" href="#" role="button">Read more</a>
					</div>
				</div>
				<!--//banner-->
				<!--main-text-->
				<div class="main-text">
					<div class="welcome">
						<h3>Welcome to our page</h3>
						<div class="col-md-4 welcome-left">
							<img src="images/img6.jpg" alt="">
						</div>
						<div class="col-md-8 welcome-right">
							<h4>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin established fact that a reader will be distracted Lorem Ipsum when looking at its layout.</h4>
							<p>Lorem Ipsum was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions.
								It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution is that it has a more of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose</p>
						</div>
						<div class="clearfix"> </div>
					</div>
                    <div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>					
					<div class="offer-grids">
						<h3>Our best offers</h3>
						<div class="col-md-4 offer-grids-info">
							<img src="images/img2.jpg" alt=""/>	
							<div class="offer-text">
								<h5>$94.675</h5>
							</div>
						</div>
						<div class="col-md-4 offer-grids-info">
							<img src="images/img3.jpg" alt=""/>	
							<div class="offer-text">
								<h5>$94.675</h5>
							</div>
						</div>
						<div class="col-md-4 offer-grids-info">
							<img src="images/img13.jpg" alt=""/>	
							<div class="offer-text">
								<h5>$144.5</h5>
							</div>	
						</div>
						<div class="col-md-6 offer-grids-info off-grid2">
							<img src="images/img4.jpg" alt=""/>	
							<div class="offer-text">
								<h5>$366.5</h5>
							</div>
						</div>
						<div class="col-md-6 offer-grids-info off-grid2">
							<img src="images/img5.jpg" alt=""/>							
							<div class="offer-text">
								<h5>$194.75</h5>
							</div>
						</div>
						<div class="clearfix"> </div>
					</div>					
					<!--features-->
					<div class="features">
						<div class="col-md-6 feature-left">
							<h3>Our professional management</h3>
							<div class="ftrs-left-text">
								<h4>The standard Lorem Ipsum passage, used sincepassage</h4>
								<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident <p>
							</div>
							<div class="ftrs-left-text">
								<h4>The standard Lorem Ipsum passage, used sincepassage</h4>
								<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident <p>
							</div>
							<div class="ftrs-left-text">
								<h4>The standard Lorem Ipsum passage, used sincepassage</h4>
								<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident <p>
							</div>
						</div>
						<div class="col-md-6 feature-right">
							<h3>Featured services</h3>
							<ul class="menu">
								<li class="item1"><a href="#">Nemo enim ipsam <span class="icon"> </span></a>
									<ul>
										<li class="subitem1"><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia.</a></li>										
									</ul>
								</li>
								<li class="item2"><a href="#">Voluptatemdolor <span class="icon"> </span></a>
									<ul>
										<li class="subitem1"><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia.</a></li>
									</ul>
								</li>
								<li class="item3"><a href="#">Odit aut fugit <span class="icon"> </span></a>
									<ul>
										<li class="subitem1"><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia.</a></li>
									</ul>
								</li>
								<li class="item4"><a href="#">Temdolorlupta <span class="icon"> </span></a>
									<ul>
										<li class="subitem1"><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia.</a></li>
									</ul>
								</li> 
								<li class="item5"><a href="#">Ptatemdolor aut <span class="icon"> </span></a>
									<ul>
										<li class="subitem1"><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia.</a></li>
									</ul>
								</li>
								<li class="item5"><a href="#">Dolor autptatem <span class="icon"> </span></a>
									<ul>
										<li class="subitem1"><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia.</a></li>
									</ul>
								</li>
							</ul>
						</div>						
						<div class="clearfix"> </div>
						<!-- script for tabs -->
						<script type="text/javascript">
							$(function() {
							
								var menu_ul = $('.menu > li > ul'),
									   menu_a  = $('.menu > li > a');
								
								menu_ul.hide();
							
								menu_a.click(function(e) {
									e.preventDefault();
									if(!$(this).hasClass('active')) {
										menu_a.removeClass('active');
										menu_ul.filter(':visible').slideUp('normal');
										$(this).addClass('active').next().stop(true,true).slideDown('normal');
									} else {
										$(this).removeClass('active');
										$(this).next().stop(true,true).slideUp('normal');
									}
								});
							
							});
						</script>
						<!-- script for tabs -->
					</div>
					<!--features-->
				</div>
				<div class="footer">
					<p>Copyright &copy; 2015.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>	
	</div>	
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/bootstrap.js"> </script>
</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<!--web-font-->
<link href='http://fonts.useso.com/css?family=Marvel:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<!--//web-font-->
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Plot Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->
<!-- js -->
<script src="js/jquery-1.11.1.min.js"></script> 
<!-- //js -->	
<!-- start-smoth-scrolling-->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>	
<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
</script>
<!--//end-smoth-scrolling-->
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<!--side-bar-->
			<div class="col-sm-3 col-md-2 sidebar">
				<div class="logo">
					<a href="${pageContext.request.contextPath}/index.action"><img src="images/logo.png" alt="logo"/></a>
				</div>
				<div class="top-nav">
					<span class="menu-icon"><img src="images/menu-icon.png" alt=""/></span>	
					<div class="nav1">
						<ul class=" nav nav-sidebar">
							<li class="active"><a href="${pageContext.request.contextPath}/index.action">首  页</a></li>
							<li><a href="about.html">好友</a></li>
							<li><a href="services.html">聊天室</a></li>
							<li><a href="gallery.html">个人信息</a></li>
							<li><a href="testmonials.html">修改密码</a></li>
							<li><a href="c${pageContext.request.contextPath}/login.action">退出登录</a></li>
						</ul> 
						<div class="social-icons">
							<ul>
								<li><a href="${pageContext.request.contextPath}/login.action"></a>登陆</li>
								<li><a href="${pageContext.request.contextPath}/register.action" class="be"></a>注册</li>
							</ul>	
						</div>						
					</div>	
					<!-- script-for-menu -->
						 <script>
						   $( "span.menu-icon" ).click(function() {
							 $( ".nav1" ).slideToggle( 300, function() {
							 // Animation complete.
							  });
							 });
						</script>
						<!-- /script-for-menu -->
				</div>
			<!--//side-bar-->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<!--banner-->
				<div class="banner">
					<div class="jumbotron banner-text">
						<h2>Lorem Ipsum</h2>
						<p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
						<a class="btn btn-primary" href="#" role="button">Read more</a>
					</div>
				</div>
				<!--//banner-->
				<!--main-text-->
				<div class="main-text">
					<div class="welcome">
						<h3>Welcome to our page</h3>
						<div class="col-md-4 welcome-left">
							<img src="images/img6.jpg" alt="">
						</div>
						<div class="col-md-8 welcome-right">
							<h4>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin established fact that a reader will be distracted Lorem Ipsum when looking at its layout.</h4>
							<p>Lorem Ipsum was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions.
								It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution is that it has a more of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose</p>
						</div>
						<div class="clearfix"> </div>
					</div>
                    <div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>					
					<div class="offer-grids">
						<h3>Our best offers</h3>
						<div class="col-md-4 offer-grids-info">
							<img src="images/img2.jpg" alt=""/>	
							<div class="offer-text">
								<h5>$94.675</h5>
							</div>
						</div>
						<div class="col-md-4 offer-grids-info">
							<img src="images/img3.jpg" alt=""/>	
							<div class="offer-text">
								<h5>$94.675</h5>
							</div>
						</div>
						<div class="col-md-4 offer-grids-info">
							<img src="images/img13.jpg" alt=""/>	
							<div class="offer-text">
								<h5>$144.5</h5>
							</div>	
						</div>
						<div class="col-md-6 offer-grids-info off-grid2">
							<img src="images/img4.jpg" alt=""/>	
							<div class="offer-text">
								<h5>$366.5</h5>
							</div>
						</div>
						<div class="col-md-6 offer-grids-info off-grid2">
							<img src="images/img5.jpg" alt=""/>							
							<div class="offer-text">
								<h5>$194.75</h5>
							</div>
						</div>
						<div class="clearfix"> </div>
					</div>					
					<!--features-->
					<div class="features">
						<div class="col-md-6 feature-left">
							<h3>Our professional management</h3>
							<div class="ftrs-left-text">
								<h4>The standard Lorem Ipsum passage, used sincepassage</h4>
								<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident <p>
							</div>
							<div class="ftrs-left-text">
								<h4>The standard Lorem Ipsum passage, used sincepassage</h4>
								<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident <p>
							</div>
							<div class="ftrs-left-text">
								<h4>The standard Lorem Ipsum passage, used sincepassage</h4>
								<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident <p>
							</div>
						</div>
						<div class="col-md-6 feature-right">
							<h3>Featured services</h3>
							<ul class="menu">
								<li class="item1"><a href="#">Nemo enim ipsam <span class="icon"> </span></a>
									<ul>
										<li class="subitem1"><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia.</a></li>										
									</ul>
								</li>
								<li class="item2"><a href="#">Voluptatemdolor <span class="icon"> </span></a>
									<ul>
										<li class="subitem1"><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia.</a></li>
									</ul>
								</li>
								<li class="item3"><a href="#">Odit aut fugit <span class="icon"> </span></a>
									<ul>
										<li class="subitem1"><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia.</a></li>
									</ul>
								</li>
								<li class="item4"><a href="#">Temdolorlupta <span class="icon"> </span></a>
									<ul>
										<li class="subitem1"><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia.</a></li>
									</ul>
								</li> 
								<li class="item5"><a href="#">Ptatemdolor aut <span class="icon"> </span></a>
									<ul>
										<li class="subitem1"><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia.</a></li>
									</ul>
								</li>
								<li class="item5"><a href="#">Dolor autptatem <span class="icon"> </span></a>
									<ul>
										<li class="subitem1"><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia.</a></li>
									</ul>
								</li>
							</ul>
						</div>						
						<div class="clearfix"> </div>
						<!-- script for tabs -->
						<script type="text/javascript">
							$(function() {
							
								var menu_ul = $('.menu > li > ul'),
									   menu_a  = $('.menu > li > a');
								
								menu_ul.hide();
							
								menu_a.click(function(e) {
									e.preventDefault();
									if(!$(this).hasClass('active')) {
										menu_a.removeClass('active');
										menu_ul.filter(':visible').slideUp('normal');
										$(this).addClass('active').next().stop(true,true).slideDown('normal');
									} else {
										$(this).removeClass('active');
										$(this).next().stop(true,true).slideUp('normal');
									}
								});
							
							});
						</script>
						<!-- script for tabs -->
					</div>
					<!--features-->
				</div>
				<div class="footer">
					<p>Copyright &copy; 2015.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>	
	</div>	
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/bootstrap.js"> </script>
</body>
>>>>>>> refs/remotes/origin/master
</html>
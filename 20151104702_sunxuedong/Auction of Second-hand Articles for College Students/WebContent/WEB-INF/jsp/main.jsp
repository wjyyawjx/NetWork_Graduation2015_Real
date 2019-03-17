<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>大学生二手物品租赁系统</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href='https://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>   
<!--slider-->
<script src="js/jquery.min.js"></script>
<script src="js/script.js" type="text/javascript"></script>
<script src="js/superfish.js"></script>
</head>
<body>
<div class="header-bg">
	<div class="wrap"> 
		<div class="h-bg">
			<div class="total">
				<div class="header" >
				
					<div class="header-bot">
						<div class="logo" width:100%; height:100%>
							<a><img src="images/logo.png"  alt=""/></a>
						</div>
						<div class="search">
						    <input type="text" class="textbox" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}">
						    <button class="gray-button"><span>搜索</span></button>
				       </div>
					<div class="clear"></div> 
				</div>		
		</div>	
		<div class="menu"> 	
			<div class="top-nav"> 
					<ul>
						<li class="active"><a href="index.html">图书</a></li>
						<li><a href="about.html">笔记</a></li>
						<li><a href="specials.html">工具</a></li>
						<li><a href="new.html">娱乐设备</a></li>
						<li><a href="contact.html">生活休闲</a></li>
					</ul>
					<div class="clear"></div> 
				</div>
		</div>
		<div class="banner-top">
			<div class="header-bottom">
				 <div class="header_bottom_right_images">
				     	<div id="slideshow">
							<ul class="slides">
							<!-- 滚动图片 -->
						    	<li><a><canvas ></canvas><img src="images/TuShu.jpg" width="800" height="400"  alt="I am learning..." ></a></li>
						        <li><a><canvas></canvas><img src="images/huaban.jpg" width="800" height="400" alt="I am writing" ></a></li>
						        <li><a><canvas></canvas><img src="images/Biji.jpg" width="800" height="400" alt="I am playing..." ></a></li>
						        <li><a><canvas></canvas><img src="images/shenghuo.jpg" width="800" height="400" alt="The life is beauty" ></a></li>
						    </ul>
						    <span class="arrow previous"></span>
						    <span class="arrow next"></span>
				  	</div>
		  			<div class="content-wrapper">		  
						<div class="content-top">
							  	<div class="box_wrapper">
							  	<h1 align="left">租赁商品列表</h1>
							  
							  	
								</div>
						  <form class="form-inline" action="${pageContext.request.contextPath }/goodslist.action" method="post" >
							 <div class="text"> 	
								<div class="grid_1_of_3 images_1_of_3">
								   <div class="grid_1">
									  <c:forEach items="${page.rows}" var="row"  varStatus="status">  
										<a href="single.html"><img src="${row.l_image}" title="continue reading" alt=""></a>
										  <div class="grid_desc">
											<p class="title">${row.l_name}</p>
											<p class="title1">${row.l_info}</p>
											   <div class="price" style="height: 19px;">
													<span class="reducedfrom">${row.l_price}</span>
								        			
											   </div>
											   <div class="cart-button">
												 <div class="cart">
													<a href="#"><img src="images/cart.png" alt=""/></a>
												 </div>
												    <input type="submit" class="button" value="点击购买">
													<div class="clear"></div>
											   </div>
										 </div>
									 </c:forEach>
								   </div><div class="clear"></div>
								</div><div class="clear"></div>
							 </div>
						 </form>
								
						</div>
				</div>
		</div>
		
		<div class="header-para">
				<div class="categories">
						<div class="list-categories">
							<div class="first-list">
								<div class="div_2">
								 
								    <a>
				                                        用户：${USER_SESSION.username}
				                    </a>
				                
				                 </div>
								<div class="div_img">
									<img src="images/car1.jpg" alt="Cars" title="Cars" width="60" height="39">
								</div><div class="clear"></div>
							</div>
							<div class="first-list">
								
								   <div>
								    <a href="${pageContext.request.contextPath }/person.action">
				                                        个人中心
				                    </a>
				                   </div>
								<div class="div_img">
									<img src="images/car2.jpg" alt="Cars" title="Cars" width="60" height="39">
								</div><div class="clear"></div>
							</div>
							<div class="first-list">
							
								    <div>
								    <a href="${pageContext.request.contextPath }/zulinShop.action">
				                                       租赁物品
				                    </a>
				                    </div>
								<div class="div_img">
									<img src="images/car3.jpg" alt="Cars" title="Cars" width="60" height="39">
								</div>
								<div class="clear"></div>
							</div>
							<div class="first-list">
								
								    <a href="${pageContext.request.contextPath }/logout.action">
				                                        退出系统
				                    </a>
				                  
								<div class="div_img">
									<img src="images/car4.jpg" alt="Cars" title="Cars" width="60" height="39">
								</div><div class="clear"></div>
							</div>
				</div>
				<div class="box"> 
							<div class="box-heading"><h1><a href="#">Cart:&nbsp;</a></h1></div>
							 <div class="box-content">
							Now in your cart&nbsp;<strong> 0 items</strong>
							</div>	
				</div>
				<div class="box-title">
					<h1><span class="title-icon"></span><a href="">Branches</a></h1>
				</div>
				<div class="section group example">
					<div class="col_1_of_2 span_1_of_2">
					  <img src="images/pic21.jpg" alt=""/>
					   <img src="images/pic24.jpg" alt=""/>
					   <img src="images/pic25.jpg" alt=""/>
					   <img src="images/pic27.jpg" alt=""/>
	 				</div>
					<div class="col_1_of_2 span_1_of_2">
						 <img src="images/pic22.jpg" alt=""/>
					  	<img src="images/pic23.jpg" alt=""/>
					  	<img src="images/pic26.jpg" alt=""/>
					  	<img src="images/pic28.jpg" alt=""/>
					  </div><div class="clear"></div>
		   		 </div>
				<div class="clear"></div>
				</div>
	</div>
	
		<div class="clear"></div>
		<div class="footer-bottom">
			<div class="copy">
				<p>2015级计算机与信息工程学院网络编程班毕业设计 <a href="http://www.cssmoban.com/" target="_blank" title="模板连接">模板地址</a> - The JSP from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">修改版</a></p>
			</div>
		</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="bs" uri="http://bs.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>大学生二手物品租赁系统</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/bootstrap.min.css" rel="stylesheet" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href='https://fonts.googleapis.com/css?family=Playball'
	rel='stylesheet' type='text/css'>
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
					<div class="header">

						<div class="header-bot">
							<div class="logo"width:100%; height:100%>
								<a><img src="images/logo.png" alt="" /></a>
							</div>


							<form class="form-inline"
								action="${pageContext.request.contextPath }/findgoodslist.action"
								method="post">
								<div class="search">
									<label for="goodsName">商品名称：</label> <input type="text"
										class="textbox" id="l_name" name="l_name" /> <label
										for="commdityFrom">商品类型：</label> <select
										data-am-selected="{searchBox: 1}" name="l_type" id="l_type">
										<option value="全部">全部</option>
										<option value="笔记">笔记</option>
										<option value="图书">图书</option>
										<option value="工具">工具</option>
										<option value="娱乐">娱乐</option>
									</select> <label for="commdityFrom">商品状态：</label> <select
										data-am-selected="{searchBox: 1}" name="l_static"
										id="l_static">
										<option value="">全部</option>
										<option value="1">可租赁</option>
										<option value="0">租赁中</option>

									</select> <input type="submit" class="gray-button" value="查询">
								</div>

							</form>
							<!------------------------------------------查询分割线---------------------------------------------------  -->
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
										<li><a><canvas></canvas><img src="images/TuShu.jpg"
												width="800" height="400" alt="I am learning..."></a></li>
										<li><a><canvas></canvas><img src="images/huaban.jpg"
												width="800" height="400" alt="I am writing"></a></li>
										<li><a><canvas></canvas><img src="images/Biji.jpg"
												width="800" height="400" alt="I am playing..."></a></li>
										<li><a><canvas></canvas><img
												src="images/shenghuo.jpg" width="800" height="400"
												alt="The life is beauty"></a></li>
									</ul>
									<span class="arrow previous"></span> <span class="arrow next"></span>
								</div>
								<div class="content-wrapper">
									<div class="content-top">
										<div class="box_wrapper">
											<h1 align="left">租赁商品列表</h1>


										</div>

										<form class="form-inline"
											action="${pageContext.request.contextPath }/commodity_information.action"
											method="post">
											<div>
												<c:forEach items="${page.rows}" var="row" varStatus="status">


													<div style="float: left">
														
															<div style="width: 220px; height: 220px">
																<img src="${row.l_image}" />
															</div>
															<h4>${row.l_name}</h4>
														</a>
														<p>
														<p align="left">价格：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${row.l_price}.00元</p>

														</p>

														<p class="title">
															租赁时间：<a>${row.l_out_time}---${row.l_in_time}</a>
														</p>

														
														<a
															href="${pageContext.request.contextPath }/commodity_information.action?id=${row.id}">点击购买</a>
														<%-- <a "${pageContext.request.contextPath }/commodity_information.action?id=${rows.id}">点击gou'm</a> --%>
														<div class="clear"></div>
													</div>




												</c:forEach>
												<div class="col-md-12 text-right">
													<bs:page
														url="${pageContext.request.contextPath }/findgoodslist.action" />
												</div>

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

												<a> 用户：${USER_SESSION.username} </a>

											</div>

											<div class="clear"></div>
										</div>
										<div class="first-list">

											<div>
												<a href="${pageContext.request.contextPath }/person.action">
													个人中心 </a>
											</div>

											<div class="clear"></div>
										</div>
										<div class="first-list">

											<div>
												<a
													href="${pageContext.request.contextPath }/zulinShop.action">
													租赁物品 </a>
											</div>

											<div class="clear"></div>
										</div>
										<div class="first-list">

											<a href="${pageContext.request.contextPath }/logout.action">
												退出系统 </a>


											<div class="clear"></div>
										</div>
									</div>
									<div class="box">
										<div class="box-heading">
											<h1>
												<a href="#">Cart:&nbsp;</a>
											</h1>
										</div>
										<div class="box-content">
											Now in your cart&nbsp;<strong> 0 items</strong>
										</div>
									</div>
									<div class="box-title">
										<h1>
											<span class="title-icon"></span><a href="">Branches</a>
										</h1>
									</div>

									<div class="clear"></div>
								</div>
								<div class="clear"></div>
							</div>
						</div>

						<div class="clear"></div>
						<div class="footer-bottom">
							<div class="copy">
								<p>
									2015级计算机与信息工程学院网络编程班毕业设计 <a href="http://www.cssmoban.com/"
										target="_blank" title="模板连接">模板地址</a> - The JSP from <a
										href="http://www.cssmoban.com/" title="网页模板" target="_blank">修改版</a>
								</p>
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
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

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>商品列表</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="assets/i/favicon.png">
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link rel="apple-touch-icon-precomposed"
	href="assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="assets/css/amazeui.min.css" />
<link rel="stylesheet" href="assets/css/admin.css">
<link rel="stylesheet" href="assets/css/app.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>


<body data-type="generalComponents">


	<header class="am-topbar am-topbar-inverse admin-header">
	<div class="am-topbar-brand">
		<a href="javascript:;" class="tpl-logo"> <img
			src="assets/img/logo.png" alt="">
		</a>
	</div>
	<div
		class="am-icon-list tpl-header-nav-hover-ico am-fl am-margin-right">

	</div>

	<button
		class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
		data-am-collapse="{target: '#topbar-collapse'}">
		<span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span>
	</button>

	<div class="am-collapse am-topbar-collapse" id="topbar-collapse">

		<ul
			class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list tpl-header-list">
			<li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
				<a class="am-dropdown-toggle tpl-header-list-link"
				href="javascript:;"> <span class="am-icon-bell-o"></span> 提醒 <span
					class="am-badge tpl-badge-success am-round">5</span></span>
			</a>
				<ul class="am-dropdown-content tpl-dropdown-content">
					<li class="tpl-dropdown-content-external">
						<h3>
							你有 <span class="tpl-color-success">5</span> 条提醒
						</h3> <a href="###">全部</a>
					</li>
					<li class="tpl-dropdown-list-bdbc"><a href="#"
						class="tpl-dropdown-list-fl"><span
							class="am-icon-btn am-icon-plus tpl-dropdown-ico-btn-size tpl-badge-success"></span>
							【预览模块】移动端 查看时 手机、电脑框隐藏。</a> <span class="tpl-dropdown-list-fr">3小时前</span>
					</li>
					<li class="tpl-dropdown-list-bdbc"><a href="#"
						class="tpl-dropdown-list-fl"><span
							class="am-icon-btn am-icon-check tpl-dropdown-ico-btn-size tpl-badge-danger"></span>
							移动端，导航条下边距处理</a> <span class="tpl-dropdown-list-fr">15分钟前</span></li>
					<li class="tpl-dropdown-list-bdbc"><a href="#"
						class="tpl-dropdown-list-fl"><span
							class="am-icon-btn am-icon-bell-o tpl-dropdown-ico-btn-size tpl-badge-warning"></span>
							追加统计代码</a> <span class="tpl-dropdown-list-fr">2天前</span></li>
				</ul>
			</li>
			<li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
				<a class="am-dropdown-toggle tpl-header-list-link"
				href="javascript:;"> <span class="am-icon-comment-o"></span> 消息
					<span class="am-badge tpl-badge-danger am-round">9</span></span>
			</a>
				<ul class="am-dropdown-content tpl-dropdown-content">
					<li class="tpl-dropdown-content-external">
						<h3>
							你有 <span class="tpl-color-danger">9</span> 条新消息
						</h3> <a href="###">全部</a>
					</li>
					<li><a href="#" class="tpl-dropdown-content-message"> <span
							class="tpl-dropdown-content-photo"> <img
								src="assets/img/user02.png" alt="">
						</span> <span class="tpl-dropdown-content-subject"> <span
								class="tpl-dropdown-content-from">
									${USER_SESSION.username} </span> <span
								class="tpl-dropdown-content-time">10分钟前 </span>
						</span> <span class="tpl-dropdown-content-font"> Amaze UI 的诞生，依托于
								GitHub 及其他技术社区上一些优秀的资源；Amaze UI 的成长，则离不开用户的支持。 </span>
					</a> <a href="#" class="tpl-dropdown-content-message"> <span
							class="tpl-dropdown-content-photo"> <img
								src="assets/img/user03.png" alt="">
						</span> <span class="tpl-dropdown-content-subject"> <span
								class="tpl-dropdown-content-from"> Steam </span> <span
								class="tpl-dropdown-content-time">18分钟前</span>
						</span> <span class="tpl-dropdown-content-font"> 为了能最准确的传达所描述的问题，
								建议你在反馈时附上演示，方便我们理解。 </span>
					</a></li>

				</ul>
			</li>
			<li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
				<a class="am-dropdown-toggle tpl-header-list-link"
				href="javascript:;"> <span class="am-icon-calendar"></span> 进度 <span
					class="am-badge tpl-badge-primary am-round">4</span></span>
			</a>
				<ul class="am-dropdown-content tpl-dropdown-content">
					<li class="tpl-dropdown-content-external">
						<h3>
							你有 <span class="tpl-color-primary">4</span> 个任务进度
						</h3> <a href="###">全部</a>
					</li>
					<li><a href="javascript:;"
						class="tpl-dropdown-content-progress"> <span class="task">
								<span class="desc">Amaze UI 用户中心 v1.2 </span> <span
								class="percent">45%</span>
						</span> <span class="progress">
								<div class="am-progress tpl-progress am-progress-striped">
									<div class="am-progress-bar am-progress-bar-success"
										style="width: 45%"></div>
								</div>
						</span>
					</a></li>
					<li><a href="javascript:;"
						class="tpl-dropdown-content-progress"> <span class="task">
								<span class="desc">新闻内容页 </span> <span class="percent">30%</span>
						</span> <span class="progress">
								<div class="am-progress tpl-progress am-progress-striped">
									<div class="am-progress-bar am-progress-bar-secondary"
										style="width: 30%"></div>
								</div>
						</span>
					</a></li>
					<li><a href="javascript:;"
						class="tpl-dropdown-content-progress"> <span class="task">
								<span class="desc">管理中心 </span> <span class="percent">60%</span>
						</span> <span class="progress">
								<div class="am-progress tpl-progress am-progress-striped">
									<div class="am-progress-bar am-progress-bar-warning"
										style="width: 60%"></div>
								</div>
						</span>
					</a></li>

				</ul>
			</li>
			<li class="am-hide-sm-only"><a href="javascript:;"
				id="admin-fullscreen" class="tpl-header-list-link"><span
					class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>

			<li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
				<a class="am-dropdown-toggle tpl-header-list-link"
				href="javascript:;"> <span class="tpl-header-list-user-nick">${USER_SESSION.username}</span><span
					class="tpl-header-list-user-ico"> <img
						src="assets/img/user01.png"></span>
			</a>
				<ul class="am-dropdown-content">
					<li><a href="#"><span class="am-icon-bell-o"></span> 资料</a></li>
					<li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>
					<li><a
						href="${pageContext.request.contextPath }/logout.action"><span
							class="am-icon-power-off"></span> 退出</a></li>
				</ul>
			</li>
			<li><a href="###" class="tpl-header-list-link"><span
					class="am-icon-sign-out tpl-header-list-ico-out-size"></span></a></li>
		</ul>
	</div>
	</header>







	<div class="tpl-page-container tpl-page-header-fixed">

		<div class="tpl-left-nav tpl-left-nav-hover">
			<div class="tpl-left-nav-title">Amaze UI 列表</div>
			<div class="tpl-left-nav-list">
				<ul class="tpl-left-nav-menu">
					<li class="tpl-left-nav-item"><a href="admin.jsp"
						class="nav-link"> <i class="am-icon-home"></i> <span>首页</span>
					</a></li>
					<li class="tpl-left-nav-item"><a href="chart.html"
						class="nav-link tpl-left-nav-link-list"> <i
							class="am-icon-bar-chart"></i> <span>数据表</span> <i
							class="tpl-left-nav-content tpl-badge-danger"> 12 </i>
					</a></li>

					<li class="tpl-left-nav-item">
						<!-- 打开状态 a 标签添加 active 即可   --> <a href="javascript:;"
						class="nav-link tpl-left-nav-link-list active"> <i
							class="am-icon-table"></i> <span>信息表單</span> <!-- 列表打开状态的i标签添加 tpl-left-nav-more-ico-rotate 图表即90°旋转  -->
							<i
							class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
					</a>
						<ul class="tpl-left-nav-sub-menu">
							<li><a
								href="${pageContext.request.contextPath }/table-user-list.action">
									<i class="am-icon-angle-right"></i> <span>用户列表</span> <i
									class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
							</a> <!-- 打开状态 a 标签添加 active 即可   --> <a
								href="${pageContext.request.contextPath }/table-goods-list-admin.action">
									<i class="am-icon-angle-right"></i> <span>商品列表</span> <i
									class="tpl-left-nav-content tpl-badge-success">18 </i>
							</a> <a href="${pageContext.request.contextPath }/form-news.action">
									<i class="am-icon-angle-right"></i> <span>评价信息</span> <i
									class="tpl-left-nav-content tpl-badge-primary"></i>
							</a></li>
						</ul>
					</li>



					<li class="tpl-left-nav-item"><a
						href="${pageContext.request.contextPath }/logout.action"
						class="nav-link tpl-left-nav-link-list"> <i
							class="am-icon-key"></i> <span>退出系统</span>

					</a></li>
				</ul>
			</div>
		</div>





		<div class="tpl-content-wrapper">
			<div class="tpl-content-page-title">Amaze UI 文字列表</div>
			<ol class="am-breadcrumb">
				<li><a href="#" class="am-icon-home">首页</a></li>
				<li><a href="#">Amaze UI CSS</a></li>
				<li class="am-active">文字列表</li>
			</ol>
			<div class="tpl-portlet-components">
				<div class="portlet-title">

					<form class="form-inline"
						action="${pageContext.request.contextPath }/findgoodslist_a.action"
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
								data-am-selected="{searchBox: 1}" name="l_static" id="l_static">
								<option value="">全部</option>
								<option value="1">可租赁</option>
								<option value="0">租赁中</option>

							</select> <input type="submit" class="gray-button" value="查询">
						</div>

					</form>

				</div>
				<div class="tpl-block">

					<div class="am-g">
						<div class="tpl-table-images">




							<form class="am-form"
								action="${pageContext.request.contextPath }/goodslist.action"
								method="post">
								<table
									class="am-table am-table-striped am-table-hover table-main">
									<thead>
										<tr>
											<th>id</th>
											<th>商品名称</th>
											<th>商品图片</th>
											<th>商品价格</th>
											<th>商品信息</th>
											<th>商品类型</th>
											<th>租赁时间</th>
											<th>截止时间</th>
											<th>商品地址</th>
											<th>物主ID</th>
											<th>商品状态</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${page.rows}" var="rows">
											<tr>
												<td>${rows.id}</td>
												<td>${rows.l_name}</td>
												<td>${rows.l_image}</td>
												<td>${rows.l_price}</td>
												<td>${rows.l_info}</td>
												<td>${rows.l_type}</td>
												<td>${rows.l_out_time}</td>
												<td>${rows.l_in_time}</td>
												<td>${rows.l_addr}</td>
												<td>${rows.u_id}</td>
												<td>${rows.l_static}</td>
												<td><a
													href="${pageContext.request.contextPath }/updategools_xiajia.action?l_static=${rows.l_static}&id=${rows.id}"
													class="btn btn-primary btn-xs" data-toggle="modal"
													data-target="#customerEditDialog"
													onclick="edituser(${rows.id})">下架商品</a> <a
													href="${pageContext.request.contextPath }/deleteGoods.action?id=${rows.id}"
													class="btn btn-danger btn-xs"
													onclick="deleteuser(${rows.id})">删除</a></td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
								<div class="col-md-12 text-right">
									<bs:page
										url="${pageContext.request.contextPath }/findgoodslist_a.action" />
								</div>
							</form>



							<div class="am-u-lg-12">
								<div class="am-cf"></div>
								<hr>
							</div>

						</div>

					</div>
				</div>
				<div class="tpl-alert"></div>
			</div>










		</div>

	</div>


	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/amazeui.min.js"></script>
	<script src="assets/js/app.js"></script>
</body>

</html>
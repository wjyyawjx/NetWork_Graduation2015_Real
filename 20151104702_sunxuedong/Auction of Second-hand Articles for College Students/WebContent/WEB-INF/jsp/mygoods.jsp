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
<title>我的商品</title>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/amazeui.min.css" />
<link rel="stylesheet" href="assets/css/admin.css">
<link rel="stylesheet" href="assets/css/app.css">
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link rel="apple-touch-icon-precomposed"
	href="assets/i/app-icon72x72@2x.png">
</head>
<body>
	<form class="form-inline"
		action="${pageContext.request.contextPath }/findgoodslist_u.action"
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

			</select> <input type="hidden" id="u_id" name="u_id"
				value="${USER_SESSION.id}"> <input type="submit"
				class="gray-button" value="查询">
		</div>

	</form>

	<div class="am-g">
		<form class="am-form"
			action="${pageContext.request.contextPath }/findgoodslist_z.action"
			method="post">
			<table class="am-table am-table-striped am-table-hover table-main">
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
						<th>物主</th>
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
							<td><img width="40px" height="40px" src="${rows.l_image}" /></td>
							<td>${rows.l_price}</td>
							<td>${rows.l_info}</td>
							<td>${rows.l_type}</td>
							<td>${rows.l_out_time}</td>
							<td>${rows.l_in_time}</td>
							<td>${rows.l_addr}</td>
							<td>${rows.u_name}</td>
							<td>${rows.u_id}</td>
							<td>${rows.l_static}</td>
							<td><a
								href="${pageContext.request.contextPath }/updatemygools.action?l_static=${rows.l_static}&id=${rows.id}"
								class="btn btn-primary btn-xs" data-toggle="modal"
								data-target="#customerEditDialog"
								onclick="editgoods(${rows.id})">修改</a> <a
								href="${pageContext.request.contextPath }/deleteGoods.actionl_static=${rows.l_static}&id=${rows.id}"
								class="btn btn-danger btn-xs"
								onclick="deletegoods(${rows.id})">删除</a></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			<div class="col-md-12 text-right">
				<bs:page
					url="${pageContext.request.contextPath }/findgoodslist_u.action" />
			</div>
		</form>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/amazeui.min.js"></script>
	<script src="assets/js/app.js"></script>
</body>
</html>
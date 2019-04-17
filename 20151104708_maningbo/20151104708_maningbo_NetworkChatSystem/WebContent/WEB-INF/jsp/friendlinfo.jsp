<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	type="text/css" rel="stylesheet" media="all">
<link href="${pageContext.request.contextPath}/css/style.css"
	type="text/css" rel="stylesheet" media="all">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/move-top.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/easing.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<h3>好友信息</h3>
		</div>
		<div class="row">
			<div class=" col-lg-2"></div>
			<form class="form-horizontal col-lg-8"
				action="${pageContext.request.contextPath}/userinfo/update.action"
				method="post" enctype="multipart/form-data">
				<div class="form-group">
					<div class="col-sm-2">
						<img src="${pageContext.request.contextPath}/upload/${userBean.image}" class="img-responsive img-circle" alt="暂无头像">
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label for="userName" class="col-sm-2 control-label">用户名：</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="userName" disabled
							placeholder="userName" value="${userBean.userName}" id="userName">
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label for="gender" class="col-sm-2 control-label">性别：</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="gender" disabled
							placeholder="gender" value="${userBean.gender}" id="gender">
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label for="gender" class="col-sm-2 control-label">生日：</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="birthDay" disabled
							placeholder="birthDay" value="${userBean.birthDay}" id="birthDay">
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label for="phone" class="col-sm-2 control-label">手机号：</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="phone" disabled
							placeholder="phone" value="${userBean.phone}" id="phone">
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label for="email" class="col-sm-2 control-label">邮箱：</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="email" disabled
							placeholder="email" value="${userBean.email}" id="email">
					</div>
				</div>
				<hr>
				<div class="col-lg-12">
					<a href="${pageContext.request.contextPath}/friendlist.action" class="btn btn-success btn-lg col-lg-12"
						id="sumbitData">返回</a>
				</div>
			</form>
			<div class=" col-lg-2">${msg }</div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Chat Room</title>
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
<script src="${pageContext.request.contextPath}/js/bootstrap.js">
	
</script>
</head>
<body>

	<div class="container">
		<div class="row col-lg-12" height="120px"></div>
		<div class="row">
			<div class="col-lg-3"></div>
			<h1 style="color: red;" class="col-lg-6">用户管理</h1>
			<div class="col-lg-3"></div>
		</div>
		<div class="row col-lg-12" height="120px"></div>
		<div class="row">
		</div>
		<div class="row">
			<hr>
		</div>
		<div class="row">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>id</th>
						<th>账号</th>
						<th>已申请的房间数</th>
						<th>已激活的房间数</th>
						<th>已停封的房间数</th>
						<th>已驳回的房间数</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${userList }">
						<tr>
							<td>${user.id }</td>
							<td>${user.userName }</td>
							<c:forEach var="userVo" items="${user.listVo }" varStatus="status">
								<td>
									<span class="btn ${color[status.index] }" value="2">${userVo.count }</span>
								</td>
							</c:forEach>
							<td>
								<c:if test="${user.flag == 1 }">
									<a class="btn btn-danger" href="${pageContext.request.contextPath}/admin/updateUserflag/0/${user.id }.action"  value="2">注销用户</a>
								</c:if>
								<c:if test="${user.flag == 0 }">
									<a class="btn btn-success"  href="${pageContext.request.contextPath}/admin/updateUserflag/1/${user.id }.action" value="2">激活用户</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
	${success }
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>添加好友</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="${pageContext.request.contextPath}/css/style.css" type="text/css" rel="stylesheet" media="all">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/move-top.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/easing.js"></script>	
</head>
<body>
	<div class="container-fluid">
		<div class="row">		
			<div>
				<div class="contact">				
					<div class="contact-grids">
						<div class="col-md-4 address">
							<h3>Contact Info</h3>
							<p class="cnt-p">Lorem ipsum dolor sit amet, consectetur adipisicing elit,sheets containing Lorem Ipsum passages sed do </p>
							<p>Eiusmod Tempor inc</p>
							<p>9560 St Dolor,London</p>
							<p>Telephone : +2 800 544 6035</p>
							<p>FAX : +1 800 889 4444</p>
							<p>Email : <a href="mailto:example@mail.com">mail@example.com</a></p>
						</div>
						<div class="col-md-8 contact-form">
							<h3>添加好友</h3>
							<form action="${pageContext.request.contextPath}/addfriend.action" method="post">
								<label>请输入您要搜索的用户名：</label>
								<input type="text" name="friend_2" id="friend_2" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
								<label>${msg}</label>
								<input type="submit" value="Submit" >
							</form>
						</div>
					</div>				
				</div>
			</div>
		</div>
		<div class="row">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>序号</th>
						<th>用户名称</th>
						<th>接收用户</th>
						<th>时间</th>
						<th>信息</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="fvalidate" items="${listValidate }" varStatus="index">

						<tr>
							<td>${index.count }</td>
							<td>${fvalidate.friend_1 }</td>
							<td>${fvalidate.friend_2 }</td>
							<td>${fvalidate.f2_allow }</td>
							<td>
								<c:choose>
								<c:when test="${fvalidate.friend_1 eq userBean.userName }">
									等待好友通过验证
   								</c:when>
   								<c:otherwise>
   									请求加你好友
   								</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
								<c:when test="${fvalidate.friend_1 eq userBean.userName }">
									<button class="btn btn-info" name="updateName">等待...</button>
   								</c:when>
   								<c:otherwise>
   									<a class="btn btn-success" href="${pageContext.request.contextPath}/friend/validate/${fvalidate.friend_1}/1.action" name="updateName">同意</a>
   									<a class="btn btn-danger" href="${pageContext.request.contextPath}/friend/validate/${fvalidate.friend_1}/2.action" name="updateName">不同意</a>
   								</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>序号</th>
						<th>用户名称</th>
						<th>接收用户</th>
						<th>时间</th>
						<th>信息</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="fvalidate" items="${listO }" varStatus="index">

						<tr>
							<td>${index.count }</td>
							<td>${fvalidate.friend_1 }</td>
							<td>${fvalidate.friend_2 }</td>
							<td>${fvalidate.f2_allow }</td>
							<td>
   								请求加你好友
							</td>
							<td>
  								<a class="btn btn-success" href="${pageContext.request.contextPath}/friend/validate/${fvalidate.friend_1}/1.action" name="updateName">同意</a>
  								<a class="btn btn-danger" href="${pageContext.request.contextPath}/friend/validate/${fvalidate.friend_1}/2.action" name="updateName">不同意</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"> </script>
</body>
</html>
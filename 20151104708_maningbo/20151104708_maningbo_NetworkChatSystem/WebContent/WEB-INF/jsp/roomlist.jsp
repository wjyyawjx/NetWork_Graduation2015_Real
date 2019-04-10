<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Friend List</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	type="text/css" rel="stylesheet" media="all">
<link href="${pageContext.request.contextPath}/css/style.css"
	type="text/css" rel="stylesheet" media="all">

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- js -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<!-- //js -->
<!-- start-smoth-scrolling-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/move-top.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/easing.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<!--//side-bar-->
			<div>
				<div class="offer-grids">
					<h3>房间列表</h3>
					<c:forEach items="${rooms}" var="room">
						<input type="hidden" name="id" value="${room.id }">
						<div class="col-md-3 offer-grids-info">
							<a href="${pageContext.request.contextPath}/room/roominfo/${room.id }.action"> <img
								src="${pageContext.request.contextPath}/images/img13.jpg" alt="" />
								<div class="offer-text">
									<h3>房间号: ${room.id}</h3>
									<h3>${room.name}</h3>
									<br>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
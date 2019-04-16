<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Friend List</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="${pageContext.request.contextPath}/css/style.css" type="text/css" rel="stylesheet" media="all">

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- js -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script> 
<!-- //js -->	
<!-- start-smoth-scrolling-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/move-top.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/easing.js"></script>	
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<!--//side-bar-->
			<div >	
					<div class="offer-grids">
						<h3>我的好友列表</h3>
						<c:forEach items="${friend}" var="c">
						<div class="col-lg-4 offer-grids-info">
							<a style="font-size: 20px;"  href="${pageContext.request.contextPath}/friend/${userBean.userName }/${c.friend_2}.action">
								<img src="${pageContext.request.contextPath}/images/talk1.jpg" alt=""/>	
								<div class="offer-text">
									<h5>${c.friend_2}</h5>
									<br>
								</div>
							</a>
							<a class="btn btn-success col-lg-6" href="${pageContext.request.contextPath}/friend/info/${c.friend_2}.action">查看好友资料</a>
							<a class="btn btn-danger col-lg-6" href="${pageContext.request.contextPath}/friend/delete/${c.friend_2}.action">删除好友</a>
						</div>
						</c:forEach>
					</div>					
				</div>
			</div>
		</div>	
		${msg }
</body>
</html>
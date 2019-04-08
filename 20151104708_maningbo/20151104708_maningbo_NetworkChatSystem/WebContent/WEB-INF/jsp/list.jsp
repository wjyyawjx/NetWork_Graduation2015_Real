<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	type="text/css" rel="stylesheet" media="all">
<link href="${pageContext.request.contextPath}/css/style.css"
	type="text/css" rel="stylesheet" media="all">
<!--web-font-->
<!--//web-font-->
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Plot Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- //Custom Theme files -->
<!-- js -->
<script src="js/jquery-1.11.1.min.js"></script>
<!-- //js -->
<!-- start-smoth-scrolling-->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	var flag='<%=session.getAttribute("flag")%>
	';
</script>
<!--//end-smoth-scrolling-->
</head>
<body>
	<c:if test="${userBean.role eq 'admin'}">
	<div class="container-fluid" style="height: 100%; width: 100%">
		<div class="row">
			<!--side-bar-->
			<div align="center">
				<div class="logo">
					<a href="${pageContext.request.contextPath}/index.action"
						target="main"><img src="images/logo.png" alt="logo" /></a>
				</div>
				<div class="top-nav">
					<span class="menu-icon"><img src="images/menu-icon.png"
						alt="" /></span>
					<div class="nav1">
						<ul class=" nav nav-sidebar">
							<li style="color: blue; font-size: 20px; font-weight: 600">当前用户：${userBean.userName}</li>
							<li id="li_index" class="active"><a
								href="${pageContext.request.contextPath}/index.action"
								target="main">首 页</a></li>
							<li id="li_chatroom"><a
								href="${pageContext.request.contextPath}/admin/adminUserList.action"
								target="main">用户管理</a></li>
							<li id="li_chatroom"><a
								href="${pageContext.request.contextPath}/room/adminRoomList.action"
								target="main">聊天室管理</a></li>
							<li id="li_chatroom"><a
								href="${pageContext.request.contextPath}/room/adminRoom.action"
								target="main">审批聊天室</a></li>
							<li id="li_changepwd"><a href="${pageContext.request.contextPath}/updatePassPage.action" target="frame">修改密码</a></li>
							<li id="li_logout"><a
								href="${pageContext.request.contextPath}/logout.action"
								target="frame">退出登录</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	</c:if>
	<c:if test="${userBean.role eq 'user'}">
		<div class="container-fluid" style="height: 100%; width: 100%">
		<div class="row">
			<!--side-bar-->
			<div align="center">
				<div class="logo">
					<a href="${pageContext.request.contextPath}/index.action"
						target="main"><img src="images/logo.png" alt="logo" /></a>
				</div>
				<div class="top-nav">
					<span class="menu-icon"><img src="images/menu-icon.png"
						alt="" /></span>
					<div class="nav1">
						<ul class=" nav nav-sidebar">
							<li style="color: blue; font-size: 20px; font-weight: 600">当前用户：${userBean.userName}</li>
							<li id="li_index" class="active"><a
								href="${pageContext.request.contextPath}/index.action"
								target="main">首 页</a></li>
							<li id="li_friendlist"><a
								href="${pageContext.request.contextPath}/friendlist.action"
								target="main">好友</a></li>
							<li id="li_friendlist"><a
								href="${pageContext.request.contextPath}/addfriendPage.action"
								target="main">添加好友</a></li>
							<li id="li_chatroom"><a
								href="${pageContext.request.contextPath}/room/list.action"
								target="main">聊天室</a></li>
							<li id="li_chatroom"><a
								href="${pageContext.request.contextPath}/room/addpage.action"
								target="main">申请聊天室</a></li>
							<li id="li_personalinfo"><a
								href="${pageContext.request.contextPath}/personalinfo.action"
								target="main">个人信息</a></li>
							<li id="li_changepwd"><a href="${pageContext.request.contextPath}/updatePassPage.action"  target="frame">修改密码</a></li>
							<li id="li_logout"><a
								href="${pageContext.request.contextPath}/logout.action"
								target="frame">退出登录</a></li>
						</ul>
						<div class="social-icons">
							<ul>
								<li style="color: #d95459; font-size: 20px; font-weight: 600"><a
									href="${pageContext.request.contextPath}/login.action"
									target="frame"></a>登陆</li>
								<li style="color: #d95459; font-size: 20px; font-weight: 600"><a
									href="${pageContext.request.contextPath}/register.action"
									class="be" target="frame"></a>注册</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</c:if>
</body>
</html>
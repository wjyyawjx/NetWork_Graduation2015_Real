<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<!--web-font-->
<link href='http://fonts.useso.com/css?family=Marvel:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<!--//web-font-->
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Plot Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->
<!-- js -->
<script src="js/jquery-1.11.1.min.js"></script> 
<!-- //js -->	
<!-- start-smoth-scrolling-->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>	
<script type="text/javascript">
	var flag='<%=session.getAttribute("flag") %>';
	if("unlogin".equals(flag)){
		alert("1111");
	}else{
		alert("2222");
	}

</script>
<!--//end-smoth-scrolling-->
</head>
<body>
	<div class="container-fluid" style="height: 100%;width: 100%">
		<div class="row">
			<!--side-bar-->
			<div align="center">
				<div class="logo">
					<a href="${pageContext.request.contextPath}/index.action" target="main"><img src="images/logo.png" alt="logo"/></a>
				</div>
				<div class="top-nav">
					<span class="menu-icon"><img src="images/menu-icon.png" alt=""/></span>	
					<div class="nav1">
						<ul class=" nav nav-sidebar">
							<li style="color: blue;font-size: 20px; font-weight: 600">当前用户：${userBean.userName}</li>
							<li id="li_index" class="active"><a href="${pageContext.request.contextPath}/index.action" target="main">首  页</a></li>
						 <li id="li_friendlist"><a href="${pageContext.request.contextPath}/friendlist.action" target="main">好友</a></li>
						 <li id="li_friendlist"><a href="${pageContext.request.contextPath}/addfriend.action" target="main">添加好友</a></li>
							<li id="li_chatroom"><a href="${pageContext.request.contextPath}/chatroom.action" target="main">聊天室</a></li>
							<li id="li_personalinfo"><a href="${pageContext.request.contextPath}/personalinfo.action" target="main">个人信息</a></li>
							<li id="li_changepwd"><a href="testmonials.html">修改密码</a></li>
							<li id="li_logout"><a href="${pageContext.request.contextPath}/logout.action" target="frame">退出登录</a></li>
						</ul> 
						<div class="social-icons">
							<ul>
								<li style="color: #d95459; font-size: 20px; font-weight: 600"><a href="${pageContext.request.contextPath}/login.action" target="frame"></a>登陆</li>
								<li style="color: #d95459; font-size: 20px; font-weight: 600"><a href="${pageContext.request.contextPath}/register.action" class="be" target="frame"></a>注册</li>
							</ul>	
						</div>						
					</div>	
				</div>
				</div>
				</div>
			</div>
</body>
</html>
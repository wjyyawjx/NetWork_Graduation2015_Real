<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>Login</title>
<!-- Custom Theme files -->
<link href="<%=basePath%>css/style1.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script>
		function check(){
			var userName = $("#userName").val();
			var userPass = $("#userPass").val();
			if(email==""||userPass==""){
				alert("账号密码为空");
				return false;
			}
			return true;
		}
	</script>
</head>
<body>
<div class="login">
	<h2>Login Form</h2>
	<div class="login-top">
		<h1>LOGIN FORM</h1>
		<form  action="${pageContext.request.contextPath}/login.action" method="post" onsubmit="return check()">
			<input type="text" id="userName" name="userName" value="username" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'User Id';}">
			<input type="password" placeholder="Password" id="userPass" name="userPass"value="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'password';}">
	    <div class="forgot">
	    	<a href="#">forgot Password</a>
	    	<span>
	    		<a>${msg}</a>
	    	</span>
	    	<input type="submit" value="submit" >
	    </div>
	</form>
	</div>
	<div class="login-bottom">
		<h3>New User &nbsp;<a href="${pageContext.request.contextPath}/register.action">Register</a>&nbsp; Here</h3>
	</div>
</div>	
<div class="copyright">
	<p>Copyright &copy; 2018.内蒙古师范大学.网络编程.马宁博</p>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>评论</title>
<link href="css/style1.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Pink Contact Form ,Login Forms,Sign up Forms,Registration Forms,News latter Forms,Elements"./>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<!--webfonts-->
<link href='http://fonts.useso.com/css?family=Lato:100,300,400,700,100italic,300italic,400italic|Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Raleway:400,200,300,500,600,800,700,900' rel='stylesheet' type='text/css'>
<!--//webfonts-->
</head>
<body>
	<h1>评论区</h1>
	<div class="login-01">
			<form method="post" action="${pageContext.request.contextPath}/pl.action">
				<ul>
				<li class="first">
					<a class=" icon user"></a><input type="text" class="text" value="Name" name="name" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Name';}" >
					<div class="clear"></div>
				</li>
				<li class="first">
					<a  class=" icon email"></a><input type="text" class="text" value="Email" name="email" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Email';}" >
					<div class="clear"></div>
				</li>
				<li class="first">
					<a  class=" icon phone"></a><input type="text" class="text" value="Phone" name="phone" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Phone';}" >
					<div class="clear"></div>
				</li>
				<li class="second">
				<a  class=" icon msg"></a><textarea value="Message" name="message" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Comments';}">Comments</textarea>
				<div class="clear"></div>
				</li>
			</ul>
			<input type="submit" value="Submit" >
			<div class="clear"></div>
		</form>
</div>
</body>
</html>
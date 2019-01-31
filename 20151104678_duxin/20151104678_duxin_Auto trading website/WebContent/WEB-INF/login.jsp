<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="viewport"
        content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <title>系统登录</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp"/>
  <link rel="stylesheet" href="css/amazeui.min.css">
  <link rel="stylesheet" href="css/app.css">
</head>
<body>


<script>
function check(){
	var usercode = $("#usercode").val();
	var password = $("#password").val();
	if(usercode==""||password==""){
		$("#message").text("账号或密码不能为空！");
		return false;
	}
	return true;
}
		
</script>
	
	
<div class="am-g myapp-login">
	<div class="myapp-login-bg">
		 <div class="myapp-login-logo">
		 	<i class="am-icon-stumbleupon"></i>
		 </div>
		 <div class="am-u-sm-10 myapp-login-form">
		 	<form class="am-form" method="get" action="${pageContext.request.contextPath}/login.action" onsubmit="return check()" >
			  <fieldset>		
			    <div class="am-form-group">
			      <input type="text" class="" id="usercode" value="请输入用户名"  name="usercode" >
			    </div>
			    <div class="am-form-group">
			      <input type="password" class="" id="password" value="请输入密码"     name="password"  >
			    </div>
			    <center><input type="submit" value="登录"/></center>
			  </fieldset>
			</form>
		 </div>
	</div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/amazeui.min.js"></script>
<script src="js/app.js"></script>
</body>
</html>
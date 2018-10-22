<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">

<script>
function validate() {
    var pwd = document.getElementById("pwd").value;
    var pwd1 = document.getElementById("pwd1").value;
 

    if(pwd1 == pwd)
     {
        document.getElementById("tishi").innerHTML="<font color='green'>两次密码相同</font>";
        document.getElementById("sub").disabled = false;
     }
else {
        document.getElementById("tishi").innerHTML="<font color='red'>两次密码不相同</font>";
		document.getElementById("sub").disabled = true;

     }
}
</script>

</head>
<body>


<h1>注册</h1>
	
		<div class="container">
			
			<form action="RegisterServlet"  method="post">
			<input type="text" Name="username" placeholder="用户名" required="">
				<input type="email" Name="email" placeholder="邮箱" required="">
				<input type="text" name="phone" placeholder="联系方式" required="">
				<input type="password" id="pwd" Name="password" onkeyup="validate()" placeholder="密码" required="">
				<input type="password" id="pwd1" Name="Password1" onkeyup="validate()" placeholder="确认密码" required="">
			
			<span id="tishi"></span>
			
				
					<input id="sub" type="submit"  disabled="value"  value="注册">
			
			

</form>
<br>
		<form action="LoginView">
		<input  type="submit"   value="登录">
			
		</form>
		</div>


</body>
</html>
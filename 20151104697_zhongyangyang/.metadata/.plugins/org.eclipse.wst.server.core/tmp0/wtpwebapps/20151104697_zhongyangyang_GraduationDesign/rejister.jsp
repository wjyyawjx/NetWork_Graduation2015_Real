<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人注册</title>
<style>
.all{
	background:white;
	width:100%;
	height:100%;
}
.login_input {
	padding: 5px;
	height: 20px;
	line-height: 20px;
	color: gray;
	width: 200px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
}
.login_name h3 {
	font-size: 16px;
	border-bottom: 1px dotted #02356f;
}
.login_button{background:#008ffd;border-radius:5px;width:120px;height:35px;line-heihgt:35px;display:block; margin-top:10px; color:white; border:none; font-family:microsoft yahei;cursor:pointer;}
</style>
<script type="text/javascript">
	var xmlHttp;
	function checkIt()
	{
		var username = document.getElementById("username").value;
		xmlHttp = new XMLHttpRequest();
		var url="UserCheckServlet?username="+username;
		xmlHttp.open("GET",url,true);
		xmlHttp.send();
		xmlHttp.onreadystatechange=function()
			{
				if (xmlHttp.readyState==4 && xmlHttp.status==200)
				{
				//给div设置内容
				document.getElementById("errorAccount").innerHTML = xmlHttp.responseText;
				}
			}
	}
	function validate() 
	{
		if(document.getElementById("username").value == "")
		{
			alert("用户登录名不能为空！");
			//document.getElementById("username").focus();
			return false;
		}
		if(document.getElementById("password").value == "")
		{
			alert("登录密码不能为空！");
			document.getElementById("password").focus();
			return false;
		}
			
			 var password = document.getElementById("password").value;
				              var userpassword = document.getElementById("userpassword").value;
				              if(password == userpassword) {
				                  return true;
				              }
				              else {
									alert("两次密码不一致！");
				                  return false;
				              }
	}

</script>
</head>
<body>
<div class="all">
	<div class="top" style="width:100%; height:150px;">
		<div class="left" style="float:left ; width:50%; height:100%;">
		</div>
		<div class="right" align="center" style="float:left ; width:50%; height:100%;">
			已有账户？<a href="login.jsp">请登录</a>
		</div>
	</div>
	<div class="main" style="width:100%;height:600px">
		<h3 align="center">用户注册</h3>
			<form action="RegisterServlet" method="post">
				<div align="center" id="errorAccount" >
					用&nbsp;&nbsp;户&nbsp;&nbsp;名：<input name="username" id="username" value="${username}" type="text" onblur="checkIt()"
						class="login_input" />
				</div>
				<div align="center">
					密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input name="password" id="password"
						type="password" value="${password}" class="login_input" />
				</div>
				<div align="center">
					确认密码：<input name="userpassword" id="userpassword"
						type="password" class="login_input" />
				</div>
				<div align="center">
					<input type="submit" class="login_button" value="注册成功" onclick="return validate() ">
				</div>
			</form>
	</div>
	<div  class="foot" style="width:100%;height:30px" align="center">
	   		关于我们|联系我们|广告服务|人才招聘|友情链接
	</div>
</div>
</body>
</html>
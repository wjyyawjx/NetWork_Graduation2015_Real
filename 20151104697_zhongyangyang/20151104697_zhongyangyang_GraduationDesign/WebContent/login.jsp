<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<style >
.all{
	width:100%;
	height:100%;
	background:white;
}
.top{
	font-size:40px;
}
.login_name h3 {
	font-size: 16px;
	border-bottom: 1px dotted #02356f;
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
.login_button{background:#008ffd;border-radius:5px;width:80px;height:35px;line-heihgt:35px;display:block; margin-top:10px; color:white; border:none; font-family:microsoft yahei;cursor:pointer;}
.login_button:hover{ background:#00b8e6;color:yellow; }	
</style>
<script type="text/javascript">
	// 表单提交请求验证
	function validate() {
		if(document.getElementById("username").value == ""){
			alert("用户登录名不能为空！");
			document.getElementById("username").focus();
			return false;
		}
		if(document.getElementById("password").value == ""){
			alert("登录密码不能为空！");
			document.getElementById("password").focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<div class="all">
		<div class="top" style="width:100%;height:80px" align="center" >
			欢迎登陆
		</div>
		<div class="main" style="width:100%;height:400px" >
			<h3 align="center">用户登录</h3>
			  <form action="Loginservlet" method="POST">
				<div align="center">
					用户名：<input name="username"  id="username" value="${username }" type="text"
						class="login_input" />
				</div>
				<div align="center">
					密&nbsp;&nbsp;&nbsp;&nbsp;码：<input name="password"  value="${password}" id="password"
						type="password" class="login_input" />
				</div>
				<div align="center">
					<input type="submit" class="login_button" value="登&nbsp;&nbsp;录"></input>
				</div>	
			</form>
		</div>
		<div class="foot" style="width:100%;height:30px" align="center">
			关于我们|联系我们|广告服务|人才招聘|友情链接
		</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆界面</title>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<script >
function check() {
	var name = $("#u_name").val();
	var pwd = $("#u_pwd").val();
	if(name==""||pwd==""){
		$("#message").text("账号或密码不能为空!");
		return false;
	}
	return true;
}
</script>
<style>
	.a{
	    height: 100px;
	    width: 300px;
	    
	    margin:150px auto; 
	}
</style>
<style>
        input[type="text"]{
            width: 200px;
            height: 25px;
            border-radius: 6px;
        }
        input[type="password"]{
            width: 200px;
            height: 25px;
            border-radius: 6px;
        }
        input[type="submit"]{
            background-color: #555555;
               border: none;
            color: white;
            padding: 12px 29px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 17px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
        }
</style>
</head>

<body style="background: url(images/timg.jpg)">

<div align="center" class="a">
<form action="${pageContext.request.contextPath}/login.action" method="post" onsubmit="return check()">
 用户名:<input id="u_user" type="text" name="u_user" /><br> 
 密&nbsp;&nbsp;&nbsp;&nbsp;码:<input id="u_pwd" type="password" name="u_pwd" /><br>
 登录类型:<select name="u_type" id="u_type">
						         <option value="管理员">管理员</option>
						         <option value="家长">家长</option>
						         <option value="教员">教员</option>
						         <option value="家长" selected="selected">家长</option>
		                       </select> <br>
<input type="submit" value="登陆" />
</form>
<a href="${pageContext.request.contextPath}/register.action" >注册新用户</a><br>
<font color="red">
<span id="message">${msg}</span>
</font>
</div>

</body>
</html>
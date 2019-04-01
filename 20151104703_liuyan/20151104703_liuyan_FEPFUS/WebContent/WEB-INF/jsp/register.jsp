<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>register</title>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<script >
function check() {
	var user = $("#u_user").val();
	var pwd = $("#u_pwd").val();
	var email = $("#u_email").val();
	var phone = $("#u_phone").val();
	var message = $("#u_message").val();
	var name = $("#u_name").val();
	if(user==""||pwd==""||email==""||phone==""||messag==""||name==""){
		$("#message").text("请填写全部信息!");
		return false;
	}
	return true;
}
</script>
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
        input[type="email"]{
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
<body>
<div align="center">
<form action="${pageContext.request.contextPath}/register.action" method="post" enctype="multipart/form-data" onsubmit="return check()">
 用户名:<input id="u_user" type="text" name="u_user" /><br> 
    密&nbsp;&nbsp;&nbsp;&nbsp;码:<input id="u_pwd" type="password" name="u_pwd" /><br>
  真实姓名:<input id="u_name" type="text" name="u_name" /><br>    
    邮&nbsp;&nbsp;&nbsp;&nbsp;箱:<input id="u_email" type="email" name="u_email" /><br>
    电&nbsp;&nbsp;&nbsp;&nbsp;话:<input id="u_phone" type="text" name="u_phone" /><br>
    职&nbsp;&nbsp;&nbsp;&nbsp;业:<select name="u_type" id="u_type">
						         <option value="家长">家长</option>
						         <option value="教员">教员</option>
						         <option value="家长" selected="selected">家长</option>
		                       </select> <br>
       身份认证图片:<input id="file" type="file" name="uploadfile" multiple="multiple" /><br />
       自我简介:<br><textarea id="u_message" name="u_message"  rows="7" cols="60">
</textarea><br>
    <input type="submit" value="注册" />
</form>
<a href="${pageContext.request.contextPath}/login.action" >返回登陆界面</a>
<font color="red">
<span id="message">${msg}</span>
</font>
</div>
</body>
</html>
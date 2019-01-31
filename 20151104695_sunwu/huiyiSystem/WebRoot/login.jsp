<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会议管理系统</title>
<meta name="author" content="DeathGhost" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css1/style.css" tppabs="css1/style.css" />

<style>
body { height: 100%; background: #16a085; overflow: hidden; }
canvas { z-index: -1; position: absolute; }
</style>
<script src="js1/jquery.js"></script>
<script src="js1/verificationNumbers.js" tppabs="js1/verificationNumbers.js"></script>
<script src="js1/Particleground.js" tppabs="js1/Particleground.js"></script>
<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
<script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
		<script type="text/javascript" src="js/selectFilter.js"></script>
<script language="javascript">
 function check1()
 {                                                                                         
     if(document.ThisForm.userName.value=="")
	 {
	 	alert("请输入用户名");
		document.ThisForm.userName.focus();
		return false;
	 }
	 if(document.ThisForm.userPw.value=="")
	 {
	 	alert("请输入密码");
		document.ThisForm.userPw.focus();
		return false;
	 }
	 	 if(document.ThisForm.userType.value=="-1")
			 {
			 	alert("请选择登陆身份");
				document.ThisForm.userType.focus();
				return false;
			 }
			 document.getElementById("indicator").style.display="block";
			 loginService.login(document.ThisForm.userName.value,document.ThisForm.userPw.value,document.ThisForm.userType.value,callback);
	 
 }

 function callback(data)
 {
    document.getElementById("indicator").style.display="none";
    if(data=="no")
    {
        alert("用户名或密码错误");
    }
    if(data=="yes")
    {
        alert("通过验证,系统登录成功");
        window.location.href="<%=path %>/loginSuccess.jsp";
    }
 }
 </script>
<script>
$(document).ready(function() {
  //粒子背景特效
  $('body').particleground({
    dotColor: '#5cbdaa',
    lineColor: '#5cbdaa'
  });
  
	  });
</script>

</head>
<body>
<dl class="admin_login">
 <dt> <strong>会议管理系统登录</strong> <em>Data management system</em> </dt>
  <form name="ThisForm" method="POST" action="">
    <dd class="user_icon">
     <input type="text" id="userName" name="userName" placeholder="请输入用户名" class="login_txtbx"/>
    </dd>
    <dd class="pwd_icon">
      <input type="password" id="userPw" name="userPw"  placeholder="请输入密码" class="login_txtbx"/>
    </dd>		
						 <select name="userType">
	                                 <option value="0">管理员</option>
	                                 <option value="1">员工</option>
								 </select>
    <dd>
        <button name="button" type="button" class="submit_btn"  onClick="check1()">登录</button>
    </dd>
    <dd>
      <button name="Submit2" type="reset" class="submit_btn">重置</button>
    </dd>
    <br>
    <center><strong><a href="<%=path %>/admin/register/index.jsp">还没有账号？点此注册</strong></a></center>
    <img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
  </form>
  <dd>
  </dd>
</dl>
</body>
</html>
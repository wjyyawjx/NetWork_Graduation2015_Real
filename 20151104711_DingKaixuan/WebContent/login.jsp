<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>教师辅助毕业设计系统</title>
</head>
<body>
<form action="" method="post"><br>
	<input type="button" value="管理员登录" onclick="window.location.href('gly_login.jsp')" />
	<input type="button" value="教师登录" onclick="window.location.href('teacher_login.jsp')" />
	<input type="button" value="学生登录" onclick="window.location.href('student_login.jsp')" />
	<input type="button" value="注册" onclick="window.location.href('register.jsp')" />
	<a href="javascript:window.opener=null;window.open('','_self');window.close();">退出</a>
</form>
</body>
</html>
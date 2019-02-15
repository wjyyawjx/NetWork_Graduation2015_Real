<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="" method="post"><br>
	<input type="button" value="教师注册" onclick="window.location.href('teacher_register.jsp')" />
	<input type="button" value="学生注册" onclick="window.location.href('student_register.jsp')" />
	<input type="submit" value="返回" onclick="window.location.href('login.jsp')" />
	<a href="javascript:window.opener=null;window.open('','_self');window.close();">退出</a>
</form>
</body>
</html>
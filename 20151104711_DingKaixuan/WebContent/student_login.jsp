<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="" method="post">
		<span>学生登陆</span><br />
		<label>学号：</label> <input type="text" name="student_name" required placeholder="请输入您的学号" /><br />
		<label>密码：</label> <input type="password" name="student_password" required placeholder="请输入您的密码" /><br />
		<input type="reset" value="重置" />
		<input type="button" value="退出" onclick="window.location.href('login.jsp')" />
		<input type="submit" value="登陆" onclick="window.location.href('student_index.jsp')"/>
	</form>
</body>
</html>
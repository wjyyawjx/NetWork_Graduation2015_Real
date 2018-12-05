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
		<span>管理员登陆</span><br />
		<label>管理员：</label> <input type="text" name="rootname" required placeholder="请输入您的管理员账号" /><br />
		<label>密码：</label> <input type="password" name="rootpassword" required placeholder="请输入您的密码" /><br />
		<input type="reset" value="重置" />
		<input type="button" value="退出" onclick="window.location.href('login.jsp')" />
		<input type="submit" value="登陆" onclick="window.location.href('gly_index.jsp')" />
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生注册</title>
</head>
<body>
	<form action="" method="post">
				<span>学生注册</span><br />
				<label>姓名：</label>
				<input type="text" name="student_name" placeholder="请输入您的真实姓名" />
				<br />
				<label>学号：</label>
				<input type="text" name="student_num" placeholder="请输入您的真实学号" />
				<br />
				<label>QQ：</label>
				<input type="text" name="student_qq" />
				<br />
				<label>电话：</label>
				<input type="text" name="student_phone_num" />
				<br />
				<label>email：</label>
				<input type="text" name="student_email" />
				<br />

				<label>密码：</label>
				<input type="text" name="student_password" placeholder="密码只能为数字或字母"
					onkeyup="value=value.replace(/[\W]/g,'')"
					onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />
				<br />

				<label>确认密码：</label>
				<input type="text" name="student_password_again"
					placeholder="请再次输入您的密码" onkeyup="value=value.replace(/[\W]/g,'')"
					onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />
				<br />

				<input type="reset" value="重置" />
				<input type="submit" value="注册" onclick="window.location.href('login.jsp')" />
				<input type="submit" value="返回" onclick="window.location.href('register.jsp')" />
	</form>
</body>
</html>
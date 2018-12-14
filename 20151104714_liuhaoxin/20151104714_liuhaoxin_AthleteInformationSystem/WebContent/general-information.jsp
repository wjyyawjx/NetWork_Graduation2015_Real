<%--  用户查看和修改自己的信息 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<title>Insert title here</title>
<script>
function validate() 
{
    var pwd = document.getElementById("pwd").value;
    var pwd1 = document.getElementById("pwd1").value;

    if(pwd1 == pwd)
     {
        document.getElementById("tishi").innerHTML="<font color='green'>两次密码相同</font>";
        document.getElementById("sub").disabled = false;
     }
	else {
        document.getElementById("tishi").innerHTML="<font color='red'>两次密码不相同</font>";
		document.getElementById("sub").disabled = true;
     }
}
</script>
</head>
<body>
	<br>
	<table border="2" cellpadding="0" cellspacing="0" style="font-size: 40px" ; width="100%" height="100%">
		<thead>
			<tr>
				<th>用户名</th>
				<th>密码</th>
				<th>邮箱</th>
				<th>联系方式</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${userdata}" var="w">
				<tr align="center">
					<td>${w.username}</td>
					<td>${w.pwd}</td>
					<td>${w.email}</td>
					<td>${w.phone}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<br>
	<table border="2" cellpadding="0" cellspacing="0"
		style="font-size: 40px"  width="100%" height="100%">
		<tr>
			<td><h2>修改密码</h2>
			<form target="parent" action="PwdUpload" method="post">
			<input type="password" id="pwd" Name="password" onkeyup="validate()" placeholder="密码" required=""> 
			<input  type="password" id="pwd1" Name="Password1" onkeyup="validate()" placeholder="确认密码" required=""> <br>
			<span id="tishi"></span> 
			<input id="sub" type="submit" disabled="value" value="修改密码">
			</form></td>
			<td><h2>修改邮箱</h2>
			<form action="EmailUpload" method="post">
			<input type="email" Name="email" placeholder="邮箱" required="">
			<input type="submit" value="修改邮箱">
			</form></td>
			<td><h2>修改联系方式</h2>
			<form action="PhoneUpload" method="post">
			<input type="text" name="phone" placeholder="联系方式" required="">
			<input type="submit" value="修改联系方式">
			</form></td>
		</tr>
	</table>
</body>
</html>
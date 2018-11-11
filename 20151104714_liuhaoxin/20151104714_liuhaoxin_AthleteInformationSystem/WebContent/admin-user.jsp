<%--  管理员显示所有用户信息的页面 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<title>Insert title here</title>
</head>
<body>

<table border="2" cellpadding="0" cellspacing="0" style="font-size: 40px"; width="100%" height="100%">
				<thead>
					<tr >
						
						<th >用户名</th>
						<th >密码</th>
						<th >邮箱</th>
						<th >联系方式</th>
						<th>  权限（0代表普通用户，1代表记录员）</th>
						<th>修改用户的权限为0</th>
						<th>修改用户的权限为1</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${userdata}" var="w">
					<tr align="center">
					<td>${w.username}</td>
					<td>${w.pwd}</td>
					<td>${w.email}</td>
					<td>${w.phone}</td>
					<td>${w.permission}</td>
					<td><form action="PermissionUpload" method="post">
					<input type="hidden" name="uid" value=${w.uid}>
					<input type="hidden" name="qx" value="0">
					<input type="submit" style="width: 150px" value="修改权限为0"></form></td>
					<td><form action="PermissionUpload" method="post">
					<input type="hidden" name="uid" value=${w.uid}>
					<input type="hidden" style="width: 150px" name="qx" value="1">
					<input type="submit" value="修改权限为1"></form></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>


</body>
</html>
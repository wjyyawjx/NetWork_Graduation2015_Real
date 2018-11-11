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

<table border="2" cellpadding="0" cellspacing="0" style="font-size: 40px"; width="100%" height="156">
				<thead>
					<tr >
						
						<th >用户名</th>
						<th >密码</th>
						<th >邮箱</th>
						<th >联系方式</th>
						<th>  权限（0代表普通用户，1代表记录员）</th>
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
				
					</tr>
					</c:forEach>
				</tbody>
			</table>


</body>
</html>
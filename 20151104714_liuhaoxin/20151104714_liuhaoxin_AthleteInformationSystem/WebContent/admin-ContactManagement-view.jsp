<%--  管理员查看所有的用户申请（忘记密码和用户受限）  --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<title>Insert title here</title>
</head>
<body><div align="center">

<table border="2" cellpadding="0" cellspacing="0"  >
				<thead>
					<tr>
						<th width="60%" >情况说明</th>
						<th width="10%" >申请人</th>
						<th width="10%" >联系方式</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${userdata}" var="w">
					<tr>
					<td>${w.reason} </td>
					<td>${w.username} </td>
					<td>${w.phone}</td>
					</tr>
					</c:forEach>
				</tbody>
				
</body>
</html>
<%--普通用户进行申请，通过后可以成为记录员,并且显示自己已经提交的申请 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<title>Insert title here</title>

<%
	String name = (String) session.getAttribute("user");

%>
</head>
<body><div align="center">
<table>
<tr>
<td>
<form action="AddToApplyFor" method="post">
		<textarea name="reason" rows="10" cols="30">填写申请理由</textarea>
		<input type="hidden" name="username" value=<%=name %>>
		<br><br><br>
		<input type="submit" value="提交">
	</form>
</td>
<td style="width: 100px"></td>
<td>
<h1>我的申请</h1>
<table border="2" cellpadding="0" cellspacing="0" style="widows: 300px">
				<thead>
					<tr>
						<th >状态</th>
						<th >申请理由</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${gel}" var="w">
					<tr>
 					<td>${w.state}</td>
					<td>${w.reason} </td>
					</form>
					</tr>
					</c:forEach>
				</tbody>
</td>
<tr>
</table>
</div>

</body>
</html>
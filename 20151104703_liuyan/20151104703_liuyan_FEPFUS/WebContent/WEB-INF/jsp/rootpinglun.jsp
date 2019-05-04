<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="2" width="70%" height="70%">
				<tr align="center">
					<th colspan="6" style="color: black">评论管理</th>
				</tr>
				<tr align="center">
				   <td>评论人</td>
				   <td>邮箱</td>
				   <td>电话</td>
				   <td>内容</td>
				   <td>账号</td>
				</tr>
				<c:forEach items="${list}" var="pinglun">
				<tr style="align:center;">
				   <tr>
						<th style="color: black"><input type="text" value="${pinglun.p_name}"readonly="readonly"></th>
						
						<th style="color: black"><input type="text" value="${pinglun.p_email}"readonly="readonly"></th>
						
						<th style="color: black"><input type="text" value="${pinglun.p_phone}"readonly="readonly"></th>
							
						<th style="color: black"><input type="text" value="${pinglun.p_content}"readonly="readonly"></th>
					    
					    <th style="color: black"><input type="text" value="${pinglun.u_user}"readonly="readonly"></th>
					</tr>
				</c:forEach>
			</table>
</body>
</html>
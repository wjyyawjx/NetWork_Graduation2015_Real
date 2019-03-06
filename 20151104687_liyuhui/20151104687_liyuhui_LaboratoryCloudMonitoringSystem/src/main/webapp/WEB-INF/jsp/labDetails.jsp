<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>实验室详细状态</title>
</head>
<body>
	<table>
					<tr>
						<td>id</td>
						<td>用户名称</td>
						<td>用户密码</td>
						<td>加密盐</td>
						<td>角色</td>
						<td>编辑</td>
						<td>删除</td>
					</tr>
					<c:forEach items="${lab}" var="l">
						<tr>
							<td>${l.lId}</td>
							<td></td>
							<td></td>
							<td></td>
							<td><c:forEach items="${lab_user[l]}" var="lu">
                        			${lu.name} 
                        			<br>
								</c:forEach>
							</td>
							<td><a href="editUser?id=${u.id}">编辑</a></td>
							<td><a href="deleteUser?id=${u.id}">删除</a></td>
						</tr>
					</c:forEach>
	</table>
</body>
</html>
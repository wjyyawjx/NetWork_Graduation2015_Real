<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="bs" uri="http://bs.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>评价信息</title>
</head>
<body>

	<p>商品的评价信息</p>
	<form class="am-form"
		action="${pageContext.request.contextPath }/findeval.action"
		method="post">
		<table class="am-table am-table-striped am-table-hover table-main" border="1px">
			<thead>
				<tr>
					
					<th>用户</th>
					<th>时间</th>
					<th>评价信息</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.rows_p}" var="rows_p">
					<tr>
						
						<td>${rows_p.u_name}</td>
						<td>${rows_p.p_time}</td>
						<td>${rows_p.information}</td>
						
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<div>
			<bs:page
				url="${pageContext.request.contextPath }/findeval.action" />
		</div>
	</form>
</body>
</html>
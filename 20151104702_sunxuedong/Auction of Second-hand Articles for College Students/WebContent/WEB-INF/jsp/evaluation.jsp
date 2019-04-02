<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="bs" uri="http://bs.com/common/"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>评价信息</title>
</head>
<body>
	
		<p>商品的评价信息</p>
		<c:forEach items="${page.rows_p}" var="row_p" varStatus="status">
		<h2>${rows_p.u_name}123</h2>
			<div class="review-item-submitted">
				
				<strong>${rows_p.u_name}</strong> <em>${rows_p.p_time}</em>
				<div class="rateit" data-rateit-value="5"
					data-rateit-ispreset="true" data-rateit-readonly="true"></div>
			</div>
			<div class="review-item-content">
				<p>${rows_p.information}</p>
			</div>
		</c:forEach>
		<div class="col-md-12 text-right">
			<bs:page
				url="${pageContext.request.contextPath }/findeval.action" />
		</div>
</body>
</html>
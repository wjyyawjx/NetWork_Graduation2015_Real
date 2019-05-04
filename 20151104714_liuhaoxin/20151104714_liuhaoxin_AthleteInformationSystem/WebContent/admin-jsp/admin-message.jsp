<%--  管理员用户查看管理所有的留言  --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">

<title>Insert title here</title>
<script type="text/javascript">
function myFunction(){
	var b=event.target.id;
	var r=confirm("确定删除此条信息？");
	if (r==true){
		window.location.href="AdminMessageDelete?mid="+b;
	}
	else{
		alert("您取消了删除")
	}
	
}
</script>
</head>
<body>
	<table border="2" cellpadding="0" cellspacing="0"
		style="font-size: 40px" width="100%" height="100%">
		<thead>
			<tr>
				<th>用户</th>
				<th>留言</th>
				<th>删除留言</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${mes}" var="w">
				<tr align="center">
					<td>${w.username}</td>
					<td>${w.message}</td>
					<td>
					<input type="submit" id=${w.mid} style="width: 150px" onclick="myFunction()"  value="删除">
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
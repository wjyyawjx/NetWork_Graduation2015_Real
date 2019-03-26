<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网站主页</title>
</head>
<body>
<div class="all" style="width:100%;height:30px">
	<div class="top" style="width:100%;height:30px;float:center">
		<table width=100%>
			<tr>
        		<td>欢迎你:${sessionScope.username }</td>
            	<td><a href="rejister.jsp">免费注册</a></td>
            	<td>个人信息</td>
            	<td>我的订单</td>
            	<td>购物车</td>
   				<td>信息反馈</td>
            	<td><a href="login.jsp">登录</a></td>
        	</tr>
		</table>
	</div>
</div>

</body>
</html>
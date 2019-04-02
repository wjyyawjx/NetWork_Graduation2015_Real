<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="ActivityServlet" method="post">
			<div align="center">
				活动名称：<input name="actname" id="actname" type="text" />
			</div>
			<div align="center">
				简介：<textarea style="width:100%;height:300px;" name="des" id="des"></textarea>
			</div>
			<br/>
			<div align="center">
				<input type="submit" class="login_button" value="添加"></input>
			</div>
			<br/>	
	</form>
			<form action="main.jsp">
				<div align="center">
					<input type="submit" class="login_button" value="返回主页"></input>
				</div>
			</form>
</body>
</html>
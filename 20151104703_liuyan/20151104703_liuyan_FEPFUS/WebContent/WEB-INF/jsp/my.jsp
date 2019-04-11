<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<title>Insert title here</title>

</head>
<body>
	<br>

	<br>

	<br>
	<form action="">
	<table border="2" cellpadding="0" cellspacing="0"
		style="font-size: 20px"  width="100%" height="100%">

		<tr>
			<td style="width: 20%">
			<img style="width: 300px ;height: 200px" alt="没有图片"  src="${USER_SESSION.p_img}" >
				</td>
				
			<td>
				
				姓名:<input id="u_name" type="text" name="u_name" value="${USER_SESSION.u_name}" />
				<br>
				电话:<input id="u_phone" type="text" name="u_phone" value="${USER_SESSION.u_phone}" />
				<br>
				邮箱:<input id="u_email" type="email" name="u_email" value="${USER_SESSION.u_email}" />
				<br>
				简介:<br><textarea name="message"  rows="7" cols="60" >${USER_SESSION.u_message}
</textarea></td>

			
		</tr>
	</table>
	  <div align="center"><input type="submit" value="修改信息" /></div> 
	</form>
</body>
</html>
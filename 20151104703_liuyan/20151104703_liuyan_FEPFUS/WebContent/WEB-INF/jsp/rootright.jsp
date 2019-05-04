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
	<c:forEach items="${list}" var="listuser">
	<form action="${pageContext.request.contextPath}/updatejd.action" method="post">
	<table border="2" cellpadding="0" cellspacing="0"
		style="font-size: 20px"  width="100%" height="100%">

		<tr>
			<td style="width: 20%">
			<img style="width: 300px ;height: 200px" alt="没有图片"  src="${listuser.p_img}" >
				</td>
				
			<td>
				姓&nbsp;&nbsp;&nbsp;&nbsp;名:<input id="u_name" type="text" readonly="readonly" name="u_name" value="${listuser.u_name}" />
				<br>
				电&nbsp;&nbsp;&nbsp;&nbsp;话:<input id="u_phone" type="text" readonly="readonly" name="u_phone" value="${listuser.u_phone}" />
				<br>
				邮&nbsp;&nbsp;&nbsp;&nbsp;箱:<input id="u_email" type="email" readonly="readonly" name="u_email" value="${listuser.u_email}" />
				<br>
				类&nbsp;&nbsp;&nbsp;&nbsp;型:<input id="u_type" type="text" readonly="readonly" name="u_type" value="${listuser.u_type}" />
				<br>
				图片路径:<input id="p_img" type="text" readonly="readonly" name="p_img" value="${listuser.p_img}" />
				<br>
				真实路径:<input id="p_dirpath" type="text" readonly="readonly" name="p_dirpath" value="${listuser.p_dirpath}" />
				<br>
				权&nbsp;&nbsp;&nbsp;&nbsp;限:<input id="u_Jurisdiction" type="text" readonly="readonly" name="u_Jurisdiction" value="${listuser.u_Jurisdiction}" />
				<br>
				简&nbsp;&nbsp;&nbsp;&nbsp;介:<br><textarea name="u_message" readonly="readonly"  rows="7" cols="60" >${listuser.u_message}
</textarea></td>

			
		</tr>
	</table>
	  <div align="center"><input type="submit" value="修改权限" /></div> 
	</form>
	</c:forEach>
</body>
</html>
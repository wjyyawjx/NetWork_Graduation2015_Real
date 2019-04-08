<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.qst.service.RecommendServiceimp"%>
<%@page import="com.qst.service.RecommendService"%>
<%@page import="com.qst.bean.RecommendBean"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改商品信息</title>
<link href="css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="jquery-3.2.1.js"></script>
<script type="text/javascript">
	function check() {
		for (var i = 0; i < document.form1.elements.length - 1; i++) {
			if (document.form1.elements[i].value == "") {
				alert("当前表单不能有空项");
				document.form1.elements[i].focus();
				return false;
			}
		}
		return true;

	}

	function show() {
		var fileTag = document.getElementById('file');
		fileTag.onchange = function() {
			var file = fileTag.files[0];
			var fileReader = new FileReader();
			fileReader.onloadend = function() {
				if (fileReader.readyState == fileReader.DONE) {
					document.getElementById('img').setAttribute('src',
							fileReader.result);
				}
			}
			fileReader.readAsDataURL(file);
		}
	}
</script>
</head>
<body>
	<h2>修改商品信息</h2>
	<form action="../Recommend?opr=modifyrec" method="post"
		enctype="multipart/form-data">
		<table id="recDetailList">
			<%
				int comid = Integer.parseInt(request.getParameter("comid"));

				request.getSession().setAttribute("recId", comid);
				RecommendService recommendService = new RecommendServiceimp();
				RecommendBean rec = new RecommendBean();
				rec.setComid(comid);
				rec = recommendService.getRecommendMoreInfo(rec);
			%>
			<tr>
				<img src="${pageContext.request.contextPath}/image/preview.jpg" id="img" style="width: 80px; height: 80px;" />
			</tr>
			<tr>
				<td>图片上传</td>
				<td><input type="file" id="photo" name="photoupload"
					onclick="show()" /></td>
			</tr>
			<tr>
				<td>商品名：</td>
				<td><input type="text" name="recName" id="recName" value="<%=comid%>"></td>
			</tr>
			<tr>
				<td>价格：</td>
				<td><input type="text" name="price" value="<%=rec.getPrice()%>"></td>
			</tr>
			<td><input type="hidden" name="recComid" value="<%=comid%>"></td>
			<tr>
				<td colspan="2" style="text-align: center"><input type="submit"
					value="提交信息"></td>
			</tr>
		</table>
	</form>

</body>
</html>
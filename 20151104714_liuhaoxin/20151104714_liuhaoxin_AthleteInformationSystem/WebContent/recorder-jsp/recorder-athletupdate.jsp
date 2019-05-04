<%--  记录员修改运动员信息 --%>
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
<form action="RecorderJView">
		<input  type="submit"  style="width: 300px"  value="返回信息显示页面">
	</form>
	<form action="RecorderUpdate" method="post">
	<table>
		<h4>
				<tr>
					<td>姓名：</td>
					<td><input type="text" name="athletusername"
						value="${w.athletusername}" required=""></td>
				</tr>
				<tr>
					<td>学院：</td>
					<td><input type="text" name="college" value="${w.college}"
						required=""></td>
				</tr>
				<tr>
					<td>班级：</td>
					<td><input type="text" name="theclass" value="${w.theclass}"
						required=""></td>
				</tr>
				<tr>
					<td>比赛项目：</td>
					<td><input type="text" name="events" value="${w.events}"
						required=""></td>
				</tr>
				<tr>
					<td>成绩：</td>
					<td><input type="text" name="results" value="${w.results}"
						required=""></td>
				</tr>

				<tr>
					<td>排名：</td>
					<td><input type="text" name="ranking" value="${w.ranking}"
						required=""></td>
				</tr>
				<tr>
					<td><input type="hidden" name="tid" value=${w.tid}></td>
					<td><input type="submit" value="修改"></td>
				</tr>
				</h4>
			</table>
		
	</form>

</body>
</html>
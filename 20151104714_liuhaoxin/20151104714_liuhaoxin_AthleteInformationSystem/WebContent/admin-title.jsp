<%--  管理员的标题页面 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<title>Insert title here</title>

</head>
<script>
	var n = 0;
</script>
<script type="text/javascript">
	function clicke() {

		switch (n) {
		case 0:
			document.getElementById("tishi").style.background = "#FF0000";
			document.getElementById("tishi1").style.background = "#FF0000";
			document.getElementById("tishi2").style.background = "#FF0000";
			document.getElementById("tishi3").style.background = "#F7FE2E";
			document.getElementById("tishi4").style.background = "#F7FE2E";
			document.getElementById("tishi5").style.background = "#F7FE2E";
			n = 1;

			break;
		case 1:
			document.getElementById("tishi").style.background = "#F7FE2E";
			document.getElementById("tishi1").style.background = "#FF0000";
			document.getElementById("tishi2").style.background = "#FF0000";
			document.getElementById("tishi3").style.background = "#FF0000";
			document.getElementById("tishi4").style.background = "#F7FE2E";
			document.getElementById("tishi5").style.background = "#F7FE2E";
			n = 2;

			break;
		case 2:
			document.getElementById("tishi").style.background = "#F7FE2E";
			document.getElementById("tishi1").style.background = "#F7FE2E";
			document.getElementById("tishi2").style.background = "#FF0000";
			document.getElementById("tishi3").style.background = "#FF0000";
			document.getElementById("tishi4").style.background = "#FF0000";
			document.getElementById("tishi5").style.background = "#F7FE2E";
			n = 3;

			break;
		case 3:
			document.getElementById("tishi").style.background = "#F7FE2E";
			document.getElementById("tishi1").style.background = "#F7FE2E";
			document.getElementById("tishi2").style.background = "#F7FE2E";
			document.getElementById("tishi3").style.background = "#FF0000";
			document.getElementById("tishi4").style.background = "#FF0000";
			document.getElementById("tishi5").style.background = "#FF0000";
			n = 4;

			break;
		case 4:
			document.getElementById("tishi").style.background = "#FF0000";
			document.getElementById("tishi1").style.background = "#F7FE2E";
			document.getElementById("tishi2").style.background = "#F7FE2E";
			document.getElementById("tishi3").style.background = "#F7FE2E";
			document.getElementById("tishi4").style.background = "#FF0000";
			document.getElementById("tishi5").style.background = "#FF0000";
			n = 5;
			break;
		case 5:
			document.getElementById("tishi").style.background = "#FF0000";
			document.getElementById("tishi1").style.background = "#FF0000";
			document.getElementById("tishi2").style.background = "#F7FE2E";
			document.getElementById("tishi3").style.background = "#F7FE2E";
			document.getElementById("tishi4").style.background = "#F7FE2E";
			document.getElementById("tishi5").style.background = "#FF0000";
			n = 0;

			break;

		}

	}
	setInterval("clicke()", 150);
</script>
<body>

	<%
		String name = (String) session.getAttribute("user");
	%>

<body>
	<table style="width: 100%">
		<tr>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>

	<table align="center" width="100%" border="0">
		<tr>
			<td width="25%"></td>
			<td width="61%" rowspan="2"><span id="tishi"
				style="font-size: 80px;">管</span> <span id="tishi1"
				style="font-size: 80px;">理</span> <span id="tishi2"
				style="font-size: 80px;">会</span> <span id="tishi3"
				style="font-size: 80px;">的</span> <span id="tishi4"
				style="font-size: 80px;">后</span> <span id="tishi5"
				style="font-size: 80px;">台</span></td>
			<td rowspan="2"></td>
		</tr>
		<tr>
			<td style=""><p>
					
					<%=name%>管理员你好
				</p>
<form target="_parent" action="Exit" method="post">
		<button  type="submit" >退出</button></form>
				</div></td>

		</tr>
	</table>
</body>
</html>
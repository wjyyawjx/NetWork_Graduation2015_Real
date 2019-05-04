<%--  记录员管理运动员信息 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<title>Insert title here</title>
<script type="text/javascript">
function RecorderDelete(){
	var b=event.target.id;
	var r=confirm("确定删除此名运动员的信息？");
	if (r==true){
		window.location.href="RecorderDelete?tid="+b;
	}
	else{
		alert("您取消了删除")
	}
	
}

function RecorderUpdateJump(){
	var b=event.target.id;
	window.location.href="RecorderUpdateJump?tid="+b;
}


function tianjia() {
	window.location.href='recorder-jsp/recorder-athletadd.jsp';
	
}
</script>
</head>
<body>
<input type="submit"  style="width: 150px" onclick="tianjia()"  value="添加运动员信息">
	<table border="2" cellpadding="0" cellspacing="0"
		style="font-size: 40px" width="100%" height="100%">
		<thead>
			<tr>          
				<th>运动员名字</th>
				<th>学院</th>
				<th>班级</th>
				<th>项目</th>
				<th>成绩</th>
				<th>排名</th>
				<th>修改</th>
				<th>删除</th>
			</tr>
		</thead>
		
			<c:forEach items="${mea}" var="w">
			
			<tr align="center">
				
				<td>${w.athletusername}</td>
				<td>${w.college}</td>
				<td>${w.theclass}</td>
				<td>${w.events}</td>
				<td>${w.results}</td>
				<td>${w.ranking}</td>
				<td>
				<input type="submit" id=${w.tid} style="width: 150px" onclick="RecorderUpdateJump()"  value="修改">
					</td>
				<td>
					<input type="submit" id=${w.tid} style="width: 150px" onclick="RecorderDelete()"  value="删除">
					</td>
				
			</tr>
			
			</c:forEach>
	</table>
</body>
</html>
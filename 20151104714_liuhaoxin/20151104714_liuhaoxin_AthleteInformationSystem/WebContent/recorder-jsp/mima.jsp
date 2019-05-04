<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/style.css" type="text/css" media="all">
<title>Insert title here</title>
	<script src="../js/jquery.min.js"></script>
<script src="../js/jquery.hDialog.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.demo0').hDialog({title: '添加新运动员信息',height: 300});
	$('.demo0').hDialog({closeBg: '#FF0000'});
	$('.submitBtn').click(function() {
		 var b=event.target.id;
		var pwd=$("#pwd").val();
		var pwd1=$("#pwd1").val();
		if(pwd == '' && pwd1== '')
		{
			alert('密码不能为空'); 
		}
		else if(pwd != pwd1)
			{
				alert('俩次输入的密码不一致');
			}
		else if(pwd == pwd1)
			{
			alert('密sd为空'); //window.location.href="../addServlet?aid="+"asdsad";
			}
		else{
			alert('密23232323为空'); 
		}
	});
	
});
</script>
</head>
<body>

<input type="submit" class="demo0"  value="修改"  />
<div id="HBox">
			<form action="RecorderAdd" method="post" onsubmit="return false;">						
		<input type="text" id="athletusername" placeholder="运动员名字" required="" >
		<input type="text" id="theclass" placeholder="班级" required="">
		<input type="text" id="events" placeholder="项目" required="">
		<input type="text" id="results" placeholder="成绩" required="">
		<input type="text" id="ranking" placeholder="排名" required="">
			<input type="submit" id ="sd" class="submitBtn"  value="确认修改"  />
				
			</form>
		</div>

</body>
</html>
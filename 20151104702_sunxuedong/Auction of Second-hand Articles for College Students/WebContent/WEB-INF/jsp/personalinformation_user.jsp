<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
<link href="css/normalize.css" rel="stylesheet" />
<link href="css/jquery-ui.css" rel="stylesheet" />
<link href="css/jquery.idealforms.min.css" rel="stylesheet"
	media="screen" />
<style type="text/css">
body {
	font: normal 15px/1.5 Arial, Helvetica, Free Sans, sans-serif;
	color: #222;
	background: url(pattern.png);
	overflow-y: scroll;
	padding: 60px 0 0 0;
}

#my-form {
	width: 755px;
	margin: 0 auto;
	border: 1px solid #ccc;
	padding: 3em;
	border-radius: 3px;
	box-shadow: 0 0 2px rgba(0, 0, 0, .2);
}

#comments {
	width: 350px;
	height: 100px;
}
</style>
<style>
.box {
	width: 50%;
	margin-top: 10%;
	margin: auto;
	padding: 28px;
	height: 600px;
	border: 1px #111 solid;
	display: none; /* 默认对话框隐藏 */
}

.box.show {
	display: block;
}

.box .x {
	font-size: 18px;
	text-align: right;
	display: block;
}

.box input {
	width: 80%;
	font-size: 18px;
	margin-top: 18px;
}
</style>
</head>
<body>
	<form>
		<div>
			<label>姓名:</label><a>${USER_SESSION.username}</a>
		</div>
		<div>
			<label>性别:</label><a>${USER_SESSION.sex}</a>
		</div>
		<div>
			<label>电话:</label><a>${USER_SESSION.phone}</a>
		</div>
		<div>
			<label>Q Q:</label><a>${USER_SESSION.qq}</a>
		</div>
		<div>
			<label>学校:</label><a>${USER_SESSION.university}</a>
		</div>
		<div>
			<label>学院:</label><a>${USER_SESSION.college}</a>
		</div>
		<div>
			<label>地址:</label><a>${USER_SESSION.adreess}</a>
		</div>
		<input type="button" onClick="msgbox(1)" value="修改">
		<script>
			function msgbox(n) {
				document.getElementById('inputbox').style.display = n ? 'block'
						: 'none'; /* 点击按钮打开/关闭 对话框 */
			}
		</script>





	</form>
	<div id='inputbox' class="box">
		<form class="am-form"
			action="${pageContext.request.contextPath }/editpersoninfo.action"
			method="post">
			<a class='x' href='' ; onclick="msgbox(0); return false;">关闭</a>
			<div align="center" style="display: none">
				id： <input type="text" style="width: 200px; height: 30px" name="id"
					id="id" placeholder="请修改用户名" onblur="lostcode()"
					value="${USER_SESSION.id}" readonly="readonly">
			</div>
			<div align="center">
				用户名： <input type="text" style="width: 200px; height: 30px"
					name="username" id="username" placeholder="请修改用户名"
					onblur="lostcode()" value="${USER_SESSION.username}">
			</div>
			<br>
			<div align="center" style="display: none">
				密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码: <input type="password"
					name="password" id="password" style="width: 200px; height: 30px"
					value="${USER_SESSION.password}">
			</div>
			<br>
			<div align="center" style="display: none">
				性别： <label><input name="sex" id="sex"
					value="${USER_SESSION.sex}" /></label>
			</div>
			<br>
			<div align="center">
				联系方式: <input type="text" name="phone" id="phone"
					onkeyup="value=value.replace(/[^\d]/g,'')" maxlength='11'
					placeholder="请输入数字" style="width: 200px; height: 30px"
					placeholder="请修改手机号" value="${USER_SESSION.phone}">
			</div>
			<br>
			<div align="center">
				Q&nbsp;&nbsp;&nbsp;&nbsp;Q&nbsp;&nbsp;: <input type="text" name="qq"
					id="qq" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength='11'
					style="width: 200px; height: 30px" placeholder="请修改QQ"
					value="${USER_SESSION.qq}">
			</div>
			<br>
			<div align="center">
				学校名称: <input type="text" name="university" id="university"
					style="width: 200px; height: 30px" placeholder="请修改学校"
					value="${USER_SESSION.university}">
			</div>
			<br>
			<div align="center">
				所属学院： <input type="text" name="college" id="college"
					style="width: 200px; height: 30px" placeholder="请修改学院"
					value="${USER_SESSION.college}">
			</div>
			<br>
			<div align="center">
				家庭地址: <input type="text" name="adreess" id="adreess"
					style="width: 200px; height: 30px" placeholder="请修改家庭地址"
					value="${USER_SESSION.adreess}">
			</div>
			<br> <input type="submit" value="确定">
		</form>
	</div>
	<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="js/jquery.idealforms.js"></script>
	<script type="text/javascript"></script>
</body>
</html>
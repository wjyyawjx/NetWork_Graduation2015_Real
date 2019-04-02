<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>大学生二手物品租赁系统登陆界面</title>
<link rel="stylesheet" type="text/css" href="css/style2.0.css">
<script>
			function check(){
    			var username = $("#username").val();
    			var password = $("#password").val();
    			var password1 = $("#pwd").val();
    			if(password=="" || username==""){
    				alert("用户名或密码为空！");
        			return false;
   				} 
    			if(password!=password1){
    				alert("两次密码不一致！");
        			return false;
    			}
    			
		</script>
</head>
<body>


	<div class="tyg-div-denglv">
		<div align="center">

			<form action="${pageContext.request.contextPath }/add.action"
				method="post" onsubmit="return check()">
				<font color="red"> <%-- 提示信息--%> <span id="message">${msg_zc}</span></font>
				<div align="center">
					用户名： <input type="text" style="width: 200px; height: 30px"
						name="username" id="username" placeholder="请输入用户名" required=""
						onblur="lostcode()">
				</div>
				<br>
				<div align="center">
					密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码: <input type="password"
						name="password" id="password" style="width: 200px; height: 30px"
						placeholder="请输入密码" required="">
				</div>
				<br>
				<div align="center">
					确认密码： <input type="password" name="pwd" id="pwd"
						style="width: 200px; height: 30px" placeholder="请再次输入密码"
						required="">
				</div>
				<br>
				<div align="center">
					联系方式: <input type="text" name="phone" id="phone"
						onkeyup="value=value.replace(/[^\d]/g,'')" maxlength='11'
						placeholder="请输入数字" style="width: 200px; height: 30px"
						placeholder="请输入手机号" required="">
				</div>
				<br>
				<div align="center">
					性别： <label><input name="sex" type="radio" value="男"
						style="width: 30px; height: 30px" />男</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label><input
						name="sex" type="radio" value="女"
						style="width: 30px; height: 30px" />女 </label>
				</div>
				<br>
				<div align="center">
					Q&nbsp;&nbsp;&nbsp;&nbsp;Q&nbsp;&nbsp;: <input type="text"
						name="qq" id="qq" onkeyup="value=value.replace(/[^\d]/g,'')"
						maxlength='11' style="width: 200px; height: 30px"
						placeholder="请输入QQ" required="">
				</div>
				<br>
				<div align="center">
					学校名称: <input type="text" name="university" id="university"
						style="width: 200px; height: 30px" placeholder="请输入学校" required="">
				</div>
				<br>
				<div align="center">
					所属学院： <input type="text" name="college" id="college"
						style="width: 200px; height: 30px" placeholder="请输入学院" required="">
				</div>
				<br>
				<div align="center">
					家庭地址: <input type="text" name="adreess" id="adreess"
						style="width: 200px; height: 30px" placeholder="请输入家庭地址"
						required="">
				</div>
				<br>
				<!-- <div align="center">用户类型：
				<input name="type" type="radio" value="普通用户"  style="width:30px;height:30px"/>普通用户</label></div> -->
				<br>


				<div class="signin-rit">
					<span class="agree-checkbox"> <label class="checkbox">
							<input type="checkbox" name="checkbox">我同意 <a
							class="w3layouts-t" href="terms.html" target="_blank">使用条款</a> 和
							<a class="w3layouts-t" href="privacy.html" target="_blank">
								隐私政策</a>
					</label>
					</span>
				</div>
				<br>
				<button type="submit">注册</button>
			</form>
		</div>
	</div>


	<script type="text/javascript" src="./js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="./js/com.js"></script>
	<!--[if IE 6]>
<script language="javascript" type="text/javascript" src="./script/ie6_png.js"></script>
<script language="javascript" type="text/javascript">
DD_belatedPNG.fix(".png");
</script>
<![endif]-->
</body>
</html>
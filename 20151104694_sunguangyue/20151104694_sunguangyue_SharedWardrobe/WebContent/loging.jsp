<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
        function reLoadCode() {
            var time = new Date();
            document.getElementById("imagecode").src="ImgServlet?id="+time;
        }
</script>
</head>

<body>
<form method="post" action="serlet" >
<div  class="login">
    <div class="box png">
		<div class="logo png"></div>
		<div  class="input">
			<div class="log">
				<div class="name">
					<label>用户名</label><input type="text" value="" class="text" id="username" placeholder="用户名" name="username" tabindex="1">
				</div>
				<div class="pwd">
					<label>密　码</label>
					<input type="password" value="" class="text" id="pwd" placeholder="密码" name="pwd" tabindex="2">
					
					<div>
               <input type="text" class="text" name="checkCode" id="imac" >
                     <a href="javaScript:reLoadCode()" ><img src="ImgServlet" name="imagecode" id="imagecode" alt="验证码" "/>
                    </a>
             </div>
					<input type="submit" class="submit" tabindex="3" value="登录">
					<div class="check"></div>
				</div>
				<div class="tip"></div>
			</div>
		</div>
	</div>

    <div class="air-balloon ab-1 png"></div>
	<div class="air-balloon ab-2 png"></div>
    <div class="footer"></div>
</div>

<script type="text/javascript" src="js/jQuery.js"></script>
<script type="text/javascript" src="js/fun.base.js"></script>
<script type="text/javascript" src="js/script.js"></script>


<!--[if IE 6]>
<script src="js/DD_belatedPNG.js" type="text/javascript"></script>
<script>DD_belatedPNG.fix('.png')</script>
<![endif]-->
</form>
</body>
</html>
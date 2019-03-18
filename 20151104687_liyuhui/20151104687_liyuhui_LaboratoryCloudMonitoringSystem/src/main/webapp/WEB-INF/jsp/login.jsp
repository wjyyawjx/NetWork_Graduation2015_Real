<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">

    <head>

        <meta charset="utf-8">
        <title>登录</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel="stylesheet" href="/assets/css/reset.css">
        <link rel="stylesheet" href="/assets/css/supersized.css">
        <link rel="stylesheet" href="/assets/css/style.css">


        <script>
			function check(){
    			var username = $("#num").val();
    			var password = $("#pwd").val();
    			if(username=="" || password==""){
    				$("#message").text("用户名或密码为空！");
        			return false;
   				}  
    			return true;
			}
		</script>
    </head>

    <body>
		
        <div class="page-container">
        		 
            <h1>登录</h1>
            <br>
            <img src="/assets/img/imnu.jpg" style="width:320px;height:160px">
            <br>
            <font color="red"><span id="message">${msg }</span></font>
            <form action="${pageContext.request.contextPath }/login" method="post" onsubmit="return check()">
                <input type="text" name="num" class="uname" placeholder="学号/工号" >
                <input type="password" name="pwd" class="upwd" placeholder="密码" >
                <button type="submit">登 录</button>
                <div class="error"><span>+</span></div>
            </form>
            <br>
            <a href="${pageContext.request.contextPath }/toregister">新用户注册</a> 
            <br> 
            <a href="${pageContext.request.contextPath }/tofindpwd">忘记密码</a> 
            <br> 
            <br>  
            
        </div>
        <div align="center">李宇辉——毕业设计——实验室云端监管系统</div>

        <!-- Javascript -->
        <script src="/assets/js/jquery-1.8.2.min.js"></script>
        <script src="/assets/js/supersized.3.2.7.min.js"></script>
        <script src="/assets/js/supersized-init.js"></script>
        <script src="/assets/js/scripts.js"></script>

    </body>

</html>
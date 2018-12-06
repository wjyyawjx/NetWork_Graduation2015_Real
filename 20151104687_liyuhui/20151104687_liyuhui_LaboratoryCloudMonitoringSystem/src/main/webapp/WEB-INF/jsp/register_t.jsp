<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">

    <head>

        <meta charset="utf-8">
        <title>注册新账户</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel="stylesheet" href="assets/css/reset.css">
        <link rel="stylesheet" href="assets/css/supersized.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script>
			function check(){
    			var name = $("#name").val();
    			var tel = $("#tel").val();
    			var email = $("#email").val();
    			if(name==""){
    				alert("姓名为空！");
        			return false;
   				} 
    			if(tel==""){
    				alert("电话为空！");
        			return false;
   				} 
    			if(email==""){
    				alert("邮箱为空！");
        			return false;
   				} 	
    			return true;
			}
		</script>
    </head>

    <body>

        <div class="page-container">
            <h1>尊敬的老师：请完善您的信息！</h1>
            <font color="red"><span id="message">${msg }</span></font>
            <form action="${pageContext.request.contextPath }/register_t.action" method="post" onsubmit="return check()">
                <input type="text" name="name" class="uname" placeholder="姓名">
                <input type="text" name="tel" class="uname" placeholder="联系方式">
                <input type="text" name="email" class="uname" placeholder="电子邮箱">
                <button type="submit">完成</button>
                <div class="error"><span>+</span></div>
            </form>
        </div>
        <br><br><br><br><br>
        <div align="center">李宇辉——毕业设计——实验室云端监管系统</div>

        <!-- Javascript -->
        <script src="assets/js/jquery-1.8.2.min.js"></script>
        <script src="assets/js/supersized.3.2.7.min.js"></script>
        <script src="assets/js/supersized-init.js"></script>
        <script src="assets/js/scripts.js"></script>

    </body>

</html>
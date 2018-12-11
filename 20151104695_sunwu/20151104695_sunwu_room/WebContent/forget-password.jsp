<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>忘记密码</title>
 <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.css">
    
    <link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">

    <script src="lib/jquery-1.7.2.min.js" type="text/javascript"></script>

    <!-- Demo page code -->

    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
 
<link rel="stylesheet" href="css/jquery.slider.css"/>

    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="js/jquery.slider.min.js"></script>
    <script>

    var ok1=false;
            $("#slider1").slider({
                width: 340, // width
                height: 40, // height
                sliderBg: "rgb(134, 134, 131)", // 滑块背景颜色
                color: "#fff", // 文字颜色
                fontSize: 14, // 文字大小
                bgColor: "#33CC00", // 背景颜色
                textMsg: "按住滑块，拖拽验证", // 提示文字
                successMsg: "验证通过了哦", // 验证成功提示文字
                successColor: "red", // 滑块验证成功提示文字颜色
                time: 400, // 返回时间
                callback: function (result) { // 回调函数，true(成功),false(失败)
                	 if(result && ok1){		 
 		 
                		   $("#validateSubmit").html('<input type="submit" name="submit" class="regsub" value="下一步" " id="submit" >');
                          
                	   }
                }
            });

            $(function(){	                    
            	//邮箱验证
            	$("#email").blur(function(){	
            		 //获取id对应的元素的值，去掉其左右的空格
            		 var email = $.trim($('#email').val());	 
            		 //验证邮箱格式的js正则表达式
            		 var isEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            		 //清空显示层中的数据    	 
            		 $("#emailMess").html("");	
            		 if(email == ""){
            			   $("#emailMess").html("<img src='img/icon/error.ico'>"+"邮箱不能为空!");		   
            		 }
            		 else if(!(isEmail.test(email))){
            			   $("#emailMess").html("<img src='img/icon/error.ico'>"+"邮箱格式错误！");		  
            		 }
            		 else{
            	               //此处可以操作向后台发送json数据，然后返回验证结果
            			 $("#emailMess").html("<img src='img/icon/yes.ico'>");	
            			 ok1=true;
            	      }
            	});
            	 
            	//提交按钮,所有验证通过方可提交
            	 
            	});
            	<!--邮箱验证-->
         
    </script>

 
  </head>


  <body class=""> 
  <!--<![endif]-->
    
    <div class="navbar">
        <div class="navbar-inner">
                <ul class="nav pull-right">
                    
                </ul>
                <a class="brand" href="reset-password"><span class="first"></span> <span class="second">重置密码</span></a>
        </div>
    </div>
     
        <div class="row-fluid">
    <div class="dialog">
        <div class="block">
            <p class="block-heading">重置密码</p>
            <div class="block-body">
               
                <form  action="ForgetServlet" method="post">
              	    <label>请输入用户名</label>
                    <input type="text" class="span12" name="forget-username"></input>
                    <label>请输入邮箱账号</label>
                    <input type="text" class="span12" name="forget-email"></input>
                    <label>请输入新密码</label>
                    <input type="password" class="span12" name="forget-password"></input>
                    
   
   

                    
                 <button type="submit" class="btn btn-primary pull-right" >确定</button>  
                    <div class="clearfix"></div>
                </form>
            </div>
        </div>
        <a href="sign-in.jsp">返回登录</a>
    </div>
</div>


    
<script src="js/jigsaw.js"></script>
<script>
  jigsaw.init(document.getElementById('captcha'), function () {
    document.getElementById('msg').innerHTML = '登录成功！'
  })
</script>

    <script src="lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
    </script>
    
  </body>
</html>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
 <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.css">
    
    <link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">

    <script src="lib/jquery-1.7.2.min.js" type="text/javascript"></script>

    <!-- Demo page code -->

<script>
function check() { //验证用户名字段是否为空
    username= document.form1.username.value;
     if (username==""){
        alert("请输入用户名");
      document.form1.username.focus();
      return false;
   }
    //验证密码字段是否为空
    password = document.form1.password.value;
    if (password == "") {
       alert("请输入登陆密码");
       document.form1.password.focus();
       return false;
       }
   }
</script>


<script type="text/javascript">
	function check(temp){
		var re = /^1\d{10}$/
		if(!re.test(temp.value)){
			alert("手机号码格式不正确，请重新输入!");
			return;
		}
	}

 function disable()
  {
  document.getElementById("accept").disabled=true
  alert("确定要取消网站协议吗？");
  }
function enable()
  {
  document.getElementById("accept").disabled=false
  
  } 
  
  
  
if(test!=null&&!test.equlas("")){
}
</script>

<script type="text/javascript">  
                function reg(form){  
                    if(form.username.value == ""){  
                        alert("用户不能为空！");  
                        return false;  
                    }  
                    if(form.password.value == ""){  
                        alert("密码不能为空！");  
                        return false;  
                    }  
                    if(form.email.value == ""){  
                        alert("电子邮箱不能为空！");  
                        return false;  
                    }  
                }  
            </script>  

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


    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
  </head>

  <body class=""> 
  <!--<![endif]-->
    
    <div class="navbar">
        <div class="navbar-inner">
                <ul class="nav pull-right">
                    
                </ul>
                <a class="brand" href="sign-up.jsp"><span class="first"></span> <span class="second">用户注册</span></a>
        </div>
    </div>
    
        <div class="row-fluid">
    <div class="dialog">
        <div class="block">
            <p class="block-heading">用户注册</p>
            <div class="block-body">
                <form action="RegisterServlet" method="post" onsubmit="return reg(this);">
                    <label>用户名</label>
                    <input type="text" class="span12" name="username">
                     <label>手机号</label>
                     <input type="text" name="telephone" class="span12"  onblur="check(this)" >
                     <label>邮箱</label>
                    <input type="email" class="span12" name="email"> 
                    <label>密码</label>
                    <input type="password" class="span12"  name="password">
            
                   <button type="submit"  id="accept"  disabled="true" class="btn btn-primary pull-right" >注册</button> 
                  <input type="checkBox" onclick="if (this.checked) {enable()} else {disable()}">I agree with the<a href="terms-and-conditions.html">Terms and Conditions</a></label>
                        
                    <div class="clearfix"></div>
                </form>
            </div>
        </div>
        <p><a href="sign-in.jsp" >用户登录</a></p>
    
    </div>
</div>


    


    <script src="lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
    </script>
    
  </body>
</html>


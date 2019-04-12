<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> 

<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
        
        <%-- <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" /> --%>
		 <link href="<%=path %>/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
		 <link href="<%=path %>/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
		 <link href="<%=path %>/bootstrap/custom.min.css" rel="stylesheet"/>
		<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
		
        <script language="javascript">
            function check()
            {
                 var real="${sessionScope.yuangong.loginpw}";
                 if(document.formPw.loginpw.value !=real)
                 {
                     alert("原密码不正确");
                     return ;
                 }
                 
                 if(document.formPw.loginpw1.value =="")
                 {
                     alert("新密码不能空");
                     return ;
                 }
                 document.getElementById("indicator").style.display="block";
                 loginService.yuangong_PwEdit(document.formPw.loginpw1.value,callback);
            }
            function callback(data)
            {
                document.getElementById("indicator").style.display="none";
                alert("修改成功,重新登陆后生效");
            }
        </script>
	</head>

	<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#FFFFFF" style="background:rgb(236,240,245); padding-left:20px;">

	<div class="title clearfix">
	<h2 style="font-size:34px; font-weight:bold;">修改密码</h2>
	</div>
	<ul class="breadcrumb" style="">
	<li>
	<i class="fa fa-home"></i>
	<i style="color:rgb(42,63,84); font-style:normal;" id="breadcrumbSeal">操作   /   修改密码</i>
	</li>
	</ul>
	<ul id="myTab" class="nav nav-tabs" style="height:30px;">
	<li class="active"><a href="#home" data-toggle="tab" style="height:30px; line-height:3px;" id="tabTitle">
	修改密码</a>
	</li>
	</ul>
	<div id="myTabContent" class="tab-content" style="margin-top:20px;">
	<div class="tab-pane fade in active" id="home">
	<section class="content">
	<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
	<div class="x_panel">
	<div id="table-box" style="display: block; height:440px;">
	
	
			<form method="post" action="<%=path %>/userPwEdit.action" name="formPw" class="form-horizontal form-label-left">
			
			<div class="form-group">
		<label class="control-label col-xs-3" >用户名:
		</label>
		<div class="col-xs-6">
		 <input type="text" value="${sessionScope.yuangong.loginname }"name="loginname" size="20" disabled="disabled"  class="form-control col-xs-6"/>
		</div>
		</div> 
 	
		 <div class="form-group">
		<label class="control-label col-xs-3" >原密码:
		</label>
		<div class="col-xs-6">
		 <input type="password" name="loginpw" id="loginpw" size="22"class="form-control col-xs-6" />
		</div>
		</div> 
 		
 		 <div class="form-group">
		<label class="control-label col-xs-3" >新密码:
		</label>
		<div class="col-xs-6">
		        <input type="password" id="loginpw1" name="loginpw1" size="22"class="form-control col-xs-6" />
		</div>
		</div> 
				    
		 <div class="col-md-offset-3 col-xs-6">
		 <input type="button" class="btn btn-primary col-md-offset-1" value="修改"onclick="check()" />&nbsp;&nbsp;
		 <input type="reset" class="btn btn-primary col-md-offset-1" value="重置"/>&nbsp;&nbsp;
		 <img id="indicator" src="<%=path %>/img/loading.gif" alt="Loading..." style="display:none"/>
	    </div>
			
		</form>
		</div>
		</div>
		</div>
		</div>
		</section>
		</div>
		</div>
		
   </body>
</html>
		
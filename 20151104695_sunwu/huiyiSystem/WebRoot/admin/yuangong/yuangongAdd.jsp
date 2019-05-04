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
        
       <%--  <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" /> --%>
        
         <link href="<%=path %>/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
        
        <link href="<%=path %>/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
		 <link href="<%=path %>/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
		 <link href="<%=path %>/bootstrap/custom.min.css" rel="stylesheet"/>
        
        
        <script type="text/javascript">
		    function orgAll()
		    {
		       	var strUrl = "<%=path %>/org?type=orgAll";
				var ret = window.open(strUrl,"","width=350px,height=400px,top=400px,left=800px,status=no,directories=yes,scrollbars=yes,resizable=no,model=true");
			    if(ret==undefined)
			    {
			        ret="";
			    }
		
		    }
		    
		    
		    
		    function check()
		    {
		        if(document.getElementById("org_id").value=="")
		        {
		            alert("请选择小组");
		            return false;
		        }
		        if(document.getElementById("name").value=="")
		        {
		            alert("请输入小组姓名");
		            return false;
		        }
		    } 
		    
		    
		</script>
	</head>

	<body background="qy_back.gif" leftmargin="0" topmargin="0"
	marginwidth="0" marginheight="0" bgcolor="#FFFFFF" style="background:rgb(236,240,245); padding-left:20px;">
<div class="title clearfix">
	<h2 style="font-size:34px; font-weight:bold;">添加用户</h2>
	</div>
	<ul class="breadcrumb" style="">
	<li>
	<i class="fa fa-home"></i>
	<i style="color:rgb(42,63,84); font-style:normal;" id="breadcrumbSeal">操作   /   添加用户</i>
	</li>
	</ul>
	<ul id="myTab" class="nav nav-tabs" style="height:30px;">
	<li class="active"><a href="#home" data-toggle="tab" style="height:30px; line-height:3px;" id="tabTitle">
	添加用户</a>
	</li>
	</ul>
	<div id="myTabContent" class="tab-content" style="margin-top:20px;">
	<div class="tab-pane fade in active" id="home">
	<section class="content">
	<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
	<div class="x_panel">
	<div id="table-box" style="display: block; height:440px;">
	
	
			<form action="<%=path %>/yuangong?type=yuangongAdd" name="formAdd" method="post" class="form-horizontal form-label-left">
				    <br />			
			<div class="form-group">
			<label class="control-label col-xs-3">小组：
			</label>
			<div class="col-xs-6">
			<input type="text"  class="form-control col-xs-6"  name="org_id" id="org_id" readonly="readonly" />
			</div>
			 <input type="button"   class="btn btn-primary col-md-offset-1" value="选择小组" onclick="orgAll()"/>
				</div>  
			   	 <div class="form-group">
				<label class="control-label col-xs-3">   学号：
				</label>
				<div class="col-xs-6">
				<input type="text"  class="form-control col-xs-6"  name="bianhao" id="bianhao" />
				</div>
				</div>  
					<div class="form-group">
				<label class="control-label col-xs-3"> 姓名：
				</label>
				<div class="col-xs-6">
				<input type="text"  class="form-control col-xs-6"  name="name" id="name" />
				</div>
				</div> 
				<div class="form-group">
				<label class="control-label col-xs-3">性别： </label>
					<div class="col-xs-6">
					<input type="radio" name="sex"   value="男" checked="checked"/>男
			       &nbsp;&nbsp;&nbsp;&nbsp;
			       <input type="radio" name="sex"  value="女"/>女
					</div>
					</div>
				<div class="form-group">
				<label class="control-label col-xs-3"> 账号：
				</label>
				<div class="col-xs-6">
				<input type="text"  class="form-control col-xs-6"  name="loginname" />
				</div>
				</div> 
				<div class="form-group">
				<label class="control-label col-xs-3"> 密码：
				</label>
				<div class="col-xs-6">
				<input type="text"  class="form-control col-xs-6" name="loginpw"/>
				</div>
				</div> 
				
				<div class="col-md-offset-3 col-xs-6">
				  <input type="submit"  class="btn btn-primary col-md-offset-1" value="注册" onclick="return check()"/>&nbsp; 
			     <input type="reset"  class="btn btn-primary col-md-offset-1" value="重置"/>&nbsp;
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

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
        
        <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
        <link href="<%=path %>/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
        
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
		            alert("请输入员工姓名");
		            return false;
		        }
		    } 
		</script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/images/allbg.gif'>
			<form action="<%=path %>/yuangong?type=yuangongRegister" name="formAdd" method="post" class="form-horizontal form-label-left">
					
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">	
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/images/wbg.gif" class='title'><span>员工注册</span></td>
					    </tr>
					   </table>
					   
					  <div class="title clearfix">
					<h2 style="font-size:34px; font-weight:bold;">员工注册</h2>
					</div>
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
									<select class="form-control" id="conditionType">
									<option  name="sex">男</option>
									<option name="sex">女</option>
									</select>
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
   </body>
</html>

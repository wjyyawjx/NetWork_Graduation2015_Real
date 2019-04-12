<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
		 <link href="bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
		 <link href="bootstrap/custom.min.css" rel="stylesheet"/>
		
        <script language="javascript">
           function yuangongDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/yuangong?type=yuangongDel&id="+id;
               }
           }
           function yuangongAdd()
           {
                 var url="<%=path %>/admin/yuangong/yuangongAdd.jsp";
				 window.location.href=url;
           }
           
           function yuangongQuanxian(id)
           {
                 var strUrl="<%=path %>/admin/yuangong/yuangongQuanxian.jsp?id="+id;
                 var ret = window.open(strUrl,"","width=500px,height=300px,top=400px,left=800px,status=no,directories=yes,scrollbars=yes,resizable=no,model=true");
                  var loop = setInterval(function() {       
                	         if(ret.closed) {      
                	             clearInterval(loop);      
                	             window.location.reload();   
                	         }      
                	     }, 1);     
				 }
       </script>
	</head>


	<body background="qy_back.gif" leftmargin="0" topmargin="0"
	marginwidth="0" marginheight="0" bgcolor="#FFFFFF" style="background:rgb(236,240,245); padding-left:20px;">

<div class="title clearfix">
	<h2 style="font-size:34px; font-weight:bold;">员工管理</h2>
	</div>
	<ul class="breadcrumb" style="">
	<li>
	<i class="fa fa-home"></i>
	<i style="color:rgb(42,63,84); font-style:normal;" id="breadcrumbSeal">操作   /   员工管理</i>
	</li>
	</ul>
	<ul id="myTab" class="nav nav-tabs" style="height:30px;">
	<li class="active"><a href="#home" data-toggle="tab" style="height:30px; line-height:3px;" id="tabTitle">
	员工管理</a>
	</li>
	</ul>
	<div id="myTabContent" class="tab-content" style="margin-top:20px;">
	<div class="tab-pane fade in active" id="home">
	<section class="content">
	<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
	<div class="x_panel">
	<div id="table-box" style="display: block; height:440px;">
	
<form action="<%=path %>/yuangong?type=yuangongSerach" name="formAdd" method="post">
	<input type="radio" name="fangshi" value="按学号搜索" checked="checked"/>按学号搜索
						        &nbsp;&nbsp;&nbsp;&nbsp;
						        <input type="radio" name="fangshi" value="按姓名搜索"/>按姓名搜索
						        &nbsp;&nbsp;&nbsp;&nbsp;
						        <input type="radio" name="fangshi" value="按小组搜索"/>按小组搜索
						        &nbsp;&nbsp;
	<input type="text" name="content"/>&nbsp;&nbsp;
	<input type="submit" value="搜索" />
	</form>
	</center>
	
	<table class="table table-striped table-bordered table-hover table-condensed" width="98%"  border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
		<thead>
		<tr bgcolor="#E7E7E7">
					<td height="14" colspan="100" >&nbsp;员工管理&nbsp;</td>
				</tr>
			<tr >
				<th width="7%" style="text-align:center;">学号</th>
					<th width="7%" style="text-align:center;">姓名</th>
					<th width="7%" style="text-align:center;">性别</th>
					
					<th width="7%" style="text-align:center;">小组</th>
					<th width="7%" style="text-align:center;">账号</th>
					<th width="7%" style="text-align:center;">密码</th>
					<th width="7%" style="text-align:center;">职务</th>
					<th width="7%" style="text-align:center;">操作</th>
			</tr>
		</thead>
		<tbody>
				    
				<c:forEach items="${requestScope.yuangongList}" var="yuangong">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${yuangong.bianhao}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuangong.name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuangong.sex}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuangong.organization.name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuangong.loginname}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuangong.loginpw}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuangong.quanxian}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <a href="#" onclick="yuangongQuanxian(${yuangong.id})" class="pn-loperator" style="color: red">职务管理</a>
						<a href="#" onclick="yuangongDel(${yuangong.id})" class="pn-loperator">删除</a>
						<a href="<%=path %>/yuangong?type=yuangongUpdate1&id=${yuangong.id}";>修改</a>
					</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			
	<div class="ln_solid"></div>
	<div class="form-actions">
	<div class="row">
	<div class="col-md-offset-3 col-xs-6">
	<button type=button class="btn btn-primary col-md-offset-1" onclick='yuangongAdd()'>添加</button>
	</div>
	</div>
	</div>
			
	</div>
	</div>
	</div>
	</div>
	</section>
	</div>
	</div>
		    
		    
	</body>
</html>

<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
 	<link href="<%=path %>/bootstrap/css/bootstrap.min.css" rel="stylesheet"/> 
	 <link href="<%=path %>/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
	 <link href="<%=path %>/bootstrap/custom.min.css" rel="stylesheet"/>

  </head>
  
  <body background="qy_back.gif" leftmargin="0" topmargin="0"
	marginwidth="0" marginheight="0" bgcolor="#FFFFFF" style="background:rgb(236,240,245); padding-left:20px;">

	<div class="title clearfix">
	<h2 style="font-size:34px; font-weight:bold;">审批处理</h2>
	</div>
	<ul class="breadcrumb" style="">
	<li>
	<i class="fa fa-home"></i>
	<i style="color:rgb(42,63,84); font-style:normal;" id="breadcrumbSeal">操作   /   审批处理</i>
	</li>
	</ul>
	<ul id="myTab" class="nav nav-tabs" style="height:30px;">
	<li class="active"><a href="#home" data-toggle="tab" style="height:30px; line-height:3px;" id="tabTitle">
	审批处理</a>
	</li>
	</ul>
	<div id="myTabContent" class="tab-content" style="margin-top:20px;">
	<div class="tab-pane fade in active" id="home">
	<section class="content">
	<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
	<div class="x_panel">
  
    <form method="post"   action="<%=path %>/shiyong?type=shiyongUpdate2" class="form-horizontal form-label-left"> 
	 
     <input type="hidden" name="id" value="${bean.id }"/>
    
		<div class="form-group">
		<label class="control-label col-xs-3" >标题:
		</label>
		<div class="col-xs-6">
		<input type="text" name="title" class="form-control col-xs-6" value="${bean.title }" readonly="readonly"/>
		</div>
		</div>     
    
   		 <div class="form-group">
		<label class="control-label col-xs-3" >会议室名称:
		</label>
		<div class="col-xs-6">
		<input type="text" name="title"  class="form-control col-xs-6" value="${bean.cailiao  }" readonly="readonly"/>
		</div>
		</div>     
		
		<div class="form-group">
		<label class="control-label col-xs-3" >申请人:
		</label>
		<div class="col-xs-6">
		<input type="text" name="lingliaoren"  class="form-control col-xs-6" value="${bean.lingliaoren  }" readonly="readonly"/>
		</div>
		</div>     
		
		<div class="form-group">
		<label class="control-label col-xs-3" >使用开始时间:
		</label>
		<div class="col-xs-6">
		<input type="text" name="startdate"  class="form-control col-xs-6" value="${bean.startdate }" readonly="readonly"/>
		</div>
		</div>    
		
		<div class="form-group">
		<label class="control-label col-xs-3" >使用结束时间:
		</label>
		<div class="col-xs-6">
		<input type="text" name="enddate"  class="form-control col-xs-6" value="${bean.enddate  }" readonly="readonly"/>
		</div>
		</div>     
    	<div class="form-group">
		<label class="control-label col-xs-3" >备注:
		</label>
		<div class="col-xs-6">
		<textarea rows="4" cols="50" name="content"  class="form-control col-xs-6" readonly="readonly">${bean.content }</textarea>
		</div>
		</div> 
		
		 <div class="form-group">
		<label class="control-label col-xs-3" >审批结果: </label>
		<div class="col-xs-6">
	   <select name="chulijieguo" class="form-control">
      <option value="未处理" <c:if test="${bean.chulijieguo=='未处理' }">selected</c:if> >未处理</option>
      <option value="审核通过" <c:if test="${bean.chulijieguo=='审核通过' }">selected</c:if> >审核通过</option>
       <option value="审核不通过" <c:if test="${bean.chulijieguo=='审核不通过' }">selected</c:if> >审核不通过</option>
      </select>
	    </div>     
		</div> 
      
    	 <div class="form-group">
		<label class="control-label col-xs-3" >处理反馈:
		</label>
		<div class="col-xs-6">
		<textarea rows="3" cols="50" name="chulifankui" class="form-control col-xs-6"  >${bean.chulifankui }</textarea>
 		</div>
		</div> 
      
      <div class="col-md-offset-3 col-xs-6">
		 <input type="submit" class="btn btn-primary col-md-offset-1" value="提交"/>&nbsp;&nbsp;
		 <input type="reset" class="btn btn-primary col-md-offset-1" value="重置"/>&nbsp;&nbsp;
		 <input  onclick="javascript:history.go(-1);" class="btn btn-primary col-md-offset-1" type="button" value="返回" />&nbsp;
	    </div>
</form>
</div>
</div>
</div>
</section>
</div>
</div>

  </body>
</html>

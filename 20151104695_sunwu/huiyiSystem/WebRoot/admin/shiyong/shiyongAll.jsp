<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		
       <script language="javascript">
           function shiyongAdd()
           {
              var url="<%=path %>/shiyong?type=shiyongAddto";
              window.location.href=url;
           }
        
       </script>
	</head>

<body background="qy_back.gif" leftmargin="0" topmargin="0"
	marginwidth="0" marginheight="0" bgcolor="#FFFFFF" style="background:rgb(236,240,245); padding-left:20px;">

	<div class="title clearfix">
	<h2 style="font-size:34px; font-weight:bold;">会议室预约审批</h2>
	</div>
	<ul class="breadcrumb" style="">
	<li>
	<i class="fa fa-home"></i>
	<i style="color:rgb(42,63,84); font-style:normal;" id="breadcrumbSeal">操作   /   会议室预约审批</i>
	</li>
	</ul>
	<ul id="myTab" class="nav nav-tabs" style="height:30px;">
	<li class="active"><a href="#home" data-toggle="tab" style="height:30px; line-height:3px;" id="tabTitle">
	会议室预约审批</a>
	</li>
	</ul>
	<div id="myTabContent" class="tab-content" style="margin-top:20px;">
	<div class="tab-pane fade in active" id="home">
	<section class="content">
	<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
	<div class="x_panel">
	<div id="table-box" style="display: block; height:440px;">


	<table class="table table-striped table-bordered table-hover table-condensed" width="98%"  border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
		<thead>
		<tr bgcolor="#E7E7E7">
					<td height="14" colspan="14" >&nbsp;会议室预约审批结果&nbsp;</td>
		</tr>
			<tr >
			
			<th width="5%"><div align="center"><span class="STYLE1">序号</span></div></th>
			<th width="23%"><div align="center"><span class="STYLE1">标题</span></div></th>
            <th width="8%"><div align="center"><span class="STYLE1">会议室名称</span></div></th>
            <th width="8%"><div align="center"><span class="STYLE1">申请人</span></div></th>
            <th width="8%"><div align="center"><span class="STYLE1">审批状态</span></div></th>
            <th width="8%"><div align="center"><span class="STYLE1">使用开始时间</span></div></th>
            <th width="23%"><div align="center"><span class="STYLE1">使用结束时间</span></div></th>
            <th width="15%"><div align="center">基本操作</div></td>
			
				
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${requestScope.shiyongList}" var="bean" varStatus="ss">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						 ${ss.index+1}
					</td>
					<td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${bean.title }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${bean.cailiao} </span></div></td>
            <td bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${bean.lingliaoren}</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${bean.chulijieguo }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${fn:substring(bean.startdate,0, 19)}</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${fn:substring(bean.enddate,0, 19)}</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE4">
            <img src="images/edt.gif" width="16" height="16" />
           	<a href="<%=path %>/shiyong?type=shiyongUpdate1&id=${bean.id}";>修改</a>&nbsp; &nbsp;
            <img src="images/del.gif" width="16" height="16" />
        <a class="pn-loperator" href="<%=path %>/shiyong?type=shiyongDel&id=${bean.id}">删除</a>
					
            </span></div></td>
				</tr>
				</c:forEach>
		</tbody>
	</table>
<br />
	<div class="ln_solid"></div>
	<div class="form-actions">
	<div class="row">
	<div class="col-md-offset-3 col-xs-6">
	<button type=button class="btn btn-primary col-md-offset-1" onclick='shiyongAdd()'>添加会议室预约</button>
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

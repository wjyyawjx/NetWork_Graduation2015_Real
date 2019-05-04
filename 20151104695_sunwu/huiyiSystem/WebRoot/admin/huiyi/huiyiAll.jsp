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
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		
        <script language="javascript">
            function gonggaoDetail(id)
           {
                 var url="<%=path %>/huiyi?type=huiyiDetail&id="+id;
                 var n="";
                 var w="680px";
                 var h="500px";
                 var s="resizable:no;help:no;status:no;scroll:yes";
				 openWin(url,n,w,h,s);
           }
        </script>
	</head>

	<body background="qy_back.gif" leftmargin="0" topmargin="0"
	marginwidth="0" marginheight="0" bgcolor="#FFFFFF" style="background:rgb(236,240,245); padding-left:20px;">

	<div class="title clearfix">
	<h2 style="font-size:34px; font-weight:bold;">会议室信息</h2>
	</div>
	<ul class="breadcrumb" style="">
	<li>
	<i class="fa fa-home"></i>
	<i style="color:rgb(42,63,84); font-style:normal;" id="breadcrumbSeal">信息   /   会议室信息</i>
	</li>
	</ul>
	<ul id="myTab" class="nav nav-tabs" style="height:30px;">
	<li class="active"><a href="#home" data-toggle="tab" style="height:30px; line-height:3px;" id="tabTitle">
	会议室信息</a>
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
					<td height="14" colspan="14" >&nbsp;会议室信息&nbsp;</td>
				</tr>
			<tr >
			<td width="5%"><div align="center"><span class="STYLE1">序号</span></div></td>
			<td width="23%" ><div align="center"><span class="STYLE1">门牌号</span></div></td>
            <td width="8%" ><div align="center"><span class="STYLE1">会议室用途</span></div></td>
            <td width="8%"><div align="center"><span class="STYLE1">有无多媒体</span></div></td>
            <td width="8%"><div align="center"><span class="STYLE1">会议室名称</span></div></td>
            <td width="8%"><div align="center"><span class="STYLE1">容纳人数</span></div></td>
            <td width="8%"><div align="center"><span class="STYLE1">会议室地点</span></div></td>
            <td width="15%"><div align="center"><span class="STYLE1">基本操作</span></div></td>
			
				
			</tr>
		</thead>
		
		<tbody>
		<c:forEach items="${requestScope.huiyiList}" var="bean" varStatus="ss">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						 ${ss.index+1}
					</td>
					 <td bgcolor="#FFFFFF" align="center">${bean.menpaihao }</td>
      <td bgcolor="#FFFFFF" align="center">${bean.fangwujiegou }</td>
      <td bgcolor="#FFFFFF" align="center">${bean.salestate }</td>
      <td bgcolor="#FFFFFF" align="center">${bean.shebei }</td>
      <td bgcolor="#FFFFFF" align="center">${bean.mianji }</td>
      <td bgcolor="#FFFFFF" align="center">${bean.price }</td>
					
					<td bgcolor="#FFFFFF" align="center">
					    <a href="#" onclick="gonggaoDetail(${bean.id})" class="pn-loperator">查看内容</a>
					</td>
				</tr>
				</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
	</div>
	</div>
	</section>
	</div>
	</div>
	</body>
</html>

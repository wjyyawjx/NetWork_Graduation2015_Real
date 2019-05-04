<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String url = request.getServletPath();
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
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
		 <link href="bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
		 <link href="bootstrap/custom.min.css" rel="stylesheet"/>
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		
        <script language="javascript">
           function wenjianAdd()
           {
              var url="<%=path %>/admin/wenjian/wenjianAdd.jsp";
              window.location.href=url;
           }
           
           function down1(fujianPath,fujianYuashiMing)
           {
               var url="<%=path %>/updown/updown.jsp?fujianPath="+fujianPath+"&fujianYuashiMing="+fujianYuashiMing;
		       url=encodeURI(url); 
               url=encodeURI(url); 
               window.open(url,"_self");
           }
           function wenjianDetail(id)
           {
                 var url="<%=path %>/wenjian?type=wenjianDetail&id="+id;
                 var n="";
                 var w="480px";
                 var h="500px";
                 var s="resizable:no;help:no;status:no;scroll:yes";
				 openWin(url,n,w,h,s);
           }
        </script>
	</head>

	<body background="qy_back.gif" leftmargin="0" topmargin="0"
	marginwidth="0" marginheight="0" bgcolor="#FFFFFF" style="background:rgb(236,240,245); padding-left:20px;">

<div class="title clearfix">
	<h2 style="font-size:34px; font-weight:bold;">文档信息</h2>
	</div>
	<ul class="breadcrumb" style="">
	<li>
	<i class="fa fa-home"></i>
	<i style="color:rgb(42,63,84); font-style:normal;" id="breadcrumbSeal">操作   /   文档信息</i>
	</li>
	</ul>
	<ul id="myTab" class="nav nav-tabs" style="height:30px;">
	<li class="active"><a href="#home" data-toggle="tab" style="height:30px; line-height:3px;" id="tabTitle">
	文档信息</a>
	</li>
	</ul>
	<div id="myTabContent" class="tab-content" style="margin-top:20px;">
	<div class="tab-pane fade in active" id="home">
	<section class="content">
	<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
	<div class="x_panel">
	<div id="table-box" style="display: block; height:440px;">
	
<form action="<%=path %>/wenjian?type=wenjianSerach" name="formAdd" method="post">
	<input type="radio" name="fangshi" value="按资料名称搜索" checked="checked"/>按资料名称搜索
						        &nbsp;&nbsp;&nbsp;&nbsp;
						        <input type="radio" name="fangshi" value="按小组名称搜索"/>按小组名称搜索
						        &nbsp;&nbsp;&nbsp;&nbsp;
						        <input type="radio" name="fangshi" value="按上传者搜索"/>按上传者搜索
						        &nbsp;&nbsp;
	<input type="text" name="content"/>&nbsp;&nbsp;
	<input type="submit" value="搜索" />
	</form>
	
	</center>
	
	<table class="table table-striped table-bordered table-hover table-condensed" width="98%"  border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
		<thead>
		<tr bgcolor="#E7E7E7">
					<td height="14" colspan="41" >&nbsp;文档信息&nbsp;</td>
				</tr>
			<tr >
					<th width="5%" style="text-align:center;">序号</th>
					<th width="30%" style="text-align:center;">文件名称</th>
					<th width="20%" style="text-align:center;">附件下载</th>
					<th width="10%" style="text-align:center;">上传时间</th>
					<th width="10%" style="text-align:center;">上传者</th>
					<th width="10%" style="text-align:center;">上传小组</th>
					<th width="5%" style="text-align:center;">文件说明</th>
					 <c:if test="${sessionScope.userType==0}">
					<th width="10%" style="text-align:center;">操作</th>
					 </c:if>
			
			</tr>
		</thead>
		<tbody>
				    
				<c:forEach items="${requestScope.wenjianList}" var="wenjian" varStatus="ss">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						 ${ss.index+1}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${wenjian.mingcheng}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 <a href="#" onclick="down1('${wenjian.fujian}','${wenjian.fujianYuanshiming}')">${wenjian.fujianYuanshiming}</a>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${wenjian.shijian}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${wenjian.yuangong.name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${wenjian.yuangong.organization.name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					     <a href="#" onclick="wenjianDetail(${wenjian.id})" class="pn-loperator">点击查看</a>
					</td>
					 <c:if test="${sessionScope.userType==0}">
						
					<td bgcolor="#FFFFFF" align="center">
						<a class="pn-loperator" href="<%=path %>/wenjian?type=wenjianDel&id=${wenjian.id}&url=<%=url %>">删除</a>
						<a href="<%=path %>/wenjian?type=wenjianUpdate1&id=${wenjian.id}";>修改</a>
					</td>
					 </c:if>
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

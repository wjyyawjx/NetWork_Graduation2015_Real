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

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
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

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
	<center>
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
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="41" background="<%=path %>/img/tbg.gif">&nbsp;文档信息&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="5%">序号</td>
					<td width="30%">文件名称</td>
					<td width="20%">附件下载</td>
					<td width="10%">上传时间</td>
					<td width="10%">上传者</td>
					<td width="10%">上传小组</td>
					<td width="5%">文件说明</td>
					 <c:if test="${sessionScope.userType==0}">
					<td width="10%">操作</td>
					 </c:if>
		        </tr>	
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
			</table>
	</body>
</html>

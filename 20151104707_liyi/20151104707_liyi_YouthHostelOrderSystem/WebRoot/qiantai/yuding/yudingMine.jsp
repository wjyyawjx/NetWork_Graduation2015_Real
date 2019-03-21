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
	    <base target="_self"/>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
       
        <script language="javascript">
        </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="42" background="<%=path %>/img/tbg.gif">&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="4%">序号</td>
					<td width="10%">客房信息</td>
					<td width="10%">客户姓名</td>
					<td width="10%">联系方式</td>
					
					<td width="10%">预定时间</td>
					<td width="10%">备注信息</td>
					
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.yudingList}" var="yuding" varStatus="sta">
				<tr align='center' bgcolor="#FFFFFF">
					<td bgcolor="#FFFFFF" align="center">${sta.index+1}</td>
					<td bgcolor="#FFFFFF" align="center">${yuding.kefang.fangjianhao}</td>
					<td bgcolor="#FFFFFF" align="center">${yuding.kehuming}</td>
					<td bgcolor="#FFFFFF" align="center">${yuding.dianhua}</td>
					
					<td bgcolor="#FFFFFF" align="center">${yuding.yudingshi}</td>
					<td bgcolor="#FFFFFF" align="center">${yuding.beizhu}</td>
					
					<td bgcolor="#FFFFFF" align="center">
					   <form action="<%=path %>/yudingDel.action" name="ff" method="post">
					       <input type="hidden" name="id" value="${yuding.id}"/>
					       <input type="submit" value="取消预定"/>
					   </form>
				    </td>
				</tr>
				</c:forEach>
			</table>
	</body>
</html>

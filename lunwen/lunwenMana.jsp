<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		
        <script language="javascript">
           function down1(fujianPath,fujianYuashiMing)
           {
               var url="<%=path %>/updown/updown.jsp?fujianPath="+fujianPath+"&fujianYuashiMing="+fujianYuashiMing;
		       url=encodeURI(url); 
               url=encodeURI(url); 
               window.open(url,"_self");
           }
           
           function lunwenDelLaoshi(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/lunwenDelLaoshi.action?id="+id;
               }
           }
           
           function yishenGengxin(id)
           {
                   window.location.href="<%=path %>/admin/lunwen/yishenGengxin.jsp?id="+id;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
						<tr bgcolor="#E7E7E7">
							<td height="14" colspan="15" background="<%=path %>/img/tbg.gif">&nbsp;</td>
						</tr>
						<tr align="center" bgcolor="#FAFAF1" height="22">
							<td width="5%">序号</td>
							<td width="20%">选题题目</td>
							<td width="10%">附件下载</td>
							<td width="10%">提交时间</td>
							
							<td width="10%">审核状态</td>
							<td width="10%">批阅意见</td>
							<td width="10%">学生</td>
							<td width="10%">操作</td>
				        </tr>	
						<c:forEach items="${requestScope.lunwenList}" var="lunwen" varStatus="ss">
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
							<td bgcolor="#FFFFFF" align="center">
								 ${ss.index+1}
							</td>
							<td bgcolor="#FFFFFF" align="center">
								 ${lunwen.mingcheng}
							</td>
							<td bgcolor="#FFFFFF" align="center">
							    <a href="#" onclick="down1('${lunwen.fujian}','${lunwen.fujian}')" style="font-size: 11px;color: red">附件下载</a>
							</td>
							<td bgcolor="#FFFFFF" align="center">
								 ${lunwen.tijiaoshi}
							</td>
							
							<td bgcolor="#FFFFFF" align="center">
								 ${lunwen.yishenjieguo}
							</td>
							<td bgcolor="#FFFFFF" align="center">
								 ${lunwen.yishenyijian}
							</td>
							<td bgcolor="#FFFFFF" align="center">
								 ${lunwen.user.userName}&nbsp;&nbsp;${lunwen.user.userRealname}
							</td>
							<td bgcolor="#FFFFFF" align="center">
								<input type="button" value="删除" onclick="lunwenDelLaoshi(${lunwen.id})"/>
								
								<c:if test="${lunwen.yishenjieguo=='待审核'}">
								   <input type="button" value="审核" onclick="yishenGengxin(${lunwen.id})"/>
								</c:if>
							</td>
						</tr>
						</c:forEach>
					</table>
	</body>
</html>

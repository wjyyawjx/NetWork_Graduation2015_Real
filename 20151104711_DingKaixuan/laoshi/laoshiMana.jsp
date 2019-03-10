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
		
        <script language="javascript">
           function laoshiDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/laoshiDel.action?id="+id;
               }
           }
           
           function laoshiPre(id)
           {
                   window.location.href="<%=path %>/laoshiPre.action?id="+id;
           }
           
           function laoshiAdd()
           {
                 var url="<%=path %>/admin/laoshi/laoshiAdd.jsp";
				 window.location.href=url;
           }
           
       </script>
	</head>

	<body leftmargin="8" topmargin="8" background='<%=path %>/images/allbg.gif'>
			<table width="80%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="7" background="<%=path %>/images/tbg.gif">&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
				    <td width="4%">序号</td>
				    <td width="10%">编号</td>
					<td width="10%">姓名</td>
					<td width="10%">性别</td>
					
					<td width="10%">年龄</td>
					<td width="10%">密码</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.laoshiList}" var="laoshi" varStatus="sta">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${sta.index+1 }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${laoshi.bianhao }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${laoshi.xingming }
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${laoshi.xingbie }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${laoshi.nianling }
					</td>
					
					<td bgcolor="#FFFFFF" align="center">
						${laoshi.loginpw }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<input type="button" value="删除" onclick="laoshiDel(${laoshi.id })"/>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			<br/>
			<input type="button" value="添加老师信息" style="width: 130px;height: 24px;" onclick="laoshiAdd()" />
	</body>
</html>

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
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		
       <script language="javascript">
           function gonggaoAdd()
           {
              var url="<%=path %>/shiyong?type=shiyongAddto";
              window.location.href=url;
           }
        
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="14" background="<%=path %>/img/tbg.gif">&nbsp;会议室预约审批&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="5%">序号</td>
				    <td width="23%"><div align="center"><span class="STYLE1">标题</span></div></td>
            <td width="8%"><div align="center"><span class="STYLE1">会议室名称</span></div></td>
            <td width="8%"><div align="center"><span class="STYLE1">申请人</span></div></td>
            <td width="8%"><div align="center"><span class="STYLE1">审批状态</span></div></td>
            <td width="8%"><div align="center"><span class="STYLE1">使用开始时间</span></div></td>
           <td width="23%"><div align="center"><span class="STYLE1">使用结束时间</span></div></td>
            <td width="15%"><div align="center">基本操作</div></td>
          </tr>
          
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
			</table>
				<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加会议室预约" style="width: 100px;" onclick="gonggaoAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>

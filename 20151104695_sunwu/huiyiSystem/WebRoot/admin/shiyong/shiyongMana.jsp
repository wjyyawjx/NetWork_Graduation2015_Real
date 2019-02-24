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
           
           function gonggaoDetail(id)
           {
        	   window.location.href="<%=path %>/shiyong?type=shiyongDetail&id="+id;
                
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="14" background="<%=path %>/img/tbg.gif">&nbsp;会议室预约信息管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td>序号</td>
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
					<td bgcolor="#FFFFFF" align="center">
						${bean.title }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${bean.cailiao}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${bean.lingliaoren}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${bean.chulijieguo }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${fn:substring(bean.startdate,0, 19)}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					${fn:substring(bean.enddate,0, 19)}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					<a href="#" onclick="gonggaoDetail(${bean.id})" class="pn-loperator">处理会议室使用信息</a>
					
					</td>
				</tr>
				</c:forEach>
			</table>
			
	</body>
</html>

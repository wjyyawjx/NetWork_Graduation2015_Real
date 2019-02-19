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
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		
        <script language="javascript">
           function gonggaoAdd()
           {
              var url="<%=path %>/admin/huiyi/huiyiAdd.jsp";
              window.location.href=url;
           }
           
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

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="14" background="<%=path %>/img/tbg.gif">&nbsp;会议信息管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td>序号</td>
					 <td >门牌号</td>
      <td >会议用途</td>
      <td >有无多媒体</td>
      <td >会议名称</td>
      <td >容纳人数</td>
      <td >会议室地点</td>

      <td >操作</td>
		        </tr>	
				<c:forEach items="${requestScope.huiyiList}" var="bean" varStatus="ss">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						 ${ss.index+1}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${bean.menpaihao }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${bean.fangwujiegou }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${bean.salestate }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${bean.shebei }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${bean.mianji }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${bean.price }
					</td>
					<td bgcolor="#FFFFFF" align="center">
					<a href="#" onclick="gonggaoDetail(${bean.id})" class="pn-loperator">查看内容</a>
						<a class="pn-loperator" href="<%=path %>/huiyi?type=huiyiDel&id=${bean.id}">删除</a>
						<a href="<%=path %>/huiyi?type=huiyiUpdate1&id=${bean.id}";>修改</a>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加会议室" style="width: 80px;" onclick="gonggaoAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>

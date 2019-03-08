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
		<script type="text/javascript" src="<%=path %>/js/popup_shuaxin.js"></script>
		
        <script language="javascript">
           function kefangDel(id)
           {
                var url="<%=path %>/kefangDel.action?id="+id;
                window.location.href=url;
           }
           function over(picPath)
	       {
			  if (picPath=="")picPath="/images/default.jpg";
			  x = event.clientX;
			  y = event.clientY;      
			  document.all.tip.style.display = "block";
			  document.all.tip.style.top = y;
			  document.all.tip.style.left = x+10;
			  document.all.photo.src = ".."+picPath; 
		   }
		   function out()
	       {
			  document.all.tip.style.display = "none";
		   }	
		   
		   function kefangAdd()
           {
              var url="<%=path %>/admin/kefang/kefangAdd.jsp";
              window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="10" background="<%=path %>/img/tbg.gif">&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="5%">序号</td>
					<td width="10%">客房类型</td>
					<td width="10%">房间编号</td>
					<td width="10%">房间面积</td>
					
					<td width="30%">房间介绍</td>
					<td width="10%">房间图片</td>
					<td width="10%">房间费用(一天)</td>
					<td width="10%">状态</td>
					
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.kefangList}" var="kefang" varStatus="sta">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${sta.index+1}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${kefang.kefangleixing}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${kefang.fangjianhao}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${kefang.area}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${kefang.jieshao}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   <div onmouseover = "over('<%=path %>/${kefang.fujian}')" onmouseout = "out()" style="cursor:hand;">
						   客房图片
					   </div>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${kefang.qianshu}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<c:if test="${kefang.zhuangtai=='空闲中'}">
						     <span style="color: black">空闲中</span>
						</c:if>
						<c:if test="${kefang.zhuangtai=='已预订'}">
						     <span style="color: red">已预订</span>
						</c:if>
						<c:if test="${kefang.zhuangtai=='已入住'}">
						     <span style="color: green">已入住</span>
						</c:if>
					</td>
					<td  bgcolor="#FFFFFF" align="center" >
						<input type="button" value="删除" onclick="kefangDel(${kefang.id})"/>
					</td>
				</tr>
				</c:forEach>
			</table>
			<div id="tip" style="position:absolute;display:none;border:0px;width:80px; height:80px;">
			<TABLE id="tipTable" border="0" bgcolor="#ffffee">
				<TR align="center">
					<TD><img id="photo" src="" height="80" width="110"></TD>
				</TR>
			</TABLE>
			</div>
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 8px;">
			  <tr>
			    <td>
			      <input type="button" value="添加客房信息" style="width: 80px;" onclick="kefangAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>

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
           function fajianxiangDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   	var url="<%=path %>/email?type=fajianxiangDel&id="+id;
	                var pop=new Popup({ contentType:1,isReloadOnClose:false,width:200,height:150});
		            pop.setContent("contentUrl",url);
		            pop.setContent("title","操作窗口");
		            pop.build();
		            pop.show();
               }
           }
           
           function down1(fujianPath,fujianYuashiMing)
           {
               var url="<%=path %>/updown/updown.jsp?fujianPath="+fujianPath+"&fujianYuashiMing="+fujianYuashiMing;
		       url=encodeURI(url); 
               url=encodeURI(url); 
               window.open(url,"_self");
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="6" background="<%=path %>/images/tbg.gif">&nbsp;已共享&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="15%">发布者</td>
					<td width="15%">接收者</td>
					<td width="15%">文件标题</td>
					<td width="15%">附件</td>
					<td width="15%">日期</td>
					<td width="15%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.fajianxiangList}" var="fajianxiang">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${fajianxiang.fromYuangong.name }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${fajianxiang.toYuangong.name }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a style="color: red" href="<%=path %>/email?type=fajianxiangDetail&id=${fajianxiang.id }">${fajianxiang.title }</a>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 <c:if test='${fajianxiang.fujian=="" }'>
							  无
						 </c:if>
						 <c:if test='${fajianxiang.fujian!="" }'>
						     ${fajianxiang.fujianYuanshiming}&nbsp;&nbsp;&nbsp;
						     <a style="color: red;font-size: 10px;" href="#" onclick='down1("${fajianxiang.fujian }","${fajianxiang.fujianYuanshiming }")'>下载</a>
						 </c:if>  
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${fajianxiang.shijian }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a href="#" onclick="fajianxiangDel(${fajianxiang.id})" class="pn-loperator">删除</a>
					</td>
				</tr>
				</c:forEach>
			</table>
	</body>
</html>

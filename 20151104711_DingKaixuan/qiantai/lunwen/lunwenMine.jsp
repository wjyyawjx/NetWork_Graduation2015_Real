<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	

	<script language="javascript">
		   function down1(fujianPath,fujianYuashiMing)
           {
               var url="<%=path %>/updown/updown.jsp?fujianPath="+fujianPath+"&fujianYuashiMing="+fujianYuashiMing;
		       url=encodeURI(url); 
               url=encodeURI(url); 
               window.open(url,"_self");
           }
           
           function lunwenDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/lunwenDel.action?id="+id;
               }
           }
    </script>
	
	
  </head>
  
<body>
<DIV class=fwtop>
	<jsp:include flush="true" page="/qiantai/top.jsp"></jsp:include>
</DIV>



<table align="center" style="margin-top: 6px;margin-bottom: 6px;" width="1001"><tr><td>
      <table width="101%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:3px">
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
								<input type="button" value="删除" onclick="lunwenDel(${lunwen.id})" style="width: 70px;">
							</td>
						</tr>
						</c:forEach>
					</table>   
</td></tr></table>



<!-- foot -->
   <jsp:include flush="true" page="/qiantai/foot.jsp"></jsp:include>
<!-- foot -->
</body>
</html>

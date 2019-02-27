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
	
	<style rel="stylesheet" type="text/css">
		.c1-bline{border-bottom:#999 1px dashed;border-top:1px;}
		.f-right{float:right}
		.f-left{float:left}
		.clear{clear:both}
	</style>

	<script language="javascript">
		    
    </script>
	
	
</head>
  
<body>
<DIV class=fwtop>
	<jsp:include flush="true" page="/qiantai/top.jsp"></jsp:include>
</DIV>



<table align="center" style="margin-top: 6px;margin-bottom: 6px;" width="1001">
    <tr>
        <td>
            <fieldset><legend class="fieldtitle">&nbsp;系统公告</legend>
						<table class="bill" width="97%">
							<tr>
								<td>
								<c:forEach items="${requestScope.gonggaoList}" var="gonggao">
						   <div class="c1-bline" style="padding:7px 0px;">
						       <div class="f-left">
							     <img src="<%=path %>/img/head-mark4.gif" align="middle" class="img-vm" border="0"/> 
						             <a href="<%=path %>/gonggaoDetailQian.action?gonggaoId=${gonggao.gonggaoId}">${gonggao.gonggaoTitle}</a>
						       </div>
						      <div class="f-right">${gonggao.gonggaoData}</div>
						      <div class="clear"></div>
						  </div>
					</c:forEach>
								</td>
							</tr>
						</table>
					</fieldset>
        </td>
    </tr>
</table>


<DIV class=fwtop>
	<jsp:include flush="true" page="/qiantai/foot.jsp"></jsp:include>
</DIV>
</body>
</html>

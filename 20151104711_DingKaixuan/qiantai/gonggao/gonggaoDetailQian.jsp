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
		    
    </script>
	
	
  </head>
  
<body>
<DIV class=fwtop>
	<jsp:include flush="true" page="/qiantai/top.jsp"></jsp:include>
</DIV>


<table align="center" style="margin-top: 6px;margin-bottom: 6px;" width="1001"><tr><td>
<div style="border:1px solid  #CCCCCC;height: 100%;width: 1002;margin-left: 0px;">
                     <br/>信息标题：<c:out value="${requestScope.gonggao.gonggaoTitle}" escapeXml="false"></c:out>
	                 <br/><br/><c:out value="${requestScope.gonggao.gonggaoContent}" escapeXml="false"></c:out>
	                 <br/><br/>发布时间：<c:out value="${requestScope.gonggao.gonggaoData}" escapeXml="false"></c:out> 
</div>         
</td></tr></table>


<DIV class=fwtop>
	<jsp:include flush="true" page="/qiantai/foot.jsp"></jsp:include>
</DIV>
</body>
</html>

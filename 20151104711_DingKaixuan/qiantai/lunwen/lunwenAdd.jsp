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
	
	<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
	

	<script language="javascript">
		    function check()
		    {
		        if(document.form1.mingcheng.value=="")
		        {
		            alert("请输入选题题目");
		            return false;
		        }
		        if(document.form1.fujian.value=="")
		        {
		            alert("请上传附件");
		            return false;
		        }
		        document.form1.submit();
		    }
		    
		    function up()
		    {
		        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
	            pop.setContent("contentUrl","<%=path %>/upload/upload.jsp");
	            pop.setContent("title","文件上传");
	            pop.build();
	            pop.show();
		    }
        </script>
	
	
  </head>
  
<body>
<DIV class=fwtop>
	<jsp:include flush="true" page="/qiantai/top.jsp"></jsp:include>
</DIV>



<table align="center" style="margin-top: 6px;margin-bottom: 6px;" width="1001"><tr><td>
<form action="<%=path %>/lunwenAdd.action" name="form1" method="post">
				     <table width="101%" border="0" cellpadding="1" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:3px">
						<tr bgcolor="#E7E7E7">
							<td height="14" colspan="3" background="<%=path %>/img/tbg.gif">&nbsp;&nbsp;</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF"  height="32">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						         选题题目：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="mingcheng" style="width: 280px;"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" height="32">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						         附件上传：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="fujian" id="fujian" style="width: 280px;" readonly="readonly"/>
						        <input type="button" value="上传" onclick="up()"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF"  height="32">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						         提交时间：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="tijiaoshi" style="width: 280px;" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date())%>"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						       <input type="button" value="提交" onclick="check()" style="width: 100px;"/>&nbsp; 
						       <input type="reset" value="重置" style="width: 100px;"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>        
</td></tr></table>


<!-- foot -->
   <jsp:include flush="true" page="/qiantai/foot.jsp"></jsp:include>
<!-- foot -->
</body>
</html>

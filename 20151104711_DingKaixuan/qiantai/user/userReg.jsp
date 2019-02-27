<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991334/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	

	<script language="javascript">
		    function check1()
		    {
		        if(document.form1.userName.value=="")
		        {
		            alert("请输入学号");
		            return false;
		        }
		        if(document.form1.userPw.value=="")
		        {
		            alert("请输入密码");
		            return false;
		        }
		        
		        if(document.form1.laoshiId.value=="0")
		        {
		            alert("请选择指导老师");
		            return false;
		        }
		        
		        if(document.form1.userTel.value !="")
				{
				    var sMobile = document.form1.userTel.value; 
					    if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(sMobile)))
					    { 
					        alert("请输入正确的11位手机号"); 
					        return false; 
					    }
				}
				
				if(document.form1.userEmail.value !="")
				{
				      if (!isEmail(document.form1.userEmail.value))
				      {
					  alert("您输入的邮箱有误,请重新核对后再输入!");
					  return false;
				      }
				    
				}
		        document.form1.submit();
		    }
		    
		    function laoshiAll()
	        {
	             var strUrl = "<%=path %>/laoshiAll.action";
                 var ret = window.showModalDialog(strUrl,"","dialogWidth:800px; dialogHeight:380px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
                 
                 document.getElementById("laoshiId").value=ret[0];
                 document.getElementById("xxx").value=ret[1];
	        }
	        
	        function isEmail(str)
			{
			    var reg = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
			    return reg.test(str);
			}
    </script>
	
</head>
  
<body>
<DIV class=fwtop>
	<jsp:include flush="true" page="/qiantai/top.jsp"></jsp:include>
</DIV>



<table align="center" style="margin-top: 6px;margin-bottom: 6px;" width="1001"><tr><td>
      <form action="<%=path %>/userReg.action" name="form1" method="post">
						<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
							<tr>
								<td width="10%" height="38" align="right" bgcolor="#F9F9F9" style="font-size: 12px;">
									学号：
								</td>
								<td width="90%" bgcolor="#FFFFFF">
									&nbsp;
									<input type="text" name="userName" id="userName" style="width: 266px;" 
									    onkeyup="value=value.replace(/[^\d]/g,'') " 
                                        onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
								</td>
							</tr>
							<tr>
								<td height="38" align="right" bgcolor="#F9F9F9" style="font-size: 12px;">
									密码：
								</td>
								<td bgcolor="#FFFFFF">
									&nbsp;
									<input type="password" name="userPw" style="width: 266px;" />
								</td>
							</tr>
							<tr>
								<td height="38" align="right" bgcolor="#F9F9F9" style="font-size: 12px;">
									姓名：
								</td>
								<td bgcolor="#FFFFFF">
									&nbsp;
									<input type="text" name="userRealname" style="width: 266px;"/>
								</td>
							</tr>
							<tr>
								<td height="38" align="right" bgcolor="#F9F9F9" style="font-size: 12px;">
									性别：
								</td>
								<td bgcolor="#FFFFFF">
									&nbsp;
									<input type="radio" name="userSex" value="男" checked="checked"/>男
									&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="userSex" value="女"/>女
								</td>
							</tr>
							<tr align='center' bgcolor="#FFFFFF" height="33">
							    <td width="10%" bgcolor="#FFFFFF" align="right">
							                 指导老师：
							    </td>
							    <td width="90%" bgcolor="#FFFFFF" align="left">
							        &nbsp;
							        <input type="text" name="xxx" id="xxx" style="width: 380px;" readonly="readonly"/>
							        <input type="button" value="选择" onclick="laoshiAll()" style="width: 60px;"/>
							        <input type="hidden" name="laoshiId" id="laoshiId" size="60" value="0"/>
							    </td>
							</tr>
							
							<tr>
								<td height="38" align="right" bgcolor="#F9F9F9" style="font-size: 12px;">
									电话：
								</td>
								<td bgcolor="#FFFFFF">
									&nbsp;
									<input type="text" name="userTel" style="width: 266px;" />
								</td>
							</tr>
							<tr>
								<td height="38" align="right" bgcolor="#F9F9F9" style="font-size: 12px;">
									邮箱：
								</td>
								<td bgcolor="#FFFFFF">
									&nbsp;
									<input type="text" name="userEmail" style="width: 266px;"/>
								</td>
							</tr>
							<tr>
								<td height="38" align="right" bgcolor="#F9F9F9">
									&nbsp;
								</td>
								<td bgcolor="#FFFFFF">
									&nbsp;
									<input type="button" value="确定" onclick="check1();" style="width: 60px;"/>
									<input type="button" value="重置" onclick="closeOpen()" style="width: 60px;"/>
								</td>
							</tr>
						</table>
					</form>      
</td></tr></table>


<DIV class=fwtop>
	<jsp:include flush="true" page="/qiantai/foot.jsp"></jsp:include>
</DIV>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.ResultSet"
    pageEncoding="UTF-8" %>
<%@ page import="com.tools.ConnDB"%>
<%@ page import="com.tools.ChStr"%>	
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%
	ConnDB conn = new ConnDB();
	ChStr chStr = new ChStr();
	if(request.getParameter("ID")!=null){
		int ID=Integer.parseInt(request.getParameter("ID"));
		ResultSet rs=conn.executeQuery("select * from tb_member where ID="+ID);
		String username="";
		String Truename="";
	    String city="";
	    String address="";
	    String postcode="";
	    String CardNO="";
	    String CardType="";   
	    float Amount=0;
	    String Tel="";
	    String Email=""; 
	    if(!rs.next()){
	    	out.println("<script lanuage='javascript'>alert('您的操作有误!');window.location.href='membermanage.jsp';</script>");
	    }else{
	    	username=rs.getString("userName");
	    	Truename=rs.getString("trueName");
	    	city=rs.getString("city");
	    	address=rs.getString("address");
            postcode=rs.getString("postcode");
            CardNO=rs.getString("cardNO");
            CardType=rs.getString("cardType");        
            Amount=rs.getFloat("Amount");
            Tel=rs.getString("tel");   
            Email=rs.getString("email"); 
	    	}
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员详细</title>
<link rel="stylesheet" href="../front/css/mr-01.css" type="text/css">
<script type="text/javascript" src="onclock.js"></script>
<script src="../front/js/jsArr01.js" type="text/javascript"></script>
<script src="../front/js/module.js" type="text/javascript"></script>
<script src="../front/js/jsArr02.js" type="text/javascript"></script>
<script src="../front/js/tab.js" type="text/javascript"></script>
<script  type="text/javascript" src="${pageContext.request.contextPath}/front/js/jquery.1.3.2.js"></script>
<script  type="text/javascript" src="${pageContext.request.contextPath}/front/js/ajaxupload.js"></script>

<script type="text/javascript">
</script>
<style type="text/css">
	li{list-style: none;}
</style>
</head>
<body>
		<%
		Date d = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String now = df.format(d);
	%>
	<div id="top" style=" background: url(../front/images/top.jpg);height:150px;width:100%; background-size:cover;">
		<span style="margin-left:100px; font-size: 60px; text-shadow: 5px 5px 5px black, 0px 0px 2px black;
		 color: white;">51汽车网后台管理系统</span>	
	</div>	
<table width="100%"height="250"  border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
<tr>
	<td>
		<table width="100%" height="350" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
			<tr>
			<td width="250" valign="top">
			<table width="100%" height="480"  border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top" background="../front/images/left.jpg"><jsp:include page="navigation.jsp"/></td>
			</tr>
			</table></td>
			<td align="center" valign="top"><table width="100%" height="50" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top" background="../front/images/center.jpg">
					<table width="100%" height="36"  border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="30%" style=" font-size: 10px; text-shadow: 5px 5px 5px black, 0px 0px 2px black;color: white;">&nbsp;当前时间：<%=now %></td>
					</tr>	
				</table></td>
			</tr>
			<table width="92%" height="192"  border="0" cellpadding="0" cellspacing="0">
				<tr>
				<td valign="top">
					<table width="100%" height="14"  border="0" cellpadding="0" cellspacing="0">
                	<tr>
              			<td height="13" align="center">&nbsp;</td>
            		</tr>
            		</table>
            		<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder_dashed">
            		<tr>
                    	<td width="19%" height="27" align="center" class="tableBorder_B_dashed">&nbsp;用 户 名：</td>
                    	<td height="13" class="tableBorder_B_dashed"> &nbsp;<%=username%></td>
                    </tr>
                    <tr>
                   	    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;真实姓名：</td>
                        <td height="14" class="tableBorder_B_dashed">&nbsp;<%=Truename%></td>
                    </tr>
                    <tr>
	                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;城&nbsp;&nbsp;&nbsp;&nbsp;市：</td>
	                    <td class="tableBorder_B_dashed">&nbsp;<%=city%></td>
                    </tr>
                    <tr>
	                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;地&nbsp;&nbsp;&nbsp;&nbsp;址：</td>
	                    <td height="14" class="tableBorder_B_dashed">&nbsp;<%=address%></td>
                    </tr>
                    <tr>
	                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;邮政编码：</td>
	                    <td width="81%" height="27" class="tableBorder_B_dashed">&nbsp;<%=postcode%></td>
                    </tr>
                     <tr>
	                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;证件类型：</td>
	                    <td height="14" class="tableBorder_B_dashed">&nbsp;<%=CardType%> </td>
                    </tr>                   
                    <tr>
	                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;证件号码：</td>
	                    <td class="tableBorder_B_dashed">&nbsp;<%=CardNO%></td>
                    </tr>
                    <tr>
	                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;电&nbsp;&nbsp;&nbsp;&nbsp;话：</td>
	                    <td class="tableBorder_B_dashed">&nbsp;<%=Tel%></td>
                    </tr>
                    <tr>
	                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;Email：</td>
	                    <td class="tableBorder_B_dashed">&nbsp;<%=Email%></td>
                    </tr>
                    <tr>
	                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;消 费 额：</td>
	                    <td class="tableBorder_B_dashed">&nbsp;<%=Amount%> (元)</td>
                    </tr>
                    <tr>
                    	<td height="38" colspan="2" align="center">
                    	<input name="Submit3" type="button" class="btn_grey" value="返回" onClick="JScript:history.back()"></td>
                 	</tr>
                </table>
                	</td></tr>
					</table>		
			</table>	
			</table>	
</table>
</body>
</html>
<%conn.close();
}else{
      out.println("<script lanage='javascript'>alert('您的操作有误');window.location.href='ht_index.jsp';");
}%>
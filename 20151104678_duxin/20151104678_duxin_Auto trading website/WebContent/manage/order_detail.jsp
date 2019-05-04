<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.ResultSet"
    pageEncoding="UTF-8" %>
<%@ page import="com.tools.ConnDB"%>
<%@ page import="com.tools.ChStr"%>	
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%
	ConnDB conn =new ConnDB();
	if (request.getParameter("ID")!=null){
		int ID=Integer.parseInt(request.getParameter("ID"));
		ResultSet rs_main=conn.executeQuery("select * from tb_order where orderID="+ID);
		int orderID=0;
		String address="";
	    String postcode="";
	    String tel="";
	    String bz="";
	    int goodID=-1;
	    String goodsname="";
	    float nowprice=0;
	    int number=0;
	    if(rs_main.next()){
	    	orderID=rs_main.getInt("orderID");
	    	address=rs_main.getString("address");
	    	tel=rs_main.getString("tel");
	    	bz=rs_main.getString("bz");
	    	if (bz.equals("")){
               bz="无";
            }
	    }
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单详情</title>
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
					<table width="100%" height="272"  border="0" cellpadding="0" cellspacing="0">
						<tr>
              				<td width="97%" height="220" align="center" valign="top">
              				<table width="90%" height="131"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_LTR_dashed">
                        <tr>
                       		<td width="16%" style="padding:5px;">订 单 号：&nbsp;<%=orderID%></td>
                        </tr>
                        <tr>
                          	<td style="padding:5px;">地&nbsp;&nbsp;&nbsp;&nbsp;址：&nbsp;<%=address%></td>
                        </tr>
                        <tr>
                        	<td style="padding:5px;">邮政编码：&nbsp;<%=postcode%></td>
                        </tr>
                        <tr>
                        	<td style="padding:5px;">电&nbsp;&nbsp;&nbsp;&nbsp;话：&nbsp;<%=tel%></td>
                        </tr>
                        <tr>
                        	<td style="padding:5px;">备&nbsp;&nbsp;&nbsp;&nbsp;注：&nbsp;<%=bz%></td>
                        </tr>
                        </table>
                        <table width="90%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#CCCCCC" class="tableBorder_dashed">
                        	<tr align="center" bgcolor="#eeeeee">
	                          <td width="21%" height="24">商品名称</td>
	                          <td width="45%">商品名称</td>
	                          <td width="22%">单价</td>
	                          <td width="12%">数量</td>
	                        </tr>
	                        	<%
		                        	ResultSet rs=conn.executeQuery("select * from tb_order_detail where orderID="+orderID);
	                                while(rs.next()){
	                                	goodID=rs.getInt("goodsID");
                                       // goodsname=rs.getString("goodsname");
                                        nowprice=rs.getFloat("price");
                                        number=rs.getInt("number");
	                                }
	                        	%>
	                        <tr align="center">
	                        	<td height="27"><%=goodsname%></td>
	                        	<td height="27"><%=goodsname%></td>
	                        	<td><%=nowprice%>(元)</td>
	                        	<td><%=number%></td>           		                        	
	                        </tr>
								<%} %>  
					</table>     
					<table width="100%" height="49"  border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td align="center"><input name="Submit" type="submit" class="btn_grey" value="返回" onClick="history.back(-1)"></td>
					</tr>
					</table>	</td>		
                      		</tr>
					</table>		
			</table>	
			</table>	
</table>
</body>
</html>
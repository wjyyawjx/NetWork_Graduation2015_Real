<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.ResultSet"
    pageEncoding="UTF-8" %>
<%@ page import="com.tools.ConnDB"%>
<%@ page import="com.tools.ChStr"%>	
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%
	ConnDB conn = new ConnDB();
	ChStr chStr = new ChStr();
	
	String PID = "";
	String typeID = "";
	String goodsName = "";
	String superType = "";
	String subType = "";
	String introduce = "";
	String picture = "";
	float price=(float)0.0;
	float nowprice=(float)0.0;
	int sale=0;
	int newgoods=0;
	PID = request.getParameter("ID");
	if(PID!=null && PID!=""){
		int ID = Integer.parseInt(PID);
		ResultSet rs = conn.executeQuery("select * from tb_goods where ID="+ID);
		if(!rs.next()){
			out.print("<script lanuage='javascript'>alert('您的操作有误1!');window.location.href='ht_index.jsp';</script>");
		}else{ 
            goodsName=rs.getString("goodsName");
            introduce=rs.getString("introduce");
            price=rs.getFloat("Price");       
            nowprice=rs.getFloat("nowPrice");
            picture=rs.getString("picture");
            newgoods=rs.getInt("newgoods");         
            sale=rs.getInt("sale");

		}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>物品添加</title>
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
                     <form action="goods_del_deal.jsp" method="post" name="form1">
						<table width="100%" border="0" align="center" cellpadding="-2" cellspacing="-2" bordercolordark="#ffffff">
							<tr>
								<td width="14%" height="27">&nbsp;商品名称:</td>
								<td height="27" colspan="3">&nbsp;
									<input name = "ID" type="hidden" id ="ID" value="<%=PID%>">
									<%=goodsName %>&nbsp;&nbsp;
								</td>
							</tr>
							 <tr>

			                    <td height="16">&nbsp;图片文件：</td>			
			                    <td height="27" colspan="3">&nbsp;<%=picture%></td>
                             </tr>
                              <tr>

			                    <td height="27" align="center">定　　价：</td>
			                    <td height="27">&nbsp;<%=price%>(元)</td><td height="27" align="center">现&nbsp;&nbsp;&nbsp;&nbsp;价： </td>
			                    <td height="27">&nbsp;<%=nowprice%>(元)</td>
                              </tr>
                              <tr>
			                    <td height="45">&nbsp;是否新品：</td>
			                    <td>&nbsp; <%if(newgoods==0){out.print("不是新品");}else{out.print("是新品");}%></td>
                                <td>&nbsp;是否特价：</td>
                                <td><%if(sale==0){out.print("不是特价商品");}else{out.print("是特价商品");}%></td>
                 			  </tr>
                 			   <tr>
			                    <td height="103">&nbsp;商品简介：</td>
			                    <td colspan="3"><span class="style5">&nbsp;</span><%=introduce%></td>
                 			  </tr>
                 			  <tr>
                   				 <td height="38" colspan="4" align="center">
                      		     <input name="Submit" type="submit" class="btn_grey" value="确定删除">&nbsp;
                      		     <input name="Submit3" type="button" class="btn_grey" value="返回" onClick="JScript:history.back()"></td>
                             </tr>
						</table>
					</form>
				</table>		
			</table>	
			</table>	
</table>
</body>
</html>
<%}else{
      out.println("<script language='javascript'>alert('您的操作有误!');window.location.href='ht_index.jsp';");
}%>
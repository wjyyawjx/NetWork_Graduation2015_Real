<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.ResultSet"
    pageEncoding="UTF-8" %>
<%@ page import="com.tools.ConnDB"%>
<%@ page import="com.tools.ChStr"%>	
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%
	ConnDB conn = new ConnDB();
	String username = (String)session.getAttribute("userName");
	int ID = -1;
	ID=Integer.parseInt(request.getParameter("ID"));
	if(ID>0){
		ResultSet rs=conn.executeQuery("select ID,goodsName,introduce,nowPrice,picture from tb_goods where ID="+ID);
		int goodsID=-1;
		String goodsName="";
	    String introduce="";
	    float nowPrice=(float)0.0;
	    String picture="";
	    if(rs.next()){
	    	goodsID=rs.getInt(1);
            goodsName=rs.getString(2);
            introduce=rs.getString(3);
            nowPrice=rs.getFloat(4);
            picture=rs.getString(5);
	    }	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>物品详情</title>
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
						 <td width="70%" align="right"><a href="superType.jpg">[ <img src="../front/images/list.png" width="30px" height="30px">&nbsp;大分类信息管理]</a>&nbsp;
						 <a href="subType.jsp">[ <img src="../front/images/list.png" width="30px" height="30px">&nbsp;小分类信息管理]</a>&nbsp;
						 <a href="goods_add.jsp">[ <img src="../front/images/list.png" width="30px" height="30px">&nbsp;添加商品信息]</a></td>
						<td width="30%" style=" font-size: 10px; text-shadow: 5px 5px 5px black, 0px 0px 2px black;color: white;">&nbsp;当前时间：<%=now %></td>
					</tr>	
				</table></td>
			</tr>
			<table width="92%" height="192"  border="0" cellpadding="0" cellspacing="0">
				<tr>
				<td valign="top">
                	<table width="98%" height="79"  border="0" cellpadding="0" cellspacing="0" class="noborder">
                    	<tr>
                      		<td width="37%" height="95" rowspan="4" align="center"><img src="../images/goods/<%=picture%>" width="184" height="119"></td>
                     		<td width="63%"><%=goodsName%></td>
                   		</tr>
                   		<tr>
                        	<td>单价：<%=nowPrice%>(元) </td>
                       </tr>
                        <tr>
                        	<td><%=introduce%></td>
                       </tr>
                       <tr>
                       		<td><input name="Submit" type="submit" class="btn_grey" onClick="history.back(-1);" value="返回">&nbsp;
                       		    <%if (username!=null && username!=""){%>&nbsp;
                       		    <input name="see" type="button" class="btn_grey" onClick="window.location.href='cart_add.jsp?goodsID=<%=goodsID%>'" value="购买">
                                <%}%>
                            </td>
                    	</tr>
                      </table></td>
                      </tr>
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

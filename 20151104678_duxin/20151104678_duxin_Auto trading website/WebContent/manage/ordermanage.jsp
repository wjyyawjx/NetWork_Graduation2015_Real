<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.ResultSet"
    pageEncoding="UTF-8" %>
<%@ page import="com.tools.ConnDB"%>
<%@ page import="com.tools.ChStr"%>	
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%
	ConnDB conn =new ConnDB();
	ChStr chStr =new ChStr();
	ResultSet rs=conn.executeQuery("select * from tb_order");
	int orderID=0;
	String username="";
	int bnumber=0;
	String receviename="";
	String address="";
	String postcode="";
	String tel="";
	String pay="";    
	String carry="";
	float rebate=1;
	String orderDate="";
	String bz="";
	if (bz.equals("")){
        bz="无";
     }
	int enforce=0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单管理</title>
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
                     <table width="100%" height="48"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#CCCCCC" bordercolorlight="#FFFFFF">
						 <tr align="center">
						 	<td width="8%" height="30">订单号</td>
		                    <td width="8%">品种数</td>
		                    <td width="10%">用户名</td>
		                    <td width="15%">收货人</td>
 							<td width="17%">收货地址</td>
                      		<td width="6%">联系电话</td>
                      		<td width="15%">订货日期</td>
                      		<td width="10%">备注</td>
                      		<td width="20%">执行</td>
                      	</tr>
                      	<%
                      		String str = (String)request.getParameter("Page");
                      		if(str==null){
                      			str="0";
                      		}
                      		int pagesize=10;
                      		rs.last();
                      		int RecordCount=rs.getRow(); 
                      		int maxPage=0;
                      		maxPage=(RecordCount%pagesize==0)?(RecordCount/pagesize):(RecordCount/pagesize+1);
                      		int Page=Integer.parseInt(str);
                      		if(Page<1){
                      			Page=1;
                      		}else{
                      			 if(((Page-1)*pagesize+1)>RecordCount){
                      				 Page = maxPage;
                      			 }
                      		}
                      		rs.absolute((Page-1)*pagesize+1);
                      		for(int i=1;i<=pagesize;i++){
                      			orderID=rs.getInt("orderID");
                      			bnumber=rs.getInt("bnumber");
                      		    username=rs.getString("username");
	                      	    receviename=rs.getString("recevieName");
	                      	    address=rs.getString("address");
	                      	    tel=rs.getString("tel");
		                      	orderDate=rs.getString("OrderDate");
		                        bz=rs.getString("bz");
		                        enforce=rs.getInt("enforce");
                      		
                      	%>
                      		<tr align="center">
                      			<td height="24"><a href="order_detail.jsp?ID=<%=orderID%>"><%=orderID%></a></td>
								<td><%=bnumber%></td>
								<td><%=username%></td>
								<td><%=receviename%></td>
								<td><%=address%></td>
								<td><%=tel%></td>
								<td><%=orderDate%></td>
								<td><%=bz%></td>
								<td><%if(enforce==0){%><a href="order_enforce.jsp?ID=<%=orderID%>"><img src="../images/enforce.gif" width="16" height="16"></a>
								<%}else{ %>已执行<%} %></td>
								</tr>
					<%
					 try{
				         if(!rs.next()){break;}
				         }catch(Exception e){}
					}
					%>	
					</table>
					<table width="100%"  border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td align="right">当前页数：[<%=Page%>/<%=maxPage%>]&nbsp;
			     			 <%if(Page>1){%>
			     			 <a href="index.jsp?Page=1">第一页</a> <a href="index.jsp?Page=<%=Page-1%>">上一页</a>
			     			 <%
			     			 }
			     			 if(Page<maxPage){
			     				%>
			     				<a href="index.jsp?Page=<%=Page+1%>">下一页</a>　<a href="index.jsp?Page=<%=maxPage%>">最后一页&nbsp;</a>
			     				<%} %></td>
     		            </tr>
					</table>	</td>		
                      		</tr>
					</table>		
			</table>	
			</table>	
</table>
</body>
</html>
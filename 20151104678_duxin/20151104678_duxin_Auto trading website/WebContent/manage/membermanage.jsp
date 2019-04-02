<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.ResultSet"
    pageEncoding="UTF-8" %>
<%@ page import="com.tools.ConnDB"%>
<%@ page import="com.tools.ChStr"%>	
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%
	ConnDB conn = new ConnDB();
	ChStr chStr = new ChStr();
	ResultSet rs = conn.executeQuery("select * from tb_member");	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员管理</title>
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
					<table width="100%" height="14"  border="0" cellpadding="0" cellspacing="0">
						 <tr>
              				<td height="13" align="center">&nbsp;</td>
           				 </tr>
					</table>
					<table width="100%" height="48"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#CCCCCC" bordercolorlight="#FFFFFF">
						<tr>
							<td width="14%" height="27" align="center">用户名</td>
							<td width="14%" align="center">真实姓名</td>
							<td width="11%" align="center">城市</td>
							<td width="14%" align="center">电话</td>
							<td width="26%" align="center">Email</td>
							<td width="10%" align="center">销费额</td>
							<td width="11%" align="center">冻结/解冻</td>
						</tr>
					<%
						String str=(String)request.getParameter("Page");
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
						            Page=maxPage;
						      }
						}
						rs.absolute((Page-1)*pagesize+1);
						for(int i=1;i<=pagesize;i++){
							int ID=rs.getInt("ID");
							String username=rs.getString("username");
							String Truename=rs.getString("Truename");
							String city=rs.getString("city");
							String CardNO=rs.getString("CardNO");
							String CardType=rs.getString("CardType");
							float Amount=rs.getFloat("Amount");
							String Tel=rs.getString("Tel");
							String Email=rs.getString("Email");
							int freeze=rs.getInt("freeze"); 
							%>
							<tr style="padding:5px;">
								<td height="24" align="center"><a href="member_detail.jsp?ID=<%=ID%>"><%=username%></a></td>
								<td align="center"><%=Truename%></td>
								<td align="center"><%=city%></td>
								<td align="center"><%=Tel%></td>
								<td align="center"><%=Email%></td>
								<td align="center"><%=Amount%></td>
								<td align="center"><%if(freeze==0){%><a href="member_freeze.jsp?ID=<%=ID%>"><img src="../images/freeze.gif" alt="冻结" width="20" height="15"></a>
								<%}%>
									<%if(freeze==1){%><a href="member_thaw.jsp?ID=<%=ID%>"><img src="../images/thaw.gif" alt="解冻" width="20" height="15"></a>
									<%}%></td>
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
						<td height="27" align="right">当前页数：[<%=Page%>/<%=maxPage%>]&nbsp;
						 <%if(Page>1){%>
						 <a href="membermanage.jsp?Page=1">第一页</a>　<a href="membermanage.jsp?Page=<%=Page-1%>">上一页</a>
						 <%
      						}
      						if(Page<maxPage){
      					 %>
      					 <a href="membermanage.jsp?Page=<%=Page+1%>">下一页</a>　<a href="membermanage.jsp?Page=<%=maxPage%>">最后一页&nbsp;</a>
      					 <%}%></td>
      					 </tr>
      					 </table></td>
					</tr>
				</table>		
			</table>	
			</table>	
</table>
</body>
</html>
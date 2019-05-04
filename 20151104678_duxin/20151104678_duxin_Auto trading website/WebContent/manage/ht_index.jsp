<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
	<%@ page import="com.tools.ConnDB" %>
	<!--<jsp:include page="safe.jsp"/>-->
	<%
		ConnDB conn = new ConnDB();//创建并实例化ConnDB的一个对象
		ResultSet rs=conn.executeQuery("select*from tb_goods order by INTime Desc");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理主页</title>
<link rel="stylesheet" href="../front/css/mr-01.css" type="text/css">
<script type="text/javascript" src="onclock.js"></script>
<script src="../front/js/jsArr01.js" type="text/javascript"></script>
<script src="../front/js/module.js" type="text/javascript"></script>
<script src="../front/js/jsArr02.js" type="text/javascript"></script>
<script src="../front/js/tab.js" type="text/javascript"></script>
<style type="text/css">
	li{list-style: none;}
</style>
</head>
<body onload="clockon(bgclock)">
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
		</table>
		<table width="100%" height="192" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top">
				<table width="100%" height="" style="background-color:#4D4D4D" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td height="13" align="center"><span style="color: #ffffff; ">商品列表</span></td>
					</tr>
				</table>
					  <table width="100%" height="48"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#CCCCCC" bordercolorlight="#FFFFFF">
					  	<tr bgcolor="#eeeeee">
                			<td width="22%" height="24" align="center">商品名称</td>
							<td width="40%" align="center">简介</td>
				            <td width="11%" align="center">是否新品</td>
				            <td width="11%" align="center">是否特价</td>
				            <td width="8%" align="center">修改</td>
				            <td width="8%" align="center">删除</td>
						</tr>
		<% 
		String str=(String)request.getParameter("Page");
		if(str==null){
			str="0";
		}
		int pagesize=10;
		rs.last();
		int RecordCount = rs.getRow();
		int maxPage=0;
		maxPage = (RecordCount%pagesize==0)?(RecordCount/pagesize):(RecordCount/pagesize+1);
		int Page = Integer.parseInt(str);
		if(Page<1){
			Page=1;
		}else{
			 if(Page>maxPage){
		         Page=maxPage;
		      }
		}
		rs.absolute((Page-1)*pagesize+1);
		for(int i=1;i<=pagesize;i++){
			int ID = rs.getInt("ID");
			String goodsName=rs.getString("goodsName");
		  	String introduce=rs.getString("introduce");
		    String newgoods=rs.getInt("newgoods")==0 ? "否":"是";
		    String sale=rs.getInt("sale")==0 ? "否":"是"; 
		
		%>
		<tr style="padding:5px;">
			<td height="20" align="center"><a href="goods_detail.jsp?ID=<%=ID%>"><%=goodsName%></a></td>
            <td align="center"><%=introduce%></td>
            <td align="center"><%=newgoods%></td>
            <td align="center"><%=sale%></td>
            <td align="center"><a href="goods_modify.jsp?ID=<%=ID%>"><img src="../front/images/modify.gif" width="15" height="15"></a></td>
            <td align="center"><a href="goods_del.jsp?ID=<%=ID%>"><img src="../front/images/del.gif" width="16" height="16"></a></td>
        </tr>
        <%
        	try{
                if(!rs.next()){break;}
            	}catch(Exception e){}		
		}
        %>
			</table>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="right">当前页数：[<%=Page%>/<%=maxPage%>]&nbsp;
     			 <%if(Page>1){%>
     			 <a href="index.jsp?Page=1">第一页</a> <a href="index.jsp?Page=<%=Page-1%>">上一页</a>
     			 <%
     			 }
     			 if(Page<maxPage){
     				%>
     				<a href="index.jsp?Page=<%=Page+1%>">下一页</a>　<a href="index.jsp?Page=<%=maxPage%>">最后一页&nbsp;</a>
     				<%} %>
     				</td>
     		</tr>

		</table></td>
			</tr>
			</table>
            </tr>		
		</table>
    	</td>
    	</tr>
</table>

</body>
</html>
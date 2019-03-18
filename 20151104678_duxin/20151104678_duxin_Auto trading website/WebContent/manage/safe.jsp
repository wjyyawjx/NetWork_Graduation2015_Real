<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.tools.ConnDB"%>
    <%
    	ConnDB conn = new ConnDB();//创建并实例化ConnDB的一个对象
    	ResultSet rs = conn.executeQuery("select * from tb_goods order by INTime Desc");
    	
    %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>51汽车网后台管理系统</title>
<link rel="stylesheet" href="../css/mr-01.css" type="text/css">
<script src="../js/jsArr01.js" type="text/javascript"></script>
<script src="../js/module.js" type="text/javascript"></script>
<script src="../js/jsArr02.js" type="text/javascript"></script>
<script src="../js/tab.js" type="text/javascript"></script>
<style type="text/css">
	li{list-style: none;}
</style>

</head>
<body>
	<div id="top" style=" background: url(images/top2.jpg);height:150px;width:100%; background-size:cover;">
		<span style="margin-left:100px; font-size: 60px; text-shadow: 5px 5px 5px black, 0px 0px 2px black;
		 color: white;">51汽车网后台管理系统</span>	
	</div>
	<div id="center" style="margin-top: 100xp;">
		<div id="center_left" style="float:left; margin-left: 50px;">
			<div style="background-color:#4D4D4D ">
				<span style="color: #ffffff; margin-left: 40px;">网站后台管理</span>
			</div>
			<div  >
				<ul style="border-style: solid;border-color: black; border-right-color: red;">
				<hr>
					<li>商品管理<br>Goods Manage</li>
					<hr>
					<li>销量排行榜<br>Sale Top 10</li>
					<hr>
					<li>会员管理<br>Membar Manage</li>
					<hr>
					<li>订单管理<br>Order Manage</li>
					<hr>
					<li>退出后台<br>Exit Background</li>	
					<hr>
				</ul>
			</div>
		</div>
		<div id="center_right" style="float:left;margin-left: 70px;width:80%"> 
		<div style="background-color:#4D4D4D;">
				<span style="color: #ffffff" >商品列表</span>
			</div>
		<table width="100%" height="48" border="1" cellpadding="0" cellspacing="0" bordercolor="#ffffff" bordercolordark="#CCCCCC" bordercolorlight="#ffffff">
			<tr bgcolor="#eeeeee">
				<td width="22%" height="24" align="center">商品名称</td>
				<td width="40%"  align="center">简介</td>
				<td width="11%"  align="center">是否新品</td>
				<td width="11%"  align="center">是否特价</td>
				<td width="8%"  align="center">修改</td>
				<td width="8%"  align="center">删除</td>
			</tr>
			
		<%
		String str =(String)request.getParameter("Page");
		if(str==null){
			str="0";
		}
		int pagesize=10;
		rs.last();
		int RecordCount = rs.getRow();
		rs.last();
		int maxPage = 0;
		maxPage = (RecordCount%pagesize==0)?(RecordCount/pagesize):(RecordCount/pagesize+1);
		int Page = Integer.parseInt(str);//将字符串STR转换成整型
		if(Page<1){
			Page=1;
		}else{
			if(Page>maxPage){
				Page =maxPage;
			}
		}
		rs.absolute((Page-1)*pagesize+1);//定位记录指针
		for(int i=1;i<=pagesize;i++){
			int ID=rs.getInt("ID");
			String goodsName = rs.getString("goodsName");
			String introduce = rs.getString("introduce");
			String newgoods = rs.getInt("newGoods")==0?"否":"是";
			String sale = rs.getInt("sale")==0?"否":"是";
			%>
				<tr style="padding: 5px;">
				<td height="20" align="center">
					<a href="goodsDetail.jsp?ID=<%=ID%>"><%=goodsName%></a></td>
					<td align="center"><%=introduce%></td>
	                <td align="center"><%=newgoods%></td>
	                <td align="center"><%=sale%></td>
	                <td align="center"><a href="goods_modify.jsp?ID=<%=ID%>">
	                	<img src="images/modify.gif" width="20" height="20" style=" margin-left: 20px;"></a></td>
	                <td align="center"><a href="goods_del.jsp?ID=<%=ID%>">
	                        <img src="images/del.gif" width="20" height="20" style=" margin-left: 20px;"></a></td>
	
	              </tr>
			<%
			   try{
				   if(!rs.next()){break;} //当记录指针到达记录尾时，退出For循环
			   }catch(Exception e){}
			   }
			%>
	                </table>	
			<table width="100%" border="0" cellspacing="0" cellpadding="0">	
				<tr>
					<td align="right"> 当前页数：[<%=Page%>/<%=maxPage%>]&nbsp;
					<%if(Page>1){ %>
					<a href="index.jsp?Page=<%=Page+1%>">下一页</a>     <a href="index.jsp?Page=<%=maxPage%>">最后一页&nbsp;</a>
					<%} %>
					</td>
				</tr>
		</table>
		</div>
	</div>
</body>
</html>
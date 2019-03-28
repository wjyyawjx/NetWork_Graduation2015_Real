<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.ResultSet"
    pageEncoding="UTF-8" %>
<%@ page import="com.tools.ConnDB"%>
<%@ page import="com.tools.ChStr"%>	
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<!-- 数据库调用信息 -->
<%
	ConnDB conn =new ConnDB();
	ChStr chStr =new ChStr();
	ResultSet rs_super = conn.executeQuery("select ID,TypeName from tb_supertype group by ID,TypeName");
	int superID = -1;
	String superName="";
	if(rs_super.next()){
		superID = rs_super.getInt(1);
	}else{
		out.println("<script language='javascript'>alert('请先录入类别信息');window.location.href ='../front/manage/ht_index.jsp';</script>");
		return;	
	}
	
	int P_superID = -1;
	ResultSet rs_sub=null; 
	//查询所属小类的默认选项
	if(request.getParameter("superID")==""||request.getParameter("superID")==null){
		P_superID = superID;
	}else{
		P_superID = Integer.parseInt(request.getParameter("superID"));
	}
	rs_sub = conn.executeQuery("select *from tb_subType where superType ="+P_superID);
	int subID=-1;
	String subName="";
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

<script type="text/javascript">
	function mycheck(){
		if(form1.goodsName.value==""){
			alert("请输入商品名称！");
			from1.goodsName.focus();
			return;
		}
		if(form1.picture.value==""){
			alert("请输入图片路径！");
			form1.picture.focus();
			return;
		}
		if(form1.price.value==""){
			alert("请输入商品的定价！");
			form1.price.focus();
			return;
		}
		if(isNaN(form1.price.value)){
			alert("您输入的定价错误，请重新输入！");
			form1.price.value="";
			form1.price.focus();
			return;
		if(from1.introduce.value==""){
			alert("请输入商品简介！");
			form1.introduce.focus();
			return;
		}
		form1.submit();	
		}
	}
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
                      <form action="goods_add_deal.jsp" method="post" name="form1" >
                      <fieldset>
                      <table width="100%"  border="0" align="center" cellpadding="-2" cellspacing="-2" bordercolordark="#FFFFFF">
                     
				<tr>
				<td height="27">所属大类：</td>
				 <td width="31%" height="27">
						<script language="javascript">
						function F_super(val){
							window.location.href="goods_add.jsp?superID="+val;//实现级联菜单
							
						}
						</script>
						<select name="supertype" class="textarea" id="supertype" onChange="F_super(this.value)">
						<%rs_super.first();
                             do{
                                superID=rs_super.getInt(1);
                                superName=rs_super.getString(2);
                          %>	
                        <option value="<%=superID%>"<%if(superID==P_superID){out.println(" selected");/*注意此处的分号*/}%>><%=superName%></option>
                         <%}while(rs_super.next());%>       
						</select></td>
						<td width="13%" height="27">所属小类：</td>
                        <td width="42%" height="27"><option value="<%=subID%>"><%=subName%></option>
                        <select name="typeID" class="textarea" id="typeID">
                        	<%while(rs_sub.next()){
                        		subID=rs_sub.getInt(1);
                        		subName=rs_sub.getString(3);%>
                        		<option value="<%=subID%>"><%=subName%></option>
                        	<% } %>             
                        </select>
						</td>
					</tr>
					<tr>
					    <td width="14%" height="27">&nbsp;商品名称：</td>
                     	<td height="27" colspan="3">
                      	<input name="goodsName" type="text" class="Sytle_text" id="bookID2" size="50">                    </td>
                    </tr>
                 	 <tr>
                      	<td height="41">图片文件：</td>
                    	<td height="41">                	
                        <input name="picture" type="file" class="Style_upload" id="picture">
                        </td>
                    	<td height="41">定　　价：</td>
	                    <td height="41"><input name="price" type="text" class="Sytle_text" id="price">(元)</td>
					</tr>
                    <tr>
                    	<td height="45">是否新品：</td>
                   		<td>&nbsp; <input name="newGoods" type="radio" class="noborder" value="1" checked>是
						<input name="newGoods" type="radio" class="noborder" value="0">否</td>
                   		<td>&nbsp;是否特价：</td>
						<td><input name="sale" type="radio" class="noborder" value="1" checked>是
						<input name="sale" type="radio" class="noborder" value="0">否</td>
                    </tr>
                  	<tr>
	                    <td height="103">商品简介：</td>
	                    <td colspan="3"><span class="style5"></span>
                        <textarea name="introduce" cols="60" rows="5" class="textarea" id="introduce"></textarea></td>
                    </tr>                    
                    <tr>
                    <td height="38" colspan="4" align="center">
                        <input name="Button" type="submit" class="btn_grey" value="保存" onClick="mycheck()">
                      	&nbsp;                        
						<input name="Submit2" type="reset" class="btn_grey" value="重置">
                        &nbsp;
                        <input name="Submit3" type="button" class="btn_grey" value="返回" onClick="JScript:history.back(-1)">
					</td>
					
				</tr>
				
				</table>
				</fieldset>
				</form>
				</table>		
			</table>	
			</table>	
</table>
</body>
</html>
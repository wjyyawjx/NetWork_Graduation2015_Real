<%@page import="com.qst.bean.BuytodayBean"%>
<%@page import="java.util.List"%>
<%@page import="com.qst.service.BuytodayService"%>
<%@page import="com.qst.service.BuytodayServiceimp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品信息列表</title>
<link href="../css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
  function check(){
    var mymessage=confirm("确定要删除吗？");  
    if(mymessage==true){
    
       return true;
    }  
    else if(mymessage==false){  
       return false;
    }   
    
  }
  
</script>
</head>

<body>  
<div align="right">欢迎你，${sessionScope.username } &nbsp;&nbsp;&nbsp;<a href="logout.jsp">退出</a></div>
<h2>商品信息列表</h2>
<p id="addRec"><a href="recommend.jsp"><input type="button" value="添加商品"></a></p>

<table>
  <tr>
    <td class="listTable" width="100">编号</td>
    <td class="listTable" width="100">商品名</td>
    <td class="listTable" width="100">现价</td>
    <td class="listTable" width="100">原价</td>
    <td class="listTable" width="100">折扣</td>
    <td id="profile"  width="200">图片</td>
    <td id="operate">操作</td>
  </tr>
<%
   session.removeAttribute("list");
   BuytodayService buyService = new BuytodayServiceimp();
   List<BuytodayBean> list = buyService.getAllBuytoday();
   session.setAttribute("list", list);
   for(BuytodayBean buy:list){
 %>

  <tr>
   <td><%=buy.getTodayid() %> </td>
   <td><%=buy.getTyname() %> </td>
   <td><%=buy.getOriginal() %> </td>
   <td><%=buy.getPresent() %> </td>
   <td><%=buy.getDscount() %> </td>
   <td><%=buy.getPicturename() %> </td>
   <td>
   <a href="modifytoday.jsp?todayid=<%=buy.getTodayid() %>">修改&nbsp;</a>
   <a href="../Delbuytoday?todayid=<%=buy.getTodayid() %>" onclick="return check()">删除&nbsp;</a></td>
  </tr>
<%} %>




</table>

</body>
</html>
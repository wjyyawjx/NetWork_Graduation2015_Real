<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
          <form method="post"   action="method!fangchanupdate2"><div align="right"> 
    </div><table class="table" cellspacing="1" cellpadding="2"  align="center" border="0">
  <tbody>
    
    
  
    <input type="hidden" name="id" value="${bean.id }"/>
    <tr>
      <td align="right">有无多媒体:</td>
      <td>
       <select name="salestate">
      <option value="有多媒体" <c:if test="${bean.salestate=='有多媒体' }">selected</c:if>>有多媒体</option>
      <option value="无多媒体"  <c:if test="${bean.salestate=='无多媒体' }">selected</c:if>>无多媒体</option>
      </select>
      </td>
      
    </tr>
    <tr>
      <td align="right">门牌号:</td>
      <td><input type="text" name="menpaihao" value="${bean.menpaihao }"/></td>
      
    </tr>
     <tr>
      <td align="right">会议室用途:</td>
      <td><input type="text" name="fangwujiegou" value="${bean.fangwujiegou }"/></td>
      
    </tr>
     <tr>
      <td align="right">会议室名称:</td>
      <td><input type="text" name="shebei" value="${bean.shebei }"/></td>
      
    </tr>
     <tr>
      <td align="right">容纳人数:</td>
      <td><input type="text" name="mianji" value="${bean.mianji }"/></td>
      
    </tr>
    <tr>
      <td align="right">会议室地点:</td>
      <td><input type="text" name="price"  value="${bean.price }"/></td>
      
    </tr>
    <tr>
      <td align="right">备注:</td>
      <td>
      <textarea rows="7" cols="50" name="beizhu">${bean.beizhu }</textarea>
      </td>
      
    </tr>
    
    
    
  
    
  </tbody>
</table>
</form>
  </body>
</html>

<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
        
        <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
        
        <script language="javascript">
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
		<form method="post"   action="<%=path %>/huiyi?type=huiyiAdd"><div align="right"> 
    </div><table class="table" cellspacing="1" cellpadding="2" width="80%" align="center" border="0">
  <tbody>
    
    
  
      <tr>
      <td align="right">会议室名称:</td>
      <td><input type="text" name="shebei" /></td>
      
    </tr>
     <tr>
      <td align="right">容纳人数:</td>
      <td><input type="text" name="mianji" /></td>
      
    </tr>
     <tr>
      <td align="right">会议室地点:</td>
      <td><input type="text" name="price" /></td>
      
    </tr>
     <tr>
      <td align="right">门牌号:</td>
      <td><input type="text" name="menpaihao" /></td>
      
    </tr>
    
   
    <tr>
      <td align="right">有无多媒体:</td>
      <td>
       <select name="salestate">
      <option value="有多媒体" >有多媒体</option>
      <option value="无多媒体"  >无多媒体</option>
      </select>
      </td>
      
    </tr>
   
     <tr>
      <td align="right">会议室用途:</td>
      <td><input type="text" name="fangwujiegou" /></td>
      
    </tr>
    
    <tr>
      <td align="right">备注:</td>
      <td>
      <textarea rows="7" cols="50" name="beizhu"></textarea>
      </td>
      
    </tr>
    
     <tr>
      <td></td>
      <td>  <input type="submit" value="提交"/>
      &nbsp; &nbsp; &nbsp; &nbsp;
      <input type="reset" value="重置"/>
       &nbsp; &nbsp; &nbsp; &nbsp;
      <input  onclick="javascript:history.go(-1);"  type="button" value="返回" /></td>
      
    </tr>
    
  
    
  </tbody>
</table>
</form>
   </body>
</html>

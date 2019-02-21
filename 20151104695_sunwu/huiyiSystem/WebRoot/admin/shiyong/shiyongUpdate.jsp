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
	<table class="usertableborder" cellspacing="1" cellpadding="3" width="96%" align="center"
        border="0">
        <tr>
            <th colspan="3">
               更新会议室使用信息</th>
        </tr>
        
    </table>
    <br>
	
	
			 	<form action="<%=path %>/shiyong?type=shiyongUpdate" name="formAdd" method="post">
			    <div align="right"> 
    </div>
   <table class="table" cellspacing="1" cellpadding="2" width="80%" align="center" border="0">
  <tbody>
    
     <input type="hidden" name="id" value="${bean.id }"/>
    
      <tr>
      <td>标题:</td>
      <td>   <input type="text" name="title" value="${bean.title }"/></td>
      
    </tr>
      <tr>
      <td align="right">会议室名称:</td>
      <td>
      <select name="cailiao">
      <option value=""></option>
      <c:forEach items="${list2}" var="bean2">
      <option value="${bean2.shebei }" <c:if test="${bean2.shebei==bean.cailiao }">selected</c:if>>${bean2.shebei }</option>
      </c:forEach>
      
      </select>
      </td>
      
    </tr>
    
         
  
     <tr>
      <td  align="right">使用开始时间:</td>
      <td>   <input type="text" name="startdate" value="${bean.startdate }"/></td>
      
    </tr>
      <tr>
      <td  align="right">使用结束时间:</td>
      <td>   <input type="text" name="enddate" value="${bean.enddate }"/></td>
      
    </tr>
    <tr>
      <td>备注:</td>
      <td>
       <textarea rows="7" cols="50" name="content">${bean.content }</textarea>
      </td>
      
    </tr>
    
     <tr>
      <td><br></td>
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

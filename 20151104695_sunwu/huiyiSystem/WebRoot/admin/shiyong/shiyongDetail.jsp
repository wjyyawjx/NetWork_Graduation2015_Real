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
          <form method="post"   action="<%=path %>/shiyong?type=shiyongUpdate2"><div align="right"> 
    </div>
    
     <table class="table" cellspacing="1" cellpadding="2" width="80%" align="center" border="0">
  <tbody>
    
     <input type="hidden" name="id" value="${bean.id }"/>
    
    <tr>
      <td>标题:</td>
      <td>   <input type="text" name="title" value="${bean.title }" readonly="readonly"/></td>
      
    </tr>
    
     <tr>
      <td>会议室名称:</td>
      <td>   <input type="text" name="title" value="${bean.cailiao  }" readonly="readonly"/></td>
      
    </tr>
     <tr>
      <td>申请人:</td>
      <td>   <input type="text" name="lingliaoren" value="${bean.lingliaoren  }" readonly="readonly"/></td>
      
    </tr>
      <tr>
      <td  align="right">使用开始时间:</td>
      <td>   <input type="text" name="startdate" value="${bean.startdate }" readonly="readonly"/></td>
    </tr>
    
      <tr>
      <td  align="right">使用结束时间:</td>
      <td>   <input type="text" name="enddate" value="${bean.enddate  }" readonly="readonly"/></td>
      
    </tr>

    
    <tr>
      <td>备注:</td>
      <td>
       <textarea rows="7" cols="50" name="content" readonly="readonly">${bean.content }</textarea>
      </td>
      
    </tr>
    
      <tr>
      <td align="right">审批结果:</td>
      <td>
      <select name="chulijieguo">
      <option value="未处理" <c:if test="${bean.chulijieguo=='未处理' }">selected</c:if> >未处理</option>
      <option value="审核通过" <c:if test="${bean.chulijieguo=='审核通过' }">selected</c:if> >审核通过</option>
       <option value="审核不通过" <c:if test="${bean.chulijieguo=='审核不通过' }">selected</c:if> >审核不通过</option>
      </select>
      </td>
      
    </tr>

    
    <tr>
      <td align="right">处理反馈:</td>
      <td>
      <textarea rows="7" cols="50" name="chulifankui">${bean.chulifankui }</textarea>
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

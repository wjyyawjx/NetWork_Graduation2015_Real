<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html  xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="css/main2.css" rel="stylesheet" type="text/css" />
  <head>
    <title>My JSP 'BB.jsp' starting page</title>
  </head>
  <body >
  <div  class="login">
    
		
			<div class="log">
  <form action="ZhuceServlet"method="post" style="padding-top:-700px;">
	  <div class="name"> 输入用户名:<input  class="text" name="name" type="text"><br><br>
	  
	   输入工号:<input  class="text" name="worknumber" type="text"><br><br>
	   选择性别:<br><input  type="radio"name="sex"value="男"checked>男
	        <input   type="radio"name="sex"value="女">女<br><br>
	 选择岗位:<br>
	 <input    type="radio"name="gangwei"value="javaweb老师"checked>javaweb老师
	      <br>  <input   type="radio"name="gangwei"value="数据库老师">数据库老师
	 	       <br> <input type="radio"name="gangwei"value=".net老师">.net老师<br><br>
	 
	   选择家乡:
	   <select  class="text" name="home">
		   <option value="内蒙古呼和浩特">内蒙古呼和浩特</option>
		   <option value="内蒙古锡林格勒" selected>内蒙古锡林格勒</option>
		   <option value="内蒙古乌兰察布">内蒙古乌兰察布</option>
   		</select><br>
           <br>    填写个人信息:<br>
	   <textarea  class="text" name="info" row="5"cols="30"></textarea><br>
	   <table>
	   <tr>
	   <td>	   <input class="submit" type="submit"value="注册">
	   
	   	   <input type="reset" class="submit" value="重置">
	   </td>
	   </tr>
	   </table>
	    </div>
   </form>
   </div>
   </div>
   <div class="air-balloon ab-1 png"></div>
	<div class="air-balloon ab-2 png"></div>
    <div class="footer"></div>
  </body>
</html>

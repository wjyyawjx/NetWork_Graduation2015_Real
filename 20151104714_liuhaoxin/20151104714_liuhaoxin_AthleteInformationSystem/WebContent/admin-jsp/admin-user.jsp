<%--  管理员显示所有用户信息的页面 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css"  type="text/css" media="all">
<title>Insert title here</title>
 <script type="text/javascript">
 function prom()
 {
	 
	 var b=event.target.id;
     var pwd=prompt("请输入密码","");
     
     if(pwd)
     {
    	 var pwd1=prompt("请在次输入密码","");
    	 if(pwd==pwd1){
    		 window.location.href="UserPwdUpdate?pwd="+pwd+"&uid="+b;
    	 }else{
        	 alert("俩次输入的密码不一致")
         }
     }else{
    	  alert("您取消了修改")
     }
   
 }
 </script>
</head>
<body>
<form action="UserQuery" method="post">
	<table border="0" cellpadding="0" cellspacing="0" style="font-size: 20px"  width="100%" height="31" >
		  <tr>
		  <td width="17%" align="right" valign="middle">
		  <h3>用户名：</h3>
	      </td>
		  <td width="14%" align="left" valign="middle">
		  <input type="text" style="width: 200px" name="username" placeholder="输入用户名"></td>
		  <td width="16%" align="right" valign="middle"> <h3>用户类型：</h3> </td>
		  <td width="15%" align="left" valign="middle">
		  <select  name="type">
		  <option value="3">所有用户</option>
		  <option value="0">普通用户</option>
		  <option value="1">管理员</option>
		  </select></td>
		  <td width="20%" align="center" valign="middle">
		  <input type="submit" style="width: 200px" value="搜索"></td>
		  </tr> 
    </table>
</form>
	<table border="2" cellpadding="0" cellspacing="0"
		style="font-size: 20px"  width="100%" height="50px">
		<thead>
			<tr>
				<th>用户名                                                </th>
				<th>密码                                                   </th>
				<th>邮箱                                                   </th>
				<th>联系方式                                            </th>
				<th>用户类型</th>
				<th>修改密码                                           </th>
				<th>修改为普通用户               </th>
				<th>修改为记录员用户                </th>
				<th>禁用用户                                            </th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${userdata}" var="w">
				<tr align="center">
					<td>${w.username}</td>
					<td>${w.pwd}</td>
					<td>${w.email}</td>
					<td>${w.phone}</td>
					<td>${w.permission}</td>
					<td><input type="submit" style="width: 150px" id=${w.uid} onclick="prom()" value="修改密码"></td>
					<td>
					<form action="PermissionUpload" method="post">
						<input type="hidden" name="uid" value=${w.uid}> 
						<input type="hidden" name="qx"  value="0"> 
						<input type="submit" style="width: 150px" value="修改为普通用户  ">
					</form></td>
					<td>
					<form action="PermissionUpload" method="post">
						<input type="hidden" name="uid" value=${w.uid}> 
						<input type="hidden" name="qx" value="1"> 
						<input type="submit" style="width: 150px" value="修改为记录员用户  ">
						</form>
					</td>
					<td>
					<form action="PermissionUpload" method="post">
						<input type="hidden" name="uid" value=${w.uid}>
						<input type="hidden" name="qx" value="-1"> 
						<input type="submit" style="width: 150px" value="禁用此用户">
						</form>
					</td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
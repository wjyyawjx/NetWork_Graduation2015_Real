<%--显示所有申请理由 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<title>Insert title here</title>
 <script type="text/javascript">
 function prom()
 {
	 var b=event.target.id;
     var liyou=prompt("请输入拒绝理由","");
     
     if(liyou)
     {
    	 window.location.href="PermissionUpload3?aid="+b+"&liyou="+liyou;
    	 }else{
        	 alert("您取消了")
         }
 }
 
 function deletereason()
 {
	 var b=event.target.id;
	 var r=confirm("确定删除此条申请？");
		if (r==true){
			window.location.href="ToApplyForDelete?aid="+b;
		}
		else{
			alert("您取消了删除")
		}
 }
 </script>
</head>
<body>
<div align="center">

<table border="2" cellpadding="0" cellspacing="0"  >
				<thead>
					<tr>
						<th width="50%" >申请理由</th>
						<th width="10%" >申请人</th>
						<th width="10%" >状态</th>
						<th width="10%" >通过审核</th>
						<th width="10%" >拒绝通过</th>
						<th width="10%" >删除</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${gel}" var="w">
					<tr>
					<td>${w.reason} </td>
					<td>${w.username} </td>
					<td>${w.state}</td>
					<td>
					<form action="PermissionUpload2" method="post">
					<input type="hidden" name="username" value=${w.username}>
					<input type="submit" style="width: 150px" value="通过审核">
					</form></td>
			<td><input type="submit" style="width: 150px" id=${w.aid} onclick="prom()" value="拒绝申请"></td>

			<td><input type="submit" style="width: 150px" id=${w.aid} onclick="deletereason()" value="删除此条申请"></td>
					</tr>
					</c:forEach>
				</tbody>
		</table>	
		</div>
</body>
</html>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>标题</title>
<link href="<%=path%>/style/css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript">
$(function(){
  $('p').each(function(i){
    $(this).click(function(){
      $('p:not(:eq('+i+'))').next().hide();
      $('p:not(:eq('+i+'))').find('span').text("+");  
      $(this).next().show();  
      $(this).find('span').text("-"); 
    })
  })
})
function logout(){
  if (confirm("您确定要退出管理后台吗？"))
  top.location = "logout.php";
  return false;
}
</script>
</head>

<body class="admin_left">
  <div class="admin_nav"> 
    <p><span>+</span> 员工注册</p>
    <div> 
      <a target="mainFrame" href="yuangongRegister.jsp">员工注册</a> 
    </div>
  </div>
</body>
</html>
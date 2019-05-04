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
   	            <c:if test="${sessionScope.userType==0}"> 

    <p><span>+</span> 部门管理</p>
    <div> 
      <a target="mainFrame" href="<%=path %>/org?type=orgMana">部门管理</a> 
     

    </div>
    <p><span>+</span> 人员管理</p>
    <div> 
      <a target="mainFrame" href="<%=path %>/yuangong?type=yuangongMana">人员管理</a> 

    </div>
    <p><span>+</span> 共享文档管理</p>
    <div> 
      <a target="mainFrame" href="<%=path %>/wenjian?type=wenjianMana">共享文档管理</a> 
    </div>
    <p><span>+</span> 系统公告</p>
    <div> 
      <a target="mainFrame" href="<%=path %>/gonggao?type=gonggaoMana">公告管理</a>
	     

    </div>


	  <p><span>+</span> 会议室管理</p>
    <div> 
      <a target="mainFrame" href="<%=path %>/huiyi?type=huiyiMana">会议室管理</a>
	     

    </div>
    
    
      <p><span>+</span> 预约管理</p>
    <div> 
      <a target="mainFrame" href="<%=path %>/shiyong?type=shiyongMana">预约管理</a>
	     

    </div>

    <p><span>+</span> 密码修改</p>
    <div> 
      <a target="mainFrame" href="<%=path %>/admin/userinfo/userPw.jsp">密码修改</a> 
	        
    </div>
	 </c:if>
	            
	            <c:if test="${sessionScope.userType==1}"> 
    
    <p><span>+</span> 私人文件共享</p>
    <div> 
      <a target="mainFrame" href="<%=path %>/admin/email/emailAdd.jsp">新增共享文件</a> 
      <a target="mainFrame" href="<%=path %>/email?type=fajianxiangMana">已共享文件</a> 
      <a target="mainFrame" href="<%=path %>/email?type=shoujianxiangMana">收到的共享</a> 
      <a target="mainFrame" href="<%=path %>/email?type=caogaoxiangMana">备份的私人文件</a> 

    </div>

<p><span>+</span> 我的公开共享</p>
    <div> 
      <a target="mainFrame" href="<%=path %>/wenjian?type=wenjianAll">我的共享管理</a>
	     
      <a target="mainFrame" href="<%=path %>/admin/wenjian/wenjianAdd.jsp">上传共享文件</a>

    </div>
<p><span>+</span> 所有公开共享</p>
    <div> 
      <a target="mainFrame" href="<%=path %>/wenjian?type=wenjianMana">所有人的共享</a>
	     
    

    </div>
<p><span>+</span> 查看公告</p>
    <div> 
      <a target="mainFrame" href="<%=path %>/gonggao?type=gonggaoAll">公告查看</a>
	     

    </div>
    
    <p><span>+</span> 查看会议室</p>
    <div> 
      <a target="mainFrame" href="<%=path %>/huiyi?type=huiyiAll">会议室查看</a>
	     

    </div>
    
     <p><span>+</span>会议室预约</p>
    <div> 
      <a target="mainFrame" href="<%=path %>/shiyong?type=shiyongAll">会议室预约</a>
	     

    </div>
    
  <p><span>+</span> 密码修改</p>
    <div> 
      <a target="mainFrame" href="<%=path %>/admin/userinfo/userPw_yuangong.jsp">密码修改</a> 
	        
    </div>
	 </c:if>
	 
<!-- 时钟控件 -->
<embed wmode="transparent" src="honehone_clock_tr.swf" quality="high" bgcolor="#FDF6E3" width="200" height="110" name="honehoneclock" align="middle" allowscriptaccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer">
	 
<!-- 小老鼠控件 -->
<object type="application/x-shockwave-flash" style="outline:none;"  data="mouse.swf?up_bodyColor=f0e9cc&amp;up_feetColor=D4C898&amp;up_eyeColor=000567&amp;up_wheelSpokeColor=DEDEDE&amp;up_wheelColor=FFFFFF&amp;up_waterColor=E0EFFF&amp;up_earColor=b0c4de&amp;up_wheelOuterColor=FF4D4D&amp;up_snoutColor=F7F4E9&amp;up_bgColor=F0E4E4&amp;up_foodColor=cba920&amp;up_wheelCenterColor=E4EB2F&amp;up_tailColor=E6DEBE&amp;"   width="200" height="160"><param name="movie"  value="mouse.swf?up_bodyColor=f0e9cc&amp;up_feetColor=D4C898&amp;up_eyeColor=000567&amp;up_wheelSpokeColor=DEDEDE&amp;up_wheelColor=FFFFFF&amp;up_waterColor=E0EFFF&amp;up_earColor=b0c4de&amp;up_wheelOuterColor=FF4D4D&amp;up_snoutColor=F7F4E9&amp;up_bgColor=F0E4E4&amp;up_foodColor=cba920&amp;up_wheelCenterColor=E4EB2E&amp;up_tailColor=E6DEBE&amp;">

  </div>
</body>
</html>
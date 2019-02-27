<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 

<%String path = request.getContextPath();%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
  <head>
        <LINK rel=stylesheet type=text/css href="<%=path %>/css/style.css">
		<LINK rel=stylesheet type=text/css href="<%=path %>/css/gray.css">
		
		<STYLE type=text/css>
		   BODY {BACKGROUND-COLOR: #f8f8f8; BACKGROUND-REPEAT: repeat-x}
		   .fwtop {MARGIN: 0px auto; WIDTH: 100%; BACKGROUND: #66B3FF}
		</STYLE>
	    
	    <script type="text/javascript">
	        function gerenzhuye()
			{
			    var targetWinUrl="<%=path %>/admin/index.jsp"
				var targetWinName="newWin";
				var features="width="+screen.width+" ,height="+screen.height+" ,toolbar=yes, top=0, left=0, menubar=yes, scrollbars=yes, resizable=yes,location=no, status=yes";
				var new_win=window.open(targetWinUrl,targetWinName,features);
			}
			
			function liuyanAdd()
	        {
	            <c:if test="${sessionScope.userType!=2}">
	                  alert("请先登录");
	            </c:if>
	            <c:if test="${sessionScope.userType==2}">
	                 var strUrl = "<%=path %>/qiantai/liuyan/liuyanAdd.jsp";
		             var ret = window.showModalDialog(strUrl,"","dialogWidth:800px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
		             window.location.reload();
	            </c:if>
	        }
	    </script>
  </head>
  
  <body>
    <!-- 头 -->
	<DIV class=fwtop_head style="height: 160px;"><!-- 背景色在上的css里改 -->
		<table border="0" width="100%">
		    <tr>
		         <td width="60%">
		             <DIV style="font-size: 23px;margin-top: 60px;margin-left: 120px;">基于Javaweb的教师指导毕业设计系统</DIV>
		         </td>
		         <td width="40%">
		             <div style="float: right;margin-top: 100px;margin-right: 20px;">
						   
					 </div>
		         </td>
		    </tr>
		</table>
	</DIV>
	<!-- 头 -->
	<!-- 导航 -->
    <DIV class=fwtop_mainNav>
        <DIV id=siteMainNav class="siteMainNav fwtop_nav fwnavlink">
			<UL>
			  <LI class=open><A href="<%=path %>/qiantai/default.jsp" style="font-size: 15px;margin-left: 30px;">系统首页</A> </LI>
			  <%-- <LI class=commli><A href="#">商品类别</A> 
				  <DIV class="lev2 lev2_1">
					  <DL class=lev3>
					    <c:forEach items="${sessionScope.cateLogList}" var="catelog">
						   <DD class=lev3_cell><I class=cir></I><A href="<%=path %>/goodsByCatelog.action?catelogId=${catelog.catelogId}">${catelog.catelogName}</A> </DD>
						</c:forEach>
					  </DL>
				  </DIV>
              </LI> --%>
              
              <LI class=open><A href="<%=path %>/ziyuanAll.action" style="font-size: 15px;">资料下载</A> </LI>
              <c:if test="${sessionScope.userType !=2}">
              <LI class=open><a href="<%=path %>/qiantai/user/userReg.jsp" style="font-size: 15px;">学生注册</a></LI>
	          <LI class=open><a href="<%=path %>/qiantai/user/userLogin.jsp" style="font-size: 15px;">学生登陆</a></LI>
              </c:if>
              
              <c:if test="${sessionScope.userType ==2}">
	             <LI class=open><a href="#" style="font-size: 15px;">欢迎你：${sessionScope.user.userName}</a></LI>
	             <LI class=open><a href="<%=path %>/userLogout.action" style="font-size: 15px;">注销退出</a></LI>
	             <LI class=open><a href="<%=path %>/qiantai/lunwen/lunwenAdd.jsp" style="font-size: 15px;">提交题目</a></LI>
	             <LI class=open><a href="<%=path %>/lunwenMine.action" style="font-size: 15px;">我的题目</a></LI>
	          </c:if>
	          
	          <LI class=open style="margin-left: 200px;"><A href="<%=path %>/login.jsp" style="font-size: 15px;">后台登陆</A> </LI>
            </UL>
        </DIV>
    </DIV>
    <!-- 导航 -->
  </body>
</html>

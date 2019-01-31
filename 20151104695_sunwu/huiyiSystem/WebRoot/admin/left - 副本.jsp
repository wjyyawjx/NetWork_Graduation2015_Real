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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<STYLE type=text/css> 
		{
			FONT-SIZE: 12px
		}
		#menuTree A {
			COLOR: #566984; TEXT-DECORATION: none
		}
		</STYLE>

		<SCRIPT src="<%=path%>/js/TreeNode.js" type=text/javascript></SCRIPT>
		<SCRIPT src="<%=path%>/js/Tree.js" type=text/javascript></SCRIPT>
	</head>

	<BODY style="BACKGROUND-POSITION-Y: -120px;  BACKGROUND-REPEAT: repeat-x" topmargin="5">
		<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%">
				<TR>
					<TD width=10 height=29>
						<IMG src="<%=path %>/img/bg_left_tl.gif">
					</TD>
					<TD
						style="FONT-SIZE: 18px; BACKGROUND-IMAGE: url(<%=path %>/img/bg_left_tc.gif); COLOR: white; FONT-FAMILY: system">
						Main Menu
					</TD>
					<TD width=10>
						<IMG src="<%=path %>/img/bg_left_tr.gif">
					</TD>
				</TR>
				<TR>
					<TD style="BACKGROUND-IMAGE: url(<%=path %>/img/bg_left_ls.gif)"></TD>
					<TD id=menuTree style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; HEIGHT: 100%; BACKGROUND-COLOR: white" vAlign=top></TD>
					<TD style="BACKGROUND-IMAGE: url(<%=path %>/img/bg_left_rs.gif)"></TD>
				</TR>
		</TABLE>
		<SCRIPT type=text/javascript>
                var tree = null;
	            var root = new TreeNode('系统菜单');
	            
	            <c:if test="${sessionScope.userType==0}"> 
	            var fun2 = new TreeNode('密码修改');
	            var fun21 = new TreeNode('密码修改', '<%=path %>/admin/userinfo/userPw.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun2.add(fun21);
	            root.add(fun2);
	            
	            
	            var fun3 = new TreeNode('部门管理');
	            var fun31 = new TreeNode('部门管理', '<%=path %>/org?type=orgMana', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun3.add(fun31);
	            root.add(fun3);
	            
	            var fun4 = new TreeNode('员工管理');
	            var fun41 = new TreeNode('员工管理', '<%=path %>/yuangong?type=yuangongMana', 'tree_node.gif', null, 'tree_node.gif', null);
	            var fun42 = new TreeNode('员工录入', '<%=path %>/admin/yuangong/yuangongAdd.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun4.add(fun41);
	            fun4.add(fun42);
	            root.add(fun4);
	            
	            
	            var fun5 = new TreeNode('发文管理');
	            var fun51 = new TreeNode('发文管理', '<%=path %>/gonggao?type=gonggaoMana', 'tree_node.gif', null, 'tree_node.gif', null);
	            var fun52 = new TreeNode('发文录入', '<%=path %>/admin/gonggao/gonggaoAdd.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun5.add(fun51);
	            fun5.add(fun52);
	            root.add(fun5);
	            
	            
	            var fun8 = new TreeNode('文档管理');
	            var fun81 = new TreeNode('文档管理', '<%=path %>/wenjian?type=wenjianMana', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun8.add(fun81);
	            root.add(fun8);
	            
	            </c:if>
	            
	            <c:if test="${sessionScope.userType==1}"> 
	            
	            var fun2 = new TreeNode('密码修改');
	            var fun21 = new TreeNode('密码修改', '<%=path %>/admin/userinfo/userPw_yuangong.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun2.add(fun21);
	            root.add(fun2);
	            
	            
	            var fun5 = new TreeNode('发文浏览');
	            var fun51 = new TreeNode('发文浏览', '<%=path %>/gonggao?type=gonggaoAll', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun5.add(fun51);
	            root.add(fun5);
	            
	            
	            var fun7 = new TreeNode('内部文件');
	            var fun71 = new TreeNode('新文件', '<%=path %>/admin/email/emailAdd.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
	            var fun72 = new TreeNode('已共享', '<%=path %>/email?type=fajianxiangMana', 'tree_node.gif', null, 'tree_node.gif', null);
	            var fun73 = new TreeNode('已接受', '<%=path %>/email?type=shoujianxiangMana', 'tree_node.gif', null, 'tree_node.gif', null);
	            var fun74 = new TreeNode('草稿箱', '<%=path %>/email?type=caogaoxiangMana', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun7.add(fun71);
	            fun7.add(fun72);
	            fun7.add(fun73);
	            fun7.add(fun74);
	            root.add(fun7);  
	            
	            
	            var fun8 = new TreeNode('公司文档');
	            var fun81 = new TreeNode('公司文档', '<%=path %>/wenjian?type=wenjianAll', 'tree_node.gif', null, 'tree_node.gif', null);
	            var fun82 = new TreeNode('文档上传', '<%=path %>/admin/wenjian/wenjianAdd.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun8.add(fun81);
	            fun8.add(fun82);
	            root.add(fun8);
	            </c:if>
	            
	            tree = new Tree(root);
	            tree.show('menuTree')
        </SCRIPT>
	</BODY>
</html>

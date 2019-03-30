<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tools.ConnDB"%>
<%@ page import="com.tools.ChStr"%>
<%
	ConnDB conn = new ConnDB();
	ChStr chStr = new ChStr();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>冻结成功</title>
</head>
<body>
<%
	if(request.getParameter("ID")!=""){
		int ID=Integer.parseInt(request.getParameter("ID"));
		String sql="update tb_member set freeze=0 where ID="+ID;
		int ret=0;
		ret=conn.executeUpdate(sql);
		if (ret!=0){
			out.println("<script language='javascript'>alert('该会员信息已经被成功解冻！');window.location.href='membermanage.jsp';</script>");
		}else{
			out.println("<script language='javascript'>alert('操作失败！');window.location.href='membermanage.jsp';</script>");
		}
	}
%>
</body>
</html>
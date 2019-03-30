<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tools.ConnDB"%>
<jsp:include page="safe.jsp"/>
<%
	ConnDB conn = new ConnDB();
	if(request.getParameter("ID")!=""){
		int ID=Integer.parseInt(request.getParameter("ID"));
		String sql="update tb_member set freeze=1 where ID="+ID;
		int ret=0;
	    ret=conn.executeUpdate(sql);
	    if (ret!=0){
            out.println("<script language='javascript'>alert('该会员信息已经被冻结！');window.location.href='membermanage.jsp';</script>");
	    }else{
	    	 out.println("<script language='javascript'>alert('操作失败！');window.location.href='membermanage.jsp';</script>");
	    	 }
	    }
%>

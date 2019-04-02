<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tools.ConnDB"%>
<!--<jsp:include page="safe.jsp"/>-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	ConnDB conn =new ConnDB();
	if(request.getParameter("ID")!=""){
	 	int ID=Integer.parseInt(request.getParameter("ID"));
     	String sql="update tb_order set enforce=1 where orderID="+ID;
     	int ret=0;
     	ret=conn.executeUpdate(sql);
     	if (ret!=0){
     		 out.println("<script language='javascript'>alert('订单执行成功！');window.location.href='ordermanage.jsp';</script>");
        }else{
        out.println("<script language='javascript'>alert('订单执行失败！');window.location.href='ordermanage.jsp';</script>");
		}
     }
%>
</body>
</html>
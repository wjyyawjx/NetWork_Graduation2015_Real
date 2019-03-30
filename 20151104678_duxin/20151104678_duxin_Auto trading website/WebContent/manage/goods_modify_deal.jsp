<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*" errorPage=""
    pageEncoding="UTF-8"  import = "java.sql.ResultSet"%>
<%-- 创建MemberDaoImpl类的对象 --%>	
<%@ page import="com.dao.GoodsDaoImpl"%>

<%-- 创建Member类的对象，并对Member类的所有属性进行赋值 --%>	
<jsp:useBean id="goods" scope="request" class="com.model.Goods">
<jsp:setProperty name="goods" property="*"/>
</jsp:useBean>
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<%-- 创建ConnDB类的对象 --%>	
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>

<%--<jsp:include page="safe.jsp"/> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");					//设置请求的编码为UTF-8
		response.setCharacterEncoding("UTF-8"); 
		Integer id=goods.getID();
		ResultSet rs=conn.executeQuery("select * from tb_goods where ID="+id);
		if (!rs.next()){
		      out.println("<script language='javascript'>alert('您的操作有误！');window.location.href='ht_index.jsp';</script>");
		}else{
			int ret=0;
	        GoodsDaoImpl up_goods=new GoodsDaoImpl();
	        ret=up_goods.update(goods);
	        if (ret!=0){
	            out.println("<script language='javascript'>alert('商品信息修改成功！');window.location.href='ht_index.jsp';</script>");
	          }else{
	            out.println("<script language='javascript'>alert('商品信息修改失败！');window.location.href='ht_index.jsp';</script>");
	          }
		}	
	%>
</body>
</html>
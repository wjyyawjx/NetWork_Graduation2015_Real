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
		String goodsName = goods.getGoodsName();			
		ResultSet rs=conn.executeQuery("select * from tb_goods where goodsname='"+goodsName+"'");
		if (rs.next()){
			out.println("<script language='javascript'>alert('该商品信息已经添加！');window.location.href='goods_add.jsp';</script>");
		}else{
			int ret=0;
			GoodsDaoImpl ins_goods=new GoodsDaoImpl();
			ret=ins_goods.insert(goods);
			 if (ret!=0){
				 out.println("<script language='javascript'>alert('商品信息添加成功！');window.location.href='index.jsp';</script>");
			 }else{
				 out.println("<script language='javascript'>alert('商品信息添加失败！');//window.location.href='goods_add.jsp';</script>");
			 }
		}
	%>

</body>
</html>
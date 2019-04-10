<%@page import="com.model.Goods"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.io.PrintWriter,java.io.File,
org.apache.commons.fileupload.FileItem,
org.apache.commons.fileupload.disk.DiskFileItemFactory,
org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="com.dao.GoodsDaoImpl, java.sql.ResultSet"%>

<%-- 创建Member类的对象，并对Member类的所有属性进行赋值 --%>	

<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<%-- 创建ConnDB类的对象 --%>	
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>

<%--<jsp:include page="safe.jsp"/> --%>
<%

request.setCharacterEncoding("utf-8");  
response.setCharacterEncoding("utf-8"); 
// dfif对象为解析器提供解析时的缺省的一些配置
	DiskFileItemFactory dfif = new DiskFileItemFactory();
// 创建解析器
	ServletFileUpload sfu = new ServletFileUpload(dfif);
sfu.setHeaderEncoding("utf-8");//解决了上传图片如果为中文就是乱码问题

String loadpath="D:/upload";//上传文件存放目录(此路径是将上传的文件放在本地的硬盘上)
Goods goods = new Goods();
String goodsName = goods.getGoodsName();
String filName="";
try{
	// 开始解析(分析InputStream)
	// 每一个表单域当中的数据都会
	// 封装到一个对应的FileItem对象上。
	List<FileItem> items = sfu.parseRequest(request);
	for (int i = 0; i < items.size(); i++) {
		FileItem item = items.get(i);
		// 要区分是上传文件域还是普通的表单域
		if (item.isFormField()) {
					// 普通表单域
					if ("typeID".equals(item.getFieldName())) {
                		goods.setTypeID(new Integer(item.getString("UTF-8")));
                		System.out.println(goods.getTypeID()+"1");
            		}else if ("goodsName".equals(item.getFieldName())) {
               			goods.setGoodsName(new String(item.getString("UTF-8")));
               			System.out.println(goods.getGoodsName()+"2");
           			}else if ("introduce".equals(item.getFieldName())) {
               		    goods.setIntroduce(new String(item.getString("UTF-8")));
                        System.out.println(goods.getIntroduce()+"3");
                    }else if ("price".equals(item.getFieldName())) {
                        goods.setPrice(new Integer(item.getString("UTF-8")));
                        System.out.println(goods.getPrice()+"4");
                    }else if ("nowPrice".equals(item.getFieldName())) {
                        goods.setNowPrice(new Integer(item.getString("UTF-8")));
                        System.out.println(goods.getNowPrice()+"5");
                    }else if ("INTime".equals(item.getFieldName())) {
                        goods.setINTime(new String(item.getString("UTF-8")));
                        System.out.println(goods.getINTime()+"6");
                    }else if ("newGoods".equals(item.getFieldName())) {
                        goods.setNewGoods(new Integer(item.getString("UTF-8")));
                        System.out.println(goods.getNewGoods()+"7");
                    }else if ("sale".equals(item.getFieldName())) {
                       goods.setSale(new Integer(item.getString("UTF-8")));
                       System.out.println(goods.getSale()+"8");
                 }
					
					String name = item.getString();
					filName=name;
					
					
					File savefile = new File(new File(loadpath), name);
	                

					request.getSession().setAttribute("FileName",name);
					
					
				} else {
					// 上传文件域
					// ServletContext:servlet上下文对象。
					ServletContext sctx = getServletContext();
					// 获得原始的文件名
					String filename = item.getName();
					goods.setPicture(filename);
			File loadFolder = new File(loadpath);
			if (!loadFolder.exists()) {
				loadFolder.mkdirs();
			}
					File file = new File(loadFolder + "\\" + filename);
					item.write(file);
				}
	}
	request.setCharacterEncoding("utf-8");  
	response.setCharacterEncoding("utf-8"); 
	//String result=loadpath+"/"+filName;
	String result="/upload/"+filName;
	ResultSet rs=conn.executeQuery("select * from tb_goods where goodsname='"+goodsName+"'");
	if (rs.next()){
		out.println("<script language='javascript'>alert('该商品信息已经添加！');window.location.href='goods_add.jsp';</script>");
	}else{
		int ret=0;
		GoodsDaoImpl ins_goods=new GoodsDaoImpl();
		ret=ins_goods.insert(goods);
		 if (ret!=0){
			 out.println("<script language='javascript'>alert('商品信息添加成功！');window.location.href='ht_index.jsp';</script>");
		 }else{
			 out.println("<script language='javascript'>alert('商品信息添加失败！');//window.location.href='goods_add.jsp';</script>");
		 }
	}
}catch(Exception e){
	e.printStackTrace();
}
%>

<%@page import="com.model.Goods"%>
<%@page import="com.dao.UploadDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.io.PrintWriter,
java.io.File,java.io.OutputStream,
java.io.FileOutputStream,
java.io.InputStream,
org.apache.commons.fileupload.FileItem,
org.apache.commons.fileupload.disk.DiskFileItemFactory,
org.apache.commons.fileupload.FileUploadException,
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
	
	String goodsName = request.getParameter("goodsName");
	
	Goods goods = new Goods();
	
	//1、创建一个DiskFileItemFactory工厂  
	DiskFileItemFactory factory = new DiskFileItemFactory();  
	//2、创建一个文件上传解析器  
	ServletFileUpload upload = new ServletFileUpload(factory);  
	//解决上传文件名的中文乱码  
	upload.setHeaderEncoding("UTF-8");   
	factory.setSizeThreshold(1024 * 500);//设置内存的临界值为500K  
	File linshi = new File("D:\\linshi");//当超过500K的时候，存到一个临时文件夹中  
	factory.setRepository(linshi);
	upload.setSizeMax(1024 * 1024 * 5);//设置上传的文件总的大小不能超过5M  
try {  
    // 1. 得到 FileItem 的集合 items  
    List<FileItem> /* FileItem */items = upload.parseRequest(request);  

    // 2. 遍历 items:  
    for (FileItem item : items) {  
        // 若是一个一般的表单域, 打印信息  
        if (item.isFormField()) {  
            String name = item.getFieldName();
            //System.out.println(value)
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
   
        }  
        // 若是文件域则把文件保存到 d:\\files 目录下.  
        else {
            String picture = item.getName();  
            long sizeInBytes = item.getSize(); 
            
            System.out.println(sizeInBytes);  

            InputStream in = item.getInputStream();  
            byte[] buffer = new byte[1024];  
            int len = 0;  
	
            String file = picture.substring(picture.lastIndexOf("\\"));
            picture = "d:\\upload" + picture.substring(picture.lastIndexOf("\\"));//文件最终上传的位置  

            System.out.println(file);  
            //System.out.println();
            OutputStream Out = new FileOutputStream(picture);
            /*String desc=request.getParameter("desc");
            System.out.println(desc);
			uploadservice.UPloadValidate(desc,fileName,sizeInBytes);
            response.sendRedirect("index.jsp");*/
			
            while ((len = in.read(buffer)) != -1) {  
                Out.write(buffer, 0, len);  
            }  
            goods.setPicture(picture);
            out.close();  
            in.close(); 
            
        } 
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
    }
} catch (FileUploadException e) {  
    e.printStackTrace();  
}  
	
%>

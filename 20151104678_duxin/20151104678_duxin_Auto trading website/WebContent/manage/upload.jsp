<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.io.PrintWriter,java.io.File,
org.apache.commons.fileupload.FileItem,
org.apache.commons.fileupload.disk.DiskFileItemFactory,
org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%
// dfif对象为解析器提供解析时的缺省的一些配置
	DiskFileItemFactory dfif = new DiskFileItemFactory();
// 创建解析器
	ServletFileUpload sfu = new ServletFileUpload(dfif);
sfu.setHeaderEncoding("utf-8");//解决了上传图片如果为中文就是乱码问题
String loadpath="D:/upload";//上传文件存放目录(此路径是将上传的文件放在本地的硬盘上)

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
					String name = item.getString();
					filName=name;
					System.out.println("name:" + name);
					request.getSession().setAttribute("FileName",name);
					out.print("<a href=\"index.jsp?param=" +filName + "\">" + filName + "</a>" );
					
				} else {
					// 上传文件域
					// ServletContext:servlet上下文对象。
					ServletContext sctx = getServletContext();
					// 获得原始的文件名
					String filename = item.getName();
			File loadFolder = new File(loadpath);
			if (!loadFolder.exists()) {
				loadFolder.mkdirs();
			}
					File file = new File(loadFolder + "\\" + filename);
					item.write(file);
				}
	}
	
	//String result=loadpath+"/"+filName;
	String result="/upload/"+filName;

	PrintWriter writer = response.getWriter();
	
	writer.print("{");
	//writer.print("msg:\"文件大小:"+item.getSize()+",文件名:"+filename+"\"");
	writer.print("picUrl:\"" + result + "\"");
	writer.print("}");
	
	writer.close();
}catch(Exception e){
	e.printStackTrace();
}
%>

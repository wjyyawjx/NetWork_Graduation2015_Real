package com.neishida.Servlet;

import java.io.File;  
import java.io.FileOutputStream;  
import java.io.IOException;  
import java.io.InputStream;  
import java.io.OutputStream;  
import java.util.List;  
  
import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
import org.apache.commons.fileupload.FileItem;  
import org.apache.commons.fileupload.FileUploadException;  
import org.apache.commons.fileupload.disk.DiskFileItemFactory;  
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.neishida.service.uploadservice;

/**
 * Servlet implementation class simpleFileupload
 */
@WebServlet("/SimpleFileupload")
public class SimpleFileupload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SimpleFileupload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");  
        response.setCharacterEncoding("utf-8");  
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
                    String value = item.getString("utf-8");
  
                    System.out.println(value);
                      
                      
                }  
                // 若是文件域则把文件保存到 e:\\files 目录下.  
                else {
                    String fileName = item.getName();  
                    long sizeInBytes = item.getSize();  
                    System.out.println(fileName);  
                    System.out.println(sizeInBytes);  
  
                    InputStream in = item.getInputStream();  
                    byte[] buffer = new byte[1024];  
                    int len = 0;  
  
                    fileName = "D:\\毕设git材料\\NetWork_Graduation2015_Real\\20151104700_guoyunlong\\20151104700_guoyunlong_CampusActivityPlatform\\WebContent\\upload\\file\\" + item.getName();//文件最终上传的位置  
                    String file = item.getName();
                    System.out.println(file);  
                    //System.out.println();
                    OutputStream out = new FileOutputStream(fileName);
                    
                    /*String desc=request.getParameter("desc");
                    System.out.println(desc);
					uploadservice.UPloadValidate(desc,fileName,sizeInBytes);
                    response.sendRedirect("index.jsp");*/
  
                    while ((len = in.read(buffer)) != -1) {  
                        out.write(buffer, 0, len);  
                    }  
                    
                    
					uploadservice.UPloadValidate(file,fileName,sizeInBytes);
                    response.sendRedirect("index.jsp");
                    
                    out.close();  
                    in.close();  
                } 
                
            }
  
        } catch (FileUploadException e) {  
            e.printStackTrace();  
        }  
  
    }  
}  
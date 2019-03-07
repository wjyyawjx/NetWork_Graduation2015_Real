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
@WebServlet("/simpleFileupload")
public class simpleFileupload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public simpleFileupload() {
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
        //1銆佸垱寤轰竴涓狣iskFileItemFactory宸ュ巶  
        DiskFileItemFactory factory = new DiskFileItemFactory();  
        //2銆佸垱寤轰竴涓枃浠朵笂浼犺В鏋愬櫒  
        ServletFileUpload upload = new ServletFileUpload(factory);  
        //瑙ｅ喅涓婁紶鏂囦欢鍚嶇殑涓枃涔辩爜  
        upload.setHeaderEncoding("UTF-8");   
        factory.setSizeThreshold(1024 * 500);//璁剧疆鍐呭瓨鐨勪复鐣屽�间负500K  
        File linshi = new File("D:\\linshi");//褰撹秴杩�500K鐨勬椂鍊欙紝瀛樺埌涓�涓复鏃舵枃浠跺す涓�  
        factory.setRepository(linshi);  
        upload.setSizeMax(1024 * 1024 * 5);//璁剧疆涓婁紶鐨勬枃浠舵�荤殑澶у皬涓嶈兘瓒呰繃5M  
        try {  
            // 1. 寰楀埌 FileItem 鐨勯泦鍚� items  
            List<FileItem> /* FileItem */items = upload.parseRequest(request);  
  
            // 2. 閬嶅巻 items:  
            for (FileItem item : items) {  
                // 鑻ユ槸涓�涓竴鑸殑琛ㄥ崟鍩�, 鎵撳嵃淇℃伅  
                if (item.isFormField()) {  
                    String name = item.getFieldName();  
                    String value = item.getString("utf-8");
  
                    System.out.println(value);
                      
                      
                }  
                // 鑻ユ槸鏂囦欢鍩熷垯鎶婃枃浠朵繚瀛樺埌 e:\\files 鐩綍涓�.  
                else {
                    String fileName = item.getName();  
                    long sizeInBytes = item.getSize();  
                    System.out.println(fileName);  
                    System.out.println(sizeInBytes);  
  
                    InputStream in = item.getInputStream();  
                    byte[] buffer = new byte[1024];  
                    int len = 0;  
  
                    fileName = "g:\\NBA\\WebContent\\FILE\\upload" + fileName.substring(fileName.lastIndexOf("\\"));//鏂囦欢鏈�缁堜笂浼犵殑浣嶇疆  
                    String file = fileName.substring(fileName.lastIndexOf("\\"));
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
                    response.sendRedirect("suibian.jsp");
                    
                    out.close();  
                    in.close();  
                } 
                
            }
  
        } catch (FileUploadException e) {  
            e.printStackTrace();  
        }  
  
    }  
}  
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
        //1閵嗕礁鍨卞杞扮娑撶嫞iskFileItemFactory瀹搞儱宸�  
        DiskFileItemFactory factory = new DiskFileItemFactory();  
        //2閵嗕礁鍨卞杞扮娑擃亝鏋冩禒鏈电瑐娴肩姾袙閺嬫劕娅�  
        ServletFileUpload upload = new ServletFileUpload(factory);  
        //鐟欙絽鍠呮稉濠佺炊閺傚洣娆㈤崥宥囨畱娑擃厽鏋冩稊杈╃垳  
        upload.setHeaderEncoding("UTF-8");   
        factory.setSizeThreshold(1024 * 500);//鐠佸墽鐤嗛崘鍛摠閻ㄥ嫪澶嶉悾灞斤拷闂磋礋500K  
        File linshi = new File("D:\\linshi");//瑜版捁绉存潻锟�500K閻ㄥ嫭妞傞崐娆欑礉鐎涙ê鍩屾稉锟芥稉顏冨閺冭埖鏋冩禒璺恒仚娑擄拷  
        factory.setRepository(linshi);  
        upload.setSizeMax(1024 * 1024 * 5);//鐠佸墽鐤嗘稉濠佺炊閻ㄥ嫭鏋冩禒鑸碉拷鑽ゆ畱婢堆冪毈娑撳秷鍏樼搾鍛扮箖5M  
        try {  
            // 1. 瀵版鍩� FileItem 閻ㄥ嫰娉﹂崥锟� items  
            List<FileItem> /* FileItem */items = upload.parseRequest(request);  
  
            // 2. 闁秴宸� items:  
            for (FileItem item : items) {  
                // 閼汇儲妲告稉锟芥稉顏冪閼割剛娈戠悰銊ュ礋閸╋拷, 閹垫挸宓冩穱鈩冧紖  
                if (item.isFormField()) {  
                    String name = item.getFieldName();  
                    String value = item.getString("utf-8");
  
                    System.out.println(value);
                      
                      
                }  
                // 閼汇儲妲搁弬鍥︽閸╃喎鍨幎濠冩瀮娴犳湹绻氱�涙ê鍩� e:\\files 閻╊喖缍嶆稉锟�.  
                else {
                    String fileName = item.getName();  
                    long sizeInBytes = item.getSize();  
                    System.out.println(fileName);  
                    System.out.println(sizeInBytes);  
  
                    InputStream in = item.getInputStream();  
                    byte[] buffer = new byte[1024];  
                    int len = 0;  
  
                    fileName = "d:\\upload\\file" + fileName.substring(fileName.lastIndexOf("\\"));//閺傚洣娆㈤張锟界紒鍫滅瑐娴肩姷娈戞担宥囩枂  
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
                    response.sendRedirect("main.jsp");
                    
                    out.close();  
                    in.close();  
                } 
                
            }
  
        } catch (FileUploadException e) {  
            e.printStackTrace();  
        }  
  
    }  
}  
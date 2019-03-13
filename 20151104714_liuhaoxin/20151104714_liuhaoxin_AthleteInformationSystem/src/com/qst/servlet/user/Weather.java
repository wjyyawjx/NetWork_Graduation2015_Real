package com.qst.servlet.user;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

/**
 * Servlet implementation class Weather
 */
@WebServlet("/Weather")
public class Weather extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Weather() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//利用和风天气信息的接口，获取天气信息
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		String param = "key=562f49571e3e4562bd49c32a95bf946e&location=auto_ip";
	    StringBuilder sb = new StringBuilder();
	    InputStream is = null;
	    BufferedReader br = null;
	    PrintWriter out = null;
	    try {
	        //接口地址
	        String url ="https://free-api.heweather.com/s6/weather/now?";
	        URL    uri = new URL(url);
	        HttpURLConnection connection = (HttpURLConnection) uri.openConnection();
	        connection.setRequestMethod("POST");
	        connection.setReadTimeout(5000);
	        connection.setConnectTimeout(10000);
	        connection.setRequestProperty("accept", "*/*");
	        //发送参数
	        connection.setDoOutput(true);
	        out = new PrintWriter(connection.getOutputStream());
	        out.print(param);
	        out.flush();
	        //接收结果
	        is = connection.getInputStream();
	        br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
	        String line;
	        //缓冲逐行读取
	        while ( ( line = br.readLine() ) != null ) {
	            sb.append(line);
	        }
	        String str=sb.toString();
	        
	    	JSONObject obj = new JSONObject(str).getJSONArray("HeWeather6").getJSONObject(0);
			JSONObject basic = obj.getJSONObject("basic");
			JSONObject now = obj.getJSONObject("now");
			JSONObject update = obj.getJSONObject("update");
			String location = "你所在的城市为:" +basic.getString("location");
			String tmp = "今天气温:" +now.getString("tmp")+"°C  ";
			String cond_txt = "天气："+now.getString("cond_txt");
			String loc = "天气信息更新时间是："+update.getString("loc");
			HttpSession session = request.getSession(); 
			session.setAttribute("location",location);
			session.setAttribute("tmp",tmp);
			session.setAttribute("cond_txt",cond_txt);
			session.setAttribute("loc",loc);
	    } catch ( Exception ignored ) {
	    } finally {
	        //关闭流
	        try {
	            if(is!=null){
	                is.close();
	            }
	            if(br!=null){
	                br.close();
	            }
	            if (out!=null){
	                out.close();
	            }
	        } catch ( Exception ignored ) {}
	    }	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

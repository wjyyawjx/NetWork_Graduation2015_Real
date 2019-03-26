package com.locker.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class text {
	public static void main(String[] args) throws ParseException {
		 Date date = new Date();
		 
		
		 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		 
		 System.out.println(df.format(date));// new Date()为获取当前系统时间
		 
		 String df2 = df.format(date);
		 System.out.println(df2);
		 
		 long time = df.parse(df2).getTime();
	     System.out.println(time);
		
		
	     //format  时间转字符串               parse 字符串转时间
	     
	     
	    
			String str = String.valueOf((int)((Math.random()*9+1)*100000));
	        System.out.println(str);
	       
	     
	}
}

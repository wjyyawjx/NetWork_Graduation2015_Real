/**
 * 
 */
package com.yidu.common;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @描述：
 * @author Administrator
 * @date2018年11月8日
 * @version 1.0
 */
public class Other {
	public static void main(String[] args) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
	}
}

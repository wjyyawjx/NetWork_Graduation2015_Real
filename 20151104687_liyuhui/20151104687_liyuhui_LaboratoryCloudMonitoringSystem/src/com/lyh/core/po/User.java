package com.lyh.core.po;

import java.io.Serializable;


public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int u_type;
	private String num;
	private String password;
	
	public int getU_type() {
		return u_type;
	}
	public void setU_type(int u_type) {
		this.u_type = u_type;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}

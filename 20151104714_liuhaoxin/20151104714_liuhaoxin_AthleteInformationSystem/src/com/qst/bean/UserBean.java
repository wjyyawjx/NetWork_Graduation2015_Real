package com.qst.bean;
//用户表
public class UserBean {

	private String username,pwd,phone,email,permission;
	private int uid;
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPermission() {
		if(permission.equals("0")) {
			return "普通用户";
		}else if(permission.equals("1")) {
			return "记录员用户";
		}
		return "受到限制的用户";
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

}

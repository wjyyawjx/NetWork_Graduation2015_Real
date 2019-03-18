package com.imnu.po;

import java.io.Serializable;

public class User implements Serializable {
	private static final long serialVersionUID = 1L;
    private Integer u_id; 
	private String u_name;
    private String u_pwd;
    private String u_email;
    private String u_phone;
    private String p_img;
    private String p_dirpath;
    public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_pwd() {
		return u_pwd;
	}
	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_phone() {
		return u_phone;
	}
	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}
	public String getP_dirpath() {
		return p_dirpath;
	}
	public void setP_dirpath(String p_dirpath) {
		this.p_dirpath = p_dirpath;
	}
	public String getP_img() {
		return p_img;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
}

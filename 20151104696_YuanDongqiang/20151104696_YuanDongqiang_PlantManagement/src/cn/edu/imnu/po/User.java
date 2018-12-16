package cn.edu.imnu.po;

import java.io.Serializable;

/**
 * 用户类
 */
public class User implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer u_id;//用户id
	private String u_name;//用户名称
	private String u_pwd;//用户密码
	private String u_type;//用户类别
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
	public String getU_type() {
		return u_type;
	}
	public void setU_type(String u_type) {
		this.u_type = u_type;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}

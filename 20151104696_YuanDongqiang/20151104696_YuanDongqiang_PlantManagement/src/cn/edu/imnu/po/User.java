package cn.edu.imnu.po;

import java.io.Serializable;

/**
 * 用户类
 */
public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer u_id;// 用户id
	private String u_name;// 用户名称
	private String u_pwd;// 用户密码
	private String u_type;// 用户类别
	private String u_email;// 用户邮箱
	private String u_code;// 用户账号

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

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public void setU_type(String u_type) {
		this.u_type = u_type;
	}

	public String getU_code() {
		return u_code;
	}

	public void setU_code(String u_code) {
		this.u_code = u_code;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}

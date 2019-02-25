package cn.edu.imnu.po;

import java.util.Date;

public class IP {
	private static final long serialVersionUID = 1L;
	private Integer u_id;// 近期登陆用户id
	private String u_ip;// 机器的IP
	private Date u_time;// 近期登录时间

	public Integer getU_id() {
		return u_id;
	}

	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}

	public String getU_ip() {
		return u_ip;
	}

	public void setU_ip(String u_ip) {
		this.u_ip = u_ip;
	}

	public Date getU_time() {
		return u_time;
	}

	public void setU_time(Date u_time) {
		this.u_time = u_time;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}

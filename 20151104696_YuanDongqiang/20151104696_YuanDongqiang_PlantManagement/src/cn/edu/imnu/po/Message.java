package cn.edu.imnu.po;

import java.util.Date;

public class Message {
	private static final long serialVersionUID = 1L;
	private Integer m_id; // 消息id;
	private String m_text;// 消息内容;
	private Integer m_read;// 是否阅读;
	private Integer u_id;// 上传用户id;
	private Integer p_id;// 植物id;
	private Date m_time;// 发送消息时间;
	private String u_name;//用户名;

	public Integer getM_id() {
		return m_id;
	}

	public void setM_id(Integer m_id) {
		this.m_id = m_id;
	}

	public String getM_text() {
		return m_text;
	}

	public void setM_text(String m_text) {
		this.m_text = m_text;
	}

	public Integer getM_read() {
		return m_read;
	}

	public void setM_read(Integer m_read) {
		this.m_read = m_read;
	}

	public Integer getU_id() {
		return u_id;
	}

	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}

	public Integer getP_id() {
		return p_id;
	}

	public void setP_id(Integer p_id) {
		this.p_id = p_id;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Date getM_time() {
		return m_time;
	}

	public void setM_time(Date m_time) {
		this.m_time = m_time;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
}

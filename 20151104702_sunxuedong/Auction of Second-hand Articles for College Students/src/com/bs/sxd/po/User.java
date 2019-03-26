package com.bs.sxd.po;
import java.io.Serializable;
import org.springframework.web.multipart.MultipartFile;
public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String username;
	private String password;
	private String phone;
	private String sex;
	private String qq;
	private String university;
	private String college;
	private String adreess;
	private Integer type;
	private Integer start;            // 起始行
	private Integer rows;             // 所取行数
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	private MultipartFile file;  
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getUniversity() {
		return university;
	}
	public void setUniversity(String university) {
		this.university = university;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public String getAdreess() {
		return adreess;
	}
	public void setAdreess(String adreess) {
		this.adreess = adreess;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	 @Override
	    public String toString() {
	        return "User [id=" + id + ", username=" + username + ", password=" + password + ", phone=" + phone
	                + ", sex=" + sex + ", qq=" + qq + ", university=" + university + ", college=" + college + ",adreess=" + adreess + ",type=" + type + "]";
	    }
}

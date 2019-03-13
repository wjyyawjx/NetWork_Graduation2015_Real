package com.bs.sxd.po;

import java.io.Serializable;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Goods implements Serializable  {
	private static final long serialVersionUID = 1L;
    private Integer id;
	private String l_name;
	private String l_image;
	private Integer l_price;
	private String l_info;
	private String l_type;
	private Date l_out_time;
	private Date l_in_time;
	private Integer u_id;
	private String l_addr;
	private MultipartFile file;  
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	
	public String getL_name() {
		return l_name;
	}
	public void setL_name(String l_name) {
		this.l_name = l_name;
	}
	public String getL_image() {
		return l_image;
	}
	public void setL_image(String l_image) {
		this.l_image = l_image;
	}
	public Integer getL_price() {
		return l_price;
	}
	public void setL_price(Integer l_price) {
		this.l_price = l_price;
	}
	public String getL_info() {
		return l_info;
	}
	public void setL_info(String l_info) {
		this.l_info = l_info;
	}
	public String getL_type() {
		return l_type;
	}
	public void setL_type(String l_type) {
		this.l_type = l_type;
	}
	public Date getL_out_time() {
		return l_out_time;
	}
	public void setL_out_time(Date l_out_time) {
		this.l_out_time = l_out_time;
	}
	public Date getL_in_time() {
		return l_in_time;
	}
	public void setL_in_time(Date l_in_time) {
		this.l_in_time = l_in_time;
	}
	public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public String getL_addr() {
		return l_addr;
	}
	public void setL_addr(String l_addr) {
		this.l_addr = l_addr;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	 @Override
	    public String toString() {
	        return "Goods [id=" + id + ", l_name=" + l_name + ", l_image=" + l_image + ", l_price=" + l_price
	                + ", l_info=" + l_info + ", l_type=" + l_type + ", l_out_time=" + l_out_time + ", l_in_time=" + l_in_time + ",l_addr=" + l_addr + ",u_id=" + u_id + "]";
	    }
}

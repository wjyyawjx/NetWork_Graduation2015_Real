package com.model;

/**
 * TLunwen entity. @author MyEclipse Persistence Tools
 */

public class TLunwen implements java.io.Serializable
{

	// Fields

	private Integer id;
	private String mingcheng;
	private String fujian;
	private String tijiaoshi;
	
	private String yishenjieguo;//待审核--审核通过--审核未过
	private String yishenyijian;
	private Integer userId;
	
	private TUser user;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMingcheng() {
		return mingcheng;
	}
	public void setMingcheng(String mingcheng) {
		this.mingcheng = mingcheng;
	}
	
	public TUser getUser() {
		return user;
	}
	public void setUser(TUser user) {
		this.user = user;
	}
	public String getFujian() {
		return fujian;
	}
	public void setFujian(String fujian) {
		this.fujian = fujian;
	}
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	public String getYishenjieguo() {
		return yishenjieguo;
	}
	public void setYishenjieguo(String yishenjieguo) {
		this.yishenjieguo = yishenjieguo;
	}
	public String getYishenyijian() {
		return yishenyijian;
	}
	public void setYishenyijian(String yishenyijian) {
		this.yishenyijian = yishenyijian;
	}
	public String getTijiaoshi() {
		return tijiaoshi;
	}
	public void setTijiaoshi(String tijiaoshi) {
		this.tijiaoshi = tijiaoshi;
	}
	
}
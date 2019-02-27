package com.orm;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


public class Huiyishi {

	
	private long id;
	
	private int fangchanlock;
	
	private String zhuzhi;//住址
	
	private String fangwujiegou;//房屋结构
	
	private String shebei;//设备
	
	private String mianji;//房屋面积
	
	private String beizhu;//备注
	

	
	private String menpaihao;//门牌�?

	private String salestate;//�?��状�?
	
	private String createtime;
	
	private String price;

	public String getSalestate() {
		return salestate;
	}

	public void setSalestate(String salestate) {
		this.salestate = salestate;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getMenpaihao() {
		return menpaihao;
	}

	public void setMenpaihao(String menpaihao) {
		this.menpaihao = menpaihao;
	}

	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public int getFangchanlock() {
		return fangchanlock;
	}

	public void setFangchanlock(int fangchanlock) {
		this.fangchanlock = fangchanlock;
	}

	public String getZhuzhi() {
		return zhuzhi;
	}

	public void setZhuzhi(String zhuzhi) {
		this.zhuzhi = zhuzhi;
	}

	public String getFangwujiegou() {
		return fangwujiegou;
	}

	public void setFangwujiegou(String fangwujiegou) {
		this.fangwujiegou = fangwujiegou;
	}

	public String getShebei() {
		return shebei;
	}

	public void setShebei(String shebei) {
		this.shebei = shebei;
	}

	public String getMianji() {
		return mianji;
	}

	public void setMianji(String mianji) {
		this.mianji = mianji;
	}



	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	
}

package com.orm;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

public class Shiyong{


	private long id;
	private String title;
	
	private String content;
	
	private String releasedate;

	private int shiyonglock;
	private String cailiao;
	private String lingliaoren;
	private String startdate;
	private String enddate;
	private String chulijieguo;
	private String chulifankui;
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}




	public String getChulifankui() {
		return chulifankui;
	}

	public void setChulifankui(String chulifankui) {
		this.chulifankui = chulifankui;
	}

	public String getChulijieguo() {
		return chulijieguo;
	}

	public void setChulijieguo(String chulijieguo) {
		this.chulijieguo = chulijieguo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReleasedate() {
		return releasedate;
	}

	public void setReleasedate(String releasedate) {
		this.releasedate = releasedate;
	}



	public int getShiyonglock() {
		return shiyonglock;
	}

	public void setShiyonglock(int shiyonglock) {
		this.shiyonglock = shiyonglock;
	}

	public String getCailiao() {
		return cailiao;
	}

	public void setCailiao(String cailiao) {
		this.cailiao = cailiao;
	}

	public String getLingliaoren() {
		return lingliaoren;
	}

	public void setLingliaoren(String lingliaoren) {
		this.lingliaoren = lingliaoren;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	
}

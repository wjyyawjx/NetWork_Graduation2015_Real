package com.qst.bean;

public class GameBean {
	private int sid;
	private String username,gamesname,startTime,stopTime;
					//记录员     运动会名称   开始时间  结束时间
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getGamesname() {
		return gamesname;
	}
	public void setGamesname(String gamesname) {
		this.gamesname = gamesname;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getStopTime() {
		return stopTime;
	}
	public void setStopTime(String stopTime) {
		this.stopTime = stopTime;
	}

}

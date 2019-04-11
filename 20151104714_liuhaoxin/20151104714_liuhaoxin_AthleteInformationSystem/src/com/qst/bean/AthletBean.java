package com.qst.bean;
//存储运动员信息的
public class AthletBean {
	private int tid,tsid;
	           //id 运动会id
	private String athletusername, ranking ,results,events,theclass;
					//名字                排名              成绩     项目         班级
	public String getRanking() {
		return ranking;
	}
	public void setRanking(String ranking) {
		this.ranking = ranking;
	}
	public String getResults() {
		return results;
	}
	public void setResults(String results) {
		this.results = results;
	}
	public String getEvents() {
		return events;
	}
	public void setEvents(String events) {
		this.events = events;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getTsid() {
		return tsid;
	}
	public void setTsid(int tsid) {
		this.tsid = tsid;
	}
	public String getAthletusername() {
		return athletusername;
	}
	public void setAthletusername(String athletusername) {
		this.athletusername = athletusername;
	}
	public String getTheclass() {
		return theclass;
	}
	public void setTheclass(String theclass) {
		this.theclass = theclass;
	}
}

package com.yidu.domain;

import java.util.Date;

public class Record {
    private String recordId;

    private String userId;

    private String toyId;

    private String overdueId;

    private Date recordTime;

    private Date recordEndTime;
    
    private String recordState;
    
    
    
    
    
    public String getRecordState() {
		return recordState;
	}

	public void setRecordState(String recordState) {
		this.recordState = recordState;
	}

	public Date getRecordEndTime() {
		return recordEndTime;
	}

	public void setRecordEndTime(Date recordEndTime) {
		this.recordEndTime = recordEndTime;
	}

	public String getRecordId() {
        return recordId;
    }

    public void setRecordId(String recordId) {
        this.recordId = recordId == null ? null : recordId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getToyId() {
        return toyId;
    }

    public void setToyId(String toyId) {
        this.toyId = toyId == null ? null : toyId.trim();
    }

    public String getOverdueId() {
        return overdueId;
    }

    public void setOverdueId(String overdueId) {
        this.overdueId = overdueId == null ? null : overdueId.trim();
    }

    public Date getRecordTime() {
        return recordTime;
    }

    public void setRecordTime(Date recordTime) {
        this.recordTime = recordTime;
    }
}
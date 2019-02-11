package com.imnu.model;

import java.math.BigDecimal;
import java.util.Date;

public class AuRecord {
    private String reId;

    private String comId;

    private String userId;

    private String reDate;

    private Long reState;

    private BigDecimal reMoney;
    
    private String comName;
    
    private String userName;

    
    
    public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getReId() {
        return reId;
    }

    public void setReId(String reId) {
        this.reId = reId == null ? null : reId.trim();
    }

    public String getComId() {
        return comId;
    }

    public void setComId(String comId) {
        this.comId = comId == null ? null : comId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

   

    public String getReDate() {
		return reDate;
	}

	public void setReDate(String reDate) {
		this.reDate = reDate;
	}

	public Long getReState() {
        return reState;
    }

    public void setReState(Long reState) {
        this.reState = reState;
    }

    public BigDecimal getReMoney() {
        return reMoney;
    }

    public void setReMoney(BigDecimal reMoney) {
        this.reMoney = reMoney;
    }
}
package com.imnu.model;

import java.math.BigDecimal;
import java.util.Date;

public class AuMreload {
    private String mrId;

    private String comId;

    private String userId;

    private String mrDate;

    private Long mrState;
    
    private BigDecimal mrMoney;
    
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

	public BigDecimal getMrMoney() {
		return mrMoney;
	}

	public void setMrMoney(BigDecimal mrMoney) {
		this.mrMoney = mrMoney;
	}

	public String getMrId() {
        return mrId;
    }

    public void setMrId(String mrId) {
        this.mrId = mrId == null ? null : mrId.trim();
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

    

    public String getMrDate() {
		return mrDate;
	}

	public void setMrDate(String mrDate) {
		this.mrDate = mrDate;
	}

	public Long getMrState() {
        return mrState;
    }

    public void setMrState(Long mrState) {
        this.mrState = mrState;
    }
}
package com.imnu.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.function.Predicate;



public class AuIndent {
    private String inId;

    private String comId;

    private String userId;

    private String inDate;
    private String inTime;

    private BigDecimal inMoney;
    private String inState;

    private String userName;
    private String comName;
    
    
    
    public String getInState() {
		return inState;
	}

	public void setInState(String inState) {
		this.inState = inState;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}

	public String getInTime() {
		return inTime;
	}

	public void setInTime(String inTime) {
		this.inTime = inTime;
	}

	public String getInId() {
        return inId;
    }

    public void setInId(String inId) {
        this.inId = inId == null ? null : inId.trim();
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
    public String getInDate() {
		return inDate;
	}

	public void setInDate(String inDate) {
		this.inDate = inDate;
	}

	public BigDecimal getInMoney() {
        return inMoney;
    }

    public void setInMoney(BigDecimal inMoney) {
        this.inMoney = inMoney;
    }
}
package com.yidu.domain;

import java.math.BigDecimal;
import java.util.Date;

public class Overdue {
    private String overdueId;

    private Date overdueTime;
    
    private String overdueTimeVo;
    

    private BigDecimal overdueMoney;

    public String getOverdueId() {
        return overdueId;
    }

    public String getOverdueTimeVo() {
		return overdueTimeVo;
	}

	public void setOverdueTimeVo(String overdueTimeVo) {
		this.overdueTimeVo = overdueTimeVo;
	}

	public void setOverdueId(String overdueId) {
        this.overdueId = overdueId ;
    }

    public Date getOverdueTime() {
        return overdueTime;
    }

    public void setOverdueTime(Date overdueTime) {
        this.overdueTime = overdueTime;
    }

    public BigDecimal getOverdueMoney() {
        return overdueMoney;
    }

    public void setOverdueMoney(BigDecimal overdueMoney) {
        this.overdueMoney = overdueMoney;
    }
}
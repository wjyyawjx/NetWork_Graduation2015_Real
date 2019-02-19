package com.locker.domain;

public class Record extends Pages {
    private String reId;

    private String uId;

    private String caId;

    private String reDeposit;

    private String reOut;

    private String reMoney;

    private String reOverdue;

    private String reCharge;

    private String reCode;
    //存放时间
    private String reTime;
    //逾期取件码
    private String reCodeyin;
    //逾期收费类型
    private String chOverdue;
    //用户名
    private String uZh; 
    
    
    //新增楼层
    private String louceng;
    
    //输出楼层
    private String louceng2;
  
    public String getLouceng2() {
		return louceng2;
	}

	public void setLouceng2(String louceng2) {
		this.louceng2 = louceng2;
	}

	public String getLouceng() {
		return louceng;
	}

	public void setLouceng(String louceng) {
		this.louceng = louceng;
	}

	public String getuZh() {
		return uZh;
	}

	public void setuZh(String uZh) {
		this.uZh = uZh;
	}

	public String getChOverdue() {
		return chOverdue;
	}

	public void setChOverdue(String chOverdue) {
		this.chOverdue = chOverdue;
	}

	public String getReCodeyin() {
		return reCodeyin;
	}

	public void setReCodeyin(String reCodeyin) {
		this.reCodeyin = reCodeyin;
	}

	public String getReTime() {
		return reTime;
	}

	public void setReTime(String reTime) {
		this.reTime = reTime;
	}

	public String getReId() {
        return reId;
    }

    public void setReId(String reId) {
        this.reId = reId == null ? null : reId.trim();
    }

    public String getuId() {
        return uId;
    }

    public void setuId(String uId) {
        this.uId = uId == null ? null : uId.trim();
    }

    public String getCaId() {
        return caId;
    }

    public void setCaId(String caId) {
        this.caId = caId == null ? null : caId.trim();
    }

    public String getReDeposit() {
        return reDeposit;
    }

    public void setReDeposit(String reDeposit) {
        this.reDeposit = reDeposit == null ? null : reDeposit.trim();
    }

    public String getReOut() {
        return reOut;
    }

    public void setReOut(String reOut) {
        this.reOut = reOut == null ? null : reOut.trim();
    }

    public String getReMoney() {
        return reMoney;
    }

    public void setReMoney(String reMoney) {
        this.reMoney = reMoney == null ? null : reMoney.trim();
    }

    public String getReOverdue() {
        return reOverdue;
    }

    public void setReOverdue(String reOverdue) {
        this.reOverdue = reOverdue == null ? null : reOverdue.trim();
    }

    public String getReCharge() {
        return reCharge;
    }

    public void setReCharge(String reCharge) {
        this.reCharge = reCharge == null ? null : reCharge.trim();
    }

    public String getReCode() {
        return reCode;
    }

    public void setReCode(String reCode) {
        this.reCode = reCode == null ? null : reCode.trim();
    }
}
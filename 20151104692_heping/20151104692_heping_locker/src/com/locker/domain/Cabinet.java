package com.locker.domain;

public class Cabinet extends Pages {
    private String caId;

    private String loId;

    private String chId;

    private String caWhether;

    private String caDeadline;
    
    
    private String loName;
    
    private String chType;
    
    //楼层
    private String arName;
    //储物柜收费
    private String chCharge;
    //储物柜逾期收费
    private String chOverdue;
    
    
	public String getChCharge() {
		return chCharge;
	}

	public void setChCharge(String chCharge) {
		this.chCharge = chCharge;
	}

	public String getChOverdue() {
		return chOverdue;
	}

	public void setChOverdue(String chOverdue) {
		this.chOverdue = chOverdue;
	}

	public String getArName() {
		return arName;
	}

	public void setArName(String arName) {
		this.arName = arName;
	}

	public String getLoName() {
		return loName;
	}

	public void setLoName(String loName) {
		this.loName = loName;
	}

	

	public String getChType() {
		return chType;
	}

	public void setChType(String chType) {
		this.chType = chType;
	}

	public String getCaId() {
        return caId;
    }

    public void setCaId(String caId) {
        this.caId = caId == null ? null : caId.trim();
    }

    public String getLoId() {
        return loId;
    }

    public void setLoId(String loId) {
        this.loId = loId == null ? null : loId.trim();
    }

    public String getChId() {
        return chId;
    }

    public void setChId(String chId) {
        this.chId = chId == null ? null : chId.trim();
    }

    public String getCaWhether() {
        return caWhether;
    }

    public void setCaWhether(String caWhether) {
        this.caWhether = caWhether == null ? null : caWhether.trim();
    }

    public String getCaDeadline() {
        return caDeadline;
    }

    public void setCaDeadline(String caDeadline) {
        this.caDeadline = caDeadline == null ? null : caDeadline.trim();
    }
}
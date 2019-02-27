package com.yidu.domain;

public class Charge {
    private String chId;

    private String chType;

    private String chCharge;

    private String chOverdue;

    public String getChId() {
        return chId;
    }

    public void setChId(String chId) {
        this.chId = chId == null ? null : chId.trim();
    }

    public String getChType() {
        return chType;
    }

    public void setChType(String chType) {
        this.chType = chType == null ? null : chType.trim();
    }

    public String getChCharge() {
        return chCharge;
    }

    public void setChCharge(String chCharge) {
        this.chCharge = chCharge == null ? null : chCharge.trim();
    }

    public String getChOverdue() {
        return chOverdue;
    }

    public void setChOverdue(String chOverdue) {
        this.chOverdue = chOverdue == null ? null : chOverdue.trim();
    }
}
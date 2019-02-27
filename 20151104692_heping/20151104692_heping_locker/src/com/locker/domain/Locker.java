package com.locker.domain;

public class Locker{
    private String loId;

    private String arId;

    private String loName;

    private String loPhone;

    private String arName;
    
    public String getArName() {
		return arName;
	}

	public void setArName(String arName) {
		this.arName = arName;
	}

	public String getLoId() {
        return loId;
    }

    public void setLoId(String loId) {
        this.loId = loId == null ? null : loId.trim();
    }

    public String getArId() {
        return arId;
    }

    public void setArId(String arId) {
        this.arId = arId == null ? null : arId.trim();
    }

    public String getLoName() {
        return loName;
    }

    public void setLoName(String loName) {
        this.loName = loName == null ? null : loName.trim();
    }

    public String getLoPhone() {
        return loPhone;
    }

    public void setLoPhone(String loPhone) {
        this.loPhone = loPhone == null ? null : loPhone.trim();
    }
}
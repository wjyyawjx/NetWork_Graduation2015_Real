package com.yidu.domain;

public class User extends Pages{
    private String uId;

    private String uZh;

    private String uMm;

    private String uType;
    
    
    private String uPhone;

    private String uSite;


	public String getuId() {
        return uId;
    }

    public void setuId(String uId) {
        this.uId = uId == null ? null : uId.trim();
    }

    public String getuZh() {
        return uZh;
    }

    public void setuZh(String uZh) {
        this.uZh = uZh == null ? null : uZh.trim();
    }

    public String getuMm() {
        return uMm;
    }

    public void setuMm(String uMm) {
        this.uMm = uMm == null ? null : uMm.trim();
    }

    public String getuType() {
        return uType;
    }

    public void setuType(String uType) {
        this.uType = uType == null ? null : uType.trim();
    }

    public String getuPhone() {
        return uPhone;
    }

    public void setuPhone(String uPhone) {
        this.uPhone = uPhone == null ? null : uPhone.trim();
    }

    public String getuSite() {
        return uSite;
    }

    public void setuSite(String uSite) {
        this.uSite = uSite == null ? null : uSite.trim();
    }
}
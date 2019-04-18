package com.yidu.controller.vo;

import java.math.BigDecimal;

public class ToyVo {
    private String toyId;

    private String typeId;
    
    private String typeName;//类型名称

    private String photoId;
    
    private String photoPath;

    private String toyName;

    private String toyIntroduce;

    private Integer toyAge;

    private BigDecimal toyMoney;

    private BigDecimal toyDeposit;

    
    
    public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getToyId() {
        return toyId;
    }

    public void setToyId(String toyId) {
        this.toyId = toyId == null ? null : toyId.trim();
    }

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId == null ? null : typeId.trim();
    }

    public String getPhotoId() {
        return photoId;
    }

    public void setPhotoId(String photoId) {
        this.photoId = photoId == null ? null : photoId.trim();
    }

    public String getToyName() {
        return toyName;
    }

    public void setToyName(String toyName) {
        this.toyName = toyName == null ? null : toyName.trim();
    }

    public String getToyIntroduce() {
        return toyIntroduce;
    }

    public void setToyIntroduce(String toyIntroduce) {
        this.toyIntroduce = toyIntroduce == null ? null : toyIntroduce.trim();
    }

    public Integer getToyAge() {
        return toyAge; 
    }

    public void setToyAge(Integer toyAge) {
        this.toyAge = toyAge;
    }

    public BigDecimal getToyMoney() {
        return toyMoney;
    }

    public void setToyMoney(BigDecimal toyMoney) {
        this.toyMoney = toyMoney;
    }

    public BigDecimal getToyDeposit() {
        return toyDeposit;
    }

    public void setToyDeposit(BigDecimal toyDeposit) {
        this.toyDeposit = toyDeposit;
    }
}
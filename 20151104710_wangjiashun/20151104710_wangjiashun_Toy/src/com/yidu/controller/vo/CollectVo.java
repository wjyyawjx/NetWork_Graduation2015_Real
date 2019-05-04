package com.yidu.controller.vo;

import java.math.BigDecimal;

public class CollectVo {
	private String collectId;

    private String toyId;

    private String userId;
    private String toyName;
    private BigDecimal toyMoney;

    private BigDecimal toyDeposit;
	public String getCollectId() {
		return collectId;
	}

	public void setCollectId(String collectId) {
		this.collectId = collectId;
	}

	public String getToyId() {
		return toyId;
	}

	public void setToyId(String toyId) {
		this.toyId = toyId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	

	public String getToyName() {
		return toyName;
	}

	public void setToyName(String toyName) {
		this.toyName = toyName;
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

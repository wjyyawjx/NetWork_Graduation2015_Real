package com.yidu.controller.vo;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

public class CarVo {
	private String carId;

    private BigDecimal carTotal;

    private Integer carNum;
    
    private String toyName;
    
    private String userId;
    
    private String toyId;
    
    private String userName;
    
    private Double toyMoney;
    
    private Double toyDeposit;
    
    private Double sum;
    
    private String carEndTime;
	

	public String getCarEndTime() {
		return carEndTime;
	}

	public void setCarEndTime(String carEndTime) {
		this.carEndTime = carEndTime;
	}

	public Double getSum() {
		return sum;
	}

	public void setSum(Double sum) {
		this.sum = sum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getToyId() {
		return toyId;
	}

	public void setToyId(String toyId) {
		this.toyId = toyId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getCarId() {
		return carId;
	}

	public void setCarId(String carId) {
		this.carId = carId;
	}

	public BigDecimal getCarTotal() {
		return carTotal;
	}

	public void setCarTotal(BigDecimal carTotal) {
		this.carTotal = carTotal;
	}

	public Integer getCarNum() {
		return carNum;
	}

	public void setCarNum(Integer carNum) {
		this.carNum = carNum;
	}

	public String getToyName() {
		return toyName;
	}

	public void setToyName(String toyName) {
		this.toyName = toyName;
	}


	public Double getToyMoney() {
		return toyMoney;
	}

	public void setToyMoney(Double toyMoney) {
		this.toyMoney = toyMoney;
	}

	public Double getToyDeposit() {
		return toyDeposit;
	}

	public void setToyDeposit(Double toyDeposit) {
		this.toyDeposit = toyDeposit;
	}
    
    
    
    
}

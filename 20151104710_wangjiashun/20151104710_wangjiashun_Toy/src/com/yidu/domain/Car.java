package com.yidu.domain;

import java.math.BigDecimal;
import java.util.Date;

public class Car {
    private String carId;

    private String userId;

    private String toyId;

    private BigDecimal carTotal;

    private Integer carNum;
    
    private String carEndTime;
    
    


	public String getCarEndTime() {
		return carEndTime;
	}

	public void setCarEndTime(String carEndTime) {
		this.carEndTime = carEndTime;
	}

	public String getCarId() {
        return carId;
    }

    public void setCarId(String carId) {
        this.carId = carId == null ? null : carId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getToyId() {
        return toyId;
    }

    public void setToyId(String toyId) {
        this.toyId = toyId == null ? null : toyId.trim();
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
}
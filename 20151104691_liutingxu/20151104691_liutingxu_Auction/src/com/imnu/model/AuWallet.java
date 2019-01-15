package com.imnu.model;

import java.math.BigDecimal;

public class AuWallet {
    private String waId;

    private String userId;

    private BigDecimal waBalance;
    
    private String userName;
    private Integer curPage;
    
    private String wrMoney;
    
    
    
    
    
   	public String getWrMoney() {
		return wrMoney;
	}

	public void setWrMoney(String wrMoney) {
		this.wrMoney = wrMoney;
	}

	public Integer getCurPage() {
   		return curPage;
   	}

   	public void setCurPage(Integer curPage) {
   		this.curPage = curPage;
   	}
    

    public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	

	public String getWaId() {
		return waId;
	}

	public void setWaId(String waId) {
		this.waId = waId;
	}

	public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public BigDecimal getWaBalance() {
        return waBalance;
    }

    public void setWaBalance(BigDecimal waBalance) {
        this.waBalance = waBalance;
    }

	public void setWrMoney(BigDecimal bigDecimal) {
		// TODO Auto-generated method stub
		
	}
}
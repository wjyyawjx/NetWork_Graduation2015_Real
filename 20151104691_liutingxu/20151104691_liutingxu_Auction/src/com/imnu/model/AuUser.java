package com.imnu.model;

import java.math.BigDecimal;

public class AuUser {
    private String userId;

    private String userName;

    private String userPwd;

    private Long userSex;

    private BigDecimal userPhone;

    private String userType;

    
    
 

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd == null ? null : userPwd.trim();
    }

    public Long getUserSex() {
        return userSex;
    }

    public void setUserSex(Long userSex) {
        this.userSex = userSex;
    }

    public BigDecimal getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(BigDecimal userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType == null ? null : userType.trim();
    }
}
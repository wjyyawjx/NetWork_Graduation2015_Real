package com.yidu.domain;

public class User {
    private String userId;

    private String userName;

    private String userPsw;

    private Long userCredit;

    private Integer userType;
    
    private String userPhone;
    
    private String userEmail;
    
    private String userTypeks;
    
    private String realName;
    
    
    
    
    

    public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getUserTypeks() {
		return userTypeks;
	}

	public void setUserTypeks(String userTypeks) {
		this.userTypeks = userTypeks;
	}

	public String getUserPhone() {
		return userPhone;
	}
    
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone == null ? null : userPhone.trim();
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail == null ? null : userEmail.trim();
	}


   
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

    public String getUserPsw() {
        return userPsw;
    }

    public void setUserPsw(String userPsw) {
        this.userPsw = userPsw == null ? null : userPsw.trim();
    }

    public Long getUserCredit() {
        return userCredit;
    }

    public void setUserCredit(Long userCredit) {
        this.userCredit = userCredit;
    }

    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }
}
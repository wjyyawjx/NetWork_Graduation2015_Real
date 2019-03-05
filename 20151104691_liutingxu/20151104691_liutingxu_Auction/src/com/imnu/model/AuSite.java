package com.imnu.model;

public class AuSite {
    private String siId;

    private String userId;

    private String siContent;
    
    private String userName;
    
    private String siName;
    
    private String siPhone;
    private Integer curPage;
    
    
    
   	public Integer getCurPage() {
   		return curPage;
   	}

   	public void setCurPage(Integer curPage) {
   		this.curPage = curPage;
   	}

    public String getSiPhone() {
		return siPhone;
	}

	public void setSiPhone(String siPhone) {
		this.siPhone = siPhone;
	}

	public String getSiName() {
		return siName;
	}

	public void setSiName(String siName) {
		this.siName = siName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getSiId() {
        return siId;
    }

    public void setSiId(String siId) {
        this.siId = siId == null ? null : siId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getSiContent() {
        return siContent;
    }

    public void setSiContent(String siContent) {
        this.siContent = siContent == null ? null : siContent.trim();
    }
}
package com.imnu.model;

import java.math.BigDecimal;
import java.util.Date;

public class AuCommodity {
    private String comId;

    private String typeId;

    private String userId;

    private String comName;

    private String comComment;

    private BigDecimal comMoney;

    private String comDate;

    private String comTime;

    private String comImage;

    private Long comState;

    private BigDecimal comMargin;
    
    private String comStarting;
    
    private BigDecimal comAuCommodity;
    
    private String typeName;
    
    private String userName;

    
    

	public BigDecimal getComAuCommodity() {
		return comAuCommodity;
	}

	public void setComAuCommodity(BigDecimal comAuCommodity) {
		this.comAuCommodity = comAuCommodity;
	}

	public String getComId() {
		return comId;
	}

	public void setComId(String comId) {
		this.comId = comId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
	public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId == null ? null : typeId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getComName() {
        return comName;
    }

    public void setComName(String comName) {
        this.comName = comName == null ? null : comName.trim();
    }

    public String getComComment() {
        return comComment;
    }

    public void setComComment(String comComment) {
        this.comComment = comComment == null ? null : comComment.trim();
    }

    public BigDecimal getComMoney() {
        return comMoney;
    }

    public void setComMoney(BigDecimal comMoney) {
        this.comMoney = comMoney;
    }
    
    

    public String getComDate() {
		return comDate;
	}

	public void setComDate(String comDate) {
		this.comDate = comDate;
	}

	public String getComTime() {
		return comTime;
	}

	public void setComTime(String comTime) {
		this.comTime = comTime;
	}

	public String getComImage() {
        return comImage;
    }

    public void setComImage(String comImage) {
        this.comImage = comImage == null ? null : comImage.trim();
    }

    public Long getComState() {
        return comState;
    }

    public void setComState(Long comState) {
        this.comState = comState;
    }

    public BigDecimal getComMargin() {
        return comMargin;
    }

    public void setComMargin(BigDecimal comMargin) {
        this.comMargin = comMargin;
    }

	public String getComStarting() {
		return comStarting;
	}

	public void setComStarting(String comStarting) {
		this.comStarting = comStarting;
	}
    
}
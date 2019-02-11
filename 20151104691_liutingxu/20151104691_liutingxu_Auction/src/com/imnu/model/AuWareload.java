package com.imnu.model;

import java.math.BigDecimal;
import java.util.Date;



/**
 * 
 * 描述:钱包支出Bean
 */
public class AuWareload {
    private String wrId;

    private String waId;

    private BigDecimal wrMoney;

    private String wrDate;

    private String wrContent;
    
    private String wrDate2;
    private Integer curPage;
    
    
    
   	public Integer getCurPage() {
   		return curPage;
   	}

   	public void setCurPage(Integer curPage) {
   		this.curPage = curPage;
   	}
    
    public String getWrDate2() {
		return wrDate2;
	}

	public void setWrDate2(String wrDate2) {
		this.wrDate2 = wrDate2;
	}
	
	public String getWrId() {
		return wrId;
	}

	public void setWrId(String wrId) {
		this.wrId = wrId;
	}

	public String getWaId() {
        return waId;
    }

    public void setWaId(String waId) {
        this.waId = waId == null ? null : waId.trim();
    }

    public BigDecimal getWrMoney() {
        return wrMoney;
    }

    public void setWrMoney(BigDecimal wrMoney) {
        this.wrMoney = wrMoney;
    }

    

    public String getWrDate() {
		return wrDate;
	}

	public void setWrDate(String wrDate) {
		this.wrDate = wrDate;
	}

	public String getWrContent() {
        return wrContent;
    }

    public void setWrContent(String wrContent) {
        this.wrContent = wrContent == null ? null : wrContent.trim();
    }
}
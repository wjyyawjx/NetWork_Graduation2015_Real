package com.yidu.controller.vo;

import java.util.Date;
/**
 * 
 * 订单Vo
 * @author wj
 * @since 2018-10-18
 *
 */
public class RecordVo {
	private String recordId; // 租借订单ID

	private String userId;  // 用户ID

	private String toyId;  // 玩具ID

	private String overdueId;  // 逾期ID
 
	private Date recordTime;  //租借订单日期
	
	private String toyName;  //玩具名称
	
	private String userName;  //租借用户
	
	private Double toyMoney;  //租借金额
	
	private Double toyDeposit;  //租借押金
	
	private Date recordEndTime; // 截至日期
	
	private String recordState;
	
	public String getRecordState() {
		return recordState;
	}

	public void setRecordState(String recordState) {
		this.recordState = recordState;
	}

	public Date getRecordEndTime() {
		return recordEndTime;
	}

	public void setRecordEndTime(Date recordEndTime) {
		this.recordEndTime = recordEndTime;
	}

	public String getRecordId() {
		return recordId;
	}

	public void setRecordId(String recordId) {
		this.recordId = recordId;
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

	public String getOverdueId() {
		return overdueId;
	}

	public void setOverdueId(String overdueId) {
		this.overdueId = overdueId;
	}

	public Date getRecordTime() {
		return recordTime;
	}

	public void setRecordTime(Date recordTime) {
		this.recordTime = recordTime;
	}

	public String getToyName() {
		return toyName;
	}

	public void setToyName(String toyName) {
		this.toyName = toyName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

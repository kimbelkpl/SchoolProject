package com.java.plyd.service;

import java.util.Date;



public class Stock_in {
	private int stockInId;
	private String conarridate;
	private String stockIndate;
	private int supId;
	private String vr_no;
	private int warId;
	private String remark;
	private int createUserId;
	private int modifiedUserId;
	private Date createDate;
	private Date modifiedDate;
	private int flag;
	private String enddate;

	
	
public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

public int getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(int createUserId) {
		this.createUserId = createUserId;
	}

	public int getModifiedUserId() {
		return modifiedUserId;
	}

	public void setModifiedUserId(int modifiedUserId) {
		this.modifiedUserId = modifiedUserId;
	}



	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

public Stock_in(){
	
}

public int getStockInId() {
	return stockInId;
}

public void setStockInId(int stockInId) {
	this.stockInId = stockInId;
}

public String getConarridate() {
	return conarridate;
}

public void setConarridate(String conarridate) {
	this.conarridate = conarridate;
}

public String getStockIndate() {
	return stockIndate;
}

public void setStockIndate(String stockIndate) {
	this.stockIndate = stockIndate;
}


public String getVr_no() {
	return vr_no;
}

public void setVr_no(String vr_no) {
	this.vr_no = vr_no;
}


public String getRemark() {
	return remark;
}

public void setRemark(String remark) {
	this.remark = remark;
}

public int getSupId() {
	return supId;
}

public void setSupId(int supId) {
	this.supId = supId;
}

public int getWarId() {
	return warId;
}

public void setWarId(int warId) {
	this.warId = warId;
}



}

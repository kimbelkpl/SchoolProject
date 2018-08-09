package com.java.plyd.service;

import java.util.Date;

public class Warehouse {
	private int warehouse_id;
	private String wareName;
	private String wareAddress;
	private String warePhone;
	private String wareRemark;
	private int wareCreatedID;
	private int wareModifiedID;
	private Date wareCreatedDate;
	private Date wareModifiedDate;
	private int wareflag;
	
	
	public Warehouse(){
		
	}
	
	public Warehouse(int warehouse_id, String wareName, String wareAddress,
			String warePhone, String wareRemark, int wareCreatedID,
			int wareModifiedID, Date wareCreatedDate, Date wareModifiedDate,
			int wareflag) {
		super();
		this.warehouse_id = warehouse_id;
		this.wareName = wareName;
		this.wareAddress = wareAddress;
		this.warePhone = warePhone;
		this.wareRemark = wareRemark;
		this.wareCreatedID = wareCreatedID;
		this.wareModifiedID = wareModifiedID;
		this.wareCreatedDate = wareCreatedDate;
		this.wareModifiedDate = wareModifiedDate;
		this.wareflag = wareflag;
	}

	public int getId() {
		return warehouse_id;
	}
	public void setId(int id) {
		this.warehouse_id = id;
	}
	public String getWareName() {
		return wareName;
	}
	public void setWareName(String wareName) {
		this.wareName = wareName;
	}
	public String getWareAddress() {
		return wareAddress;
	}
	public void setWareAddress(String wareAddress) {
		this.wareAddress = wareAddress;
	}
	public String getWarePhone() {
		return warePhone;
	}
	public void setWarePhone(String warePhone) {
		this.warePhone = warePhone;
	}
	public String getWareRemark() {
		return wareRemark;
	}
	public void setWareRemark(String wareRemark) {
		this.wareRemark = wareRemark;
	}
	public int getWareCreatedID() {
		return wareCreatedID;
	}
	public void setWareCreatedID(int wareCreatedID) {
		this.wareCreatedID = wareCreatedID;
	}
	public int getWareModifiedID() {
		return wareModifiedID;
	}
	public void setWareModifiedID(int wareModifiedID) {
		this.wareModifiedID = wareModifiedID;
	}
	public Date getWareCreatedDate() {
		return wareCreatedDate;
	}
	public void setWareCreatedDate(Date wareCreatedDate) {
		this.wareCreatedDate = wareCreatedDate;
	}
	public Date getWareModifiedDate() {
		return wareModifiedDate;
	}
	public void setWareModifiedDate(Date wareModifiedDate) {
		this.wareModifiedDate = wareModifiedDate;
	}
	public int getWareflag() {
		return wareflag;
	}
	public void setWareflag(int wareflag) {
		this.wareflag = wareflag;
	}
	
	
}

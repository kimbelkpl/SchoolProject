package com.java.plyd.service;

public class Stock_out {
	private int stock_out_id;
	private String stock_out_date;
	private int fromwarehouse_id;
	private int towarehouse_id;
	private int customer_id;
	private String vr_no;
	private String remark;
	private int createUserId;
	private int modifiedUserId;
	private String createDate;
	private String modifiedDate;
	private int flag;
	private String enddate;

	public Stock_out() {

	}

	
	public String getEnddate() {
		return enddate;
	}


	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}


	public void setStock_out_date(String stock_out_date) {
		this.stock_out_date = stock_out_date;
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

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(String modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public int getStock_out_id() {
		return stock_out_id;
	}

	public void setStock_out_id(int stock_out_id) {
		this.stock_out_id = stock_out_id;
	}

	public String getStock_out_date() {
		return stock_out_date;
	}


	public int getFromwarehouse_id() {
		return fromwarehouse_id;
	}


	public void setFromwarehouse_id(int fromwarehouse_id) {
		this.fromwarehouse_id = fromwarehouse_id;
	}


	public int getTowarehouse_id() {
		return towarehouse_id;
	}


	public void setTowarehouse_id(int towarehouse_id) {
		this.towarehouse_id = towarehouse_id;
	}


	public int getCustomer_id() {
		return customer_id;
	}


	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	
	
	
	

}

package com.java.plyd.service;

import java.util.Date;

public class Stock_InDetail {
	private int stock_in_detail_id;
	private int merchandise_id;
	private int qty;
	private int sub_unit_id;
	private String remark;
	private String voucher_no;
	private int stock_in_id;
	private int created_user_id;
	private int modified_user_id;
	private Date created_date;
	private Date modified_date;
	private int flag;
	
	public Stock_InDetail(){
		
	}
	public Stock_InDetail(int stock_in_detail_id, int merchandise_id, int qty,
			int sub_unit_id, String remark, String voucher_no, int stock_in_id, int created_user_id,
			int modified_user_id, Date created_date, Date modified_date, int flag) {
		super();
		this.stock_in_detail_id = stock_in_detail_id;
		this.merchandise_id = merchandise_id;
		this.qty = qty;
		this.sub_unit_id = sub_unit_id;
		this.remark = remark;
		this.voucher_no = voucher_no;
		this.stock_in_id = stock_in_id;
		this.created_user_id = created_user_id;
		this.modified_user_id = modified_user_id;
		this.created_date = created_date;
		this.modified_date = modified_date;
		this.flag = flag;
	}
	public int getStock_in_detail_id() {
		return stock_in_detail_id;
	}
	public void setStock_in_detail_id(int stock_in_detail_id) {
		this.stock_in_detail_id = stock_in_detail_id;
	}
	public int getMerchandise_id() {
		return merchandise_id;
	}
	public void setMerchandise_id(int merchandise_id) {
		this.merchandise_id = merchandise_id;
	}
	
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getSub_unit_id() {
		return sub_unit_id;
	}
	public void setSub_unit_id(int sub_unit_id) {
		this.sub_unit_id = sub_unit_id;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getVoucher_no() {
		return voucher_no;
	}
	public void setVoucher_no(String voucher_no) {
		this.voucher_no = voucher_no;
	}
	public int getStock_in_id() {
		return stock_in_id;
	}
	public void setStock_in_id(int stock_in_id) {
		this.stock_in_id = stock_in_id;
	}
	public int getCreated_user_id() {
		return created_user_id;
	}
	public void setCreated_user_id(int created_user_id) {
		this.created_user_id = created_user_id;
	}
	public int getModified_user_id() {
		return modified_user_id;
	}
	public void setModified_user_id(int modified_user_id) {
		this.modified_user_id = modified_user_id;
	}
	public Date getCreated_date() {
		return created_date;
	}
	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}
	public Date getModified_date() {
		return modified_date;
	}
	public void setModified_date(Date modified_date) {
		this.modified_date = modified_date;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}

	
}


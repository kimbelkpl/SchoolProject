package com.java.plyd.service;

import java.util.Date;

public class StockoutDetail {
private int stockoutdetail_id;
private int stockoutid;
private int merchandise_id;
private int qty;
private int subunit;
private String voucherno;
private String remark;
private int created_user_id;
private int modified_user_id;
private Date created_date;
private Date modified_date;
private int flag;

public String getVoucherno() {
	return voucherno;
}
public void setVoucherno(String voucherno) {
	this.voucherno = voucherno;
}

public int getStockoutdetail_id() {
	return stockoutdetail_id;
}
public void setStockoutdetail_id(int stockoutdetail_id) {
	this.stockoutdetail_id = stockoutdetail_id;
}
public int getStockoutid() {
	return stockoutid;
}
public void setStockoutid(int stockoutid) {
	this.stockoutid = stockoutid;
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
public String getRemark() {
	return remark;
}
public void setRemark(String remark) {
	this.remark = remark;
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
public int getSubunit() {
	return subunit;
}
public void setSubunit(int subunit) {
	this.subunit = subunit;
}


}

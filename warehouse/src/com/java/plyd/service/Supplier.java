package com.java.plyd.service;

public class Supplier {
	private int supplier_id;
	private String name;
	private String address;
	private String phone_no;
	private String email;
	private String remark;
	private int created_user_id;
	private int modified_user_id;
	private String created_date;
	private String modified_date;
	private int flag;

public Supplier() {
		
	}

public int getSupplier_id() {
	return supplier_id;
}

public void setSupplier_id(int supplier_id) {
	this.supplier_id = supplier_id;
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

public String getCreated_date() {
	return created_date;
}

public void setCreated_date(String created_date) {
	this.created_date = created_date;
}

public String getModified_date() {
	return modified_date;
}

public void setModified_date(String modified_date) {
	this.modified_date = modified_date;
}

public int getFlag() {
	return flag;
}

public void setFlag(int flag) {
	this.flag = flag;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getAddress() {
	return address;
}

public void setAddress(String address) {
	this.address = address;
}

public String getPhone_no() {
	return phone_no;
}

public void setPhone_no(String phone_no) {
	this.phone_no = phone_no;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getRemark() {
	return remark;
}

public void setRemark(String remark) {
	this.remark = remark;
}
}

package com.java.plyd.service;

import java.util.Date;

public class Damage {

	private int damage_id;
	private String damage_date;
	private int merchandise_id;
	private String merchandise;
	private int qty;
	private String subunit;
	private String remark;
	private int created_user_id;
	private int modified_user_id;
	private Date created_date;
	private Date modified_date;
	private int flag;
	
	public Damage(){
		
	}

	public int getDamage_id() {
		return damage_id;
	}

	public void setDamage_id(int damage_id) {
		this.damage_id = damage_id;
	}

	public String getDamage_date() {
		return damage_date;
	}

	public void setDamage_date(String damage_date) {
		this.damage_date = damage_date;
	}

	public int getMerchandise_id() {
		return merchandise_id;
	}

	public void setMerchandise_id(int merchandise_id) {
		this.merchandise_id = merchandise_id;
	}

	public String getMerchandise() {
		return merchandise;
	}

	public void setMerchandise(String merchandise) {
		this.merchandise = merchandise;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public String getSubunit() {
		return subunit;
	}

	public void setSubunit(String subunit) {
		this.subunit = subunit;
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

	
}

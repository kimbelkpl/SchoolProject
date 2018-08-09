package com.java.plyd.service;

public class Merchandise {
	private int merchandise_id;
	private String name;
	private double unit_price;
	private int brand_id;
	private int sub_unit_id;
	private int sub_category_id;
	private int created_user_id;
	private int modified_user_id; 
	private String created_date;
	private String modified_date;
	private int flag;
	private int convertion_unit_id;
	private double convertion_value;
	public Merchandise() {
		super();
	}
	public int getMerchandise_id() {
		return merchandise_id;
	}
	public void setMerchandise_id(int merchandise_id) {
		this.merchandise_id = merchandise_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(double unit_price) {
		this.unit_price = unit_price;
	}
	public int getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(int brand_id) {
		this.brand_id = brand_id;
	}
	public int getSub_unit_id() {
		return sub_unit_id;
	}
	public void setSub_unit_id(int sub_unit_id) {
		this.sub_unit_id = sub_unit_id;
	}
	public int getSub_category_id() {
		return sub_category_id;
	}
	public void setSub_category_id(int sub_category_id) {
		this.sub_category_id = sub_category_id;
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
	public int getConvertion_unit_id() {
		return convertion_unit_id;
	}
	public void setConvertion_unit_id(int convertion_unit_id) {
		this.convertion_unit_id = convertion_unit_id;
	}
	public double getConvertion_value() {
		return convertion_value;
	}
	public void setConvertion_value(double convertion_value) {
		this.convertion_value = convertion_value;
	}

}

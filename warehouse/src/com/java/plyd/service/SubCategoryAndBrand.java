package com.java.plyd.service;

import java.util.Date;

public class SubCategoryAndBrand {
	private int sub_category_and_brand_id;
	private int sub_category_id;
	private int brand_id;
	private Date created_date;
	public SubCategoryAndBrand(){}
	public SubCategoryAndBrand(int sub_category_and_brand_id,
			int sub_category_id, int brand_id, Date created_date) {
		super();
		this.sub_category_and_brand_id = sub_category_and_brand_id;
		this.sub_category_id = sub_category_id;
		this.brand_id = brand_id;
		this.created_date = created_date;
	}
	public int getSub_category_and_brand_id() {
		return sub_category_and_brand_id;
	}
	public void setSub_category_and_brand_id(int sub_category_and_brand_id) {
		this.sub_category_and_brand_id = sub_category_and_brand_id;
	}
	public int getSub_category_id() {
		return sub_category_id;
	}
	public void setSub_category_id(int sub_category_id) {
		this.sub_category_id = sub_category_id;
	}
	public int getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(int brand_id) {
		this.brand_id = brand_id;
	}
	public Date getCreated_date() {
		return created_date;
	}
	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}
	
}

package com.java.plyd.service;

import java.util.Date;

public class User {

	private int user_id;
	private String name;
	private String password;
	private int user_level_id;
	private int created_user_id;
	private int modified_user_id;
	private Date created_date;
	private Date modified_date;
	private int flag;
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getUser_level_id() {
		return user_level_id;
	}
	public void setUser_level_id(int user_level_id) {
		this.user_level_id = user_level_id;
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

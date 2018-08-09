package com.java.plyd.service;

public class Stock_Balance {
	private int stock_balance_id;
	private int  merchandise_id;
	private int warehouse_id;
	private int qty;
	private String remark;
	public int getStock_balance_id() {
		return stock_balance_id;
	}
	public void setStock_balance_id(int stock_balance_id) {
		this.stock_balance_id = stock_balance_id;
	}
	public Stock_Balance() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public int getMerchandise_id() {
		return merchandise_id;
	}
	public void setMerchandise_id(int merchandise_id) {
		this.merchandise_id = merchandise_id;
	}
	
	
	public int getWarehouse_id() {
		return warehouse_id;
	}
	public void setWarehouse_id(int warehouse_id) {
		this.warehouse_id = warehouse_id;
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
	

}

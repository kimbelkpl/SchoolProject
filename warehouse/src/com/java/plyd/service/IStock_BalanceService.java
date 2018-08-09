package com.java.plyd.service;

import java.util.List;

public interface IStock_BalanceService {
	public void entry(Stock_Balance stock_balanceinstance);
	public void remove(int ID);
	public void edit(Stock_Balance stock_balanceinstance);
	public List<Stock_Balance> selectAll();
	public Stock_Balance selectStock_Balance(int ID);
	public List<Stock_Balance> selectStock_BalanceByWarehouseid(int warehouseid);
	
}

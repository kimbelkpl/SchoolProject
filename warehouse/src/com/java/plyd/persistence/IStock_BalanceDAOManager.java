package com.java.plyd.persistence;

import java.util.List;

import com.java.plyd.service.*;



public interface IStock_BalanceDAOManager {
	public void Insert(Stock_Balance stock_balanceinstance);
	public void Delete(int ID);
	public void Update(Stock_Balance stock_balanceinstance);
	public List<Stock_Balance> selectAll();
	public Stock_Balance selectStock_Balance(int ID);
	public List<Stock_Balance> selectStockBalanceByWarehouseId(int warehouseid);

}

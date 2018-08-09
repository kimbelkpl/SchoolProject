package com.java.plyd.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.java.plyd.persistence.IStock_BalanceDAOManager;

@Service(value = "Stock_BalanceService")
public class Stock_BalanceService implements IStock_BalanceService {
	@Resource(name = "Stock_BalanceDAOManager")
	private IStock_BalanceDAOManager stock_balanceDAOManager;
	@Override
	public void entry(Stock_Balance stock_balanceinstance) {
		// TODO Auto-generated method stub
		stock_balanceDAOManager.Insert(stock_balanceinstance);
	}

	@Override
	public void remove(int ID) {
		// TODO Auto-generated method stub
		stock_balanceDAOManager.Delete(ID);
	}

	@Override
	public void edit(Stock_Balance stock_balanceinstance) {
		// TODO Auto-generated method stub
		stock_balanceDAOManager.Update(stock_balanceinstance);
		
	}

	@Override
	public List<Stock_Balance> selectAll() {
		// TODO Auto-generated method stub
		return  stock_balanceDAOManager.selectAll();
	}

	@Override
	public Stock_Balance selectStock_Balance(int ID) {
		// TODO Auto-generated method stub
		return stock_balanceDAOManager.selectStock_Balance(ID);
	}

	@Override
	public List<Stock_Balance> selectStock_BalanceByWarehouseid(int warehouseid) {
		// TODO Auto-generated method stub
		return stock_balanceDAOManager.selectStockBalanceByWarehouseId(warehouseid);
	}

	
	
}

package com.java.plyd.persistence;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;

import com.java.plyd.service.Stock_Balance;
@Repository("Stock_BalanceDAOManager")
public class Stock_BalanceDAOManager extends SqlMapClientDaoSupport implements IStock_BalanceDAOManager {

	@Override
	public void Insert(Stock_Balance stock_balanceinstance) {
		

		try {
			
			getSqlMapClientTemplate().insert("Stock_Balance.insertStock_Balance",stock_balanceinstance);
			System.out.println("Insert successful to stock balance....");
			
		} catch (Exception ex) {
			
			System.out.println("Inserting........");

		}
		
	}

	@Override
	public void Delete(int ID) {
		// TODO Auto-generated method stub
		

		try {
			getSqlMapClientTemplate().delete("Stock_Balance.deleteStock_Balance",
					ID);

		} catch (Exception ex) {
			System.out.println("Deleting.....");

		}

		
	}

	@Override
	public void Update(Stock_Balance stock_balanceinstance) {
		// TODO Auto-generated method stub
		try {
			getSqlMapClientTemplate().update("Stock_Balance.updateStock_Balance",
					stock_balanceinstance);

		} catch (Exception ex) {
			System.out.println("Updating.....");

		}
		
	}

	@Override
	public List<Stock_Balance> selectAll() {
		// TODO Auto-generated method stub
		List<Stock_Balance> stock_balancelist = null;
		try {
			return getSqlMapClientTemplate().queryForList(
					"Stock_Balance.selectAllStock_Balance");

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("Retrieving  all......");
		}
		return null;

	}

	@Override
	public Stock_Balance selectStock_Balance(int ID) {
		// TODO Auto-generated method stub
		try {
			return (Stock_Balance) getSqlMapClientTemplate().queryForObject(
					"Stock_Balance.selectStock_Balance", ID);

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("Retrieving Id.....");
		}
		return null;
	}

	@Override
	public List<Stock_Balance> selectStockBalanceByWarehouseId(int warehouseid) {
		try {
			return getSqlMapClientTemplate().queryForList(
					"Stock_Balance.selectStock_BalanceByWarehouseId",warehouseid);

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("Retrieving  all......");
		}
		return null;
	}

}

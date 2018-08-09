package com.java.plyd.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java.plyd.persistence.IStock_inDAOManager;


@Service(value = "Stock_inService")
public class Stock_inService implements IStock_inService {

	@Resource(name = "Stock_inDAOManager")
	private IStock_inDAOManager Stock_inDAOManager;

	public int entry(Stock_in stock_ininstance) {
		int value=0;
		try{
		return value=Stock_inDAOManager.Insert(stock_ininstance);
		}catch(Exception e){System.out.println("this is service"+value);}
		return value;
	}

	@Override
	public void remove(int stock_inid) {
		Stock_inDAOManager.Delete(stock_inid);
	}

	@Override
	public void edit(Stock_in stock_in) {
		Stock_inDAOManager.Update(stock_in);
	}

	@Override
	public List<Stock_in> selectAll() {
		// TODO Auto-generated method stub
		return Stock_inDAOManager.selectAll();
	}

	@Override
	public Stock_in selectStock_in(int stock_inid) {
		// TODO Auto-generated method stub
		
		return Stock_inDAOManager.selectStock_in(stock_inid);
	}

	@Override
	public List<Stock_in> selectAllforadmin() {
		// TODO Auto-generated method stub
		return Stock_inDAOManager.selectAllforadmin();
	
	}
	
	@Override
	public List<Stock_in> selectAllByDate(Stock_in stockid) {
		// TODO Auto-generated method stub
		return Stock_inDAOManager.selectAllByDate(stockid);
	
	}

	@Override
	public List<Stock_in> selectAllByDaily(Stock_in stockid) {
		// TODO Auto-generated method stub
		return Stock_inDAOManager.selectAllByDaily(stockid);
	}

	@Override
	public List<Stock_in> selectAllByDailySumMerchandise(Stock_in stock_in) {
		// TODO Auto-generated method stub
		return Stock_inDAOManager.selectAllByDailySumMerchandise(stock_in);
	}

}

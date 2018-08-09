package com.java.plyd.persistence;

import java.util.List;

import com.java.plyd.service.Stock_in;


public interface IStock_inDAOManager {
	public int Insert(Stock_in stock_ininstance);
	public void Delete(int stock_inid);
	public void Update(Stock_in stock_in);
	public List<Stock_in> selectAll();
	public Stock_in selectStock_in(int stock_inid);
	public List<Stock_in> selectAllforadmin();
	public List<Stock_in> selectAllByDate(Stock_in stock_in);
	public List<Stock_in> selectAllByDaily(Stock_in stock_in);
	public List<Stock_in> selectAllByDailySumMerchandise(Stock_in stock_in);
}

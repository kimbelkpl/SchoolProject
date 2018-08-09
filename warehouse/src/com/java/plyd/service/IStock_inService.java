package com.java.plyd.service;

import java.util.List;

public interface IStock_inService {
	public int entry(Stock_in stock_ininstance);
	public void remove(int stock_inid);
	public void edit(Stock_in stockid);
	public List<Stock_in> selectAll();
	public Stock_in selectStock_in(int stock_inid);
	public List<Stock_in> selectAllforadmin();
	public List<Stock_in> selectAllByDate(Stock_in stockid);
	public List<Stock_in> selectAllByDaily(Stock_in stockid);
	public List<Stock_in> selectAllByDailySumMerchandise(Stock_in stock_in);
}

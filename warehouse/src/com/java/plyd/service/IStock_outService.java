package com.java.plyd.service;

import java.util.List;

public interface IStock_outService {
	
	public int entry(Stock_out stock_outinstance);
	public void remove(int stock_outid);
	public void edit(Stock_out stock_out);
	public List<Stock_out> selectAll();
	public Stock_out selectStock_out(int stock_outid);
	public List<Stock_out> selectAllforadmin();
	public List<Stock_out> selectAllByDate(Stock_out stockid);
	public List<Stock_out> selectAllByDaily(Stock_out stock_out);
	public List<Stock_out> selectAllByDailyMerchandise(Stock_out stock_out);
}

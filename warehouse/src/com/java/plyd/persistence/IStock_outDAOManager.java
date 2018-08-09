package com.java.plyd.persistence;

import java.util.List;

import com.java.plyd.service.Stock_in;
import com.java.plyd.service.Stock_out;
import com.java.plyd.service.User_Level;

public interface IStock_outDAOManager {
	
	public int Insert(Stock_out stock_outinstance);
	public void Delete(int stock_outid);
	public void Update(Stock_out stock_out);
	public List<Stock_out> selectAll();
	public Stock_out selectStock_out(int stock_outid);
	public List<Stock_out> selectAllforadmin();
	public List<Stock_out> selectAllByDate(Stock_out stock_out);
	public List<Stock_out> selectAllByDaily(Stock_out stock_out);
	public List<Stock_out> selectAllByDailyMerchandise(Stock_out stock_out);
}

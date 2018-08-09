package com.java.plyd.service;

import java.util.List;

public interface IStockoutdetailService {
	
	public void entry(List<StockoutDetail> stockoutdetail);
	public void remove(int stockoutdetail_id);
	public void edit(StockoutDetail stockoutdetail);
	public List<StockoutDetail> selectAll();
	public StockoutDetail selectStockoutDetail(int stockoutdetail_id);
	public List<StockoutDetail> selectAllforadmin();
	public List<StockoutDetail> selectAllVou(int stock_out_id);
	public List<StockoutDetail> selectStockOutSumMerchandise(int merchandiseid);
	public List<StockoutDetail> selectOrder();
}

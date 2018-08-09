package com.java.plyd.persistence;

import java.util.List;

import com.java.plyd.service.Stock_InDetail;
import com.java.plyd.service.StockoutDetail;

public interface IStockoutdetailDAOManager {
	
	public void Insert(List<StockoutDetail> stockoutdetail);
	public void Delete(int stockoutdetail_id);
	public void Update(StockoutDetail stockoutdetail);
	public List<StockoutDetail> selectAll();
	public StockoutDetail selectStockoutDetail(int stockoutdetail_id);
	public List<StockoutDetail> selectAllforadmin();
	public List<StockoutDetail> selectAllVou(int stock_out_id);
	public List<StockoutDetail> selectStockOutSumMerchandise(int merchandiseid);
	public List<StockoutDetail> selectOrder();
}

package com.java.plyd.persistence;

import java.util.List;

import com.java.plyd.service.Stock_Balance;
import com.java.plyd.service.Stock_InDetail;

public interface IStock_InDetailDAOManager {
	public void Insert(List<Stock_InDetail> stock_in_detail_instanceList);
	public void Delete(int stock_in_detail_id);
	public void Update(Stock_InDetail stock_in_detail_instance);
	public List<Stock_InDetail> selectAll();
	public Stock_InDetail selectStock_InDetail(int stock_in_detail_id);
	public List<Stock_InDetail> selectAllforadmin();
	public List<Stock_InDetail> selectAllVou(int stock_in_id);
	public List<Stock_InDetail> selectStockInSumMerchandise(int merchandiseid);
}

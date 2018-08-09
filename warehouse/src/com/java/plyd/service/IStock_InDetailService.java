package com.java.plyd.service;

import java.util.List;

public interface IStock_InDetailService {
	public void entry(List<Stock_InDetail> stock_in_detail_instanceList);
	public void remove(int stock_in_detail_id);
	public void edit(Stock_InDetail stock_in_detail_instance);
	public List<Stock_InDetail> selectAll();
	public Stock_InDetail selectStock_InDetail(int stock_in_detail_id);
	public List<Stock_InDetail> selectAllforadmin();
	public List<Stock_InDetail> selectAllVou(int stock_in_id);
	public List<Stock_InDetail> selectStockInSumMerchandise(int merchandiseid);
}

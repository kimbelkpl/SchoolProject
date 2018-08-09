package com.java.plyd.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java.plyd.persistence.IStock_InDetailDAOManager;

@Service(value = "Stock_InDetailService")
public class Stock_InDetailService implements IStock_InDetailService{
	
	@Resource(name = "Stock_InDetailDAOManager")
	private IStock_InDetailDAOManager Stock_InDetailDAOManager;
	
	
	public void entry(List<Stock_InDetail> stock_in_detail_instanceList) {

		Stock_InDetailDAOManager.Insert(stock_in_detail_instanceList);
	}

	
	public void remove(int stock_in_detail_id) {
		Stock_InDetailDAOManager.Delete(stock_in_detail_id);
	}

	
	public void edit(Stock_InDetail stock_in_detail_instance) {
		Stock_InDetailDAOManager.Update(stock_in_detail_instance);
	}

	
	public List<Stock_InDetail> selectAll() {
		// TODO Auto-generated method stub
		return Stock_InDetailDAOManager.selectAll();
	}

	
	public Stock_InDetail selectStock_InDetail(int stock_in_detail_id) {
		// TODO Auto-generated method stub
		return Stock_InDetailDAOManager.selectStock_InDetail(stock_in_detail_id);
	}
	@Override
	public List<Stock_InDetail> selectAllforadmin() {
		// TODO Auto-generated method stub
		return  Stock_InDetailDAOManager.selectAllforadmin();
	}

	@Override
	public List<Stock_InDetail> selectAllVou(int stock_in_id) {
		try{
		return Stock_InDetailDAOManager.selectAllVou(stock_in_id);
	}catch(Exception ex){System.out.println("This is service DAOManager");}
		return null;
	}


	@Override
	public List<Stock_InDetail> selectStockInSumMerchandise(int merchandiseid) {
		// TODO Auto-generated method stub
		return Stock_InDetailDAOManager.selectStockInSumMerchandise(merchandiseid);
	}



	

}

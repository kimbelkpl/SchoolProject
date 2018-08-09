  package com.java.plyd.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java.plyd.persistence.IStockoutdetailDAOManager;

@Service(value= "StockoutdetailService")
public class StockoutdetailService implements IStockoutdetailService{
	
	@Resource(name ="StockoutdetailDAOManager")
	private IStockoutdetailDAOManager StockoutdetailDAOManager;

	@Override
	public void entry(List<StockoutDetail> stockoutdetail) {
		// TODO Auto-generated method stub
		StockoutdetailDAOManager.Insert(stockoutdetail);
		
	}

	@Override
	public void edit(StockoutDetail stockoutdetail) {
		// TODO Auto-generated method stub
		StockoutdetailDAOManager.Update(stockoutdetail);
		
	}

	@Override
	public void remove(int stockoutdetail_id) {
		// TODO Auto-generated method stub
		StockoutdetailDAOManager.Delete(stockoutdetail_id);
		
	}

	@Override
	public List<StockoutDetail> selectAll() {
		// TODO Auto-generated method stub
		return StockoutdetailDAOManager.selectAll();
	}

	@Override
	public StockoutDetail selectStockoutDetail(int stockoutdetail_id){
		// TODO Auto-generated method stub
		return StockoutdetailDAOManager.selectStockoutDetail(stockoutdetail_id);
	}

	
	@Override
	public List<StockoutDetail> selectAllforadmin() {
		// TODO Auto-generated method stub
		return StockoutdetailDAOManager.selectAllforadmin();
	}

	@Override
	public List<StockoutDetail> selectAllVou(int stock_out_id) {
		// TODO Auto-generated method stub
		try{
		return StockoutdetailDAOManager.selectAllVou(stock_out_id);
		}catch(Exception ex){System.out.println("this is service"+stock_out_id);}
		
		return null;
	}

	@Override
	public List<StockoutDetail> selectStockOutSumMerchandise(int merchandiseid) {
		// TODO Auto-generated method stub
		return StockoutdetailDAOManager.selectStockOutSumMerchandise(merchandiseid);
	}

	@Override
	public List<StockoutDetail> selectOrder() {
		// TODO Auto-generated method stub
		return StockoutdetailDAOManager.selectOrder();
	}

}

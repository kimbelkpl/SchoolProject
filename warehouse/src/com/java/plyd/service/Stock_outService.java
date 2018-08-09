
package com.java.plyd.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java.plyd.persistence.IStock_outDAOManager;

@Service(value = "Stock_outService")
public class Stock_outService implements IStock_outService {

	@Resource(name = "Stock_outDAOManager")
	private IStock_outDAOManager Stock_outDAOManager;

	public int entry(Stock_out stock_outinstance) {
 int value=0;
		try{
		return value=Stock_outDAOManager.Insert(stock_outinstance);
		}catch(Exception e){
			System.out.println("this is service"+value);
			
			
		}
		return value;
		// }
		// else {
		// return 2;
		// }

	}

	@Override
	public void remove(int stock_outid) {
		Stock_outDAOManager.Delete(stock_outid);
	}

	@Override
	public void edit(Stock_out stock_out) {
		Stock_outDAOManager.Update(stock_out);
	}

	@Override
	public List<Stock_out> selectAll() {
		// TODO Auto-generated method stub
		return Stock_outDAOManager.selectAll();
	}

	@Override
	public Stock_out selectStock_out(int stock_outid) {
		// TODO Auto-generated method stub
		return Stock_outDAOManager.selectStock_out(stock_outid);
	}

	@Override
	public List<Stock_out> selectAllforadmin() {
		// TODO Auto-generated method stub
		return Stock_outDAOManager.selectAllforadmin();
	}

	@Override
	public List<Stock_out> selectAllByDate(Stock_out stockid) {
		// TODO Auto-generated method stub
		return Stock_outDAOManager.selectAllByDate(stockid);
	
	}

	@Override
	public List<Stock_out> selectAllByDaily(Stock_out stock_out) {
		// TODO Auto-generated method stub
		return Stock_outDAOManager.selectAllByDaily(stock_out);
	}

	@Override
	public List<Stock_out> selectAllByDailyMerchandise(Stock_out stock_out) {
		// TODO Auto-generated method stub
		return Stock_outDAOManager.selectAllByDailyMerchandise(stock_out);
	}
	

}

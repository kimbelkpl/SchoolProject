package com.java.plyd.persistence;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;

import com.java.plyd.service.Stock_in;
import com.java.plyd.service.Stock_out;
import com.java.plyd.service.User_Level;

@Repository("Stock_outDAOManager")
public class Stock_outDAOManager extends SqlMapClientDaoSupport implements IStock_outDAOManager  {

	
	public int Insert(Stock_out stock_outinstance) {
		
		
		int value=0;
			try {
				return (value= (int) getSqlMapClientTemplate().insert("Stock_out.insertStock_out", stock_outinstance));
				
				 
			} catch (Exception ex) {
				System.out.println("This is inserting....."+value);

			}
		return value;
		
	}

	public void Delete(int stock_outid) {
		
		
		
		try {
			 getSqlMapClientTemplate().delete("Stock_out.deleteStock_out", stock_outid);
			
			
		} catch (Exception ex) {

		}
	
	
}
public void Update(Stock_out stock_out) {
		
		
		
		try {
			 getSqlMapClientTemplate().update("Stock_out.updateStock_out", stock_out);
			
			
		} catch (Exception ex) {

		}
	
	
}

	public List<Stock_out> selectAll() {
		
		
		List<Stock_out> stock_outList = null;
		try {
       			return getSqlMapClientTemplate().queryForList("Stock_out.selectAllStock_out");
       			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
		
	
	
}

public Stock_out selectStock_out(int stock_outid) {
		
		
		
		try {
       			return (Stock_out)getSqlMapClientTemplate().queryForObject("Stock_out.selectStock_out",stock_outid);
       			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
		
	
	
}
	
@Override
public List<Stock_out> selectAllforadmin() {
	// TODO Auto-generated method stub
	try{
		return (List<Stock_out>)getSqlMapClientTemplate().queryForList("Stock_out.selectAllforadmin");
	}catch(Exception ex){
		
	}
	return null;
}
	
public List<Stock_out> selectAllByDate(Stock_out stock_out) {
	// TODO Auto-generated method stub
	try{
		return (List<Stock_out>)getSqlMapClientTemplate().queryForList("Stock_out.selectAllByDate",stock_out);
	}catch(Exception ex){
		ex.printStackTrace();
		
	}
	return null;
}

@Override
public List<Stock_out> selectAllByDaily(Stock_out stock_out) {
	// TODO Auto-generated method stub
	try{
		return (List<Stock_out>)getSqlMapClientTemplate().queryForList("Stock_out.selectAllByDaily",stock_out);
	}catch(Exception ex){
		ex.printStackTrace();
		
	}
	return null;
}

@Override
public List<Stock_out> selectAllByDailyMerchandise(Stock_out stock_out) {
	// TODO Auto-generated method stub
	try{
		return (List<Stock_out>)getSqlMapClientTemplate().queryForList("Stock_out.selectAllByDailyMerchandise",stock_out);
	}catch(Exception ex){
		ex.printStackTrace();
		
	}
	return null;
}
	

}



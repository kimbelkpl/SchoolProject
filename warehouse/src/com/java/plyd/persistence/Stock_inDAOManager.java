package com.java.plyd.persistence;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;

import com.java.plyd.service.Stock_in;


@Repository("Stock_inDAOManager")
public class Stock_inDAOManager extends SqlMapClientDaoSupport implements IStock_inDAOManager  {

	
	public int Insert(Stock_in stock_ininstance) {
		
		int value=0;
			
			try {
				
				return (value=(int) getSqlMapClientTemplate().insert("Stock_in.insertStock_in", stock_ininstance));
				
				
			} catch (Exception ex) {
				System.out.println("This is Daomanager"+value);
			}
		
	return value;
	}

	public void Delete(int stock_inid) {
		
		
		
		try {
			 getSqlMapClientTemplate().delete("Stock_in.deleteStock_in", stock_inid);
			
			
		} catch (Exception ex) {

		}
	
	
}
public void Update(Stock_in stock_in) {
		
		
		
		try {
			 getSqlMapClientTemplate().update("Stock_in.updateStock_in", stock_in);
			
			
		} catch (Exception ex) {

		}
	
	
}

	public List<Stock_in> selectAll() {
		
		
		List<Stock_in> stock_inList = null;
		try {
       			return getSqlMapClientTemplate().queryForList("Stock_in.selectAllStock_in");
       			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
		
	
	
}

public Stock_in selectStock_in(int stock_inid) {
		
		
		
		try {
       			return (Stock_in)getSqlMapClientTemplate().queryForObject("Stock_in.selectStock_in",stock_inid);
       			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
		
	
	
}

@Override
public List<Stock_in> selectAllforadmin() {
	// TODO Auto-generated method stub
	try{
		return (List<Stock_in>)getSqlMapClientTemplate().queryForList("Stock_in.selectAllforadmin");
	}catch(Exception ex){
		
	}
	return null;
}
public List<Stock_in> selectAllByDate(Stock_in stock_in) {
	// TODO Auto-generated method stub
	try{
		return (List<Stock_in>)getSqlMapClientTemplate().queryForList("Stock_in.selectAllByDate",stock_in);
	}catch(Exception ex){
		ex.printStackTrace();
		
	}
	return null;
}

@Override
public List<Stock_in> selectAllByDaily(Stock_in stock_in) {
	// TODO Auto-generated method stub
	try{
		return (List<Stock_in>)getSqlMapClientTemplate().queryForList("Stock_in.selectAllByDaily",stock_in);
	}catch(Exception ex){
		ex.printStackTrace();
		
	}
	return null;
}

@Override
public List<Stock_in> selectAllByDailySumMerchandise(Stock_in stock_in) {
	// TODO Auto-generated method stub
	try{
		return (List<Stock_in>)getSqlMapClientTemplate().queryForList("Stock_in.selectAllByDailySumMer",stock_in);
	}catch(Exception ex){
		ex.printStackTrace();
		
	}
	return null;
}
	


}


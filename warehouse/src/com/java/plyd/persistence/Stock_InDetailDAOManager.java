package com.java.plyd.persistence;

import java.util.*;


import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;

import com.java.plyd.service.*;


@Repository("Stock_InDetailDAOManager")
public class Stock_InDetailDAOManager extends SqlMapClientDaoSupport implements IStock_InDetailDAOManager  {

	@Override
	public void Insert(List<Stock_InDetail> stock_in_detail_instanceList) {
		try {
			for (Stock_InDetail stock_InDetail : stock_in_detail_instanceList) {
				 getSqlMapClientTemplate().insert("Stock_InDetail.insertStock_InDetail", stock_InDetail);
					
							
			}
			
		} catch (Exception ex) {

		}
		
	}

	@Override
	public void Delete(int stock_in_detail_id) {
		try {
			 getSqlMapClientTemplate().delete("Stock_InDetail.deleteStock_InDetail", stock_in_detail_id);
			
			
		} catch (Exception ex) {

		}
	
	}

	@Override
	public void Update(Stock_InDetail stock_in_detail_instance) {
		try {
			 getSqlMapClientTemplate().update("Stock_InDetail.updateStock_InDetail", stock_in_detail_instance);
			
			
		} catch (Exception ex) {

		}
		
	}

	@Override
	public List<Stock_InDetail> selectAll() {
		
		List<Stock_InDetail> Stock_InDetail = null;
		try {
       			return getSqlMapClientTemplate().queryForList("Stock_InDetail.selectAllStock_InDetail");
       			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public Stock_InDetail selectStock_InDetail(int stock_in_detail_id) {
		try {
   			return (Stock_InDetail)getSqlMapClientTemplate().queryForObject("Stock_InDetail.selectStock_InDetail",stock_in_detail_id);
   			
	} catch (Exception ex) {
		ex.printStackTrace();
	}
	return null;
	}

	@Override
	public List<Stock_InDetail> selectAllVou(int stock_in_id) {
		List<Stock_InDetail> Stock_InDetail = null;
		try {
       			return getSqlMapClientTemplate().queryForList("Stock_InDetail.selectAllStock_InDetailVou",stock_in_id);
       			
		} catch (Exception ex) {System.out.println("this is persistence DAOManager");
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Stock_InDetail> selectAllforadmin() {
		// TODO Auto-generated method stub
		try {
   			return getSqlMapClientTemplate().queryForList("Stock_InDetail.selectAllforadmin");
   			
	} catch (Exception ex) {
		ex.printStackTrace();
	}
	return null;
	}

	@Override
	public List<Stock_InDetail> selectStockInSumMerchandise(int merchandiseid) {
		// TODO Auto-generated method stub
		try {
			return getSqlMapClientTemplate().queryForList(
					"Stock_InDetail.selectStock_InSummerchandise",merchandiseid);

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("Retrieving  all......");
		}
		return null;
	}

	}

	
	


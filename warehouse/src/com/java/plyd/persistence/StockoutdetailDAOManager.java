package com.java.plyd.persistence;

import java.util.List;


import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;
import com.java.plyd.service.StockoutDetail;

@Repository("StockoutdetailDAOManager")
public class StockoutdetailDAOManager extends SqlMapClientDaoSupport implements IStockoutdetailDAOManager  {

	@Override
	public void Insert(List<StockoutDetail> stockoutdetail) {
		// TODO Auto-generated method stub
		try{
			for (StockoutDetail stockoutdet: stockoutdetail){
			getSqlMapClientTemplate().insert("StockoutDetail.insertStockoutDetail",stockoutdet);
			System.out.println("Stock out Detail insert successful");
			}
		}catch (Exception ex){
			ex.printStackTrace();
			System.out.println("Inserting.....");
			
		}
		
	}

	@Override
	public void Delete(int stockoutdetail_id) {
		// TODO Auto-generated method stub
		try{
			getSqlMapClientTemplate().delete("StockoutDetail.deleteStockoutDetail",stockoutdetail_id);
		}catch (Exception ex){
			ex.printStackTrace();
			
		}
		
	}

	@Override
	public void Update(StockoutDetail stockoutdetail) {
		// TODO Auto-generated method stub
		try{
			getSqlMapClientTemplate().update("StockoutDetail.updateStockoutDetail",stockoutdetail);
		}catch (Exception ex){
			ex.printStackTrace();
			
		}
		
	}

	@Override
	public List<StockoutDetail> selectAll() {
		
		// TODO Auto-generated method stub
		List<StockoutDetail> stockoutdetaillist = null;
				try {
		       			return getSqlMapClientTemplate().queryForList("StockoutDetail.selectAllStockoutDetail");
		       			
				} catch (Exception ex) {
					ex.printStackTrace();
				}
				return null;
			}

			@Override
			public StockoutDetail selectStockoutDetail(int stockoutdetail_id) {
				// TODO Auto-generated method stub
				try {
		   			return (StockoutDetail)getSqlMapClientTemplate().queryForObject("StockoutDetail.selectStockoutDetail",stockoutdetail_id);
		   			
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			return null;
			}

		

			@Override
			public List<StockoutDetail> selectAllforadmin(){
				try {
		   			return getSqlMapClientTemplate().queryForList("StockoutDetail.selectAllforadmin");
		   			
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			return null;
			}

			@Override
			public List<StockoutDetail> selectAllVou(int stock_out_id) {
				// TODO Auto-generated method stub
				try{
					return getSqlMapClientTemplate().queryForList("StockoutDetail.selectAllStock_OutDetailVou",stock_out_id);
				}catch(Exception ex){System.out.println("This is persistence"+stock_out_id);
					ex.printStackTrace();
				}
				return null;
			}

			@Override
			public List<StockoutDetail> selectStockOutSumMerchandise(
					int merchandiseid) {
				// TODO Auto-generated method stub
				try {
					return getSqlMapClientTemplate().queryForList(
							"StockoutDetail.selectStock_outSummerchandise",merchandiseid);

				} catch (Exception ex) {
					ex.printStackTrace();
					System.out.println("Retrieving  all......");
				}
				return null;
			}

			@Override
			public List<StockoutDetail> selectOrder() {
				// TODO Auto-generated method stub
				try{
					return getSqlMapClientTemplate().queryForList("StockoutDetail.selectOrder");
				}catch(Exception ex){System.out.println("This is persistence");
					ex.printStackTrace();
				}
				return null;
			}
			

		}


package com.java.plyd.persistence;

import java.util.*;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;

import com.java.plyd.service.*;


@Repository("BrandDAOManager")
public class BrandDAOManager extends SqlMapClientDaoSupport implements IBrandDAOManager  {

	
	public int Insert(Brand brandinstance) {
		
		
			
			try {
				 return (int)getSqlMapClientTemplate().insert("Brand.insertBrand", brandinstance);
				
				
			} catch (Exception ex) {

			}
		
		return 0;
	}

	public void Delete(int brandID) {
		
		
		
		try {
			 getSqlMapClientTemplate().delete("Brand.deleteBrand", brandID);
			
			
		} catch (Exception ex) {

		}
	
	
}
public void Update(Brand brand) {
		
		
		
		try {
			 getSqlMapClientTemplate().update("Brand.updateBrand", brand);
			
			
		} catch (Exception ex) {

		}
	
	
}

	public List<Brand> selectAll() {
		
		
		List<Brand> brandlist = null;
		try {
       			return getSqlMapClientTemplate().queryForList("Brand.selectAllBrand");
       			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
		
	
	
}

public Brand selectBrand(int brandID) {
		
		
		
		try {
       			return (Brand)getSqlMapClientTemplate().queryForObject("Brand.selectBrand",brandID);
       			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
		
	
	
}

@Override
public List<Brand> selectAllforadmin() {
	List<Brand> brandlist = null;
	try {
   			return getSqlMapClientTemplate().queryForList("Brand.selectAllforadmin");
   			
	} catch (Exception ex) {
		ex.printStackTrace();
	}
	return null;
}
}

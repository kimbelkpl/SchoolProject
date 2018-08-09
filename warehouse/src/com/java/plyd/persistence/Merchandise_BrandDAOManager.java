package com.java.plyd.persistence;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import com.java.plyd.service.*;

import org.springframework.stereotype.Repository;

@Repository("Merchandise_BrandDAOManager")
public class Merchandise_BrandDAOManager extends SqlMapClientDaoSupport  implements IMerchandise_BrandDAOManager {

	@Override
	public void Insert(Merchandise_Brand item) {
		try {
			 getSqlMapClientTemplate().insert("Merchandise_Brand.insertMerchandise_Brand", item);
			
			
		} catch (Exception ex) {

		}
	
		
	}

	@Override
	public void Delete(int ID) {
		
		try {
			 getSqlMapClientTemplate().delete("Merchandise_Brand.deleteMerchandise_Brand",  ID);
			
			
		} catch (Exception ex) {

		}
	
		
	}

	@Override
	public void Update(Merchandise_Brand item) {
		
		try {
			 getSqlMapClientTemplate().update("Merchandise_Brand.updateMerchandise_Brand", item);
			
			
		} catch (Exception ex) {

		}
		
	}

	@Override
	public List<Merchandise_Brand> selectAll() {
		
		try {
       			return (List<Merchandise_Brand>)getSqlMapClientTemplate().queryForList("Merchandise_Brand.selectAllMerchandise_Brand");
       			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
		
	
	}

}

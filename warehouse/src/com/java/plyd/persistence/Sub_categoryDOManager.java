package com.java.plyd.persistence;

import java.util.*;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;
import com.java.plyd.service.*;

@Repository("Sub_categoryDOManager")

public class Sub_categoryDOManager extends SqlMapClientDaoSupport implements ISub_categoryDOManager{

	@Override
	public int Insert(Sub_category sub_category) {
		// TODO Auto-generated method stub
		try {
			return (int)getSqlMapClientTemplate().insert("Sub_category.insertSub_category", sub_category);
			
			
		} catch (Exception ex) {

		}
		return 0;
	}

	@Override
	public void Delete(int sub_category_id) {
		// TODO Auto-generated method stub
		try{
			 getSqlMapClientTemplate().delete("Sub_category.deleteSub_category", sub_category_id);
				
				
			} catch (Exception ex) {

			}
	}

	@Override
	public void Update(Sub_category sub_category) {
		// TODO Auto-generated method stub
		try {
			 getSqlMapClientTemplate().update("Sub_category.updateSub_category", sub_category);
			
			
		} catch (Exception ex) {

		}
	}

	@Override
	public List<Sub_category> selectAll() {
		// TODO Auto-generated method stub
		try {
       			return getSqlMapClientTemplate().queryForList("Sub_category.selectAllSub_category");
       			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public Sub_category selectSub_category(int sub_category_id) {
		// TODO Auto-generated method stub
		try {
   			return (Sub_category)getSqlMapClientTemplate().queryForObject("Sub_category.selectSub_category",sub_category_id);
   			
	} catch (Exception ex) {
		ex.printStackTrace();
	}
	return null;
	}

	@Override
	public void DeleteByCategoryId(int category_id) {
		// TODO Auto-generated method stub
		try{
			 getSqlMapClientTemplate().delete("Sub_category.deleteSub_categoryByCategoryId",category_id);
				
				
			} catch (Exception ex) {

			}
	}

	@Override
	public List<Sub_category> selectAllforadmin() {
		try {
   			return getSqlMapClientTemplate().queryForList("Sub_category.selectAllSub_categoryforadmin");
   			
	} catch (Exception ex) {
		ex.printStackTrace();
	}
	return null;
	}

	@Override
	public boolean hascategory(int category_id) {
		// TODO Auto-generated method stub
		if(getSqlMapClientTemplate().queryForList("Sub_category.selectAllBycid",category_id).size()>0){
			return true;
		}
		return false;
	}

}

package com.java.plyd.persistence;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;

import com.java.plyd.service.SubCategoryAndBrand;
@Repository("SubCategoryAndBrandDAOManager")
public class SubCategoryAndBrandDAOManager extends SqlMapClientDaoSupport implements ISubCategoryAndBrandDAOManager {

	@Override
	public void Insert(SubCategoryAndBrand sad) {
		// TODO Auto-generated method stub
		try {
			 getSqlMapClientTemplate().insert("SubCategoryAndBrand.insertSubCategoryAndBrand", sad);
			
			
		} catch (Exception ex) {

		}
	}

	@Override
	public void Delete(int sub_category_id) {
		// TODO Auto-generated method stub
		try{
			 getSqlMapClientTemplate().delete("SubCategoryAndBrand.deleteSubCategoryAndBrand", sub_category_id);
				
				
			} catch (Exception ex) {

			}
	}

	@Override
	public List<SubCategoryAndBrand> SelectSubCategoryAndBrandBySubCategoryId(
			int sub_category_id) {
		// TODO Auto-generated method stub
		try {
   			return (List<SubCategoryAndBrand>)getSqlMapClientTemplate().queryForList("SubCategoryAndBrand.selectSubCategoryAndBrandBySubCategoryId",sub_category_id);
   			
	} catch (Exception ex) {
		ex.printStackTrace();
	}
	return null;
	}

	@Override
	public void Delete1(int brand_id) {
		// TODO Auto-generated method stub
		try{
			 getSqlMapClientTemplate().delete("SubCategoryAndBrand.deleteSubCategoryAndBrand1", brand_id);
				
				
			} catch (Exception ex) {

			}
	}

	@Override
	public List<SubCategoryAndBrand> SelectSubCategoryAndBrandByBrandId(
			int brand_id) {
		// TODO Auto-generated method stub
		try {
   			return (List<SubCategoryAndBrand>)getSqlMapClientTemplate().queryForList("SubCategoryAndBrand.selectSubCategoryAndBrandByBrandId",brand_id);
   			
	} catch (Exception ex) {
		ex.printStackTrace();
	}
		return null;
	}

	@Override
	public List<SubCategoryAndBrand> selectAll() {
		// TODO Auto-generated method stub
		try {
			return getSqlMapClient().queryForList("SubCategoryAndBrand.selectAll");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}

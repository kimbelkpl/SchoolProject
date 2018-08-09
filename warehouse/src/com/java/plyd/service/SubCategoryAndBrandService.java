package com.java.plyd.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java.plyd.persistence.IBrandDAOManager;
import com.java.plyd.persistence.ISubCategoryAndBrandDAOManager;
@Service(value = "SubCategoryAndBrandService")
public class SubCategoryAndBrandService implements ISubCategoryAndBrandService {

	@Resource(name = "SubCategoryAndBrandDAOManager")
	private ISubCategoryAndBrandDAOManager manager;
	
	@Override
	public void entry(SubCategoryAndBrand sad) {
		// TODO Auto-generated method stub
		manager.Insert(sad);
	}

	@Override
	public void remove(int sub_category_id) {
		// TODO Auto-generated method stub
		manager.Delete(sub_category_id);
	}

	@Override
	public List<SubCategoryAndBrand> selectSubCategoryAndBrandBySubCategoryId(
			int sub_category_id) {
		// TODO Auto-generated method stub
		return (List<SubCategoryAndBrand>)manager.SelectSubCategoryAndBrandBySubCategoryId(sub_category_id);
	}

	@Override
	public void remove1(int brand_id) {
		// TODO Auto-generated method stub
		manager.Delete1(brand_id);
	}

	@Override
	public List<SubCategoryAndBrand> selectSubCategoryAndBrandByBrandId(
			int brand_id) {
		// TODO Auto-generated method stub
		return (List<SubCategoryAndBrand>)manager.SelectSubCategoryAndBrandByBrandId(brand_id);
	}

	@Override
	public List<SubCategoryAndBrand> selectAll() {
		// TODO Auto-generated method stub
		return manager.selectAll();
	}

}

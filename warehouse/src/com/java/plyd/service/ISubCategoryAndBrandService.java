package com.java.plyd.service;

import java.util.List;

public interface ISubCategoryAndBrandService {
	public void entry(SubCategoryAndBrand sad);
	public void remove(int sub_category_id);
	public List<SubCategoryAndBrand> selectSubCategoryAndBrandBySubCategoryId(int sub_category_id);
	public void remove1(int brand_id);
	public List<SubCategoryAndBrand> selectSubCategoryAndBrandByBrandId(int brand_id);
	public List<SubCategoryAndBrand> selectAll();
}

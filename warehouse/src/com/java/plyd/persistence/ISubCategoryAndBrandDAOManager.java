package com.java.plyd.persistence;

import java.util.List;

import com.java.plyd.service.*;

public interface ISubCategoryAndBrandDAOManager {
	public void Insert(SubCategoryAndBrand sad);
	public void Delete(int sub_category_id);
	public List<SubCategoryAndBrand> SelectSubCategoryAndBrandBySubCategoryId(int sub_category_id);
	public void Delete1(int brand_id);
	public List<SubCategoryAndBrand> SelectSubCategoryAndBrandByBrandId(int brand_id);
	public List<SubCategoryAndBrand> selectAll();
}

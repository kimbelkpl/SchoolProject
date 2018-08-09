package com.java.plyd.service;

import java.util.*;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.java.plyd.persistence.*;
import com.java.plyd.service.*;

@Service(value = "Sub_category_service")
public class Sub_category_service implements ISub_category_service{

	@Resource(name = "Sub_categoryDOManager")
	private ISub_categoryDOManager sub_categoryDOManager;
	//ICategoryDOManager categoryDOManager;
	//ISupplierDOManager supplierDOManager;
	@Override
	public int entry(Sub_category sub_category) {
		// TODO Auto-generated method stub
		return sub_categoryDOManager.Insert(sub_category);
	}

	@Override
	public void remove(int sub_category_id) {
		// TODO Auto-generated method stub
		sub_categoryDOManager.Delete(sub_category_id);
	}

	@Override
	public void edit(Sub_category sub_category) {
		// TODO Auto-generated method stub
		sub_categoryDOManager.Update(sub_category);
	}

	@Override
	public List<Sub_category> selectAll() {
		// TODO Auto-generated method stub
		return sub_categoryDOManager.selectAll();
	}

	@Override
	public Sub_category selectSub_category(int sub_category_id) {
		// TODO Auto-generated method stub
		return sub_categoryDOManager.selectSub_category(sub_category_id);
	}

	@Override
	public void removesub(int category_id) {
		// TODO Auto-generated method stub
		sub_categoryDOManager.DeleteByCategoryId(category_id);
	}

	@Override
	public List<Sub_category> selectAllforadmin() {
		// TODO Auto-generated method stub
		return sub_categoryDOManager.selectAllforadmin();
	}

	@Override
	public boolean hascategory(int category_id) {
		// TODO Auto-generated method stub
		if(sub_categoryDOManager.hascategory(category_id)){
			return true;
		}
		return false;
	}

}

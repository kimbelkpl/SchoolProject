package com.java.plyd.persistence;

import java.util.*;

import com.java.plyd.service.*;

public interface ISub_categoryDOManager {
	public int Insert(Sub_category sub_category);
	public void Delete(int sub_category_id);
	public void DeleteByCategoryId(int category_id);
	public void Update(Sub_category sub_category);
	public List<Sub_category> selectAll();
	public Sub_category selectSub_category(int sub_category_id);
	public List<Sub_category> selectAllforadmin();
	public boolean hascategory(int category_id);
}

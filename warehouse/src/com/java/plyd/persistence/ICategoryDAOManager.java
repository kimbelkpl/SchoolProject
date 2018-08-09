package com.java.plyd.persistence;

import java.util.ArrayList;
import java.util.List;

import com.java.plyd.service.Category;




public interface ICategoryDAOManager {
	
	
	public void Insert(Category categoryinstance);
	public void Delete(int category_ID);
	public void Update(Category category);
	public List<Category> selectAll();
	public Category selectCategory(int category_ID);
	public List<Category> selectAllforadmin();
}

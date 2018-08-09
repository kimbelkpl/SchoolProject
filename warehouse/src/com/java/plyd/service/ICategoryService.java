package com.java.plyd.service;

import java.util.ArrayList;
import java.util.List;

public interface ICategoryService {
public void entry(Category catagoryinstance);
public void remove(int ID);
public void edit(Category categoryinstance);
public List<Category> selectAll();
public Category selectCategory(int ID);
public List<Category> selectAllforadmin();
}

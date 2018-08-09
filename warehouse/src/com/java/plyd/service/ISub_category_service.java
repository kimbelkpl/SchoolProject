package com.java.plyd.service;
import java.util.*;
public interface ISub_category_service {
	public int entry(Sub_category sub_category);
	public void remove(int sub_category_id);
	public void removesub(int category_id);
	public void edit(Sub_category sub_category);
	public List<Sub_category> selectAll();
	public Sub_category selectSub_category(int sub_category_id);
	public List<Sub_category> selectAllforadmin();
	public boolean hascategory(int category_id);
}

package com.java.plyd.service;

import java.util.List;

public interface IMerchandise_BrandService {
	
	public void entry(Merchandise_Brand item);
	public void remove(int ID);
	public void edit(Merchandise_Brand item);
	public List<Merchandise_Brand> selectAll();

}

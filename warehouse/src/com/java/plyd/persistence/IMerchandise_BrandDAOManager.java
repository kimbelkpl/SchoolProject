package com.java.plyd.persistence;

import java.util.List;

import com.java.plyd.service.Merchandise_Brand;

public interface IMerchandise_BrandDAOManager {
	
	public void Insert(Merchandise_Brand item);
	public void Delete(int ID);
	public void Update(Merchandise_Brand item);
	public List<Merchandise_Brand> selectAll();

}

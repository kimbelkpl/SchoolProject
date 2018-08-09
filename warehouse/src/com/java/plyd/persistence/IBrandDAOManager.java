package com.java.plyd.persistence;

import java.util.ArrayList;
import java.util.List;

import com.java.plyd.service.Brand;


public interface IBrandDAOManager {
	
	
	public int Insert(Brand brandinstance);
	public void Delete(int brandID);
	public void Update(Brand brandinstance);
	public List<Brand> selectAll();
	public Brand selectBrand(int brandID);
	public List<Brand> selectAllforadmin();
}

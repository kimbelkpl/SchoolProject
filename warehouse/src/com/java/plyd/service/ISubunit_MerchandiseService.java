package com.java.plyd.service;

import java.util.List;

public interface ISubunit_MerchandiseService {
	
	public void entry(Subunit_Merchandise item);
	public void remove(int ID);
	public void edit(Subunit_Merchandise item);
	public List<Subunit_Merchandise> selectAll();
	public Subunit_Merchandise selectSubunit_Subcategory(int ID);

}

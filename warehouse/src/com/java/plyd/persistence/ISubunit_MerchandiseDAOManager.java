package com.java.plyd.persistence;

import java.util.List;

import com.java.plyd.service.Subunit_Merchandise;

public interface ISubunit_MerchandiseDAOManager {
	public void Insert(Subunit_Merchandise item);
	public void Delete(int ID);
	public void Update(Subunit_Merchandise item);
	public List<Subunit_Merchandise> selectAll();
	public Subunit_Merchandise selectSubunit_Subcategory(int id);
}

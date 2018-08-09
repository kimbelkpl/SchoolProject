package com.java.plyd.persistence;

import java.util.ArrayList;
import java.util.List;

import com.java.plyd.service.Supplier;


public interface ISupplierDAOManager {
	
	public void Insert(Supplier supplierinstance);
	public void Delete(int supplier_id);
	public void Update(Supplier supplierinstance);
	public List<Supplier> selectAll();
	public List<Supplier> selectAllOn();
	public Supplier selectSupplier(int supplier_id);
}

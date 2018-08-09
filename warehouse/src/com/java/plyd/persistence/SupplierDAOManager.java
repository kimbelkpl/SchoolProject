package com.java.plyd.persistence;

import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;

import com.java.plyd.service.Supplier;


@Repository("SupplierDAOManager")
public  class SupplierDAOManager extends SqlMapClientDaoSupport implements ISupplierDAOManager  {

	
	public void Insert(Supplier supplierinstance) {
		
		
			
			try {
				 getSqlMapClientTemplate().insert("Supplier.insertSupplier", supplierinstance);
				
				
			} catch (Exception ex) {

			}
		
		
	}

	

	public void Delete(int supplier_id) {
		
		
		
		try {
			 getSqlMapClientTemplate().delete("Supplier.deleteSupplier", supplier_id);
			
			
		} catch (Exception ex) {

		}
	
	
}
public void Update(Supplier supplier) {
		
		
		
		try {
			 getSqlMapClientTemplate().update("Supplier.updateSupplier", supplier);
			
			
		} catch (Exception ex) {

		}
	
	
}

	public List<Supplier> selectAll() {
		
		
		List<Supplier> supplierlist = null;
		try {
       			return getSqlMapClientTemplate().queryForList("Supplier.selectAllSupplier");
       			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
		
	
	
}

public Supplier selectSupplier(int supplier_id) {
		
		
		
		try {
       			return (Supplier)getSqlMapClientTemplate().queryForObject("Supplier.selectSupplier",supplier_id);
       			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
		
	
	
}



@Override
public List<Supplier> selectAllOn() {
	// TODO Auto-generated method stub
	try {
			return getSqlMapClientTemplate().queryForList("Supplier.selectAllSupplierOn");
			
} catch (Exception ex) {
	ex.printStackTrace();
}
	return null;
}




}

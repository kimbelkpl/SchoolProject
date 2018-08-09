package com.java.plyd.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java.plyd.persistence.ISupplierDAOManager;
import com.java.plyd.persistence.IUserDAOManager;

@Service(value="SupplierService")
public class SupplierService implements ISupplierService{
	   @Resource(name = "SupplierDAOManager")
		private ISupplierDAOManager SupplierDAOManager;

	@Override
	public void entry(Supplier supplierinstance) {
		// TODO Auto-generated method stub
		 SupplierDAOManager.Insert(supplierinstance);
		// }
		
	}

	@Override
	public void remove(int customer_id) {
		// TODO Auto-generated method stub
		SupplierDAOManager.Delete(customer_id);
		
	}

	@Override
	public void edit(Supplier supplierrinstance) {
		// TODO Auto-generated method stub
		SupplierDAOManager.Update(supplierrinstance);
		
	}

	@Override
	public List<Supplier> selectAll() {
		// TODOcus Auto-generated method stub
		return SupplierDAOManager.selectAll();
		
	}

	@Override
	public Supplier selectSupplier(int customer_id) {
		// TODO Auto-generated method stub
		return SupplierDAOManager.selectSupplier(customer_id);
		
	}

	@Override
	public List<Supplier> selectAllOn() {
		// TODO Auto-generated method stub
		return SupplierDAOManager.selectAllOn();
	}


}

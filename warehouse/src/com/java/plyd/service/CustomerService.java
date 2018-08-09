package com.java.plyd.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java.plyd.persistence.ICustomerDAOManager;
import com.java.plyd.persistence.IUserDAOManager;

@Service(value="CustomerService")
public class CustomerService implements ICustomerService{
	   @Resource(name = "CustomerDAOManager")
		private ICustomerDAOManager CustomerDAOManager;

	@Override
	public void entry(Customer customerinstance) {
		// TODO Auto-generated method stub
		 CustomerDAOManager.Insert(customerinstance);
		// }
		
	}

	@Override
	public void remove(int customer_id) {
		// TODO Auto-generated method stub
		CustomerDAOManager.Delete(customer_id);
		
	}

	@Override
	public void edit(Customer customerinstance) {
		// TODO Auto-generated method stub
		CustomerDAOManager.Update(customerinstance);
		
	}

	@Override
	public List<Customer> selectAll() {
		// TODOcus Auto-generated method stub
		return CustomerDAOManager.selectAll();
		
	}

	@Override
	public Customer selectCustomer(int customer_id) {
		// TODO Auto-generated method stub
		return CustomerDAOManager.selectCustomer(customer_id);
		
	}

	@Override
	public List<Customer> selectAllOn() {
		// TODO Auto-generated method stub
		return CustomerDAOManager.selectAllOn();
	}

	


}

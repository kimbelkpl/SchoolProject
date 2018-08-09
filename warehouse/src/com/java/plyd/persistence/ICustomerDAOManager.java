package com.java.plyd.persistence;

import java.util.List;

import com.java.plyd.service.Customer;

public interface ICustomerDAOManager {
	
	public void Insert(Customer customerinstance);
	public void Delete(int customer_id);
	public void Update(Customer customerinstance);
	public List<Customer> selectAll();
	public List<Customer> selectAllOn();
	public Customer selectCustomer(int customer_id);
	
}

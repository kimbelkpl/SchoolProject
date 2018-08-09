package com.java.plyd.service;

import java.util.List;

public interface ICustomerService {
	public void entry(Customer customerinstance);
	public void remove(int customer_id);
	public void edit(Customer customerinstance);
	public List<Customer> selectAll();
	public List<Customer> selectAllOn();
	public Customer selectCustomer(int customer_id);

}

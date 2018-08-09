package com.java.plyd.persistence;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;
import com.java.plyd.service.Customer;
import com.java.plyd.service.User;


@Repository("CustomerDAOManager")
public class CustomerDAOManager extends SqlMapClientDaoSupport implements ICustomerDAOManager {
	public void Insert(Customer customerinstance) {

		try {
			getSqlMapClientTemplate().insert("Customer.insertCustomer",customerinstance);

		} catch (Exception ex) {

		}

	}

	public void Delete(int customer_id) {

		try {
			getSqlMapClientTemplate().delete("Customer.deleteCustomer",customer_id);

		} catch (Exception ex) {

		}

	}

	public void Update(Customer customerinstance) {

		try {
			getSqlMapClientTemplate().update("Customer.updateCustomer",customerinstance);

		} catch (Exception ex) {

		}

	}

	public List<Customer> selectAll() {

		try {
			return getSqlMapClientTemplate().queryForList(
					"Customer.selectAllCustomer");

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;

	}

	public Customer selectCustomer(int customer_id) {

		try {
			return (Customer) getSqlMapClientTemplate().queryForObject(
					"Customer.selectCustomer", customer_id);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;

	}

	@Override
	public List<Customer> selectAllOn() {
		// TODO Auto-generated method stub
		try {
			return getSqlMapClientTemplate().queryForList(
					"Customer.selectAllCustomerOn");

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}



}

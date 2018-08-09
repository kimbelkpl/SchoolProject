package com.java.plyd.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java.plyd.persistence.IWarehouseDAOManager;

@Service(value="WarehouseService")
public class WarehouseService implements IWarehouseService{
	
@Resource(name="WarehouseDAOManager")
private IWarehouseDAOManager manager;

	@Override
	public int entry(Warehouse ware) {
		// TODO Auto-generated method stub
		if (ware.getWareName() != null
				&& ware.getWareAddress() != null
				&& ware.getWarePhone() != null
				&& ware.getWareRemark() != null) {
			System.out.println("UserService is working");
			return (int)manager.Insert(ware);
			
		} else {
			System.out.println("User Name is not working");

		}
		return 1;
		
	}

	@Override
	public List<Warehouse> selectAll() {
		// TODO Auto-generated method stub
		return manager.selectAll();
	}

	@Override
	public Warehouse selectUser(int wid) {
		// TODO Auto-generated method stub
		return manager.selectWarehouse(wid);
	}

	@Override
	public void edit(Warehouse ware) {
		// TODO Auto-generated method stub
		manager.Update(ware);
	}

	@Override
	public void remove(Warehouse ware) {
		// TODO Auto-generated method stub
		//manager.Delete(wid);
		manager.Delete(ware);
	}
	
	@Override
	public int FunctionCall() {
		// TODO Auto-generated method stub
		int a=manager.FunctionCall();
		
		return a;

	}

	@Override
	public Warehouse selectwarehouse(int warehouse_id) {
		// TODO Auto-generated method stub
		return manager.selectwarehouse(warehouse_id);
	}

	/*@Override
	public void remove(int wid) {
		// TODO Auto-generated method stub
		manager.Delete(wid);
	}*/

}

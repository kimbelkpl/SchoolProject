package com.java.plyd.service;

import java.util.List;

public interface IWarehouseService {
	public int entry(Warehouse ware);
	public List<Warehouse> selectAll();
	public Warehouse selectUser(int wid);
	public void edit(Warehouse ware);
	public int FunctionCall();
	public void remove(Warehouse warehouse);
	public Warehouse selectwarehouse(int warehouse_id);
}

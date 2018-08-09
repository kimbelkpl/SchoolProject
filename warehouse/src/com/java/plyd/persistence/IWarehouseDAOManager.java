package com.java.plyd.persistence;

import java.util.List;

import com.java.plyd.service.Warehouse;

public interface IWarehouseDAOManager {
public int Insert(Warehouse ware);
public List<Warehouse> selectAll();
public Warehouse selectWarehouse(int wid);
public void Update(Warehouse ware);
public int FunctionCall();
public void Delete(Warehouse warehouse);
public Warehouse selectwarehouse(int warehouse_id);
}

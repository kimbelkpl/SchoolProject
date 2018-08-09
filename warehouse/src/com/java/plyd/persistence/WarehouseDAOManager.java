package com.java.plyd.persistence;

import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;

import com.java.plyd.service.Warehouse;
@Repository("WarehouseDAOManager")
public class WarehouseDAOManager extends SqlMapClientDaoSupport implements IWarehouseDAOManager{

	
	int success=0;
	@Override
	public int Insert(Warehouse ware) {
		// TODO Auto-generated method stub
		try {
			
			 System.out.println("WarehouseDAOManager is working");
			 success=0;
			 success=1;
			 return (int)getSqlMapClientTemplate().insert("Warehouse.insertWarehouse", ware);
			
		} catch (Exception ex) {
			
			ex.printStackTrace();
			System.out.println("WarehouseDAOManager is not working");
			success=0;

		}
		return 0;
	}

	@Override
	public List<Warehouse> selectAll() {
		// TODO Auto-generated method stub
		List<Warehouse> userlist = null;
		try {
			return getSqlMapClientTemplate().queryForList("Warehouse.selectAllWarehouse");

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;

		
	}

	@Override
	public Warehouse selectWarehouse(int wid) {
		// TODO Auto-generated method stub
		try {
			return (Warehouse) getSqlMapClientTemplate().queryForObject(
					"Warehouse.selectWarehouse", wid);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public void Update(Warehouse ware) {
		// TODO Auto-generated method stub
		try {
			 success=0;
			 success=1;
			getSqlMapClientTemplate().update("Warehouse.updateWarehouse", ware);
			

		} catch (Exception ex) {
		
			 success=0;

		}

	}

	@Override
	public void Delete(Warehouse wid) {
		// TODO Auto-generated method stub

		try {
			 success=0;
			 success=1;
			// getSqlMapClientTemplate().delete("Warehouse.deleteWarehouse", wid);
			getSqlMapClientTemplate().update("Warehouse.deleteWarehouse",wid);
			
			
		} catch (Exception ex) {
			
			 success=0;

		}

	}
	
	
	@Override
	public int FunctionCall() {
		// TODO Auto-generated method stub
		int s=success;
		
		return s;

	}

	@Override
	public Warehouse selectwarehouse(int warehouse_id) {
		// TODO Auto-generated method stub
		try {
   			return (Warehouse)getSqlMapClientTemplate().queryForObject("Warehouse.selectwarehouse",warehouse_id);
   			
	} catch (Exception ex) {
		ex.printStackTrace();
	}
		return null;
	}
 
	

}

package com.java.plyd.persistence;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;
import com.java.plyd.service.SubUnit;

@Repository("SubUnitDAOmanager")
public class SubUnitDAOmanager extends SqlMapClientDaoSupport implements ISubUnitDAOManager  {

	@Override
	public void Insert(SubUnit subunitinstance) {
		// TODO Auto-generated method stub
		try {
			 getSqlMapClientTemplate().insert("SubUnit.insertSubUnit", subunitinstance);
			
			
		} catch (Exception ex) {

		}
	}

	@Override
	public void Delete(int sID) {
		// TODO Auto-generated method stub

		try {
			 getSqlMapClientTemplate().delete("SubUnit.deleteSubUnit", sID);
			
			
		} catch (Exception ex) {

		}
	}

	@Override
	public void Update(SubUnit subunitinstance) {
		// TODO Auto-generated method stub
		try {
			 getSqlMapClientTemplate().update("SubUnit.updateSubUnit", subunitinstance);
			
			
		} catch (Exception ex) {

		}
	
	}

	@Override
	public List<SubUnit> selectAll() {
		// TODO Auto-generated method stub
		List<SubUnit> subunitlist = null;
		try {
       			return getSqlMapClientTemplate().queryForList("SubUnit.selectAllSubUnit");
       			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public SubUnit selectSubUnit(int sID) {
		// TODO Auto-generated method stub

		try {
       			return (SubUnit)getSqlMapClientTemplate().queryForObject("SubUnit.selectSubUnit",sID);
       			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public List<SubUnit> selectAllforadmin() {
		// TODO Auto-generated method stub
		List<SubUnit> subunitlist = null;
		try {
	   			return getSqlMapClientTemplate().queryForList("SubUnit.selectAllforadmin");
	   			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean hasSubunit(int BasicId) {
		// TODO Auto-generated method stub
		if(getSqlMapClientTemplate().queryForList("SubUnit.selectAllBybid",BasicId).size()>0){
			return true;
		}
		return false;
	}

	
}

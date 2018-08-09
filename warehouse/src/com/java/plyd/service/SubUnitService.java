package com.java.plyd.service;

import java.util.List;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.java.plyd.persistence.ISubUnitDAOManager;

@Service(value = "SubUnitService")
public class SubUnitService implements ISubUnitService {
	@Resource(name = "SubUnitDAOmanager")
	private ISubUnitDAOManager subunitDAOManager;
	@Override
	public void entry(SubUnit subunitinstance) {
		// TODO Auto-generated method stub
		subunitDAOManager.Insert(subunitinstance);

	}

	@Override
	public void remove(int sID) {
		// TODO Auto-generated method stub
		subunitDAOManager.Delete(sID);	
	}

	@Override
	public void edit(SubUnit subunitinstance) {
		// TODO Auto-generated method stub
		subunitDAOManager.Update(subunitinstance);
	}

	@Override
	public List<SubUnit> selectAll() {
		// TODO Auto-generated method stub
		return subunitDAOManager.selectAll();
	}

	@Override
	public SubUnit selectSubUnit(int sID) {
		// TODO Auto-generated method stub
		return subunitDAOManager.selectSubUnit(sID);
	}

	@Override
	public List<SubUnit> selectAllforadmin() {
		// TODO Auto-generated method stub
		return subunitDAOManager.selectAllforadmin();
	}

	@Override
	public boolean hasSubunit(int BasicId) {
		// TODO Auto-generated method stub
		if(subunitDAOManager.hasSubunit(BasicId)){
			return true;
		}
		return false;
	}

}

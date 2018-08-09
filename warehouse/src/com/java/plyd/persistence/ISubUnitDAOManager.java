package com.java.plyd.persistence;

import java.util.List;

import com.java.plyd.service.SubUnit;

public interface ISubUnitDAOManager {
	public void Insert(SubUnit subunitinstance);
	public void Delete(int sID);
	public void Update(SubUnit subunitinstance);
	public List<SubUnit> selectAll();
	public SubUnit selectSubUnit(int sID);
	public List<SubUnit> selectAllforadmin();
	public boolean hasSubunit(int BasicId);
}

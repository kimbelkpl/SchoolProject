package com.java.plyd.service;

import java.util.List;

public interface ISubUnitService {
	public void entry(SubUnit subunitinstance);
	public void remove(int sID);
	public void edit(SubUnit subunitinstance);
	public List<SubUnit> selectAll();
	public SubUnit selectSubUnit(int sID);
	public List<SubUnit> selectAllforadmin();
	public boolean hasSubunit(int BasicId);
}

package com.java.plyd.service;

import java.util.List;

public interface IDamageService {

	public void entry(List<Damage> item);
	public void remove(int id);
	public void edit(Damage item);
	public List<Damage> selectAll();
	public Damage selectDamage(int damage_id);
	
}

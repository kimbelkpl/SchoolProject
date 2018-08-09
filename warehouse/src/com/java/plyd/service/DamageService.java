package com.java.plyd.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.java.plyd.persistence.IDamageDAOManager;
@Service (value="DamageService")
public class DamageService implements IDamageService{

	@Resource(name ="DamageDAOManager")
	private IDamageDAOManager DamageDAOManager;
	@Override
	public void entry(List<Damage> item) {
		DamageDAOManager.Insert(item);
	}

	@Override
	public void remove(int id) {
		DamageDAOManager.Delete(id);
		
	}

	@Override
	public void edit(Damage item) {
		DamageDAOManager.Update(item);
	}

	@Override
	public List<Damage> selectAll() {
		return DamageDAOManager.selectAll();
	}

	@Override
	public Damage selectDamage(int damage_id) {
		return DamageDAOManager.selectDamage(damage_id);
	}

}

package com.java.plyd.persistence;
import java.util.List;
import com.java.plyd.service.Damage;
public interface IDamageDAOManager {

	public void Insert(List<Damage> item);
	public void Delete(int id);
	public void Update(Damage item);
	public List<Damage> selectAll();
	public Damage selectDamage(int damage_id);
}

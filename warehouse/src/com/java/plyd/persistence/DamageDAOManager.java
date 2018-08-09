package com.java.plyd.persistence;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;
import com.java.plyd.service.Damage;

@Repository("DamageDAOManager")
public class DamageDAOManager extends SqlMapClientDaoSupport implements IDamageDAOManager {

	@Override
	public void Insert(List<Damage> item) {
		try{
			for (Damage stockoutdet: item){
			getSqlMapClientTemplate().insert("Damage.insertDamage",stockoutdet);
			
			}
		}catch (Exception ex){ex.printStackTrace();}
	}

	@Override
	public void Delete(int id) {
		try{
			getSqlMapClientTemplate().delete("Damage.deleteDamage",id);
		}catch (Exception ex){
			ex.printStackTrace();
			
		}
		
	}

	@Override
	public void Update(Damage item) {
		try{
			getSqlMapClientTemplate().update("Damage.updateDamage",item);
		}catch (Exception ex){
			ex.printStackTrace();
			
		}
	}

	@Override
	public List<Damage> selectAll() {
		List<Damage> stockoutdetaillist = null;
		try {
       			return getSqlMapClientTemplate().queryForList("Damage.selectAllDamage");
       			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public Damage selectDamage(int damage_id) {
		try {
   			return (Damage)getSqlMapClientTemplate().queryForObject("Damage.selectDamage",damage_id);
   			
	} catch (Exception ex) {
		ex.printStackTrace();
	}
	return null;
	}

	

}

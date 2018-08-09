package com.java.plyd.persistence;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;

import com.java.plyd.service.Basicunit;


@Repository("BasicunitDAOManager")
public class BasicunitDAOManager extends SqlMapClientDaoSupport implements
		IBasicunitDAOManager {

	public void Insert(Basicunit instance) {

		try {
			getSqlMapClientTemplate().insert("Basicunit.insertBasicunit",
					instance);

		} catch (Exception ex) {

		}

	}

	public void Delete(int ID) {

		try {
			getSqlMapClientTemplate().delete("Basicunit.deleteBasicunit",
					ID);

		} catch (Exception ex) {

		}

	}

	public void Update(Basicunit basic) {

		try {
			getSqlMapClientTemplate().update("Basicunit.updateBasicunit",
					basic);

		} catch (Exception ex) {

		}

	}

	public List<Basicunit> selectAll() {

		List<Basicunit> basicunitlist = null;
		try {
			return getSqlMapClientTemplate().queryForList(
					"Basicunit.selectAllBasicunit");

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;

	}

	public Basicunit selectBasicunit(int ID) {

		try {
			return (Basicunit) getSqlMapClientTemplate().queryForObject(
					"Basicunit.selectBasicunit", ID);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;

	}

	@Override
	public List<Basicunit> selectAllforadmin() {
		// TODO Auto-generated method stub
		List<Basicunit> basicunitlist = null;
		try {
	   			return getSqlMapClientTemplate().queryForList("Basicunit.selectAllforadmin");
	   			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	

}

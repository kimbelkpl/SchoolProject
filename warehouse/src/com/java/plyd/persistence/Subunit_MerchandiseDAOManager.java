package com.java.plyd.persistence;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;
import com.java.plyd.service.Subunit_Merchandise;

@Repository("Subunit_MerchandiseDAOManager")
public class Subunit_MerchandiseDAOManager extends SqlMapClientDaoSupport implements ISubunit_MerchandiseDAOManager {

	@Override
	public void Insert(Subunit_Merchandise item) {
		try {
			getSqlMapClientTemplate().insert("Subunit_Merchandise.insertSubunit_Merchandise",
					item);

		} catch (Exception ex) {

		}

		
	}

	@Override
	public void Delete(int ID) {

		try {
			getSqlMapClientTemplate().update("Subunit_Merchandise.deleteSubunit_Merchandise",ID);

		} catch (Exception ex) {

		}

		
	}

	@Override
	public void Update(Subunit_Merchandise item) {
		
		try {
			getSqlMapClientTemplate().update("Subunit_Merchandise.updateSubunit_Merchandise",
					item);

		} catch (Exception ex) {

		}

		
	}

	@Override
	public List<Subunit_Merchandise> selectAll() {
		List<Subunit_Merchandise> sub_catlist = null;
		try {
			return getSqlMapClientTemplate().queryForList(
					"Subunit_Merchandise.selectAll");

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;

	}

	@Override
	public Subunit_Merchandise selectSubunit_Subcategory(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	

}

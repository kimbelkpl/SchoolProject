package com.java.plyd.persistence;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;

import com.java.plyd.service.Merchandise;
@Repository("MerchandiseDAOManager")
public class MerchandiseDAOManager extends SqlMapClientDaoSupport implements IMerchandiseDAOManager {

	@Override
	public int entry(Merchandise stu) {
		// TODO Auto-generated method stub
		try{
			return (int) getSqlMapClientTemplate().insert("Merchandise.insertMerchandise",stu);
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return 0;
	}

	@Override
	public void update(Merchandise stu) {
		// TODO Auto-generated method stub
		try{
			getSqlMapClientTemplate().update("Merchandise.updateMerchandise",stu);
	}
	catch(Exception ex){
		ex.printStackTrace();
	}
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		try{
			getSqlMapClientTemplate().delete("Merchandise.deleteMerchandise",id);
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		
	}

	@Override
	public List<Merchandise> selectAll() {
		// TODO Auto-generated method stub
		try{
			return getSqlMapClientTemplate().queryForList("Merchandise.selectAll");
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public Merchandise selectMerchandise(int id) {
		// TODO Auto-generated method stub
		try{
			return (Merchandise)getSqlMapClientTemplate().queryForObject("Merchandise.selectMerchandise", id);
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}

}
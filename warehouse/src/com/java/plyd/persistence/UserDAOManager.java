package com.java.plyd.persistence;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;

import com.java.plyd.service.Basicunit;
import com.java.plyd.service.User;


@Repository("UserDAOManager")
public class UserDAOManager extends SqlMapClientDaoSupport implements
		IUserDAOManager {

	public void Insert(User instance) {

		try {
			getSqlMapClientTemplate().insert("User.insertUser",
					instance);

		} catch (Exception ex) {

		}

	}

	public void Delete(int ID) {

		try {
			getSqlMapClientTemplate().delete("User.deleteUser",
					ID);

		} catch (Exception ex) {

		}

	}

	public void Update(User instance) {

		try {
			getSqlMapClientTemplate().update("User.updateUser",
					instance);

		} catch (Exception ex) {

		}

	}

	public List<User> selectAll() {

		try {
			return getSqlMapClientTemplate().queryForList(
					"User.selectAllUser");

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;

	}

	public User selectUser(int ID) {

		try {
			return (User) getSqlMapClientTemplate().queryForObject(
					"User.selectUser", ID);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;

	}

	@Override
	public boolean hasuserlevel(int ID) {
		// TODO Auto-generated method stub
		if(getSqlMapClientTemplate().queryForList("User.selectAllByulid",ID).size()>0){
			return true;
		}
		return false;
	}

	@Override
	public void UpdatePassword(User instance) {
		// TODO Auto-generated method stub
		try {
			getSqlMapClientTemplate().update("User.changePassword",
					instance);

		} catch (Exception ex) {

		}

		
	}

	

}

package com.java.plyd.persistence;
import java.util.*;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;
import com.java.plyd.service.*;

@Repository(value="User_LevelDAOManager")
public class User_LevelDAOManager extends SqlMapClientDaoSupport implements IUser_LevelDAOManager{

	@Override
	public void insert(User_Level user_level) {
		// TODO Auto-generated method stub
		try{
			getSqlMapClientTemplate().insert("User_Level.insertUser_Level",user_level);
		}catch(Exception ex){
			
		}
	}

	@Override
	public void delete(int user_level_id) {
		// TODO Auto-generated method stub
		try{
			getSqlMapClientTemplate().delete("User_Level.deleteUser_Level",user_level_id);
		}catch(Exception ex){
			
		}
	}

	@Override
	public void update(User_Level user_level) {
		// TODO Auto-generated method stub
		try{
			getSqlMapClientTemplate().update("User_Level.updateUser_Level",user_level);
		}catch(Exception ex){
			
		}
	}

	@Override
	public List<User_Level> selectAll() {
		// TODO Auto-generated method stub
		try{
			return (List<User_Level>)getSqlMapClientTemplate().queryForList("User_Level.selectAll");
		}catch(Exception ex){
			
		}
		return null;
	}

	@Override
	public User_Level selectUser_Level(int user_level_id) {
		// TODO Auto-generated method stub
		try{
			return (User_Level)getSqlMapClientTemplate().queryForObject("User_Level.selectUser_Level",user_level_id);
		}catch(Exception ex){
			
		}
		return null;
	}

	@Override
	public List<User_Level> selectAllforadmin() {
		// TODO Auto-generated method stub
		try{
			return (List<User_Level>)getSqlMapClientTemplate().queryForList("User_Level.selectAllforadmin");
		}catch(Exception ex){
			
		}
		return null;
	}

}

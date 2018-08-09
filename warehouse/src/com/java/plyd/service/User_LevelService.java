package com.java.plyd.service;
import java.util.*;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.java.plyd.persistence.*;
import com.java.plyd.service.*;

@Service(value="User_LevelService")
public class User_LevelService implements IUser_LevelService{
	
	@Resource(name = "User_LevelDAOManager")
	private IUser_LevelDAOManager user_levelDAOManager;
	@Override
	public void entry(User_Level user_level) {
		// TODO Auto-generated method stub
		user_levelDAOManager.insert(user_level);
	}

	@Override
	public void remove(int user_level_id) {
		// TODO Auto-generated method stub
		user_levelDAOManager.delete(user_level_id);
	}

	@Override
	public void edit(User_Level user_level) {
		// TODO Auto-generated method stub
		user_levelDAOManager.update(user_level);
	}

	@Override
	public List<User_Level> selectAll() {
		// TODO Auto-generated method stub
		return user_levelDAOManager.selectAll();
	}

	@Override
	public User_Level selectUser_Level(int user_level_id) {
		// TODO Auto-generated method stub
		return user_levelDAOManager.selectUser_Level(user_level_id);
	}

	@Override
	public List<User_Level> selectAllforadmin() {
		// TODO Auto-generated method stub
		return user_levelDAOManager.selectAllforadmin();
	}

}

package com.java.plyd.persistence;

import java.util.List;

import com.java.plyd.service.User_Level;

public interface IUser_LevelDAOManager {
	public void insert(User_Level user_level);
	public void delete(int user_level_id);
	//public void removesub(int category_id);
	public void update(User_Level user_level);
	public List<User_Level> selectAll();
	public User_Level selectUser_Level(int user_level_id);
	public List<User_Level> selectAllforadmin();
}

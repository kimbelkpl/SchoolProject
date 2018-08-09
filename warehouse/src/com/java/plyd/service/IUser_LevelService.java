package com.java.plyd.service;

import java.util.List;

public interface IUser_LevelService {
	public void entry(User_Level user_level);
	public void remove(int user_level_id);
	//public void removesub(int category_id);
	public void edit(User_Level user_level);
	public List<User_Level> selectAll();
	public User_Level selectUser_Level(int user_level_id);
	public List<User_Level> selectAllforadmin();
}

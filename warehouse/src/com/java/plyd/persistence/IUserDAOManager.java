package com.java.plyd.persistence;

import java.util.ArrayList;
import java.util.List;

import com.java.plyd.service.User;



public interface IUserDAOManager {
	
	
	public void Insert(User instance);
	public void Delete(int ID);
	public void Update(User instance);
	public List<User> selectAll();
	public User selectUser(int ID);
	public boolean hasuserlevel(int ID);
	public void UpdatePassword(User instance);
}

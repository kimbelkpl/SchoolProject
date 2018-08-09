package com.java.plyd.service;

import java.util.ArrayList;
import java.util.List;

public interface IUserService {
public void entry(User instance);
public void remove(int ID);
public void edit(User instance);
public void editPassword(User instance);
public List<User> selectAll();
public User selectUser(int ID);
public boolean hasuserlevel(int ID);
}

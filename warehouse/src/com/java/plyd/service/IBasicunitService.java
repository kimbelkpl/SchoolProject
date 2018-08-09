package com.java.plyd.service;

import java.util.ArrayList;
import java.util.List;

public interface IBasicunitService {
public void entry(Basicunit instance);
public void remove(int ID);
public void edit(Basicunit instance);
public List<Basicunit> selectAll();
public Basicunit selectBasicunit(int ID);
public List<Basicunit> selectAllforadmin();
}

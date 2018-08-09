package com.java.plyd.service;

import java.util.ArrayList;
import java.util.List;

public interface IBrandService {

public int entry(Brand brandinstance);
public void remove(int brandID);
public void edit(Brand brandinstance);
public List<Brand> selectAll();
public Brand selectBrand(int brandID);
public List<Brand> selectAllforadmin();
}

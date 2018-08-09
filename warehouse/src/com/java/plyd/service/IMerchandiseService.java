package com.java.plyd.service;

import java.util.List;

public interface IMerchandiseService {
	public int insert(Merchandise stu);
	public void update(Merchandise stu);
	public void delete(int id);
	public List<Merchandise> selectAll();
	public Merchandise selectMerchandise(int id);


}

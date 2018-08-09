package com.java.plyd.persistence;

import java.util.List;

import com.java.plyd.service.Merchandise;

public interface IMerchandiseDAOManager {
	public int entry(Merchandise stu);
	public void update(Merchandise stu);
	public void delete(int id);
	public List<Merchandise> selectAll();
	public Merchandise selectMerchandise(int id);

}

package com.java.plyd.persistence;

import java.util.ArrayList;
import java.util.List;

import com.java.plyd.service.Basicunit;



public interface IBasicunitDAOManager {
	
	
	public void Insert(Basicunit basicunitinstance);
	public void Delete(int ID);
	public void Update(Basicunit basicunitinstance);
	public List<Basicunit> selectAll();
	public Basicunit selectBasicunit(int ID);
	public List<Basicunit> selectAllforadmin();

}

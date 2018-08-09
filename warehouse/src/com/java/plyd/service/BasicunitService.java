package com.java.plyd.service;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.java.plyd.persistence.IBasicunitDAOManager;


@Service(value = "BasicunitService")
public class BasicunitService implements IBasicunitService {

	@Resource(name = "BasicunitDAOManager")
	private IBasicunitDAOManager basicDAOManager;

	public void entry(Basicunit instance) {

		// if(userinstance.getName()!=null ) {
		basicDAOManager.Insert(instance);
		// }
		// else {
		// return 2;
		// }

	}

	public void remove(int ID) {
		basicDAOManager.Delete(ID);
	}

	@Override
	public void edit(Basicunit instance) {
		basicDAOManager.Update(instance);
	}

	@Override
	public List<Basicunit> selectAll() {
		// TODO Auto-generated method stub
		return basicDAOManager.selectAll();
	}


	@Override
	public Basicunit selectBasicunit(int ID) {
		return basicDAOManager.selectBasicunit(ID);
	}

	@Override
	public List<Basicunit> selectAllforadmin() {
		// TODO Auto-generated method stub
		return basicDAOManager.selectAllforadmin();
	}
	
}

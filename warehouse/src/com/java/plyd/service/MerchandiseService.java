package com.java.plyd.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java.plyd.persistence.IMerchandiseDAOManager;
@Service(value="MerchandiseService")
public class MerchandiseService implements IMerchandiseService {
@Resource(name="MerchandiseDAOManager")

private IMerchandiseDAOManager manager;
	@Override
	public int insert(Merchandise stu) {
		// TODO Auto-generated method stub
	return manager.entry(stu);
		
	}

	@Override
	public void update(Merchandise stu) {
		// TODO Auto-generated method stub
		manager.update(stu);
		
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		manager.delete(id);
	}

	@Override
	public List<Merchandise> selectAll() {
		// TODO Auto-generated method stub
		return manager.selectAll();
	}

	@Override
	public Merchandise selectMerchandise(int id) {
		// TODO Auto-generated method stub
		return manager.selectMerchandise(id);
	}

}

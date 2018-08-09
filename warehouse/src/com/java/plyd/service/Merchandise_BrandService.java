package com.java.plyd.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java.plyd.persistence.IMerchandise_BrandDAOManager;

import javax.annotation.Resource;

@Service(value = "Merchandise_BrandService")
public class Merchandise_BrandService implements IMerchandise_BrandService{

	@Resource(name = "Merchandise_BrandDAOManager")
	private IMerchandise_BrandDAOManager Merchandise_BrandDAOManager;
	@Override
	public void entry(Merchandise_Brand item) {
		Merchandise_BrandDAOManager.Insert(item);
		
	}

	@Override
	public void remove(int ID) {
		Merchandise_BrandDAOManager.Delete(ID);
		
	}

	@Override
	public void edit(Merchandise_Brand item) {
		Merchandise_BrandDAOManager.Update(item);
		
	}

	@Override
	public List<Merchandise_Brand> selectAll() {
		return Merchandise_BrandDAOManager.selectAll();
	}

}

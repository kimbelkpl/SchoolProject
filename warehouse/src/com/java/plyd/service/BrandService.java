package com.java.plyd.service;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.java.plyd.persistence.IBrandDAOManager;


@Service(value = "BrandService")
public class BrandService implements IBrandService {

	@Resource(name = "BrandDAOManager")
	private IBrandDAOManager brandDAOManager;

	public int entry(Brand brandinstance) {

		// if(userinstance.getName()!=null ) {
		return (int)brandDAOManager.Insert(brandinstance);
		// }
		// else {
		// return 2;
		// }

	}
	@Override
	public void remove(int uID) {
		brandDAOManager.Delete(uID);
	}

	@Override
	public void edit(Brand brand) {
		brandDAOManager.Update(brand);
	}

	@Override
	public List<Brand> selectAll() {
		// TODO Auto-generated method stub
		return brandDAOManager.selectAll();
	}

	@Override
	public Brand selectBrand(int brandID) {
		// TODO Auto-generated method stub
		return brandDAOManager.selectBrand(brandID);
	}
	public List<Brand> selectAllforadmin() {
		// TODO Auto-generated method stub
		return brandDAOManager.selectAllforadmin();
	
	}
	

	

	
}

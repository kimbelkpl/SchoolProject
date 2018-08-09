package com.java.plyd.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.java.plyd.persistence.ISubunit_MerchandiseDAOManager;

@Service(value = "Subunit_MerchandiseService")
public class Subunit_MerchandiseService implements ISubunit_MerchandiseService{

	@Resource(name = "Subunit_MerchandiseDAOManager")
	private ISubunit_MerchandiseDAOManager Subunit_MerchandiseDAOManager;

	@Override
	public void entry(Subunit_Merchandise item) {
		Subunit_MerchandiseDAOManager.Insert(item);
		
	}

	@Override
	public void remove(int ID) {
		Subunit_MerchandiseDAOManager.Delete(ID);
		
	}

	@Override
	public void edit(Subunit_Merchandise item) {
		Subunit_MerchandiseDAOManager.Update(item);
		
	}

	@Override
	public List<Subunit_Merchandise> selectAll() {
		return Subunit_MerchandiseDAOManager.selectAll();
	}

	@Override
	public Subunit_Merchandise selectSubunit_Subcategory(int ID) {
		return Subunit_MerchandiseDAOManager.selectSubunit_Subcategory(ID);
	}
	
}

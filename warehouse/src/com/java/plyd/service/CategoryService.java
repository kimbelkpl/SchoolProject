package com.java.plyd.service;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.java.plyd.persistence.ICategoryDAOManager;


@Service(value = "CategoryService")
public class CategoryService implements ICategoryService {

	@Resource(name = "CategoryDAOManager")
	private ICategoryDAOManager categoryDAOManager;

	public void entry(Category categoryinstance) {

		// if(userinstance.getName()!=null ) {
		categoryDAOManager.Insert(categoryinstance);
		// }
		// else {
		// return 2;
		// }

	}

	@Override
	public void remove(int ID) {
		categoryDAOManager.Delete(ID);
	}

	@Override
	public void edit(Category category) {
		categoryDAOManager.Update(category);
	}

	@Override
	public List<Category> selectAll() {
		// TODO Auto-generated method stub
		return categoryDAOManager.selectAll();
	}


	@Override
	public Category selectCategory(int ID) {
		return categoryDAOManager.selectCategory(ID);
	}

	@Override
	public List<Category> selectAllforadmin() {
		// TODO Auto-generated method stub
		return categoryDAOManager.selectAllforadmin();
	}

}

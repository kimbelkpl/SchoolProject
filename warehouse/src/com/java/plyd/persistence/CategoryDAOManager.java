package com.java.plyd.persistence;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;

import com.java.plyd.service.Category;

@Repository("CategoryDAOManager")
public class CategoryDAOManager extends SqlMapClientDaoSupport implements
		ICategoryDAOManager {

	public void Insert(Category categoryinstance) {

		try {
			getSqlMapClientTemplate().insert("Category.insertCategory",
					categoryinstance);

		} catch (Exception ex) {

		}

	}

	public void Delete(int category_ID) {

		try {
			getSqlMapClientTemplate().delete("Category.deleteCategory",
					category_ID);

		} catch (Exception ex) {

		}

	}

	public void Update(Category category) {

		try {
			getSqlMapClientTemplate().update("Category.updateCategory",
					category);

		} catch (Exception ex) {

		}

	}

	public List<Category> selectAll() {

		List<Category> catagorylist = null;
		try {
			return getSqlMapClientTemplate().queryForList(
					"Category.selectAllCategory");

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;

	}

	public Category selectCategory(int ID) {

		try {
			return (Category) getSqlMapClientTemplate().queryForObject(
					"Category.selectCategory", ID);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;

	}

	@Override
	public List<Category> selectAllforadmin() {
		List<Category> catagorylist = null;
		try {
			return getSqlMapClientTemplate().queryForList(
					"Category.selectAllCategoryforadmin");

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;

	}

	
}

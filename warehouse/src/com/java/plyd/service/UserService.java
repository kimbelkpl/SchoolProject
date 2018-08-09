package com.java.plyd.service;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.java.plyd.persistence.IUserDAOManager;


@Service(value = "UserService")
public class UserService implements IUserService {

	@Resource(name = "UserDAOManager")
	private IUserDAOManager userDAOManager;

	public void entry(User instance) {

		// if(userinstance.getName()!=null ) {
		userDAOManager.Insert(instance);
		// }
		// else {
		// return 2;
		// }

	}

	@Override
	public void remove(int ID) {
		userDAOManager.Delete(ID);
	}

	@Override
	public void edit(User instance) {
		userDAOManager.Update(instance);
	}

	@Override
	public List<User> selectAll() {
		// TODO Auto-generated method stub
		return userDAOManager.selectAll();
	}


	@Override
	public User selectUser(int ID) {
		return userDAOManager.selectUser(ID);
	}

	@Override
	public boolean hasuserlevel(int ID) {
		// TODO Auto-generated method stub
		if(userDAOManager.hasuserlevel(ID)){
			return true;
		}
		return false;
	}

	@Override
	public void editPassword(User instance) {
		// TODO Auto-generated method stub
		userDAOManager.UpdatePassword(instance);
	}

}

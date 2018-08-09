package com.java.plyd.ui;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.plyd.service.CryptWithSHA;
import com.java.plyd.service.ICategoryService;
import com.java.plyd.service.ISub_category_service;
import com.java.plyd.service.IUserService;
import com.java.plyd.service.IUser_LevelService;
import com.java.plyd.service.SpringBeanFactory;
import com.java.plyd.service.Category;
import com.java.plyd.service.Sub_category;
import com.java.plyd.service.User;
import com.java.plyd.service.UserService;
import com.java.plyd.service.User_Level;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		IUserService userservice = (IUserService) SpringBeanFactory
				.getBean("UserService");
		IUser_LevelService user_level_service = (IUser_LevelService) SpringBeanFactory
				.getBean("User_LevelService");
		HttpSession session = request.getSession();
		

		String page = null;
		String param = request.getParameter("page");
		// String param="login";
		System.out.println(param + "Page");
		String ex="";
		String name="";
		if (param.equals("user")){
			List<User_Level> ulevellist = user_level_service.selectAll();
			request.setAttribute("ulevellist", ulevellist);
			page="/presentation/user.jsp";
		}else
		if (param.equals("userProfile")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			page = "/presentation/profile.jsp";

		}if (param.equals("logout")){
			page="/index.html";
		}else
		if (param.equals("Add")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			User user = new User();
			user.setName(request.getParameter("txtName"));
			String pass=request.getParameter("txtPassword");
			Date date=new Date();
			CryptWithSHA cry1=new CryptWithSHA();
			try {
				pass=cry1.cryptWithSHA(pass,"add",date);
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			user.setPassword(pass);
			user.setUser_level_id(Integer.parseInt(request
					.getParameter("cboUserlevel")));
			user.setCreated_user_id(uid);
			user.setModified_user_id(uid);
			user.setFlag(1);
			int i=0;
			List<User> ul = userservice.selectAll();
			for (User u: ul) {
				System.out.println("\n\n");
				System.out.println((u.getName()).toUpperCase()+" and "+request.getParameter("txtName").toUpperCase());
				
				if ((request.getParameter("txtName").toUpperCase()).equals((u.getName().toUpperCase()))) {
					i=1;
					break;
				}

				else {
					i=0;
				}
				
			}
			if(i==1){
				ex="1";
				name=request.getParameter("txtName");
			}else{
				ex="2";
				userservice.entry(user);
			}
			
			//for level post back to page
			User_Level ulv=user_level_service.selectUser_Level(user.getUser_level_id());
			//end for level post back to page
			
			request.setAttribute("txtName", request.getParameter("txtName"));
			request.setAttribute("txtPassword", request.getParameter("txtPassword"));
			request.setAttribute("cboUserlevel", ulv.getName());
			//for alerting exist or not
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not
			List<User_Level> ulevellist = user_level_service.selectAll();
			request.setAttribute("ulevellist", ulevellist);
			page = "/presentation/user.jsp";
		} else if (param.equals("Edit")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			//to check name is exist or not
			//int i=0;
			//end of check name is exist or not
			
			// ending current user
			User user = new User();
			System.out.print(request.getParameter("txtId"));
			user.setUser_id(Integer.parseInt(request.getParameter("txtId")));
			user.setName(request.getParameter("txtName"));
			user.setUser_level_id(Integer.parseInt(request.getParameter("cbouserlevel")));
			user.setModified_user_id(uid);
			user.setFlag(Integer.parseInt(request.getParameter("txtFlag")));
			List<User> ul = userservice.selectAll();
			//if(i==0){
				//ex="8";
			 userservice.edit(user);
			//}else{
				//ex="7";
				//name=request.getParameter("txtName");
			//}
			
			//request.setAttribute("txtName", request.getParameter("txtName"));
			//request.setAttribute("cboUserlevel", request.getParameter("txtUserLevel"));
			//request.setAttribute("txtFlag", request.getParameter("txtFlag"));
			
			//for alerting exist or not
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			request.setAttribute("confirmId", user.getUser_id());
			//end for alerting exist or not
			List<User_Level> ulevellist = user_level_service.selectAll();
			request.setAttribute("ulevellist", ulevellist);
			page = "/presentation/user.jsp";

		}
		else if(param.equals("ChangePassword")){
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			String cp=request.getParameter("txtPassword");
			String np=request.getParameter("txtNewPassword");
			User user=userservice.selectUser(uid);
			try {
				cp=CryptWithSHA.cryptWithSHA(cp,"login",user.getCreated_date());
				np=CryptWithSHA.cryptWithSHA(np,"login",user.getCreated_date());
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			User u=userservice.selectUser(uid);
			if(u.getPassword().equals(cp)){
				u.setPassword(np);
				System.out.print(u.getPassword());
				userservice.editPassword(u);
				page="/index.html";
			}else{ 
				ex="3";
				page="/presentation/profile.jsp";
				request.setAttribute("exist", ex);
			}
			
		}
		else if (param.equals("remove")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			int id = Integer.parseInt(request.getParameter("id"));
			userservice.remove(id);
			// user_level_service.removesub(id);
			User u = userservice.selectUser(uid);

			// to check current user is admin?
			if (u.getUser_level_id() == 1) {
				List<User_Level> ulevellist = user_level_service.selectAll();
				request.setAttribute("ulevellist", ulevellist);
				page = "/presentation/user.jsp";
			} 
			else{
				page = "/presentation/index.jsp";
			}
			// sending current user's id and name
			session.setAttribute("uname", uname);
			session.setAttribute("uid", uid);
			// ending current user's id and name
			page = "/presentation/user.jsp";

		}

		else if (param.equals("UserEditform")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			int userid = Integer.parseInt(request.getParameter("id"));
			User user = (User) userservice.selectUser(userid);
			// to add combobox in useredit form
			List<User_Level> ulevelList = user_level_service.selectAll();
			request.setAttribute("ulevellist", ulevelList);
			request.setAttribute("user", user);
			page = "/presentation/userEdit.jsp";

		} else if (param.equals("userform")) {
		
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			// ending current user
			User u = userservice.selectUser(uid);

			// to check current user is admin?
			if (u.getUser_level_id() == 1) {
				List<User_Level> ulevellist = user_level_service.selectAll();
				request.setAttribute("ulevellist", ulevellist);
				page = "/presentation/user.jsp";
			} 
			else{
				page = "/presentation/start.jsp";
			}
			// sending current user's id and name
			session.setAttribute("uname", uname);
			session.setAttribute("uid", uid);
			// ending current user's id and name
		} else if (param.equals("login")) {
			int id = 0;
			String error="";
			// getting current user's name and password
			String uname = request.getParameter("un");
			String pass = request.getParameter("pw");
			// end
			List<User> userlist = userservice.selectAll();
			for (User u : userlist) {
				if (u.getName().equals(uname) && u.getFlag()==1) {
					id = u.getUser_id();
					User user=userservice.selectUser(id);
					// to check username and password is in user table
					try {
						pass=CryptWithSHA.cryptWithSHA(pass,"login",user.getCreated_date());
						System.out.print(pass);
					} catch (NoSuchAlgorithmException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					if(u.getPassword().equals(pass)){
						page = "/presentation/start.jsp";
					}else {
						error="Password is Incorrect";
						page = "/presentation/invalid.jsp";
					}
					break;
				}else{
					error="Username is Incorrect";
					page = "/presentation/invalid.jsp";
				}

			}
			// passing current user's name and id
			session.setAttribute("uname", uname);
			session.setAttribute("uid", id);
			
			// end
			// if current user is not admin ,go to login form
			if (id == 0){
				error="Username or Password is Incorrect";
				page = "/presentation/invalid.jsp";
			}
			request.setAttribute("username", request.getParameter("un"));
			request.setAttribute("password", request.getParameter("pw"));
			request.setAttribute("error", error);
		}
		getServletContext().getRequestDispatcher(page).forward(request,
				response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.java.plyd.ui;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.plyd.service.Category;
import com.java.plyd.service.IUserService;
import com.java.plyd.service.IUser_LevelService;
import com.java.plyd.service.SpringBeanFactory;
import com.java.plyd.service.UserService;
import com.java.plyd.service.User_Level;
import com.java.plyd.service.User_LevelService;

/**
 * Servlet implementation class User_LevelController
 */
@WebServlet("/User_LevelController")
public class User_LevelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_LevelController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		IUser_LevelService user_levelservice=(IUser_LevelService)SpringBeanFactory.getBean("User_LevelService");
		IUserService userservice=(IUserService)SpringBeanFactory.getBean("UserService");
		String page = null;
		String param = request.getParameter("page");
		System.out.println(param + "Page");
		String ex="0";
		String name="";
		String confirmId="";
	 if (param.equals("Edit")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			User_Level ca = new User_Level();
			ca.setUser_level_id((Integer.parseInt(request.getParameter("txtId"))));
			ca.setName(request.getParameter("txtName"));
			ca.setRemark(request.getParameter("txtRemark"));
			ca.setModified_user_id(uid);
			ca.setFlag(Integer.parseInt(request.getParameter("txtFlag")));
			int id = ca.getUser_level_id();
			int flag=ca.getFlag();
			boolean has =userservice.hasuserlevel(id) ;
			if(flag==0&&has==true){
				ex="5";
				name=ca.getName();
			}else{
				ex="6";
			}
			request.setAttribute("txtName", request.getParameter("txtName"));
			request.setAttribute("txtRemark", request.getParameter("txtRemark"));
			request.setAttribute("txtFlag", request.getParameter("txtFlag"));
			//for alerting exist or not
			request.setAttribute("confirmId", ca.getUser_level_id());
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not
			page = "/presentation/userlevel.jsp";
		} else if(param.equals("sureEdit")){
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			User_Level ca = new User_Level();
			ca.setUser_level_id(Integer.parseInt(request.getParameter("txtId")));
			ca.setName(request.getParameter("txtName"));
			ca.setRemark(request.getParameter("txtRemark"));
			ca.setModified_user_id(uid);
			ca.setFlag(Integer.parseInt(request.getParameter("txtFlag")));
			user_levelservice.edit(ca);
			//for alerting exist or not
			request.setAttribute("confirmId", confirmId);
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not
			page = "/presentation/userlevel.jsp";
		}
		else if (param.equals("remove")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			
			int id = Integer.parseInt(request.getParameter("ulid"));
			User_Level ul=user_levelservice.selectUser_Level(id);
			boolean has=userservice.hasuserlevel(id);
			System.out.println(has+"has");
			if(userservice.hasuserlevel(id)){
				name=ul.getName();
				ex="2";
			}
			else{
				confirmId=request.getParameter("ulid");
				ex="3";
			}
			//for alerting exist or not
			request.setAttribute("confirmId", confirmId);
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not
			page = "/presentation/userlevel.jsp";
		}
		else if (param.equals("Add")) {
			//getting current user's name and id
			String uname=(String)session.getAttribute("uname");
			int uid = (Integer)(session.getAttribute("uid"));
			session.setAttribute("uid",uid);
			session.setAttribute("uname", uname);
			//End passing current user
			User_Level ul = new User_Level();
			String ulname=request.getParameter("txtName");
			ul.setName(ulname);
			ul.setRemark(request.getParameter("txtRemark"));
			ul.setCreated_user_id(uid);
			ul.setModified_user_id(uid);
			ul.setFlag(1);
			int i=0;
			List<User_Level> ul1 = user_levelservice.selectAllforadmin();
			for (User_Level c2: ul1) {
				System.out.println("\n\n");
				System.out.println((c2.getName()).toUpperCase()+" and "+ulname.toUpperCase());
				
				if ((ulname.toUpperCase()).equals((c2.getName().toUpperCase()))) {
						      i=1;
					break;
				}

				else {
					i=0;
				}
				
			}
			if(i==1){
				ex="1";
				name=ulname;
			}else{
				ex="4";
				user_levelservice.entry(ul);
			}
			request.setAttribute("txtName", request.getParameter("txtName"));
			request.setAttribute("txtRemark", request.getParameter("txtRemark"));
			
			//for alerting exist or not
			request.setAttribute("confirmId", confirmId);
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not
			page = "/presentation/userlevel.jsp";
		}else if (param.equals("AddFromUserAdd")) {
			//getting current user's name and id
			String uname=(String)session.getAttribute("uname");
			int uid = (Integer)(session.getAttribute("uid"));
			session.setAttribute("uid",uid);
			session.setAttribute("uname", uname);
			//End passing current user
			User_Level ul = new User_Level();
			String ulname=request.getParameter("txtUserLevel1");
			ul.setName(ulname);
			ul.setRemark(request.getParameter("txtRemark1"));
			ul.setCreated_user_id(uid);
			ul.setModified_user_id(uid);
			ul.setFlag(1);
			int i=0;
			List<User_Level> ul1 = user_levelservice.selectAllforadmin();
			for (User_Level c2: ul1) {
				System.out.println("\n\n");
				System.out.println((c2.getName()).toUpperCase()+" and "+ulname.toUpperCase());
				
				if ((ulname.toUpperCase()).equals((c2.getName().toUpperCase()))) {
						      i=1;
					break;
				}

				else {
					i=0;
				}
				
			}
			if(i==1){
				ex="3";
				name=ulname;
			}else{
				ex="4";
				user_levelservice.entry(ul);
			}
			request.setAttribute("txtName", request.getParameter("txtName"));
			request.setAttribute("cboUserlevel", request.getParameter("txtUserLevel"));
			request.setAttribute("txtPassword", request.getParameter("txtPassword1"));
			request.setAttribute("txtPassword2", request.getParameter("txtPassword2"));
			request.setAttribute("txtUserLevel1", request.getParameter("txtUserLevel1"));
			request.setAttribute("txtRemark1", request.getParameter("txtRemark1"));
			//for alerting exist or not
			request.setAttribute("confirmId", confirmId);
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not
			page = "/presentation/user.jsp";
		}else if (param.equals("AddFromUserEdit")) {
			//getting current user's name and id
			String uname=(String)session.getAttribute("uname");
			int uid = (Integer)(session.getAttribute("uid"));
			session.setAttribute("uid",uid);
			session.setAttribute("uname", uname);
			//End passing current user
			User_Level ul = new User_Level();
			String ulname=request.getParameter("txtUserLevel1");
			ul.setName(ulname);
			ul.setRemark(request.getParameter("txtRemark1"));
			ul.setCreated_user_id(uid);
			ul.setModified_user_id(uid);
			ul.setFlag(1);
			int i=0;
			List<User_Level> ul1 = user_levelservice.selectAllforadmin();
			for (User_Level c2: ul1) {
				System.out.println("\n\n");
				System.out.println((c2.getName()).toUpperCase()+" and "+ulname.toUpperCase());
				
				if ((ulname.toUpperCase()).equals((c2.getName().toUpperCase()))) {
						      i=1;
					break;
				}

				else {
					i=0;
				}
				
			}
			if(i==1){
				ex="5";
				name=ulname;
			}else{
				ex="6";
				user_levelservice.entry(ul);
			}
			request.setAttribute("txtName", request.getParameter("txtName"));
			request.setAttribute("cboUserlevel", request.getParameter("txtUserLevel"));
			request.setAttribute("txtFlag", request.getParameter("txtFlag"));
			request.setAttribute("txtUserLevel1", request.getParameter("txtUserLevel1"));
			request.setAttribute("txtRemark1", request.getParameter("txtRemark1"));
			//for alerting exist or not
			request.setAttribute("confirmId", request.getParameter("txtId"));
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not
			page = "/presentation/user.jsp";
		}
		else if (param.equals("userlevel")) {
			//getting current user's name and id
			String uname=(String)session.getAttribute("uname");
			int uid = (Integer)(session.getAttribute("uid"));
			session.setAttribute("uid",uid);
			session.setAttribute("uname", uname);
			//End passing current use
			//for alerting exist or not
			request.setAttribute("confirmId", confirmId);
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not
			page = "/presentation/userlevel.jsp";
		 }else if(param.equals("sureRemove")){
				// passing current user
				String uname = (String) session.getAttribute("uname");
				int uid = (Integer) (session.getAttribute("uid"));
				session.setAttribute("uid", uid);
				session.setAttribute("uname", uname);
				// ending current user
				int id=Integer.parseInt(request.getParameter("id"));
				user_levelservice.remove(id);
				//for alerting exist or not
				request.setAttribute("confirmId", confirmId);
				request.setAttribute("exist", ex);
				request.setAttribute("name", name);
				//end for alerting exist or not
				page = "/presentation/userlevel.jsp";
				
			}
		
		getServletContext().getRequestDispatcher(page).forward(request,
				response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}

}

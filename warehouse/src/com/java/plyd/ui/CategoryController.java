
package com.java.plyd.ui;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.plyd.service.ICategoryService;
import com.java.plyd.service.ISub_category_service;
import com.java.plyd.service.SpringBeanFactory;
import com.java.plyd.service.Category;

/**
 * Servlet implementation class CategoryController
 */
@WebServlet("/CategoryController")
public class CategoryController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CategoryController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		// TODO Auto-generated method stub
		ICategoryService categoryService = (ICategoryService) SpringBeanFactory
				.getBean("CategoryService");
		ISub_category_service sub_category_service = (ISub_category_service) SpringBeanFactory
				.getBean("Sub_category_service");

		String page = null;
		String param = request.getParameter("page");
		// String param="login";
		System.out.println(param + "Page");
		String ex="0";
		String name="";
		String confirmId="0";
		if (param.equals("Cancel")) {
			page = "/presentation/category.jsp";
			getServletContext().getRequestDispatcher(page).forward(request,
					response);
		}
		else if (param.equals("Add")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			Category c = new Category();
			String cname = request.getParameter("txtName");
			c.setName(cname);
			c.setRemark(request.getParameter("txtRemark"));
			c.setCreated_user_id(uid);
			c.setModified_user_id(uid);
			c.setFlag(1);
			int i=0;
			List<Category> cl = categoryService.selectAllforadmin();
			for (Category c2: cl) {
				System.out.println("\n\n");
				System.out.println((c2.getName()).toUpperCase()+" and "+cname.toUpperCase());
				
				if ((cname.toUpperCase()).equals((c2.getName().toUpperCase()))) {
					i=1;
					break;
				}
				else {
					i=0;
				}
				
			}
			if(i==1){
				ex="1";
				name=cname;
			}else{
				ex="4";
				categoryService.entry(c);
			}
			request.setAttribute("txtName", request.getParameter("txtName"));
			request.setAttribute("txtRemark", request.getParameter("txtRemark"));
			//for alerting exist or not
			request.setAttribute("confirmId", confirmId);
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not
			page = "/presentation/category.jsp";
			getServletContext().getRequestDispatcher(page).forward(request,
					response);
		}else if (param.equals("AddCategoryFromSubAdd")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			Category c = new Category();
			String cname = request.getParameter("txtName1");
			c.setName(cname);
			c.setRemark(request.getParameter("txtRemark1"));
			c.setCreated_user_id(uid);
			c.setModified_user_id(uid);
			c.setFlag(1);
			int i=0;
			List<Category> cl = categoryService.selectAllforadmin();
			for (Category c2: cl) {
				System.out.println("\n\n");
				System.out.println((c2.getName()).toUpperCase()+" and "+cname.toUpperCase());
				
				if ((cname.toUpperCase()).equals((c2.getName().toUpperCase()))) {
					i=1;
					break;
				}
				else {
					i=0;
				}
				
			}
			if(i==1){
				ex="8";
				name=cname;
			}else{
				ex="9";
				categoryService.entry(c);
			}
			String[] brandArr=request.getParameterValues("brand");
			String brand=Arrays.toString(brandArr);
			brand=brand.substring(1, brand.length()-1);
			request.setAttribute("txtName", request.getParameter("txtName"));
			request.setAttribute("cboCategory", request.getParameter("category"));
			request.setAttribute("txtRemark", request.getParameter("txtRemark"));
			request.setAttribute("txtName1", request.getParameter("txtName1"));
			request.setAttribute("txtRemark1", request.getParameter("txtRemark1"));
			request.setAttribute("brand", brand);
			//for alerting exist or not
			request.setAttribute("confirmId", confirmId);
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not
			page = "/presentation/subcategory.jsp";
			getServletContext().getRequestDispatcher(page).forward(request,
					response);
		}else if (param.equals("AddCategoryFromSubEdit")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			Category c = new Category();
			String cname = request.getParameter("txtName1");
			c.setName(cname);
			c.setRemark(request.getParameter("txtRemark1"));
			c.setCreated_user_id(uid);
			c.setModified_user_id(uid);
			c.setFlag(1);
			int i=0;
			List<Category> cl = categoryService.selectAllforadmin();
			for (Category c2: cl) {
				System.out.println("\n\n");
				System.out.println((c2.getName()).toUpperCase()+" and "+cname.toUpperCase());
				
				if ((cname.toUpperCase()).equals((c2.getName().toUpperCase()))) {
					i=1;
					break;
				}
				else {
					i=0;
				}
				
			}
			if(i==1){
				ex="10";
				name=cname;
			}else{
				ex="11";
				categoryService.entry(c);
			}
			String[] brandArr=request.getParameterValues("brand");
			String brand=Arrays.toString(brandArr);
			brand=brand.substring(1, brand.length()-1);
			request.setAttribute("txtName", request.getParameter("txtName"));
			request.setAttribute("cboCategory", request.getParameter("category"));
			request.setAttribute("txtRemark", request.getParameter("txtRemark"));
			request.setAttribute("txtName1", request.getParameter("txtName1"));
			request.setAttribute("txtRemark1", request.getParameter("txtRemark1"));
			request.setAttribute("txtFlag", request.getParameter("txtFlag"));
			request.setAttribute("brand", brand);
			//for alerting exist or not
			
			request.setAttribute("txtId", request.getParameter("txtId"));
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not
			page = "/presentation/subcategory.jsp";
			getServletContext().getRequestDispatcher(page).forward(request,
					response);
		} else if (param.equals("AddCate")) {
			int uid = (Integer) (session.getAttribute("uid"));
			Category c = new Category();
			String cname = request.getParameter("cateName");
			c.setName(cname);
			c.setRemark(request.getParameter("txtRemark1"));
			c.setCreated_user_id(uid);
			c.setModified_user_id(uid);
			c.setFlag(1);
			int i=0;
			List<Category> cl = categoryService.selectAllforadmin();
			for (Category c2: cl) {
				System.out.println("\n\n");
				System.out.println((c2.getName()).toUpperCase()+" and "+cname.toUpperCase());
				
				if ((cname.toUpperCase()).equals((c2.getName().toUpperCase()))) {
					i=1;
					break;
				}
				else {
					i=0;
				}
				
			}
			if(i==1){
				ex="1";
				name=cname;
			}else{
				ex="2";
				categoryService.entry(c);
			}
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not
			page = "/presentation/merchandise.jsp";
			getServletContext().getRequestDispatcher(page).forward(request,
					response);
		}
		else if (param.equals("AddCateEdit")) {
			int uid = (Integer) (session.getAttribute("uid"));
			Category c = new Category();
			String cname = request.getParameter("cateName");
			c.setName(cname);
			c.setRemark(request.getParameter("txtRemark1"));
			c.setCreated_user_id(uid);
			c.setModified_user_id(uid);
			c.setFlag(1);
			int i=0;
			List<Category> cl = categoryService.selectAllforadmin();
			for (Category c2: cl) {
				System.out.println("\n\n");
				System.out.println((c2.getName()).toUpperCase()+" and "+cname.toUpperCase());
				
				if ((cname.toUpperCase()).equals((c2.getName().toUpperCase()))) {
					i=1;
					break;
				}
				else {
					i=0;
				}
				
			}
			if(i==1){
				ex="20";
				name=cname;
			}else{
				ex="9";
				categoryService.entry(c);
			}
			request.setAttribute("mid", request.getParameter("id"));
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not
			page = "/presentation/merchandise.jsp";
			getServletContext().getRequestDispatcher(page).forward(request,
					response);
		}else if (param.equals("Edit")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			Category ca = new Category();
			ca.setCategory_id(Integer.parseInt(request.getParameter("txtId")));
			ca.setName(request.getParameter("txtName"));
			ca.setRemark(request.getParameter("txtRemark"));
			ca.setModified_user_id(uid);
			ca.setFlag(Integer.parseInt(request.getParameter("txtFlag")));
			int id = ca.getCategory_id();
			int flag=ca.getFlag();
			boolean has = sub_category_service.hascategory(id);
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
			request.setAttribute("confirmId", request.getParameter("txtId"));
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not
			page = "/presentation/category.jsp";
			getServletContext().getRequestDispatcher(page).forward(request,
					response);

		} else if(param.equals("sureEdit")){
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			Category ca = new Category();
			ca.setCategory_id(Integer.parseInt(request.getParameter("txtId")));
			ca.setName(request.getParameter("txtName"));
			ca.setRemark(request.getParameter("txtRemark"));
			ca.setModified_user_id(uid);
			ca.setFlag(Integer.parseInt(request.getParameter("txtFlag")));
			categoryService.edit(ca);
			//for alerting exist or not
			request.setAttribute("confirmId", confirmId);
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not
			page = "/presentation/category.jsp";
			getServletContext().getRequestDispatcher(page).forward(request,
					response);
			
		} else if (param.equals("remove")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			int id = Integer.parseInt(request.getParameter("id"));
			System.out.print(id);
			Category cl = categoryService.selectCategory(id);
			boolean has = sub_category_service.hascategory(id);
			System.out.println(has + "has");
			if (sub_category_service.hascategory(id)) {
				name=cl.getName();
				ex="2";
			} else {
				confirmId=request.getParameter("id");
				ex="3";
			}
			// sub_category_service.removesub(id);
			//for alerting exist or not
			request.setAttribute("confirmId", confirmId);
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not
			page = "/presentation/category.jsp";
			getServletContext().getRequestDispatcher(page).forward(request,
					response);
		}else if(param.equals("sureRemove")){
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			int id=Integer.parseInt(request.getParameter("id"));
			categoryService.remove(id);
			//for alerting exist or not
			request.setAttribute("confirmId", confirmId);
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not
			page = "/presentation/category.jsp";
			getServletContext().getRequestDispatcher(page).forward(request,
					response);
			
		}
		// } else if (param.equals("search")) {
		//
		// List<Catagory> userList = userService.selectAll();
		//
		// request.setAttribute("users", userList);
		//
		// page = "/presentation/search.jsp";
		// }
		else if (param.equals("editform")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			int id = Integer.parseInt(request.getParameter("id"));
			Category category = (Category) categoryService.selectCategory(id);
			request.setAttribute("category", category);
			page = "/presentation/category.jsp";
			getServletContext().getRequestDispatcher(page).forward(request,
					response);
		} else if (param.equals("categoryform")) {
			// passing current user from nav
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// End passing current user from nav
			//for alert name is exist in database
			request.setAttribute("exist", ex);
			request.setAttribute("confirmId", confirmId);
			request.setAttribute("name", name);
			//end for alert name is exist in database
			page = "/presentation/category.jsp";
			getServletContext().getRequestDispatcher(page).forward(request,
					response);
		}

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

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
import javax.swing.JOptionPane;

import com.java.plyd.service.*;

@WebServlet("/Sub_category_controller")
public class Sub_category_controller extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Sub_category_controller() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,
			NumberFormatException {
		HttpSession session=request.getSession();
		// TODO Auto-generated method stub
		ISub_category_service sub_category_service = (ISub_category_service) SpringBeanFactory
				.getBean("Sub_category_service");
		ICategoryService category_service = (ICategoryService) SpringBeanFactory
				.getBean("CategoryService");
		ISubCategoryAndBrandService subandbrand_service=(ISubCategoryAndBrandService) SpringBeanFactory
				.getBean("SubCategoryAndBrandService");

		String page = null;
		String param = request.getParameter("page");
		System.out.println(param + "Page");
		String ex="";
		String name="";
		if (param.equals("Add")) {
			// passing current user
						String uname = (String) session.getAttribute("uname");
						int uid = (Integer) (session.getAttribute("uid"));
						session.setAttribute("uid", uid);
						session.setAttribute("uname", uname);
						// ending current user
			Sub_category sub_category = new Sub_category();
			
			sub_category.setName(request.getParameter("txtName"));
			sub_category.setRemark(request.getParameter("txtRemark"));
			
			sub_category.setCategory_id(Integer.parseInt(request
					.getParameter("cboCategory")));
			sub_category.setCreated_user_id(uid);
			sub_category.setModified_user_id(uid);
			sub_category.setFlag(1);
			int i=0;
			List<Sub_category> scl = sub_category_service.selectAllforadmin();
			for (Sub_category sc: scl) {
				System.out.println("\n\n");
				System.out.println((sc.getName()).toUpperCase()+" and "+request.getParameter("txtName").toUpperCase());
				
				if ((request.getParameter("txtName").toUpperCase()).equals((sc.getName().toUpperCase()))) {
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
				int sub_category_id=sub_category_service.entry(sub_category);
				
				//for insert data to subcategory and brand
				String[] brand=request.getParameterValues("brand");
				for(int i1=0;i1<brand.length;i1++){
					SubCategoryAndBrand sad=new SubCategoryAndBrand();
					sad.setSub_category_id(sub_category_id);
					sad.setBrand_id(Integer.parseInt( brand[i1]));
					subandbrand_service.entry(sad);
				}
				//end for insert data to subcategory and brand
				
			}
			//for sending back data as string( change string array to string) 
			String[] brandArr=request.getParameterValues("brand");
			String brand=Arrays.toString(brandArr);
			brand=brand.substring(1, brand.length()-1);
			//end for sending back data as string( change string array to string) 
			
			//sent data to jsp
			Category ca=(Category)category_service.selectCategory(sub_category.getCategory_id());
			request.setAttribute("txtName", request.getParameter("txtName"));
			request.setAttribute("txtRemark", request.getParameter("txtRemark"));
			request.setAttribute("cboCategory", ca.getName());
			request.setAttribute("brand", brand);
			//for alerting exist or not
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not
			
			//end for sent data to jsp
			page = "/presentation/subcategory.jsp";

		}else if (param.equals("AddSubCategory")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			Sub_category sub_category = new Sub_category();
			
			sub_category.setName(request.getParameter("txtName1"));
			sub_category.setRemark(request.getParameter("txtRemark1"));
			sub_category.setCategory_id(Integer.parseInt(request
					.getParameter("cboCategory")));
			sub_category.setCreated_user_id(uid);
			sub_category.setModified_user_id(uid);
			sub_category.setFlag(1);
			int i=0;
			List<Sub_category> scl = sub_category_service.selectAllforadmin();
			for (Sub_category sc: scl) {
				System.out.println("\n\n");
				System.out.println((sc.getName()).toUpperCase()+" and "+request.getParameter("txtName1").toUpperCase());
				
				if ((request.getParameter("txtName1").toUpperCase()).equals((sc.getName().toUpperCase()))) {
					i=1;
					break;
				}
			
				else {
					i=0;
				}
				
			}
			if(i==1){
				ex="1";
				name=request.getParameter("txtName1");
			}else{
				ex="2";
				int sub_category_id=sub_category_service.entry(sub_category);
				
			}
			String[] subcategoryArr=request.getParameterValues("subcategory");
			String subcategory=Arrays.toString(subcategoryArr);
			subcategory=subcategory.substring(1, subcategory.length()-1);
			request.setAttribute("txtName", request.getParameter("txtName"));
			request.setAttribute("txtRemark", request.getParameter("txtRemark"));
			request.setAttribute("subcategory", subcategory);
			request.setAttribute("txtName1", request.getParameter("txtName1"));
			request.setAttribute("txtRemark1", request.getParameter("txtRemark1"));
			request.setAttribute("cboCategory", request.getParameter("cboCategory"));
			//for alerting exist or not
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not
			page = "/presentation/brand.jsp";
			
			}else if (param.equals("AddSubCategoryEdit")) {
				// passing current user
				String uname = (String) session.getAttribute("uname");
				int uid = (Integer) (session.getAttribute("uid"));
				session.setAttribute("uid", uid);
				session.setAttribute("uname", uname);
				// ending current user
				Sub_category sub_category = new Sub_category();
				
				sub_category.setName(request.getParameter("txtName1"));
				sub_category.setRemark(request.getParameter("txtRemark1"));
				sub_category.setCategory_id(Integer.parseInt(request
						.getParameter("cboCategory")));
				sub_category.setCreated_user_id(uid);
				sub_category.setModified_user_id(uid);
				sub_category.setFlag(1);
				int i=0;
				List<Sub_category> scl = sub_category_service.selectAllforadmin();
				for (Sub_category sc: scl) {
					System.out.println("\n\n");
					System.out.println((sc.getName()).toUpperCase()+" and "+request.getParameter("txtName1").toUpperCase());
					
					if ((request.getParameter("txtName1").toUpperCase()).equals((sc.getName().toUpperCase()))) {
						i=1;
						break;
					}
				
					else {
						i=0;
					}
					
				}
				if(i==1){
					ex="5";
					name=request.getParameter("txtName1");
				}else{
					ex="6";
					int sub_category_id=sub_category_service.entry(sub_category);
					
				}
				String[] subcategoryArr=request.getParameterValues("subcategory");
				String subcategory=Arrays.toString(subcategoryArr);
				subcategory=subcategory.substring(1, subcategory.length()-1);
				request.setAttribute("txtId", request.getParameter("txtId"));
				request.setAttribute("txtName", request.getParameter("txtName"));
				request.setAttribute("txtRemark", request.getParameter("txtRemark"));
				request.setAttribute("subcategory", subcategory);
				request.setAttribute("txtFlag", request.getParameter("txtFlag"));
				request.setAttribute("txtName1", request.getParameter("txtName1"));
				request.setAttribute("txtRemark1", request.getParameter("txtRemark1"));
				request.setAttribute("cboCategory", request.getParameter("cboCategory"));
				//for alerting exist or not
				request.setAttribute("exist", ex);
				request.setAttribute("name", name);
				//end for alerting exist or not
				page = "/presentation/brand.jsp";
				
				}else if (param.equals("AddNewSubCategory")) {
					System.out.println("hhhhhhhhhhhhhhhhh");
					int uid = (Integer) (session.getAttribute("uid"));
					Sub_category sub_category = new Sub_category();
					sub_category.setCategory_id(Integer.parseInt(request.getParameter("cate")));
					sub_category.setName(request.getParameter("txtsubcate1"));
					sub_category.setRemark(request.getParameter("txtRemark4"));
					sub_category.setCreated_user_id(uid);
					sub_category.setModified_user_id(uid);
					sub_category.setFlag(1);
					System.out.println("OK");
					int i=0;
					List<Sub_category> scl = sub_category_service.selectAllforadmin();
					for (Sub_category sc: scl) {	
						if ((request.getParameter("txtsubcate1").toUpperCase()).equals((sc.getName().toUpperCase()))) {
							i=1;
							break;
						}
					
						else {
							i=0;
						}
						
					}
					if(i==1){
						ex="16";
						name=request.getParameter("txtsubcate1");
					}else{
						ex="4";
						int sub_category_id=sub_category_service.entry(sub_category);
						
						String brand=request.getParameter("brand1");
						String[] array=brand.split(",");
						System.out.println("yy");
						for(int j1=0;j1<array.length;j1++){
							SubCategoryAndBrand sad=new SubCategoryAndBrand();
							sad.setSub_category_id(sub_category_id);
							sad.setBrand_id(Integer.parseInt( array[j1]));
							System.out.println("subandbrand");
							subandbrand_service.entry(sad);
							System.out.println("subandbrand");
						}
					}
					System.out.println("ok");
					request.setAttribute("txtcategory",Integer.parseInt(request.getParameter("category")));
					System.out.println("ok");
					//for alerting exist or not
					request.setAttribute("exist", ex);
					request.setAttribute("name", name);
					//end for alerting exist or not
					page = "/presentation/merchandise.jsp";
					
					}
		else if (param.equals("AddNewSubCategoryE")) {
					
					int uid = (Integer) (session.getAttribute("uid"));
					Sub_category sub_category = new Sub_category();
					sub_category.setCategory_id(Integer.parseInt(request.getParameter("cate")));
					sub_category.setName(request.getParameter("txtsubcate1"));
					sub_category.setRemark(request.getParameter("txtRemark4"));
					sub_category.setCreated_user_id(uid);
					sub_category.setModified_user_id(uid);
					sub_category.setFlag(1);
					System.out.println("OK");
					int i=0;
					List<Sub_category> scl = sub_category_service.selectAllforadmin();
					for (Sub_category sc: scl) {	
						if ((request.getParameter("txtsubcate1").toUpperCase()).equals((sc.getName().toUpperCase()))) {
							i=1;
							break;
						}
					
						else {
							i=0;
						}
						
					}
					if(i==1){
						ex="22";
						name=request.getParameter("txtsubcate1");
					}else{
						ex="12";
						int sub_category_id=sub_category_service.entry(sub_category);
						
						String brand=request.getParameter("brand1");
						String[] array=brand.split(",");
						System.out.println("yy");
						for(int j1=0;j1<array.length;j1++){
							SubCategoryAndBrand sad=new SubCategoryAndBrand();
							sad.setSub_category_id(sub_category_id);
							sad.setBrand_id(Integer.parseInt( array[j1]));
							System.out.println("subandbrand");
							subandbrand_service.entry(sad);
							System.out.println("subandbrand");
						}
					}
					request.setAttribute("mid", request.getParameter("mid"));
					request.setAttribute("txtcategory", Integer.parseInt(request.getParameter("cate")));
					request.setAttribute("txtbrand1", request.getParameter("txtbrand1"));
					request.setAttribute("txtRemark4", request.getParameter("txtRemark4"));
					//for alerting exist or not
					request.setAttribute("exist", ex);
					request.setAttribute("name", name);
					//end for alerting exist or not
					page = "/presentation/merchandise.jsp";
					
					}
		else if(param.equals("subcategoryform")){
			// passing current user
						String uname = (String) session.getAttribute("uname");
						int uid = (Integer) (session.getAttribute("uid"));
						session.setAttribute("uid", uid);
						session.setAttribute("uname", uname);
						// ending current user
			page="/presentation/subcategory.jsp";
		}

		else if (param.equals("Edit")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			ex="5";
			Sub_category sub_category = new Sub_category();
			sub_category.setSub_category_id(Integer.parseInt(request
					.getParameter("txtId")));
			sub_category.setName(request.getParameter("txtName"));
			sub_category.setRemark(request.getParameter("txtRemark"));
			//System.out.println("ljkskjlsjklfdaklfdldlf"+request.getParameter("cboCategory"));
			sub_category.setCategory_id(Integer.parseInt(request
					.getParameter("cboCategory")));
			sub_category.setModified_user_id(uid);
			sub_category.setFlag(Integer.parseInt(request
					.getParameter("txtFlag")));
			String[] brand=request.getParameterValues("brand2");
			sub_category_service.edit(sub_category);
			subandbrand_service.remove(Integer.parseInt(request.getParameter("txtId")));
			if(request.getParameter("txtFlag").equals("1")){
			for(int i=0;i<brand.length;i++){
				SubCategoryAndBrand sad=new SubCategoryAndBrand();
				sad.setSub_category_id(Integer.parseInt(request.getParameter("txtId")));
				sad.setBrand_id(Integer.parseInt(brand[i]));
				subandbrand_service.entry(sad);
			}}
			request.setAttribute("exist", ex);
			page = "/presentation/subcategory.jsp";
		} else if (param.equals("remove")) {
			// passing current user
						String uname = (String) session.getAttribute("uname");
						int uid = (Integer) (session.getAttribute("uid"));
						session.setAttribute("uid", uid);
						session.setAttribute("uname", uname);
						// ending current user
			int scid = Integer.parseInt(request.getParameter("scid"));
			sub_category_service.remove(scid);
			subandbrand_service.remove(scid);
			page = "/presentation/subcategory.jsp";
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

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

import com.java.plyd.service.Category;
import com.java.plyd.service.IBrandService;
import com.java.plyd.service.ICategoryService;
import com.java.plyd.service.ISubCategoryAndBrandService;
import com.java.plyd.service.SpringBeanFactory;
import com.java.plyd.service.Brand;
import com.java.plyd.service.SubCategoryAndBrand;

/**
 * Servlet implementation class BrandController
 */
@WebServlet("/BrandController")
public class BrandController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BrandController() {
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
		IBrandService brandService = (IBrandService) SpringBeanFactory
				.getBean("BrandService");
		ISubCategoryAndBrandService subandbrandService=(ISubCategoryAndBrandService) SpringBeanFactory.getBean("SubCategoryAndBrandService");
		ICategoryService category_service=(ICategoryService)SpringBeanFactory.getBean("CategoryService");
		HttpSession session = request.getSession();
		String page = null;
		String param = request.getParameter("page");
		String ex="";
		String name="";
		if (param.equals("brandform")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			page = "/presentation/brand.jsp";
		} else if (param.equals("AddBrand")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			Brand brand = new Brand();
			brand.setName((request.getParameter("txtName1")));
			brand.setRemark(request.getParameter("txtRemark1"));
			brand.setCreated_user_id(uid);
			brand.setModified_user_id(uid);
			brand.setFlag(1);
			int i=0;
			List<Brand> bl = brandService.selectAllforadmin();
			for (Brand b: bl) {
				System.out.println("\n\n");
				System.out.println((b.getName()).toUpperCase()+" and "+request.getParameter("txtName1").toUpperCase());
				
				if ((request.getParameter("txtName1").toUpperCase()).equals((b.getName().toUpperCase()))) {
					i=1;
					break;
				}

				else {
					i=0;
				}
				
			}
			if(i==1){
				ex="3";
				name=request.getParameter("txtName1");
			}else{
				ex="4";
				brandService.entry(brand);
			}
			String[] a= request.getParameterValues("brand");
			String aa=Arrays.toString(a);
			aa=aa.substring(1, aa.length()-1);
			request.setAttribute("txtName", request.getParameter("txtName"));
			request.setAttribute("cboCategory", request.getParameter("category"));
			request.setAttribute("brand", aa);
			request.setAttribute("txtRemark", request.getParameter("txtRemark"));
			request.setAttribute("txtName1", request.getParameter("txtName1"));
			request.setAttribute("txtRemark1", request.getParameter("txtRemark1"));
			//for alerting exist or not
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not

			page = "/presentation/subcategory.jsp";

		}else if (param.equals("Add")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			Brand brand = new Brand();
			brand.setName((request.getParameter("txtName1")));
			brand.setRemark(request.getParameter("txtRemark1"));
			brand.setCreated_user_id(uid);
			brand.setModified_user_id(uid);
			brand.setFlag(1);
			int i=0;
			List<Brand> bl = brandService.selectAllforadmin();
			for (Brand b: bl) {
				System.out.println("\n\n");
				System.out.println((b.getName()).toUpperCase()+" and "+request.getParameter("txtName1").toUpperCase());
				
				if ((request.getParameter("txtName1").toUpperCase()).equals((b.getName().toUpperCase()))) {
					i=1;
					break;
				}

				else {
					i=0;
				}
				
			}
			if(i==1){
				ex="6";
				name=request.getParameter("txtName1");
			}else{
				ex="7";
				brandService.entry(brand);
			}
			//for sending data(string array to string) to jsp
			String[] a= request.getParameterValues("brand");
			String aa=Arrays.toString(a);
			aa=aa.substring(1, aa.length()-1);
			//end for sending data(string array to string) to jsp
			request.setAttribute("txtId", request.getParameter("txtId"));
			request.setAttribute("txtName", request.getParameter("txtName"));
			//System.out.println("kjasjkkjsdjkdsjkkjdsfkjd "+request.getParameter("category"));
			request.setAttribute("cboCategory", request.getParameter("category"));
			request.setAttribute("brand", aa);
			request.setAttribute("txtRemark", request.getParameter("txtRemark"));
			request.setAttribute("txtName1", request.getParameter("txtName1"));
			request.setAttribute("txtRemark1", request.getParameter("txtRemark1"));
			request.setAttribute("txtFlag", request.getParameter("txtFlag"));
			//for alerting exist or not
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not

			page = "/presentation/subcategory.jsp";

		}else if(param.equals("BrandAdd")){
			// passing current user
						String uname = (String) session.getAttribute("uname");
						int uid = (Integer) (session.getAttribute("uid"));
						session.setAttribute("uid", uid);
						session.setAttribute("uname", uname);
						// ending current user
						Brand brand = new Brand();
						brand.setName((request.getParameter("txtName")));
						brand.setRemark(request.getParameter("txtRemark"));
						brand.setCreated_user_id(uid);
						brand.setModified_user_id(uid);
						brand.setFlag(1);
						int i=0;
						List<Brand> bl = brandService.selectAllforadmin();
						for (Brand b: bl) {
							System.out.println("\n\n");
							System.out.println((b.getName()).toUpperCase()+" and "+request.getParameter("txtName").toUpperCase());
							
							if ((request.getParameter("txtName").toUpperCase()).equals((b.getName().toUpperCase()))) {
								i=1;
								break;
							}

							else {
								i=0;
							}
							
						}
						if(i==1){
							ex="3";
							name=request.getParameter("txtName");
						}else{
							ex="4";
							int brand_id=brandService.entry(brand);
							String[] subcategoryArr=request.getParameterValues("subcategory");
							for(int i1=0;i1<subcategoryArr.length;i1++){
								SubCategoryAndBrand sad=new SubCategoryAndBrand();
								sad.setBrand_id(brand_id);
								sad.setSub_category_id(Integer.parseInt(subcategoryArr[i1]));
								subandbrandService.entry(sad);
							}
						}
						String[] subcategoryArr=request.getParameterValues("subcategory");
						String subcategory=Arrays.toString(subcategoryArr);
						subcategory=subcategory.substring(1, subcategory.length()-1);
						request.setAttribute("txtName", request.getParameter("txtName"));
						request.setAttribute("txtRemark", request.getParameter("txtRemark"));
						request.setAttribute("subcategory", subcategory);
						//for alerting exist or not
						request.setAttribute("exist", ex);
						request.setAttribute("name", name);
						//end for alerting exist or not
						page="/presentation/brand.jsp";
		}else if (param.equals("AddNewBrand")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			Brand brand = new Brand();
			brand.setName((request.getParameter("txtbrand1")));
			brand.setRemark(request.getParameter("txtRemark5"));
			brand.setCreated_user_id(uid);
			brand.setModified_user_id(uid);
			brand.setFlag(1);
			int i=0;
			List<Brand> bl = brandService.selectAllforadmin();
			for (Brand b: bl) {
				if ((request.getParameter("txtbrand1").toUpperCase()).equals((b.getName().toUpperCase()))) {
					i=1;
					break;
				}

				else {
					i=0;
				}
				
			}
			if(i==1){
				ex="17";
				name=request.getParameter("txtbrand1");
			}else{
				ex="5";
				brandService.entry(brand);
			}
			request.setAttribute("subcategory", request.getParameter("subcategory"));
			request.setAttribute("txtcategory", Integer.parseInt(request.getParameter("cate")));
			//for alerting exist or not
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not

			page = "/presentation/merchandise.jsp";

		}
		else if (param.equals("AddNewBrandE")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			Brand brand = new Brand();
			brand.setName((request.getParameter("txtbrand1")));
			brand.setRemark(request.getParameter("txtRemark5"));
			brand.setCreated_user_id(uid);
			brand.setModified_user_id(uid);
			brand.setFlag(1);
			int i=0;
			List<Brand> bl = brandService.selectAllforadmin();
			for (Brand b: bl) {
				if ((request.getParameter("txtbrand1").toUpperCase()).equals((b.getName().toUpperCase()))) {
					i=1;
					break;
				}

				else {
					i=0;
				}
				
			}
			if(i==1){
				ex="25";
				name=request.getParameter("txtbrand1");
			}else{
				ex="6";
				brandService.entry(brand);
			}
			String[] a= request.getParameterValues("brand");
			String aa=Arrays.toString(a);
			aa=aa.substring(1, aa.length()-1);
			request.setAttribute("txtName", request.getParameter("txtName"));
			request.setAttribute("cboCategory", request.getParameter("category"));
			request.setAttribute("brand", aa);
			request.setAttribute("mid", request.getParameter("mid"));
			request.setAttribute("txtRemark", request.getParameter("txtRemark"));
			request.setAttribute("txtName1", request.getParameter("txtName1"));
			request.setAttribute("txtRemark1", request.getParameter("txtRemark1"));
			//for alerting exist or not
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not

			page = "/presentation/merchandise.jsp";

		}else if (param.equals("AddBrand1")) {
	System.out.println("AddBrand1");
			
			int uid = (Integer) (session.getAttribute("uid"));
			Brand brand = new Brand();
			brand.setName(request.getParameter("txtbrand21"));
			brand.setRemark(request.getParameter("txtRemark6"));
			brand.setCreated_user_id(uid);
			brand.setModified_user_id(uid);
			brand.setFlag(1);
			int i=0;
			List<Brand> bl = brandService.selectAllforadmin();
			for (Brand b: bl) {	
				if ((request.getParameter("txtbrand21").toUpperCase()).equals((b.getName().toUpperCase()))) {
					i=1;
					break;
				}
			
				else {
					i=0;
				}
				
			}
			if(i==1){
				ex="18";
				name=request.getParameter("txtbrand21");
			}else{
				ex="8";
				int brand_id=brandService.entry(brand);
				
				int subcategory=Integer.parseInt(request.getParameter("subcategory"));
					SubCategoryAndBrand sad=new SubCategoryAndBrand();
					sad.setBrand_id(brand_id);
					sad.setSub_category_id(subcategory);
					subandbrandService.entry(sad);
			}
			request.setAttribute("txtcategory", Integer.parseInt(request.getParameter("category")));
			request.setAttribute("txtsubcategory",request.getParameter("subcategory1"));
			//for alerting exist or not
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			String st=request.getParameter("hidcat");
			System.out.print("hello");
			System.out.println("this is hid cat"+st);
			request.setAttribute("hidcat",request.getParameter("hidcat"));
			//end for alerting exist or not
			page = "/presentation/merchandise.jsp";
			
			}
else if (param.equals("AddBrand1E")) {
	
	int uid = (Integer) (session.getAttribute("uid"));
	Brand brand = new Brand();
	brand.setName(request.getParameter("txtbrand21"));
	brand.setRemark(request.getParameter("txtRemark6"));
	brand.setCreated_user_id(uid);
	brand.setModified_user_id(uid);
	brand.setFlag(1);
	int i=0;
	List<Brand> bl = brandService.selectAllforadmin();
	for (Brand b: bl) {	
		if ((request.getParameter("txtbrand21").toUpperCase()).equals((b.getName().toUpperCase()))) {
			i=1;
			break;
		}
	
		else {
			i=0;
		}
		
	}
	if(i==1){
		ex="24";
		name=request.getParameter("txtbrand21");
	}else{
		ex="11";
		int brand_id=brandService.entry(brand);
		int subcategory=Integer.parseInt(request.getParameter("subcategory"));
			SubCategoryAndBrand sad=new SubCategoryAndBrand();
			sad.setBrand_id(brand_id);
			sad.setSub_category_id(subcategory);
			subandbrandService.entry(sad);
	}
	String[] subcateArr=request.getParameterValues("subcategory");
	String subcategory=Arrays.toString(subcateArr);
	subcategory=subcategory.substring(1, subcategory.length()-1);
	request.setAttribute("subcategory", subcategory);
	request.setAttribute("txtbrand21", request.getParameter("txtbrand21"));
	request.setAttribute("txtRemark6", request.getParameter("txtRemark6"));
	request.setAttribute("mid", request.getParameter("mid"));
	//for alerting exist or not
	request.setAttribute("exist", ex);
	request.setAttribute("name", name);
	//end for alerting exist or not
	page = "/presentation/merchandise.jsp";
	
	}
		 else if (param.equals("Edit")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			ex="7";
			Brand brand = new Brand();
			brand.setBrand_id(Integer.parseInt(request.getParameter("txtId")));
			brand.setName(request.getParameter("txtName"));
			brand.setRemark(request.getParameter("txtRemark"));
			brand.setFlag(Integer.parseInt(request.getParameter("txtFlag")));
			brand.setModified_user_id(uid);
			brandService.edit(brand);
			String[] subcategory=request.getParameterValues("subcategory2");
			subandbrandService.remove1(Integer.parseInt(request.getParameter("txtId")));
			if(request.getParameter("txtFlag").equals("1")){
			for (int i = 0; i < subcategory.length; i++) {
				SubCategoryAndBrand sab=new SubCategoryAndBrand();
				sab.setBrand_id(Integer.parseInt(request.getParameter("txtId")));
				sab.setSub_category_id(Integer.parseInt(subcategory[i]));
				subandbrandService.entry(sab);
			}
			}
			List<Brand> bl = brandService.selectAll();
			request.setAttribute("bl", bl);
			request.setAttribute("exist", ex);
			page = "/presentation/brand.jsp";
		}

		else if (param.equals("remove")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user

			int brandid = Integer.parseInt(request.getParameter("bid"));
			brandService.remove(brandid);
			subandbrandService.remove1(brandid);
			List<Brand> bl = brandService.selectAll();
			request.setAttribute("bl", bl);
			page = "/presentation/brand.jsp";
		} else if (param.equals("brandEdit")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			int brandid = Integer.parseInt(request.getParameter("bid"));
			Brand brand = (Brand) brandService.selectBrand(brandid);

			request.setAttribute("brand", brand);
			page = "/presentation/brandEdit.jsp";
		}
		else if(param.equals("export")){
			List<Brand> bl=brandService.selectAll();
			request.setAttribute("bl", bl);
			page="/presentation/brandexcel.jsp";
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

package com.java.plyd.ui;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.java.plyd.service.ISupplierService;
import com.java.plyd.service.SpringBeanFactory;
import com.java.plyd.service.Supplier;/**
 * Servlet implementation class Controller
 */
@WebServlet("/SupplierController")
public class SupplierController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SupplierController() {
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
		HttpSession session=request.getSession();
		ISupplierService supplierService = (ISupplierService) SpringBeanFactory
				.getBean("SupplierService");

		String ex="";
		String name="";
		String page = null;
		
		String param = request.getParameter("page");
		

		if (param.equals("Cancel")) {
			
			
			page = "/presentation/supplier.jsp";
		}
		if (param.equals("Search")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			List<Supplier> supplier1=supplierService.selectAll();
			request.setAttribute("supplier", supplier1);
			page = "/presentation/supplier.jsp";
		}
		else if (param.equals("Add")) {
			Supplier supplier = new Supplier();

			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			
			supplier.setName(request.getParameter("txtName"));
			supplier.setAddress(request.getParameter("txtAddress"));
			supplier.setPhone_no(request.getParameter("txtPhoneNo"));
			supplier.setEmail(request.getParameter("txtEmail"));
			supplier.setRemark(request.getParameter("txtRemark"));	
			supplier.setCreated_user_id(uid);
			supplier.setModified_user_id(uid);
			supplier.setFlag(1);
			
			int i=0;
			List<Supplier> ca = supplierService.selectAll();
			for(Supplier b:ca){
				System.out.println("\n\n");
				//System.out.println(b.getName()).toUpperCase()+" and "+request.getParameter("txtName").toUpperCase());
				
				if((request.getParameter("txtEmail").toUpperCase()).equals(b.getEmail().toUpperCase())){
					i=1;
					break;
					
				}
				else{
					i=0;
				}
			}
			if(i==1){
				ex="1";
				name=request.getParameter("txtEmail");
				}
			else{
				ex="2";
				supplierService.entry(supplier);
			}
			request.setAttribute("exist",ex );
			request.setAttribute("name",name);
			request.setAttribute("txtName", request.getParameter("txtName"));
			request.setAttribute("txtAddress", request.getParameter("txtAddress"));
			request.setAttribute("txtPhoneNo", request.getParameter("txtPhoneNo"));
			request.setAttribute("txtEmail", request.getParameter("txtEmail"));
			request.setAttribute("txtRemark", request.getParameter("txtRemark"));
			List<Supplier> supplierList= supplierService.selectAll();

			request.setAttribute("supplier", supplierList);
			page = "/presentation/supplier.jsp";
			
		}
		
		 else if (param.equals("Edit")) {
			    String uname = (String) session.getAttribute("uname");
				int uid = (Integer) (session.getAttribute("uid"));
				session.setAttribute("uid", uid);
				session.setAttribute("uname", uname);
				
				Supplier supplier = new Supplier();
				
				supplier.setSupplier_id(Integer.parseInt(request.getParameter("txtId")));
				supplier.setName(request.getParameter("txtName"));
				supplier.setAddress(request.getParameter("txtAddress"));
				supplier.setPhone_no(request.getParameter("txtPhoneNo"));
				supplier.setEmail(request.getParameter("txtEmail"));
				supplier.setRemark(request.getParameter("txtRemark"));
				supplier.setModified_user_id(uid);
				supplier.setFlag(Integer.parseInt(request.getParameter("txtFlag")));
				
				supplierService.edit(supplier);

				List<Supplier> supplierList = supplierService.selectAll();

				request.setAttribute("supplier",supplierList);
				page = "/presentation/supplier.jsp";
			}
		
		else if (param.equals("remove")) {
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);

			int supplier_id = Integer.parseInt(request.getParameter("id"));
			supplierService.remove(supplier_id);
			List<Supplier> supplierList = supplierService.selectAll();

			request.setAttribute("supplier", supplierList);
			//
			page = "/presentation/supplier.jsp";
		} else if (param.equals("editform")) {
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			int supplier_id = Integer.parseInt(request.getParameter("id"));
			Supplier supplier = (Supplier) supplierService.selectSupplier(supplier_id);

			request.setAttribute("supplier", supplier);
			page = "/presentation/supplier.jsp";
		}else if (param.equals("exporttoexcel")){
			List<Supplier>supplier=supplierService.selectAll();
			request.setAttribute("supplier", supplier);
			page="/presentation/excelreport.jsp";
		}else if (param.equals("Supplier")) {
			// passing current user from nav
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// End passing current user from nav

			page = "/presentation/supplier.jsp";
		}
		

		
		getServletContext().getRequestDispatcher(page).forward(request,
				response);

	}

	private void alert( ) {
		// TODO Auto-generated method stub
		System.out.print("Successfully");
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

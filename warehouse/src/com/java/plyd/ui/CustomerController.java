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

import com.java.plyd.service.ICustomerService;
import com.java.plyd.service.SpringBeanFactory;
import com.java.plyd.service.Customer;
/**
 * Servlet implementation class CustomerController
 */
@WebServlet("/CustomerController")
public class CustomerController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CustomerController() {
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
		String ex="0";
		String name=" ";
		ICustomerService customerService = (ICustomerService) SpringBeanFactory
				.getBean("CustomerService");

		String page = null;
		String param = request.getParameter("page");
		

		if (param.equals("Cancel")) {
			
			
			page = "/presentation/customer.jsp";
		}
		if (param.equals("Search")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			List<Customer> customer=customerService.selectAll();
			request.setAttribute("customer", customer);
			page = "/presentation/customer.jsp";
		}
		else if (param.equals("Add")) {
			Customer customer = new Customer();

			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			
			customer.setName(request.getParameter("txtName"));
			customer.setAddress(request.getParameter("txtAddress"));
			customer.setPhone_no(request.getParameter("txtPhoneNo"));
			customer.setEmail(request.getParameter("txtEmail"));
			customer.setRemark(request.getParameter("txtRemark"));	
			customer.setCreated_user_id(uid);
			customer.setModified_user_id(uid);
			customer.setFlag(1);
			int i=0;
			List<Customer> cs=customerService.selectAll();
			for(Customer c:cs){
				System.out.println("\n\n");
				System.out.println((c.getEmail()).toUpperCase()+"and"+request.getParameter("txtEmail").toUpperCase());
				if((request.getParameter("txtEmail").toUpperCase()).equals(c.getEmail().toUpperCase())){
						System.out.println("equal");
						i=1;
						break;
						
				}
				else{
					i=0;
					System.out.print("not equal");
				}
						
			}
			if(i==1){
				ex="1";
				name=request.getParameter("txtEmail");
			}else{
				ex="2";
				customerService.entry(customer);
			}
			request.setAttribute("txtName",request.getParameter("txtName") );
			request.setAttribute("txtAddress",request.getParameter("txtAddress") );
			request.setAttribute("txtPhoneNo",request.getParameter("txtPhoneNo") );
			request.setAttribute("txtEmail",request.getParameter("txtEmail") );
			request.setAttribute("txtRemark",request.getParameter("txtRemark") );
			

			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			
			List<Customer> customerList = customerService.selectAll();

			request.setAttribute("customer", customerList);
			page = "/presentation/customer.jsp";
			
		}
		
		 else if (param.equals("Edit")) {
			    String uname = (String) session.getAttribute("uname");
				int uid = (Integer) (session.getAttribute("uid"));
				session.setAttribute("uid", uid);
				session.setAttribute("uname", uname);
				
		     Customer customer = new Customer();
				
			 customer.setCustomer_id(Integer.parseInt(request.getParameter("txtId")));
			 customer.setName(request.getParameter("txtName"));
			 customer.setAddress(request.getParameter("txtAddress"));
			 customer.setPhone_no(request.getParameter("txtPhoneNo"));
			 customer.setEmail(request.getParameter("txtEmail"));
			 customer.setRemark(request.getParameter("txtRemark"));
			 customer.setModified_user_id(uid);
			 customer.setFlag(Integer.parseInt(request.getParameter("txtFlag")));
				
				customerService.edit(customer);

				List<Customer> customerList = customerService.selectAll();

				request.setAttribute("customer", customerList);
				page = "/presentation/customer.jsp";
			}
		
		else if (param.equals("remove")) {
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);

			int customer_id = Integer.parseInt(request.getParameter("id"));
			customerService.remove(customer_id);
			List<Customer> customerList = customerService.selectAll();

			request.setAttribute("customer", customerList);
			//
			page = "/presentation/customer.jsp";
		} else if (param.equals("editform")) {
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			int customer_id = Integer.parseInt(request.getParameter("id"));
			Customer customer = (Customer) customerService.selectCustomer(customer_id);

			request.setAttribute("customer", customer);
			page = "/presentation/customer.jsp";
		}
		else if (param.equals("Customer")) {
			// passing current user from nav
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// End passing current user from nav

			page = "/presentation/customer.jsp";
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

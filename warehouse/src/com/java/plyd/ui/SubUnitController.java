package com.java.plyd.ui;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.plyd.service.Basicunit;
import com.java.plyd.service.IBasicunitService;
import com.java.plyd.service.ISubUnitService;
import com.java.plyd.service.SpringBeanFactory;
import com.java.plyd.service.SubUnit;
/**
 * Servlet implementation class SubUnitController
 */
@WebServlet("/SubUnitController")
public class SubUnitController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubUnitController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		// TODO Auto-generated method stub
		ISubUnitService subunitservice = (ISubUnitService) SpringBeanFactory
				.getBean("SubUnitService");
		IBasicunitService basicunitservice = (IBasicunitService) SpringBeanFactory
				.getBean("BasicunitService");

		String page = null;
		String param = request.getParameter("page");
		String ex="0";
		String bname=" ";
		String sname=" ";
		
		System.out.println(param + "Page");
		

		if (param.equals("Add")) {
			// passing current user
						String uname = (String) session.getAttribute("uname");
						int uid = (Integer) (session.getAttribute("uid"));
						session.setAttribute("uid", uid);
						session.setAttribute("uname", uname);
						// ending current user
			SubUnit subunit = new SubUnit();

			subunit.setName(request.getParameter("txtasName"));
			subunit.setRemark(request.getParameter("txtasRemark"));
			subunit.setBasic_unit_id(Integer.parseInt(request
					.getParameter("cboBasicunit")));
			subunit.setCreated_user_id(uid);
			subunit.setModified_user_id(uid);
			subunit.setFlag(1);
			
			int i=0;
			List<SubUnit> su=subunitservice.selectAll();
			List<Basicunit> bu=basicunitservice.selectAll();
			for(SubUnit sc:su){
				if((request.getParameter("txtasName").toUpperCase()).equals(sc.getName().toUpperCase())){
				/*	for(SubUnit sc:su){
						if((request.getParameter("txtasName").toUpperCase()).equals(sc.getName().toUpperCase())){
							i=1;
							break;
						}
						else{
							i=0;
							}
					}	*/
					i=1;
					break;
				} 
				else{
					i=0;
					System.out.print("Not Equal");
				}
				
			}
			if(i==0){
				subunitservice.entry(subunit);
			}
			else{
				ex="1";
				bname=request.getParameter("txtabName");
				sname=request.getParameter("txtasName");
			}
			request.setAttribute("exist", ex);
			request.setAttribute("bname", bname );
			request.setAttribute("sname", sname);
			
			List<SubUnit>sunit=subunitservice.selectAll();
			//subunitservice.entry(subunit);
			page = "/presentation/subunit.jsp";

		}
		else if(param.equals("subunitform")){
			// passing current user
						String uname = (String) session.getAttribute("uname");
						int uid = (Integer) (session.getAttribute("uid"));
						session.setAttribute("uid", uid);
						session.setAttribute("uname", uname);
						// ending current user
			page="/presentation/subunit.jsp";
		}

		else if (param.equals("Edit")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			//ex="2";
			// ending current user
			SubUnit subunit1 = new SubUnit();
			subunit1.setSub_unit_id(Integer.parseInt(request
					.getParameter("txtsId")));
			subunit1.setName(request.getParameter("txtsName"));
			subunit1.setRemark(request.getParameter("txtsRemark"));
			subunit1.setBasic_unit_id(Integer.parseInt(request
					.getParameter("cbosBasicunit")));
			subunit1.setModified_user_id(uid);
			subunit1.setFlag(Integer.parseInt(request
					.getParameter("txtsFlag")));
			ex="2";
			request.setAttribute("exist", ex);
			subunitservice.edit(subunit1);
			page = "/presentation/subunit.jsp";
		}else if (param.equals("AddSubUnit")) {
			// passing current user
			ex="";
			String name="";
			
			SubUnit basic = new SubUnit();
			basic.setName((request.getParameter("suName")));
			System.out.println("name");
			basic.setBasic_unit_id(Integer.parseInt(request.getParameter("cboBasic")));
			System.out.println("basic");
			basic.setRemark(request.getParameter("txtRemark3"));
			System.out.println("remark");
			basic.setCreated_user_id(1);
			basic.setModified_user_id(1);
			basic.setFlag(1);
			int i=0;
			List<SubUnit> sul = subunitservice.selectAllforadmin();
			for (SubUnit su: sul) {
				if ((request.getParameter("suName").toUpperCase()).equals((su.getName().toUpperCase()))) {
					i=1;
					break;
				}

				else {
					i=0;
				}
				
			}
			if(i==1){
				ex="19";
				name=request.getParameter("suName" +
						"");
			}else{
				ex="7";
				subunitservice.entry(basic);
			}
			request.setAttribute("txtcategory", Integer.parseInt(request.getParameter("category")));
			request.setAttribute("txtsubcategory",request.getParameter("subcategory"));
			request.setAttribute("brand",request.getParameter("brand"));
			request.setAttribute("txtbasicunit", Integer.parseInt(request.getParameter("cboBasic")));
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not

			page = "/presentation/merchandise.jsp";

		}
		else if (param.equals("AddSubUnit1")) {
			// passing current user
			ex="";
			String name="";
			SubUnit basic = new SubUnit();
			basic.setName((request.getParameter("suName")));
			basic.setBasic_unit_id(Integer.parseInt(request.getParameter("cboBasic")));
			basic.setRemark(request.getParameter("txtRemark3"));
			basic.setCreated_user_id(1);
			basic.setModified_user_id(1);
			basic.setFlag(1);
			int i=0;
			List<SubUnit> sul = subunitservice.selectAllforadmin();
			for (SubUnit su: sul) {
				if ((request.getParameter("suName").toUpperCase()).equals((su.getName().toUpperCase()))) {
					i=1;
					break;
				}

				else {
					i=0;
				}
				
			}
			if(i==1){
				ex="1";
				name=request.getParameter("suName");
			}else{
				ex="6";
				subunitservice.entry(basic);
			}
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not

			page = "/presentation/merchandise.jsp";
			}
		
		else if (param.equals("AddSubUnit1E")) {
			// passing current user
			ex="";
			String name="";
			SubUnit basic = new SubUnit();
			basic.setName((request.getParameter("suName")));
			basic.setBasic_unit_id(Integer.parseInt(request.getParameter("cboBasic")));
			basic.setRemark(request.getParameter("txtRemark3"));
			basic.setCreated_user_id(1);
			basic.setModified_user_id(1);
			basic.setFlag(1);
			int i=0;
			List<SubUnit> sul = subunitservice.selectAllforadmin();
			for (SubUnit su: sul) {
				if ((request.getParameter("suName").toUpperCase()).equals((su.getName().toUpperCase()))) {
					i=1;
					break;
				}

				else {
					i=0;
				}
				
			}
			if(i==1){
				ex="23";
				name=request.getParameter("suName");
			}else{
				ex="13";
				subunitservice.entry(basic);
			}
			request.setAttribute("mid", request.getParameter("mid"));
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not

			page = "/presentation/merchandise.jsp";
			} else if (param.equals("remove")) {
			// passing current user
						String uname = (String) session.getAttribute("uname");
						int uid = (Integer) (session.getAttribute("uid"));
						session.setAttribute("uid", uid);
						session.setAttribute("uname", uname);
						// ending current user
			int scid = Integer.parseInt(request.getParameter("scid"));
			ex="3";
			request.setAttribute("exist",ex);
			System.out.println("aljflsjlsfjljsljljsljljlf");
			subunitservice.remove(scid);
			page = "/presentation/subunit.jsp";
			
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

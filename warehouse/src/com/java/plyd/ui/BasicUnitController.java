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

/**
 * Servlet implementation class BasicUnitController
 */
@WebServlet("/BasicUnitController")
public class BasicUnitController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BasicUnitController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IBasicunitService basicunitService = (IBasicunitService) SpringBeanFactory.getBean("BasicunitService");
		
		ISubUnitService subService=(ISubUnitService)SpringBeanFactory.getBean("SubUnitService");
		
		HttpSession session = request.getSession();
		String page = null;
		String param = request.getParameter("page");
		String ex="0";
		String name=" ";
		System.out.println("aisakk "+param);
		if (param.equals("basicunitform")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			page = "/presentation/basicunit.jsp";
		} else if (param.equals("Add")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			Basicunit basicunit = new Basicunit();
			basicunit.setName((request.getParameter("txtabName")));
			basicunit.setRemark(request.getParameter("txtabRemark"));
			basicunit.setCreated_user_id(uid);
			basicunit.setModified_user_id(uid);
			basicunit.setFlag(1);
			
			int i=0;
			List<Basicunit> bc=basicunitService.selectAll();
			for(Basicunit b:bc){
				if((request.getParameter("txtabName").toUpperCase()).equals(b.getName().toUpperCase())){
					i=1;
					break;
				}
				else{
					i=0;
					System.out.print("Not Equal");
				}
				
			}
			if(i==0){
				basicunitService.entry(basicunit);
			}
			else{
				ex="1";
				name=request.getParameter("txtabName");
			}
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//basicunitService.entry(basicunit);
			List<Basicunit> bunit=basicunitService.selectAll();
			page = "/presentation/basicunit.jsp";

		}else if (param.equals("AddFromSubUnitAdd")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			Basicunit basicunit = new Basicunit();
			basicunit.setName((request.getParameter("txtName1")));
			basicunit.setRemark(request.getParameter("txtRemark1"));
			basicunit.setCreated_user_id(uid);
			basicunit.setModified_user_id(uid);
			basicunit.setFlag(1);
			
			int i=0;
			List<Basicunit> bc=basicunitService.selectAll();
			for(Basicunit b:bc){
				if((request.getParameter("txtName1").toUpperCase()).equals(b.getName().toUpperCase())){
					i=1;
					break;
				}
				else{
					i=0;
					System.out.print("Not Equal");
				}
				
			}
			if(i==0){
				ex="4";
				basicunitService.entry(basicunit);
			}
			else{
				ex="3";
				name=request.getParameter("txtName1");
			}
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			request.setAttribute("txtName", request.getParameter("txtName"));
			request.setAttribute("txtRemark", request.getParameter("txtRemark"));
			request.setAttribute("cboBasicUnit", request.getParameter("cboBasicUnit"));
			request.setAttribute("txtName1", request.getParameter("txtName1"));
			request.setAttribute("txtRemark1", request.getParameter("txtRemark1"));
			page = "/presentation/subunit.jsp";

		}else if (param.equals("AddFromSubUnitEdit")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			Basicunit basicunit = new Basicunit();
			basicunit.setName((request.getParameter("txtName1")));
			basicunit.setRemark(request.getParameter("txtRemark1"));
			basicunit.setCreated_user_id(uid);
			basicunit.setModified_user_id(uid);
			basicunit.setFlag(1);
			
			int i=0;
			List<Basicunit> bc=basicunitService.selectAll();
			for(Basicunit b:bc){
				if((request.getParameter("txtName1").toUpperCase()).equals(b.getName().toUpperCase())){
					i=1;
					break;
				}
				else{
					i=0;
					System.out.print("Not Equal");
				}
				
			}
			if(i==0){
				ex="6";
				basicunitService.entry(basicunit);
			}
			else{
				ex="5";
				name=request.getParameter("txtName1");
			}
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			request.setAttribute("txtName", request.getParameter("txtName"));
			request.setAttribute("txtRemark", request.getParameter("txtRemark"));
			request.setAttribute("cboBasicUnit", request.getParameter("cboBasicUnit"));
			request.setAttribute("txtName1", request.getParameter("txtName1"));
			request.setAttribute("txtRemark1", request.getParameter("txtRemark1"));
			request.setAttribute("txtId", request.getParameter("txtId"));
			request.setAttribute("txtFlag", request.getParameter("txtFlag"));
			page = "/presentation/subunit.jsp";

		}else if (param.equals("AddBasic")) {
			// passing current user
			ex="";
			name="";
			int uid = (Integer) (session.getAttribute("uid"));
			Basicunit basic = new Basicunit();
			basic.setName((request.getParameter("buName")));
			basic.setRemark(request.getParameter("txtRemark2"));
			basic.setCreated_user_id(uid);
			basic.setModified_user_id(uid);
			basic.setFlag(1);
			int i=0;
			List<Basicunit> bul = basicunitService.selectAllforadmin();
			for (Basicunit bu: bul) {
				if ((request.getParameter("buName").toUpperCase()).equals((bu.getName().toUpperCase()))) {
					i=1;
					break;
				}

				else {
					i=0;
				}
				
			}
			if(i==1){
				ex="15";
				name=request.getParameter("buName");
			}else{
				ex="3";
				basicunitService.entry(basic);
			}
			
			request.setAttribute("txtcategory", Integer.parseInt(request.getParameter("category")));
			request.setAttribute("txtsubcategory",request.getParameter("subcategory"));
			request.setAttribute("brand",request.getParameter("brand"));
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not

			page = "/presentation/merchandise.jsp";

		}
		else if (param.equals("AddBasicEdit")) {
			// passing current user
			ex="";
			name="";
			int uid = (Integer) (session.getAttribute("uid"));
			Basicunit basic = new Basicunit();
			basic.setName((request.getParameter("buName")));
			basic.setRemark(request.getParameter("txtRemark2"));
			basic.setCreated_user_id(uid);
			basic.setModified_user_id(uid);
			basic.setFlag(1);
			int i=0;
			List<Basicunit> bul = basicunitService.selectAllforadmin();
			for (Basicunit bu: bul) {
				if ((request.getParameter("buName").toUpperCase()).equals((bu.getName().toUpperCase()))) {
					i=1;
					break;
				}

				else {
					i=0;
				}
				
			}
			if(i==1){
				ex="21";
				name=request.getParameter("buName");
			}else{
				ex="10";
				basicunitService.entry(basic);
			}
			request.setAttribute("mid", request.getParameter("mid"));
			request.setAttribute("cate", request.getParameter("cboCategory"));
			request.setAttribute("exist", ex);
			request.setAttribute("name", name);
			//end for alerting exist or not

			page = "/presentation/merchandise.jsp";

		} else if (param.equals("Search")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			List<Basicunit> bl = basicunitService.selectAll();
			request.setAttribute("bl", bl);
			page = "/presentation/basicunit.jsp";
		} else if (param.equals("Edit")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user
			Basicunit basicunit = new Basicunit();
			
			basicunit.setBasic_unit_id(Integer.parseInt(request.getParameter("txtbId")));
			basicunit.setName(request.getParameter("txtbName"));
			basicunit.setRemark(request.getParameter("txtbRemark"));
			basicunit.setFlag(Integer.parseInt(request.getParameter("txtbFlag")));
			basicunit.setModified_user_id(uid);
			int id=basicunit.getBasic_unit_id();
			int flag=basicunit.getFlag();
			boolean has=subService.hasSubunit(id);
			if(flag==0&& has==true){
				ex="3";
				name=basicunit.getName();
			}
			else{
				ex="2";
				name=" ";
				basicunitService.edit(basicunit);
			}
			request.setAttribute("exist",ex);
			request.setAttribute("name",name);
			List<Basicunit> bl = basicunitService.selectAll();
			request.setAttribute("bl", bl);
			page = "/presentation/basicunit.jsp";
		}

		else if (param.equals("remove")) {
			// passing current user
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			// ending current user

			int basicid = Integer.parseInt(request.getParameter("buid"));
			Basicunit bu=basicunitService.selectBasicunit(basicid);
			boolean hasSub=subService.hasSubunit(basicid);
			if(hasSub==true){
				ex="4";
				name=bu.getName();
			}
			else{
				
				ex="5";
				name=" ";
				basicunitService.remove(basicid);
			}
			request.setAttribute("exist",ex);
			request.setAttribute("name", name);
			List<Basicunit> bl = basicunitService.selectAll();
			request.setAttribute("bl", bl);
			page = "/presentation/basicunit.jsp";
		}
//		} else if (param.equals("brandEdit")) {
//			// passing current user
//			String uname = (String) session.getAttribute("uname");
//			int uid = (Integer) (session.getAttribute("uid"));
//			session.setAttribute("uid", uid);
//			session.setAttribute("uname", uname);
//			// ending current user
//			int brandid = Integer.parseInt(request.getParameter("bid"));
//			Brand brand = (Brand) brandService.selectBrand(brandid);
//
//			request.setAttribute("brand", brand);
//			page = "/presentation/brandEdit.jsp";
//		}
//		else if(param.equals("excelform")){
//			List<Brand> bl = brandService.selectAll();
//			request.setAttribute("bl", bl);
//			page = "/presentation/excel.jsp";
//		}
		
		getServletContext().getRequestDispatcher(page).forward(request,
				response);

	}
	

	private void alert() {

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

package com.java.plyd.ui;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.plyd.persistence.IDamageDAOManager;
import com.java.plyd.service.Damage;
import com.java.plyd.service.IDamageService;
import com.java.plyd.service.SpringBeanFactory;

/**
 * Servlet implementation class DamageController
 */
@WebServlet("/DamageController")
public class DamageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DamageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     IDamageService damageService=(IDamageService) SpringBeanFactory.getBean("DamageService");
	     
	     String page=null;
	     String param=request.getParameter("page");
	     
	     if(param.equals("damage")){
	    	 List<Damage> damageList=damageService.selectAll();
	    	 request.setAttribute("damage",damageList);
	    	 page="/presentation/damage.jsp";
	     }
	     getServletContext().getRequestDispatcher(page).forward(request,response);
	    		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

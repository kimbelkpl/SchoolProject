package com.java.plyd.ui;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTMLDocument.HTMLReader.SpecialAction;

import com.java.plyd.service.*;

/**
 * Servlet implementation class StockBalanceController
 */
@WebServlet("/StockBalanceController")
public class StockBalanceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StockBalanceController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Stock_BalanceService stockbalanceService=(Stock_BalanceService)SpringBeanFactory.getBean("Stock_BalanceService");
		List<Stock_Balance> stockBalanceList=stockbalanceService.selectAll();
		String page = null;
		String param = request.getParameter("page");
		// String param="login";
		System.out.println(param + "Page");
		if(param.equals("stockbalanceform")){
			request.setAttribute("warehouseId", "");
			request.setAttribute("stockBalanceList", stockBalanceList);
			page="/presentation/stockBalance.jsp";
		}else if(param.equals("filterWarehouse")){
			int warehouseId=Integer.parseInt(request.getParameter("warehouseId"));
			if(warehouseId==0){
				request.setAttribute("stockBalanceList", stockBalanceList);
			}else{
				List<Stock_Balance> stockBalanceList1=stockbalanceService.selectStock_BalanceByWarehouseid(warehouseId);
				request.setAttribute("stockBalanceList", stockBalanceList1);
			}
			request.setAttribute("warehouseId", warehouseId);
			page="/presentation/stockBalance.jsp";
		}
		else{
			request.setAttribute("warehouseId", "");
			request.setAttribute("stockBalanceList", stockBalanceList);
			page="/presentation/stockBalance.jsp";
			
		}
		getServletContext().getRequestDispatcher(page).forward(request,
				response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

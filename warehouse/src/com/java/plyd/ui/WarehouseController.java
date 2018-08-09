package com.java.plyd.ui;

import java.io.IOException;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.plyd.service.IMerchandiseService;
import com.java.plyd.service.IStock_BalanceService;
import com.java.plyd.service.IWarehouseService;
import com.java.plyd.service.Merchandise;
import com.java.plyd.service.SpringBeanFactory;
import com.java.plyd.service.Stock_Balance;
import com.java.plyd.service.Warehouse;

/**
 * Servlet implementation class WarehouseController
 */
@WebServlet("/WarehouseController")
public class WarehouseController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public WarehouseController() {
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

		IWarehouseService wareService = (IWarehouseService) SpringBeanFactory
				.getBean("WarehouseService");
		IMerchandiseService merService=(IMerchandiseService)SpringBeanFactory.getBean("MerchandiseService");
		IStock_BalanceService stock_balance_service=(IStock_BalanceService)SpringBeanFactory.getBean("Stock_BalanceService");
		String page = null;
		String samename = "";
		String param = request.getParameter("page");
		HttpSession session = request.getSession();
		if (param.equals("warehouseform")) {

			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			
			
			request.setAttribute("samename", "login");
			page = "/presentation/warehouse.jsp";
		} 
		
		else if (param.equals("Add")) {
			System.out.println("Enter add button");
			String sessionID=request.getParameter("warehousecmid");
			int sid=Integer.parseInt(sessionID);
			
			
			String name=request.getParameter("txtName");
			String addr=request.getParameter("txtAddr");
			String phone=request.getParameter("txtPhone");
			String remark=request.getParameter("txtRemark");
			//System.out.println(name+addr+phone+remark);
		
			boolean ware=false;
			
			List<Warehouse> w=wareService.selectAll();
			
			String forexist="#";
			for(Warehouse wh:w)
			{
				
				if(wh.getWareName().equals(name) && wh.getWareAddress().equals(addr))
				{
					forexist += wh.getWareName()+"#"+wh.getWareAddress()+"#"+request.getParameter("txtPhone")+"#"+request.getParameter("txtRemark");
					ware=true;
					
					break;
				}
				
			}
			if(ware)
			{
				System.out.println("Already Exist");
				samename = "exist"+forexist;
			}
			else
			{
				Warehouse warehouse=new Warehouse();
				warehouse.setWareName(name);
				warehouse.setWareAddress(addr);
				warehouse.setWarePhone(phone);
				warehouse.setWareRemark(remark);
				warehouse.setWareCreatedID(sid);
				warehouse.setWareModifiedID(sid);
				try
				{
					int warehouse_id=wareService.entry(warehouse);
					System.out.println("warehouse_id "+warehouse_id);
					List<Merchandise> ml=merService.selectAll();
					for(Merchandise m:ml){
						Stock_Balance st1=new Stock_Balance();
						st1.setMerchandise_id(m.getMerchandise_id());
						st1.setWarehouse_id(warehouse_id);
						st1.setQty(0);
						st1.setRemark("--");
						stock_balance_service.entry(st1);
					}
					int success=wareService.FunctionCall();
					System.out.println(success+"  Insertion successful");
					if(success==1)
					{
						samename="success";
					}
					else
						samename="unsuccess";
					
					
				}catch(Exception e)
				{
					samename="unsuccess";
				}
			}
			
			request.setAttribute("samename", samename);
			page="/presentation/warehouse.jsp";

		} else if (param.equals("Edit")) {

			System.out.println("Enter edit button ");
			
			
			int flag = Integer.parseInt(request.getParameter("radioflag"));
			boolean ware=false;
			
			List<Warehouse> w=wareService.selectAll();
			
			String forexist="#";
			for(Warehouse wh:w)
			{
				
				if(wh.getWareName().equals(request.getParameter("txtName")) && wh.getWareAddress().equals(request.getParameter("txtAddress")))
				{
					if(wh.getId()==Integer.parseInt(request.getParameter("eid"))){
						
						
						if( wh.getWarePhone().equals(request.getParameter("txtPhone"))&& wh.getWareRemark().equals(request.getParameter("txtRemark"))&& wh.getWareflag()==flag){
							
							
							forexist += wh.getWareName()+"#"+wh.getWareAddress()+"#"+request.getParameter("txtPhone")+"#"+request.getParameter("txtRemark")+"#"+wh.getWareflag()+"#"+wh.getId();
							ware=true;
							
							break;
						}
					}
					
					else
					{
						forexist += wh.getWareName()+"#"+wh.getWareAddress()+"#"+request.getParameter("txtPhone")+"#"+request.getParameter("txtRemark")+"#"+wh.getWareflag()+"#"+wh.getId();
						ware=true;
						break;
					}
				}
				
				
			}
			if(ware)
			{
				System.out.println("Already Exist");
				samename = "Editexist"+forexist;
			}
			else
			{
				Warehouse warehouse = new Warehouse();
				
				warehouse.setId(Integer.parseInt(request.getParameter("eid")));
				System.out.println(request.getParameter("eid")+"  after SetId");
				warehouse.setWareName(request.getParameter("txtName"));
				warehouse.setWareAddress(request.getParameter("txtAddress"));
				warehouse.setWarePhone(request.getParameter("txtPhone"));
				warehouse.setWareRemark(request.getParameter("txtRemark"));
				
				
				// flag = Integer.parseInt(request.getParameter("radioflag"));
				System.out.println(flag + "	In edit controller is jsp flag");
				int warehousemid = Integer.parseInt(request
						.getParameter("warehousecmid"));
				System.out.println(warehousemid);
				warehouse.setWareModifiedID(warehousemid);
				warehouse.setWareflag(flag);

				try {
					
					wareService.edit(warehouse);
					int success=wareService.FunctionCall();
					
					if(success==1)
					{
						samename="editsuccess";
					}
					else
						samename="editunsuccess";
					
					
				} catch (Exception e) {
					samename="editunsuccess";
				}
				
			}
			
			
			request.setAttribute("samename", samename);			
			page = "/presentation/warehouse.jsp";
		} else if (param.equals("remove")) {

			int uid = Integer.parseInt(request.getParameter("uid"));
			System.out.println("Uid is " + uid);
			Warehouse warehouse = new Warehouse();
			warehouse.setId(uid);
			warehouse.setWareflag(0);
			try {

				wareService.remove(warehouse);
				
				int success=wareService.FunctionCall();
				
				if(success==1)
				{
					samename="deletesuccess";
				}
				else
					samename="deleteunsuccess";				
				
				
			} catch (Exception e) {
				samename="deleteunsuccess";
			}

			request.setAttribute("samename", samename);	
			page = "/presentation/warehouse.jsp";
		} else {
			page = "/presentation/warehouse.jsp";
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
	}

}

package com.java.plyd.ui;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.plyd.service.*;

/**
 * Servlet implementation class MerchandiseController
 */
@WebServlet("/MerchandiseController")
public class MerchandiseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MerchandiseController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		IMerchandiseService mService=(IMerchandiseService) SpringBeanFactory.getBean("MerchandiseService");
		ISub_category_service scService=(ISub_category_service)SpringBeanFactory.getBean("Sub_category_service");
		IBrandService bService=(IBrandService) SpringBeanFactory.getBean("BrandService");
		ISubUnitService suService=(ISubUnitService) SpringBeanFactory.getBean("SubUnitService");
		IMerchandise_BrandService merbrand=(IMerchandise_BrandService)SpringBeanFactory.getBean("Merchandise_BrandService");
		ISubunit_MerchandiseService submerService=(ISubunit_MerchandiseService)SpringBeanFactory.getBean("Subunit_MerchandiseService");
		IStock_BalanceService stockbalanceService=(IStock_BalanceService)SpringBeanFactory.getBean("Stock_BalanceService");
		IWarehouseService warehouseService=(IWarehouseService)SpringBeanFactory.getBean("WarehouseService");
		String page = null;
		String param = request.getParameter("page");
		System.out.println(param + "Page");
		HttpSession session=request.getSession();
		String uname=(String)session.getAttribute("uname");
		int uid=((Integer)(session.getAttribute("uid")));
		session.setAttribute("uname", uname);
		session.setAttribute("uid",uid);
		String ex="";
		int i=0;
		String name="";
//		int j=0;
//		int k=0;
		
		if(param.equals("Add")){
			
				Merchandise m=new Merchandise();
				m.setName(request.getParameter("txtName"));
				m.setBrand_id(Integer.parseInt(request.getParameter("cboBrand")));
				m.setSub_unit_id(Integer.parseInt(request.getParameter("cboSubUnit")));
				m.setSub_category_id(Integer.parseInt(request.getParameter("cboSubCategory")));
				m.setUnit_price(Double.parseDouble(request.getParameter("txtUnitPrice")));
				m.setConvertion_unit_id(Integer.parseInt(request.getParameter("cboConvertionUnit")));
				m.setConvertion_value(Double.parseDouble(request.getParameter("txtConvertionValue")));
				m.setCreated_user_id(uid);
				//m.setMerchandise_id(uid);
				
				m.setModified_user_id(uid);
				System.out.println("jfajfjsj");
				//for duplicate
				List<Merchandise> merchandiseList = mService.selectAll();
				for(Merchandise mer:merchandiseList){
					if((mer.getName().toUpperCase()).equals(request.getParameter("txtName").toUpperCase())){
						i=1;
						break;
					}
					else{
						i=2;
					}
				}
//				for(Merchandise mer:merchandiseList){
//					if(mer.getBrand_id()==Integer.parseInt(request.getParameter("cboBrand"))){
//						j=1;
//						break;
//					}
//					else{
//						j=2;
//					}
//				}
//				for(Merchandise mer:merchandiseList){
//					if(mer.getSub_category_id()==Integer.parseInt(request.getParameter("cboSubCategory"))){
//						k=1;
//						break;
//					}
//					else{
//						k=2;
//					}
//				}
				if(i==1){
					System.out.println("TU NAY TAL\n");
					ex="1";
					name=request.getParameter("txtName");
				}
				else{
					ex="14";
					//merchandise entry
					int mid=mService.insert(m);
					
					//merchandise_brand entry
					Merchandise_Brand mb=new Merchandise_Brand();
					mb.setMerchandise_id(mid);
					mb.setBrand_id(m.getBrand_id());
					merbrand.entry(mb);
					
					//subunit merchandise entry
					Subunit_Merchandise submer=new Subunit_Merchandise();
					submer.setmerchandise_id(mid);
					submer.setSub_unit_id(m.getSub_unit_id());
					System.out.print("mer "+submer.getmerchandise_id()+" sub "+submer.getSub_unit_id());
					submerService.entry(submer);
					
					//stock_balance entry
					List<Warehouse> wl=warehouseService.selectAll();
					for(Warehouse w:wl){
						Stock_Balance sb=new Stock_Balance();
						sb.setMerchandise_id(mid);
						sb.setWarehouse_id(w.getId());
						sb.setQty(0);
						sb.setRemark("--");
						stockbalanceService.entry(sb);
					}
				}
					request.setAttribute("txtcategory", Integer.parseInt(request.getParameter("cboCategory")));
					request.setAttribute("txtsubcategory",request.getParameter("hidtype"));
					request.setAttribute("brand",request.getParameter("hidtype1"));
					request.setAttribute("txtbasicunit", Integer.parseInt(request.getParameter("cboBasicUnit")));
					request.setAttribute("txtsubunit",request.getParameter("hidtype2"));
					request.setAttribute("txtname", request.getParameter("txtName"));
					request.setAttribute("txtconvertionunit", Integer.parseInt(request.getParameter("cboConvertionUnit")));
					request.setAttribute("txtconvertionvalue", Double.parseDouble(request.getParameter("txtConvertionValue")));
					request.setAttribute("txtunitprice", Double.parseDouble(request.getParameter("txtUnitPrice")));
					request.setAttribute("exist", ex);
					request.setAttribute("name", name);
					request.setAttribute("merchandise",merchandiseList);
			
					page="/presentation/merchandise.jsp";
		}
		else if (param.equals("remove")) {

			int id = Integer.parseInt(request.getParameter("merchandise_id"));
			mService.delete(id);
			page = "/presentation/merchandise.jsp";
		}
		
		else if(param.equals("Edit")){
			
			Merchandise mer=new Merchandise();
			mer.setMerchandise_id(Integer.parseInt(request.getParameter("txtId")));
			mer.setName(request.getParameter("txtName"));
			mer.setUnit_price(Double.parseDouble(request.getParameter("txtUnitPrice")));
			mer.setBrand_id(Integer.parseInt(request.getParameter("cboBrand")));
			mer.setSub_unit_id(Integer.parseInt(request.getParameter("cboSubUnit")));
			mer.setSub_category_id(Integer.parseInt(request.getParameter("cboSubCategory")));
			mer.setConvertion_unit_id(Integer.parseInt(request.getParameter("cboConvertionUnit")));
			mer.setConvertion_value(Double.parseDouble(request.getParameter("txtConvertionValue")));
			mer.setFlag(Integer.parseInt(request.getParameter("txtFlag")));
			
			mer.setModified_user_id(uid);

			mService.update(mer);
			page = "/presentation/merchandise.jsp";
		}else if (param.equals("Merchandise")) {

			page = "/presentation/merchandise.jsp";
		}
		getServletContext().getRequestDispatcher(page).forward(request,
				response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}

}

package com.java.plyd.ui;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.plyd.service.*;

/**
 * Servlet implementation class Stock_inDetailController
 */
@WebServlet("/Stock_inDetailController")
public class Stock_inDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Stock_inDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IStock_inService  stock_inService= (IStock_inService) SpringBeanFactory
				.getBean("Stock_inService");
		ICategoryService categoryService=(ICategoryService) SpringBeanFactory
				.getBean("CategoryService");
		ISub_category_service sub_category_service = (ISub_category_service) SpringBeanFactory
				.getBean("Sub_category_service");
		IBrandService brandService = (IBrandService) SpringBeanFactory
				.getBean("BrandService");
		IMerchandiseService manager=(IMerchandiseService)
				SpringBeanFactory.getBean("MerchandiseService");
		IStock_InDetailService stdservice=(IStock_InDetailService) SpringBeanFactory
				.getBean("Stock_InDetailService");
		IBasicunitService basicservice = (IBasicunitService) SpringBeanFactory
				.getBean("BasicunitService");
		ISubUnitService  subunitService= (ISubUnitService) SpringBeanFactory
				.getBean("SubUnitService");
		IWarehouseService WarehouseService = (IWarehouseService) SpringBeanFactory
				.getBean("WarehouseService");
		ISupplierService supplierService = (ISupplierService) SpringBeanFactory
				.getBean("SupplierService");
		IStock_BalanceService balanceservice=(IStock_BalanceService) SpringBeanFactory
				.getBean("Stock_BalanceService");
		ISubCategoryAndBrandService sub_category_brandservice=(ISubCategoryAndBrandService) SpringBeanFactory
				.getBean("SubCategoryAndBrandService");
		IMerchandise_BrandService merchandise_brandservice=(IMerchandise_BrandService) SpringBeanFactory
				.getBean("Merchandise_BrandService");
		ISubunit_MerchandiseService subunit_subcategoryservice=(ISubunit_MerchandiseService) SpringBeanFactory
				.getBean("Subunit_MerchandiseService");
		ICustomerService customerService = (ICustomerService) SpringBeanFactory
				.getBean("CustomerService");
		
		HttpSession session=request.getSession();
		String page = null;
		String param = request.getParameter("page");
	    System.out.println("This is controller");
	    

		
		if(param.equals("Edit")){
			/*String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);*/
		
			int merid=Integer.parseInt(request.getParameter("edmerchandise_id"));
			int himerid=Integer.parseInt(request.getParameter("himerchandise_id"));
			int qty=Integer.parseInt(request.getParameter("qty"));
			
			int qtyhi=Integer.parseInt(request.getParameter("hiqty"));
			int warid=Integer.parseInt(request.getParameter("ware"));
			
		    List<Stock_Balance> balList= balanceservice.selectAll();
			request.setAttribute("stock_balance", balList);
			Stock_Balance stockbal=new Stock_Balance();
			Stock_InDetail dd=new Stock_InDetail();
			
			if(merid==himerid){
				  
				  for(Stock_Balance sb:balList){
					  if(merid==sb.getMerchandise_id() && warid==sb.getWarehouse_id())
					  {
						  int balid=sb.getStock_balance_id();
						  int balqty=sb.getQty();
						  
						  if(qtyhi>qty){
							  int newqty=qtyhi-qty;
							  int newbal=balqty-newqty;
							  stockbal.setQty(newbal);
							  stockbal.setStock_balance_id(balid);
							  balanceservice.edit(stockbal);
							  
							  //detail edits
							  	
							    dd.setStock_in_detail_id(Integer.parseInt(request.getParameter("stock_in_detail_id")));
							    dd.setMerchandise_id(merid);
								//dd.setMerchandise_name(request.getParameter("edMerchandise"));
								dd.setQty(qty);
								System.out.println("hey, I found subunit id");
								dd.setSub_unit_id(Integer.parseInt(request.getParameter("edcbosubunit")));
								dd.setRemark(request.getParameter("edRemark"));
								dd.setFlag(Integer.parseInt(request.getParameter("txtFlag")));
								stdservice.edit(dd);
						  }
						  
						  else if(qtyhi<qty){
							  int newqty=qty-qtyhi;
							  int newbal=balqty+newqty;
							  stockbal.setQty(newbal);
							  stockbal.setStock_balance_id(balid);
							  balanceservice.edit(stockbal);
							  
							  dd.setStock_in_detail_id(Integer.parseInt(request.getParameter("stock_in_detail_id")));
							  dd.setMerchandise_id(merid);
						     // dd.setMerchandise_name(request.getParameter("edMerchandise"));
							  dd.setQty(qty);
							  dd.setSub_unit_id(Integer.parseInt(request.getParameter("edcbosubunit")));
							  System.out.println("This is subunit"+request.getParameter("edcbosubunit"));
							  dd.setRemark(request.getParameter("edRemark"));
						      dd.setFlag(Integer.parseInt(request.getParameter("txtFlag")));
							  stdservice.edit(dd);
							  
						  }
						  else if(qtyhi==qty){
							  dd.setStock_in_detail_id(Integer.parseInt(request.getParameter("stock_in_detail_id")));
							  dd.setMerchandise_id(merid);
						     // dd.setMerchandise_name(request.getParameter("edMerchandise"));
							  dd.setQty(qty);
							  dd.setSub_unit_id(Integer.parseInt(request.getParameter("edcbosubunit")));
							  dd.setRemark(request.getParameter("edRemark"));
						      dd.setFlag(Integer.parseInt(request.getParameter("txtFlag")));
						      stdservice.edit(dd);
						  }
						  
						 
					  }
			  }
		
		
		}
			
			else if(merid!=himerid){
				
				 
				 for(Stock_Balance sb:balList){
					  if(himerid==sb.getMerchandise_id() && warid==sb.getWarehouse_id()){
						  int balid=sb.getStock_balance_id();
						  int balqty=sb.getQty();
						  int newbal=balqty-qtyhi;
						  stockbal.setQty(newbal);
						  stockbal.setStock_balance_id(balid);
						  balanceservice.edit(stockbal);
					  }
				 }
				 
				 for(Stock_Balance sb:balList){
					  if(merid==sb.getMerchandise_id() && warid==sb.getWarehouse_id()){
						  dd.setStock_in_detail_id(Integer.parseInt(request.getParameter("stock_in_detail_id")));
						  dd.setMerchandise_id(merid);
					      //dd.setMerchandise_name(request.getParameter("edMerchandise"));
						  dd.setQty(qty);
						  dd.setSub_unit_id(Integer.parseInt(request.getParameter("edcbosubunit")));
						  dd.setRemark(request.getParameter("edRemark"));
					      dd.setFlag(Integer.parseInt(request.getParameter("txtFlag")));
					      stdservice.edit(dd); 
							
							int balid=sb.getStock_balance_id();
						    int balqty=sb.getQty();
							int newbal=balqty+qty;
							stockbal.setQty(newbal);
							stockbal.setStock_balance_id(balid);
							balanceservice.edit(stockbal);
					  }
				 }
				
			}
			
			
			
			
			int stock_in_id=Integer.parseInt(request.getParameter("stockid"));
			Stock_in stock_in = (Stock_in) stock_inService.selectStock_in(stock_in_id);
			request.setAttribute("stock_in", stock_in);
			
			
			List<Stock_InDetail> stockoutdetialList = stdservice.selectAll();
			List<Warehouse> warehouselist = WarehouseService.selectAll();
			List<Customer> customerList = customerService.selectAll();
			List<Category> categoryList = categoryService.selectAll();
			List<Sub_category> subcat=sub_category_service.selectAll();
			List<Brand> bl = brandService.selectAll();
			List<Merchandise> merchandiseList = manager.selectAll();
			List<SubUnit> subunitlist = subunitService.selectAll();
			List<SubCategoryAndBrand> sub_cat_brandList=sub_category_brandservice.selectAll();
		    List<Merchandise_Brand> merchandisebrandList=merchandise_brandservice.selectAll();
		    List<Subunit_Merchandise> subunit_subcategoryList=subunit_subcategoryservice.selectAll();
		    List<Stock_Balance> balancelist=balanceservice.selectAll();
		    List<Stock_InDetail> detailvou=stdservice.selectAllVou(stock_in_id);
		    
		    request.setAttribute("stockDetail", detailvou);
		    request.setAttribute("stockoutdetail",stockoutdetialList);
		    request.setAttribute("balanceList",balancelist);
		    request.setAttribute("unit_category", subunit_subcategoryList);
		    request.setAttribute("merchandise_brand", merchandisebrandList);
			request.setAttribute("sub_cat_brand",sub_cat_brandList);
			request.setAttribute("subunit",subunitlist);
			request.setAttribute("sub_cate",subcat);
			request.setAttribute("category", categoryList);
			request.setAttribute("bl", bl);
			request.setAttribute("merchandise", merchandiseList);
			request.setAttribute("customer", customerList);
			request.setAttribute("warehouse", warehouselist);
			
			
			page="/presentation/stockinview.jsp";
			
		}
		
		else if(param.equals("submit")){
			
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			
			
			int stock_in_id=Integer.parseInt(request.getParameter("stock"));
			Stock_in stock_in = (Stock_in) stock_inService.selectStock_in(stock_in_id);
			request.setAttribute("stock_in", stock_in);
			
			String remark=request.getParameter("rema");
			String voucher=request.getParameter("vou");
			List<Warehouse> warehouseList = WarehouseService.selectAll();
			
			
			//String[] merchandise=request.getParameterValues("cboMerchandise");
			String[] merchandiseid=request.getParameterValues("merid");
			String[] qty=request.getParameterValues("arrtxtQty");
			String[] subunit=request.getParameterValues("cbosubunit");
			System.out.println("remark"+remark);
			
			List<Stock_InDetail> stdList=new ArrayList<Stock_InDetail>();
			
			for(int i=0;i<merchandiseid.length;i++){
				
				Stock_InDetail std=new Stock_InDetail();
				//String zmerchandise=merchandise[i];
				int zmerchandiseid=Integer.parseInt(merchandiseid[i]);
				int zqty=Integer.parseInt(qty[i]);
				int zsubunit=Integer.parseInt(subunit[i]);
				System.out.println(zmerchandiseid);
				
				    std.setStock_in_id(stock_in_id);
		    		//std.setMerchandise_name(zmerchandise);
		    		std.setMerchandise_id(zmerchandiseid);
		    		std.setQty(zqty);
		    		std.setSub_unit_id(zsubunit);
		    		std.setRemark(remark);
		    		std.setVoucher_no(voucher);
		    		std.setCreated_user_id(uid);
		    		std.setModified_user_id(uid);
		    		std.setFlag(1);
		    		stdList.add(std);
			}
			stdservice.entry(stdList);
			
             //For Stock Balance
			
			String[] merid=request.getParameterValues("merid");
			String[] qtybal=request.getParameterValues("arrtxtQty");
			int warid=Integer.parseInt(request.getParameter("ware"));	
			
			for(int i=0;i<merid.length;i++){
				
			   int zmerid=Integer.parseInt(merid[i]);
			   int zqtybal=Integer.parseInt(qtybal[i]);
			   List<Stock_Balance> balList=balanceservice.selectAll();
			   Stock_Balance stockbal=new Stock_Balance();
				for(Stock_Balance sb:balList){
				   if(zmerid==sb.getMerchandise_id() && warid==sb.getWarehouse_id()){
					    int balid=sb.getStock_balance_id();
						int balqty=sb.getQty();
						int newbal=0;
					    newbal=zqtybal+balqty;
					    stockbal.setQty(newbal);
					    stockbal.setStock_balance_id(balid);
					    balanceservice.edit(stockbal);
				   }
				}
			}
			
			List<Stock_InDetail> stockoutdetialList = stdservice.selectAll();
			List<Warehouse> warehouselist = WarehouseService.selectAll();
			List<Customer> customerList = customerService.selectAll();
			List<Category> categoryList = categoryService.selectAll();
			List<Sub_category> subcat=sub_category_service.selectAll();
			List<Brand> bl = brandService.selectAll();
			List<Merchandise> merchandiseList = manager.selectAll();
			List<SubUnit> subunitlist = subunitService.selectAll();
			List<SubCategoryAndBrand> sub_cat_brandList=sub_category_brandservice.selectAll();
		    List<Merchandise_Brand> merchandisebrandList=merchandise_brandservice.selectAll();
		    List<Subunit_Merchandise> subunit_subcategoryList=subunit_subcategoryservice.selectAll();
		    List<Stock_Balance> balancelist=balanceservice.selectAll();
		    List<Stock_InDetail> detailvou=stdservice.selectAllVou(stock_in_id);
		    
		    request.setAttribute("stockDetail", detailvou);
		    request.setAttribute("stockoutdetail",stockoutdetialList);
		    request.setAttribute("balanceList",balancelist);
		    request.setAttribute("unit_category", subunit_subcategoryList);
		    request.setAttribute("merchandise_brand", merchandisebrandList);
			request.setAttribute("sub_cat_brand",sub_cat_brandList);
			request.setAttribute("subunit",subunitlist);
			request.setAttribute("sub_cate",subcat);
			request.setAttribute("category", categoryList);
			request.setAttribute("bl", bl);
			request.setAttribute("merchandise", merchandiseList);
			request.setAttribute("customer", customerList);
			request.setAttribute("warehouse", warehouselist);
			
			
			page="/presentation/stockinview.jsp";
		}
		
		else if(param.equals("delete")){
			/*String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);*/
			int stock_detail_id=Integer.parseInt(request.getParameter("uid"));
			stdservice.remove(stock_detail_id);
			
			int stock_in_id=Integer.parseInt(request.getParameter("id"));
			System.out.println("id"+stock_in_id);
			Stock_in stock_in = (Stock_in) stock_inService.selectStock_in(stock_in_id);
			request.setAttribute("stock_in", stock_in);
			
			List<Stock_InDetail> stockoutdetialList = stdservice.selectAll();
			List<Warehouse> warehouselist = WarehouseService.selectAll();
			List<Customer> customerList = customerService.selectAll();
			List<Category> categoryList = categoryService.selectAll();
			List<Sub_category> subcat=sub_category_service.selectAll();
			List<Brand> bl = brandService.selectAll();
			List<Merchandise> merchandiseList = manager.selectAll();
			List<SubUnit> subunitlist = subunitService.selectAll();
			List<SubCategoryAndBrand> sub_cat_brandList=sub_category_brandservice.selectAll();
		    List<Merchandise_Brand> merchandisebrandList=merchandise_brandservice.selectAll();
		    List<Subunit_Merchandise> subunit_subcategoryList=subunit_subcategoryservice.selectAll();
		    List<Stock_Balance> balancelist=balanceservice.selectAll();
		    List<Stock_InDetail> detailvou=stdservice.selectAllVou(stock_in_id);
		    
		    request.setAttribute("stockDetail", detailvou);
		    request.setAttribute("stockoutdetail",stockoutdetialList);
		    request.setAttribute("balanceList",balancelist);
		    request.setAttribute("unit_category", subunit_subcategoryList);
		    request.setAttribute("merchandise_brand", merchandisebrandList);
			request.setAttribute("sub_cat_brand",sub_cat_brandList);
			request.setAttribute("subunit",subunitlist);
			request.setAttribute("sub_cate",subcat);
			request.setAttribute("category", categoryList);
			request.setAttribute("bl", bl);
			request.setAttribute("merchandise", merchandiseList);
			request.setAttribute("customer", customerList);
			request.setAttribute("warehouse", warehouselist);
			page="/presentation/stockinview.jsp";
		}
		
		else if(param.equals("Search")){
			String startdtxt=request.getParameter("startdtxt");
			String enddtxt=request.getParameter("enddtxt");
			System.out.println(startdtxt+"   start date\t end date is "+enddtxt);
		
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			
			
			List<Category> categoryList = categoryService.selectAll();
			List<Sub_category> subcategoryList = sub_category_service
					.selectAll();
			List<Brand> brandList = brandService.selectAll();
			List<Merchandise> merchandiseList = manager.selectAll();
			List<Basicunit> bauList = basicservice.selectAll();
			List<SubUnit> subunitList = subunitService.selectAll();
			List<Warehouse> warehouseList = WarehouseService.selectAll();
			List<Supplier> supplierList = supplierService.selectAll();
			List<SubCategoryAndBrand> sub_cat_brandList = sub_category_brandservice.selectAll();
			
			request.setAttribute("sub_cat_brand", sub_cat_brandList);
			request.setAttribute("supplier", supplierList);
			request.setAttribute("warehouse", warehouseList);
			request.setAttribute("subunit", subunitList);
			request.setAttribute("basicunit", bauList);
			request.setAttribute("merchandise", merchandiseList);
			request.setAttribute("brand", brandList);
			request.setAttribute("subcategory", subcategoryList);
			request.setAttribute("category", categoryList);
			
			request.setAttribute("start", startdtxt);
			request.setAttribute("end", enddtxt);
			request.setAttribute("search", "search");
			page="/presentation/stockInDetail.jsp";
		}
		
		//FOR SEARCH DETAIL STOCK IN
		else if(param.equals("Daily")){
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			
			String startdtxt=request.getParameter("startdtxt");
			System.out.println(startdtxt+"   start date");
			
			List<Stock_InDetail> stockoutdetialList = stdservice.selectAll();
			List<Category> categoryList = categoryService.selectAll();
			List<Sub_category> subcategoryList = sub_category_service
					.selectAll();
			List<Brand> brandList = brandService.selectAll();
			List<Merchandise> merchandiseList = manager.selectAll();
			List<Basicunit> bauList = basicservice.selectAll();
			List<SubUnit> subunitList = subunitService.selectAll();
			List<Warehouse> warehouseList = WarehouseService.selectAll();
			List<Supplier> supplierList = supplierService.selectAll();
			List<SubCategoryAndBrand> sub_cat_brandList = sub_category_brandservice.selectAll();
			
			 request.setAttribute("stockoutdetail",stockoutdetialList);
			request.setAttribute("sub_cat_brand", sub_cat_brandList);
			request.setAttribute("supplier", supplierList);
			request.setAttribute("warehouse", warehouseList);
			request.setAttribute("subunit", subunitList);
			request.setAttribute("basicunit", bauList);
			request.setAttribute("merchandise", merchandiseList);
			request.setAttribute("brand", brandList);
			request.setAttribute("subcategory", subcategoryList);
			request.setAttribute("category", categoryList);
			
			request.setAttribute("start", startdtxt);
			
			request.setAttribute("search", "search");
			page="/presentation/stockInreport.jsp";
		}
		//DAILY MERCHANDISE REPORT
		else if(param.equals("DailyMerchandise"))
		{
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			int mqty=0;
			String startdtxt=request.getParameter("startdtxt");
			System.out.println(startdtxt+"   start date");
			
			List<Stock_in> stockinList=stock_inService.selectAll();
			List<Stock_InDetail> stockoutdetialList = stdservice.selectAll();
			List<Category> categoryList = categoryService.selectAll();
			List<Sub_category> subcategoryList = sub_category_service
					.selectAll();
			List<Brand> brandList = brandService.selectAll();
			List<Merchandise> merchandiseList = manager.selectAll();
			List<Basicunit> bauList = basicservice.selectAll();
			List<SubUnit> subunitList = subunitService.selectAll();
			List<Warehouse> warehouseList = WarehouseService.selectAll();
			List<Supplier> supplierList = supplierService.selectAll();
			List<SubCategoryAndBrand> sub_cat_brandList = sub_category_brandservice.selectAll();
			
			
			
			
			System.out.println("Merchandise qty:"+mqty);
			for(Stock_InDetail s:stockoutdetialList){
				
				for(Stock_in sin:stockinList){
					for(int i=1;i<20;i++){
					if( s.getStock_in_id()==sin.getStockInId() && sin.getStockIndate().equals(startdtxt) && s.getMerchandise_id()==i)
					{
						System.out.println("equals");
						int qty=s.getQty();
						
						mqty=mqty+qty;
						System.out.println("if"+mqty);
					
						
					}
					System.out.println("total qty"+mqty);
					break;
					/*else 
					{
						int qty=s.getQty();
						System.out.println("Quantity:"+qty);
					}*/
					}
				
				
			}
				
				
			}
			
			System.out.println("Date"+startdtxt+"Merchandise"+":"+mqty);
			
			
			
			request.setAttribute("Stockin", stockinList);
			 request.setAttribute("stockoutdetail",stockoutdetialList);
			request.setAttribute("sub_cat_brand", sub_cat_brandList);
			request.setAttribute("supplier", supplierList);
			request.setAttribute("warehouse", warehouseList);
			request.setAttribute("subunit", subunitList);
			request.setAttribute("basicunit", bauList);
			request.setAttribute("merchandise", merchandiseList);
			request.setAttribute("brand", brandList);
			request.setAttribute("subcategory", subcategoryList);
			request.setAttribute("category", categoryList);
			
			request.setAttribute("start", startdtxt);
			
			request.setAttribute("search", "search");
			page="/presentation/dailyin.jsp";
		}
		else if(param.equals("TotalQuantity"))
		{
			List<Stock_InDetail> stockoutdetialList = stdservice.selectAll();
			request.setAttribute("merchandiseID", "");
			
			 request.setAttribute("stockoutdetail",stockoutdetialList);
		
			page="/presentation/stockinsummerchandise.jsp";
		}
		else if(param.equals("filterMerchandise")){
			int merchandiseId=Integer.parseInt(request.getParameter("merchandiseid"));
			int sumqty=0;
			List<Stock_InDetail> stockoutdetialList = stdservice.selectAll();
			System.out.println("Merchandise ID:"+merchandiseId);
			
			//String[] mer=request.getParameterValues("");
			if(merchandiseId==0){
				request.setAttribute("merchandiseID", "");
				
				request.setAttribute("stockoutdetail",stockoutdetialList);
				page="/presentation/stockinsummerchandise.jsp";
				
			}else{
				
				List<Stock_InDetail> stockindetialList=stdservice.selectStockInSumMerchandise(merchandiseId);

				request.setAttribute("stockoutdetail",stockindetialList);
			 
				for(Stock_InDetail sind:stockoutdetialList)
				{
					if(merchandiseId==sind.getMerchandise_id()){
						int zqty=sind.getQty();
						sumqty=sumqty+zqty;
						
					}
					
					
				}
				System.out.println("Quantity Value:"+merchandiseId+"......"+sumqty);
				request.setAttribute("SumQty",sumqty);
				request.setAttribute("merchandiseID", merchandiseId);
				page="/presentation/NewFile1.jsp";
			}
			
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

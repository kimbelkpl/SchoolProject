package com.java.plyd.ui;

import java.io.IOException;


import java.util.ArrayList;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.plyd.service.*;



/**
 * Servlet implementation class stockoutdetailController
 */
@WebServlet("/stockoutdetailController")
public class stockoutdetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public stockoutdetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		IStock_outService  stock_outService= (IStock_outService) SpringBeanFactory
				.getBean("Stock_outService");
		IBrandService brandService = (IBrandService) SpringBeanFactory
				.getBean("BrandService");
		IMerchandiseService manager=(IMerchandiseService)
				SpringBeanFactory.getBean("MerchandiseService");
		ISub_category_service sub_category_service = (ISub_category_service) SpringBeanFactory
				.getBean("Sub_category_service");
		ICategoryService category_service = (ICategoryService) SpringBeanFactory
				.getBean("CategoryService");
		ICustomerService customerService = (ICustomerService) SpringBeanFactory
				.getBean("CustomerService");
		IWarehouseService WarehouseService = (IWarehouseService) SpringBeanFactory.getBean("WarehouseService");
		IStockoutdetailService stockoutdetailService = (IStockoutdetailService) SpringBeanFactory
				.getBean("StockoutdetailService");
		ISubUnitService  subunitService= (ISubUnitService) SpringBeanFactory
				.getBean("SubUnitService");
		IStock_BalanceService balanceservice=(IStock_BalanceService) SpringBeanFactory
				.getBean("Stock_BalanceService");
		ISubCategoryAndBrandService sub_category_brandservice=(ISubCategoryAndBrandService) SpringBeanFactory
				.getBean("SubCategoryAndBrandService");
		IMerchandise_BrandService merchandise_brandservice=(IMerchandise_BrandService) SpringBeanFactory
				.getBean("Merchandise_BrandService");
		ISubunit_MerchandiseService subunit_subcategoryservice=(ISubunit_MerchandiseService) SpringBeanFactory
				.getBean("Subunit_MerchandiseService");
		
		HttpSession session = request.getSession();
		
		StockoutDetail std=new StockoutDetail();
		
		
		
		String page = null;
		String param = request.getParameter("page");
		System.out.println(param + "Page");
			System.out.println("Submit is working");
			
			if (param.equals("stockoutform")) {
				// passing current user
				String uname = (String) session.getAttribute("uname");
				int uid = (Integer) (session.getAttribute("uid"));
				session.setAttribute("uid", uid);
				session.setAttribute("uname", uname);
				
				List<Customer> customerList = customerService.selectAll();
				List<Category> categoryList = category_service.selectAll();
				List<Sub_category> subcat=sub_category_service.selectAll();
				List<Brand> bl = brandService.selectAll();
				List<Merchandise> merchandiseList = manager.selectAll();
				List<SubUnit> subunitlist = subunitService.selectAll();
			    List<Warehouse> warehouselist = WarehouseService.selectAll();
			    List<SubCategoryAndBrand> sub_cat_brandList=sub_category_brandservice.selectAll();
			    List<Merchandise_Brand> merchandisebrandList=merchandise_brandservice.selectAll();
			    List<Subunit_Merchandise> subunit_subcategoryList=subunit_subcategoryservice.selectAll();
			    
			    request.setAttribute("warehouse", warehouselist);
			    request.setAttribute("unit_category", subunit_subcategoryList);
			    request.setAttribute("merchandise_brand", merchandisebrandList);
				request.setAttribute("sub_cate",subcat);
				request.setAttribute("subunit",subunitlist);
				request.setAttribute("category", categoryList);
				request.setAttribute("bl", bl);
				request.setAttribute("merchandise", merchandiseList);
				request.setAttribute("customer", customerList);
			   
				
				page = "/presentation/Stockout.jsp";
			}

		
			else if(param.equals("Edit")){
				String uname = (String) session.getAttribute("uname");
				int uid = (Integer) (session.getAttribute("uid"));
				session.setAttribute("uid", uid);
				session.setAttribute("uname", uname);
			
				int merid=Integer.parseInt(request.getParameter("merchandise_id"));
				int himerid=Integer.parseInt(request.getParameter("himerchandise_id"));
				int qty=Integer.parseInt(request.getParameter("txtQty"));
				
				int qtyhi=Integer.parseInt(request.getParameter("hiqty"));
				int warid=Integer.parseInt(request.getParameter("edware"));
				
			    List<Stock_Balance> balList= balanceservice.selectAll();
				request.setAttribute("stock_balance", balList);
				 Stock_Balance stockbal=new Stock_Balance();
				if(merid==himerid){
				  
						  for(Stock_Balance sb:balList){
							  if(merid==sb.getMerchandise_id() && warid==sb.getWarehouse_id())
							  {
								  int balid=sb.getStock_balance_id();
								  int balqty=sb.getQty();
								  
								  if(qtyhi>qty){
									  
									int newqty=qtyhi-qty;
									
									  int newbal=balqty+newqty;
									  stockbal.setQty(newbal);//balance qty
									  stockbal.setStock_balance_id(balid);
									  balanceservice.edit(stockbal);
									  
									  //detail edits
									  	
									    std.setStockoutdetail_id(Integer.parseInt(request.getParameter("stock_out_detail_id")));
										std.setMerchandise_id(merid);
										//std.setMerchandise(request.getParameter("Merchandise"));
										std.setQty(qty);
										std.setSubunit(Integer.parseInt(request.getParameter("cbosubunit")));
										std.setRemark(request.getParameter("txtRemark"));
										std.setFlag(Integer.parseInt(request.getParameter("txtFlag")));
										stockoutdetailService.edit(std);
								  }
								  else if(qtyhi<qty){
									 int qty1=qty-qtyhi;
									    std.setStockoutdetail_id(Integer.parseInt(request.getParameter("stock_out_detail_id")));
										std.setMerchandise_id(merid);
										//std.setMerchandise(request.getParameter("Merchandise"));
										std.setQty(qty);
										std.setSubunit(Integer.parseInt(request.getParameter("cbosubunit")));
										std.setRemark(request.getParameter("txtRemark"));
										std.setFlag(Integer.parseInt(request.getParameter("txtFlag")));
										stockoutdetailService.edit(std);
										
									  int newbal=balqty-qty1;
									  stockbal.setQty(newbal);//balance qty
									  stockbal.setStock_balance_id(balid);
									  balanceservice.edit(stockbal);
									    
										
								  }
								  else if(qtyhi==qty){
									  std.setStockoutdetail_id(Integer.parseInt(request.getParameter("stock_out_detail_id")));
										std.setMerchandise_id(merid);
										//std.setMerchandise(request.getParameter("Merchandise"));
										std.setQty(qty);
										std.setSubunit(Integer.parseInt(request.getParameter("cbosubunit")));
										std.setRemark(request.getParameter("txtRemark"));
										std.setFlag(Integer.parseInt(request.getParameter("txtFlag")));
										stockoutdetailService.edit(std);
									  
								  }
							  }
					  }
				
				
				}
				else if(merid!=himerid){
					 System.out.println("not equal");
					 
					 for(Stock_Balance sb:balList){
						  if(himerid==sb.getMerchandise_id() && warid==sb.getWarehouse_id()){
							  int balid=sb.getStock_balance_id();
							  int balqty=sb.getQty();
							  int newbal=qtyhi+balqty;
							  stockbal.setQty(newbal);
							  stockbal.setStock_balance_id(balid);
							  balanceservice.edit(stockbal);
						  }
					 }
					 
					 for(Stock_Balance sb:balList){
						  if(merid==sb.getMerchandise_id() && warid==sb.getWarehouse_id()){
							  	std.setStockoutdetail_id(Integer.parseInt(request.getParameter("stock_out_detail_id")));
								std.setMerchandise_id(merid);
								//std.setMerchandise(request.getParameter("Merchandise"));
								std.setQty(qty);
								std.setSubunit(Integer.parseInt(request.getParameter("cbosubunit")));
								std.setRemark(request.getParameter("txtRemark"));
								std.setFlag(Integer.parseInt(request.getParameter("txtFlag")));
								stockoutdetailService.edit(std);  
								
								int balid=sb.getStock_balance_id();
							    int balqty=sb.getQty();
								int newbal=balqty-qty;
								stockbal.setQty(newbal);
								stockbal.setStock_balance_id(balid);
								balanceservice.edit(stockbal);
						  }
					 }
					
				}
				
				int stock_out_id = Integer.parseInt(request.getParameter("stockid"));
				Stock_out sto=(Stock_out) stock_outService.selectStock_out(stock_out_id);
			
				request.setAttribute("stock_out", sto);
				session.setAttribute("stock", stock_out_id);
				
				List<StockoutDetail> stockoutdetialList = stockoutdetailService.selectAll();
				List<Warehouse> warehouselist = WarehouseService.selectAll();
				List<Customer> customerList = customerService.selectAll();
				List<Category> categoryList = category_service.selectAll();
				List<Sub_category> subcat=sub_category_service.selectAll();
				List<Brand> bl = brandService.selectAll();
				List<Merchandise> merchandiseList = manager.selectAll();
				List<SubUnit> subunitlist = subunitService.selectAll();
				List<SubCategoryAndBrand> sub_cat_brandList=sub_category_brandservice.selectAll();
			    List<Merchandise_Brand> merchandisebrandList=merchandise_brandservice.selectAll();
			    List<Subunit_Merchandise> subunit_subcategoryList=subunit_subcategoryservice.selectAll();
			    List<Stock_Balance> balancelist=balanceservice.selectAll();
			    List<StockoutDetail> detailvou = stockoutdetailService.selectAllVou(stock_out_id);
			    
				request.setAttribute("voucher", detailvou);
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
				
			
				page = "/presentation/stockoutview.jsp";
			}
		
			else if(param.equals("delete")){
				String uname = (String) session.getAttribute("uname");
				int uid = (Integer) (session.getAttribute("uid"));
				session.setAttribute("uid", uid);
				session.setAttribute("uname", uname);
				
				int stock_detail_id=Integer.parseInt(request.getParameter("uid"));
				stockoutdetailService.remove(stock_detail_id);
				
			
				int stock_out_id=Integer.parseInt(request.getParameter("id"));
				Stock_out sto=(Stock_out) stock_outService.selectStock_out(stock_out_id);
				
				List<StockoutDetail> detailvou = stockoutdetailService.selectAllVou(stock_out_id);
				request.setAttribute("voucher", detailvou);
				
				request.setAttribute("stock_out", sto);
				session.setAttribute("stock", stock_out_id);
				
				List<StockoutDetail> stockoutdetialList = stockoutdetailService.selectAll();
				List<Warehouse> warehouselist = WarehouseService.selectAll();
				List<Customer> customerList = customerService.selectAll();
				List<Category> categoryList = category_service.selectAll();
				List<Sub_category> subcat=sub_category_service.selectAll();
				List<Brand> bl = brandService.selectAll();
				List<Merchandise> merchandiseList = manager.selectAll();
				List<StockoutDetail> stockoutdetaillist=stockoutdetailService.selectAll();
				List<SubUnit> subunitlist = subunitService.selectAll();
				List<SubCategoryAndBrand> sub_cat_brandList=sub_category_brandservice.selectAll();
			    List<Merchandise_Brand> merchandisebrandList=merchandise_brandservice.selectAll();
			    List<Subunit_Merchandise> subunit_subcategoryList=subunit_subcategoryservice.selectAll();
			    List<Stock_Balance> balancelist=balanceservice.selectAll();
			    
				request.setAttribute("voucher", detailvou);
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
				request.setAttribute("stockoutdetail",stockoutdetaillist);
				request.setAttribute("warehouse", warehouselist);
				
				page = "/presentation/stockoutview.jsp";
			}
			
			else if(param.equals("submit")){
				String uname = (String) session.getAttribute("uname");
				int uid = (Integer) (session.getAttribute("uid"));
				session.setAttribute("uid", uid);
				session.setAttribute("uname", uname);
				
				int stock_out_id=Integer.parseInt(request.getParameter("stock"));
				Stock_out sto=(Stock_out) stock_outService.selectStock_out(stock_out_id);
				request.setAttribute("stock_out", sto);
				
				
				String remark=request.getParameter("rema");
				String voucher=request.getParameter("vou");
				
				String[] merchandise=request.getParameterValues("cboMerchandise");
				String[] merchandiseid=request.getParameterValues("merid");
				String[] qty=request.getParameterValues("arrtxtQty");
			    String[] subunit=request.getParameterValues("cbosubunit");
			    
			  
			    List<StockoutDetail> stdList=new ArrayList<StockoutDetail>();
			 
			    for(int i=0; i<merchandiseid.length;i++){
			    	StockoutDetail stockd=new StockoutDetail();
			    	int merid=Integer.parseInt(merchandiseid[i]);
			    	String mer=merchandise[i];
			    	int sqty=Integer.parseInt(qty[i]);
			    	int su=Integer.parseInt(subunit[i]);
    		
			    stockd.setStockoutid(stock_out_id);
			   // stockd.setMerchandise(mer);
			    stockd.setMerchandise_id(merid);
			    stockd.setQty(sqty);
			    stockd.setSubunit(su);
			    stockd.setVoucherno(voucher);
			    stockd.setRemark(remark);
			    stockd.setCreated_user_id(uid);
			    stockd.setModified_user_id(uid);
			    stockd.setFlag(1);
				stdList.add(stockd);

			    	  
			    }
			    stockoutdetailService.entry( stdList);
			  
			  //<----Stock Balance--->
		    
		     
			  String[]merid=request.getParameterValues("merid");
			  String[]qtybal=request.getParameterValues("arrtxtQty");
			  int warid=Integer.parseInt(request.getParameter("ware"));
			
			  Stock_Balance stockbal=new Stock_Balance();
			  for(int i=0;i<merid.length;i++){	
				  int zmerid=0;
				  int zqtybal=0;
				  zmerid=Integer.parseInt(merid[i]);
				  zqtybal=Integer.parseInt(qtybal[i]);
				  List<Stock_Balance> balList= balanceservice.selectAll();
				  request.setAttribute("stock_balance", balList);
				  for(Stock_Balance sb:balList){
					  if(zmerid==sb.getMerchandise_id() && warid==sb.getWarehouse_id())
					  {
						  int balid=sb.getStock_balance_id();
						  int balqty=sb.getQty();			
						  int newbal=balqty-zqtybal;
						  stockbal.setQty(newbal);
						  stockbal.setStock_balance_id(balid);
						  balanceservice.edit(stockbal);
					  }
				  }
				
				
			  }
				
				List<StockoutDetail> stockoutdetialList = stockoutdetailService.selectAll();
				List<Warehouse> warehouselist = WarehouseService.selectAll();
				List<Customer> customerList = customerService.selectAll();
				List<Category> categoryList = category_service.selectAll();
				List<Sub_category> subcat=sub_category_service.selectAll();
				List<Brand> bl = brandService.selectAll();
				List<Merchandise> merchandiseList = manager.selectAll();
				List<StockoutDetail> stockoutdetaillist=stockoutdetailService.selectAll();
				List<SubUnit> subunitlist = subunitService.selectAll();
				List<SubCategoryAndBrand> sub_cat_brandList=sub_category_brandservice.selectAll();
			    List<Merchandise_Brand> merchandisebrandList=merchandise_brandservice.selectAll();
			    List<Subunit_Merchandise> subunit_subcategoryList=subunit_subcategoryservice.selectAll();
			    List<Stock_Balance> balancelist=balanceservice.selectAll();
			    List<StockoutDetail> detailvou = stockoutdetailService.selectAllVou(stock_out_id);
			    
				request.setAttribute("voucher", detailvou);
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
				request.setAttribute("stockoutdetail",stockoutdetaillist);
				request.setAttribute("warehouse", warehouselist);
			
				page = "/presentation/stockoutview.jsp";
			}
			else if(param.equals("Search")){
				String startdtxt=request.getParameter("startdtxt");
				String enddtxt=request.getParameter("enddtxt");
				System.out.println(startdtxt+"   start date\t end date is "+enddtxt);
			
				String uname = (String) session.getAttribute("uname");
				int uid = (Integer) (session.getAttribute("uid"));
				session.setAttribute("uid", uid);
				session.setAttribute("uname", uname);
				List<Stock_out> stock_inList = stock_outService.selectAll();
				List<SubCategoryAndBrand> sub_cat_brandList = sub_category_brandservice.selectAll();
				List<StockoutDetail> stdList = stockoutdetailService.selectAll();
				List<Warehouse> warehouselist = WarehouseService.selectAll();
				
				
				request.setAttribute("stockindetail", stdList);
				request.setAttribute("sub_cat_brand", sub_cat_brandList);
				request.setAttribute("stock_in", stock_inList);
				
				request.setAttribute("warehouse", warehouselist);
				request.setAttribute("start", startdtxt);
				request.setAttribute("end", enddtxt);
				request.setAttribute("search", "search");
				page="/presentation/stockOutDetail.jsp";
			}
			
			else if(param.equals("Daily"))
			{
				
				
				String uname = (String) session.getAttribute("uname");
				int uid = (Integer) (session.getAttribute("uid"));
				session.setAttribute("uid", uid);
				session.setAttribute("uname", uname);
				
				String startdtxt=request.getParameter("startdtxt");
				System.out.println(startdtxt+"   start date");
				
				List<StockoutDetail> stockoutdetialList = stockoutdetailService.selectAll();
				List<Warehouse> warehouselist = WarehouseService.selectAll();
				List<Customer> customerList = customerService.selectAll();
				List<Category> categoryList = category_service.selectAll();
				List<Sub_category> subcat=sub_category_service.selectAll();
				List<Brand> bl = brandService.selectAll();
				List<Merchandise> merchandiseList = manager.selectAll();
				List<StockoutDetail> stockoutdetaillist=stockoutdetailService.selectAll();
				List<SubUnit> subunitlist = subunitService.selectAll();
				List<SubCategoryAndBrand> sub_cat_brandList=sub_category_brandservice.selectAll();
			    List<Merchandise_Brand> merchandisebrandList=merchandise_brandservice.selectAll();
			    List<Subunit_Merchandise> subunit_subcategoryList=subunit_subcategoryservice.selectAll();
			    List<Stock_Balance> balancelist=balanceservice.selectAll();
			  
			    
				
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
				request.setAttribute("stockoutdetail",stockoutdetaillist);
				request.setAttribute("warehouse", warehouselist);
				request.setAttribute("start", startdtxt);
				request.setAttribute("search", "search");
				
				page="/presentation/stockOutreport.jsp";
			}
			//DAILY MERCAHANDISE REPORT
			else if(param.equals("DailyMerchandise"))
			{
				String uname = (String) session.getAttribute("uname");
				int uid = (Integer) (session.getAttribute("uid"));
				session.setAttribute("uid", uid);
				session.setAttribute("uname", uname);
				
				String startdtxt=request.getParameter("startdtxt");
				System.out.println(startdtxt+"   start date");
				
				List<StockoutDetail> stockoutdetialList = stockoutdetailService.selectAll();
				List<Warehouse> warehouselist = WarehouseService.selectAll();
				List<Customer> customerList = customerService.selectAll();
				List<Category> categoryList = category_service.selectAll();
				List<Sub_category> subcat=sub_category_service.selectAll();
				List<Brand> bl = brandService.selectAll();
				List<Merchandise> merchandiseList = manager.selectAll();
				List<StockoutDetail> stockoutdetaillist=stockoutdetailService.selectAll();
				List<SubUnit> subunitlist = subunitService.selectAll();
				List<SubCategoryAndBrand> sub_cat_brandList=sub_category_brandservice.selectAll();
			    List<Merchandise_Brand> merchandisebrandList=merchandise_brandservice.selectAll();
			    List<Subunit_Merchandise> subunit_subcategoryList=subunit_subcategoryservice.selectAll();
			    List<Stock_Balance> balancelist=balanceservice.selectAll();
			  
			    
				
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
				request.setAttribute("stockoutdetail",stockoutdetaillist);
				request.setAttribute("warehouse", warehouselist);
				request.setAttribute("start", startdtxt);
				request.setAttribute("search", "search");
				
				page="/presentation/dailyout.jsp";
			}
			
			else if(param.equals("excelform")){
				List<StockoutDetail> stdList = stockoutdetailService.selectAll();
				request.setAttribute("stockindetail", stdList);
				page="/presentation/excel_warehouse_stockin.jsp";
			}
			//SUM MERCHANDISE FORM
			
			else if(param.equals("TotalQuantity")){
				
				List<StockoutDetail> stdList = stockoutdetailService.selectAll();
				
				request.setAttribute("stockoutdetail", stdList);
				request.setAttribute("merchandiseID", "");
				page="/presentation/stockOutSumMer.jsp";
			}
			else if(param.equals("filterMerchandise")){
				int merchandiseId=Integer.parseInt(request.getParameter("merchandiseid"));
				int sumqty=0;
				List<StockoutDetail> stdList = stockoutdetailService.selectAll();
				System.out.println("Merchandise ID:"+merchandiseId);
				
				//String[] mer=request.getParameterValues("");
				if(merchandiseId==0){
					request.setAttribute("merchandiseID", "");
					
					request.setAttribute("stockoutdetail",stdList);
					page="/presentation/stockOutSumMer.jsp";
					
				}else{
					
					List<StockoutDetail> stockoutdetialList=stockoutdetailService.selectStockOutSumMerchandise(merchandiseId);

					request.setAttribute("stockoutdetail",stockoutdetialList);
				 
					for(StockoutDetail sout:stdList)
					{
						if(merchandiseId==sout.getMerchandise_id()){
							int zqty=sout.getQty();
							sumqty=sumqty+zqty;
							
						}
						
						
					}
					System.out.println("Quantity Value:"+merchandiseId+"......"+sumqty);
					request.setAttribute("SumQty",sumqty);
					request.setAttribute("merchandiseID", merchandiseId);
					page="/presentation/NewFile2.jsp";
				}
				
			}
			/*else if(param.equals("StockoutOrder")){
			List<StockoutDetail> stdList = stockoutdetailService.selectAll();
			List<StockoutDetail> sorder = stockoutdetailService.selectOrder();
			request.setAttribute("order", sorder);
			for(StockoutDetail sd:sorder){
				System.out.println("Order Quantity:"+sd.getQty());
				
				request.setAttribute("stockoutdetail",stdList);	
				
			}
				
			page="/presentation/stockoutorder.jsp";
		}*/
		else  if(param.equals("export")){
			List<StockoutDetail> stdList = stockoutdetailService.selectAll();
			request.setAttribute("sin1", stdList);
			List<Stock_out> stock_inList = stock_outService.selectAll();
			request.setAttribute("stock_in", stock_inList);
			page = "/presentation/soutdetailexcel.jsp";
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

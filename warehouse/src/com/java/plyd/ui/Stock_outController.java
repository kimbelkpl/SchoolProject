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
 * Servlet implementation class Stock_outController
 */
@WebServlet("/Stock_outController")
public class Stock_outController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Stock_outController() {
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
		IStock_inService  stock_inService= (IStock_inService) SpringBeanFactory
				.getBean("Stock_inService");
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
		IDamageService damageservice=(IDamageService) SpringBeanFactory
				.getBean("DamageService");
		IStock_InDetailService stdservice=(IStock_InDetailService) SpringBeanFactory
				.getBean("Stock_InDetailService");
		
		HttpSession session = request.getSession();
		
		Stock_out st = new Stock_out();
		
		String page = null;
		String param = request.getParameter("page");
		System.out.println(param + "Page");
		String ex="";
		int j=0;
		String name="";
		int stockoutid=0;
	
			System.out.println("Submit is working");
			
			if (param.equals("stockoutform")) {
				// passing current user
				System.out.println("stockoutform");
				String uname = (String) session.getAttribute("uname");
				int uid = (Integer) (session.getAttribute("uid"));
				session.setAttribute("uid", uid);
				session.setAttribute("uname", uname);
				
				List<Customer> customerList = customerService.selectAllOn();
				List<Category> categoryList = category_service.selectAll();
				List<Sub_category> subcat=sub_category_service.selectAll();
				List<Brand> bl = brandService.selectAll();
				List<Merchandise> merchandiseList = manager.selectAll();
				List<SubUnit> subunitlist = subunitService.selectAll();
			    List<Warehouse> warehouselist = WarehouseService.selectAll();
			    List<Stock_Balance> balancelist=balanceservice.selectAll();
			    List<SubCategoryAndBrand> sub_cat_brandList=sub_category_brandservice.selectAll();
			    List<Merchandise_Brand> merchandisebrandList=merchandise_brandservice.selectAll();
			    List<Subunit_Merchandise> subunit_subcategoryList=subunit_subcategoryservice.selectAll();
			    List<Damage> list=damageservice.selectAll();
			    for(Damage d:list){
			    	System.out.println("this is damage"+d.getDamage_id());
			    }
			    List<Customer> customerList1=customerService.selectAll();
			    request.setAttribute("customerList1", customerList1);
			    request.setAttribute("unit_category", subunit_subcategoryList);
			    request.setAttribute("merchandise_brand", merchandisebrandList);
				request.setAttribute("sub_cat_brand",sub_cat_brandList);
				request.setAttribute("balanceList",balancelist);
				request.setAttribute("sub_cate",subcat);
				request.setAttribute("subunit",subunitlist);
				request.setAttribute("category", categoryList);
				request.setAttribute("bl", bl);
				request.setAttribute("merchandise", merchandiseList);
				request.setAttribute("customer", customerList);
			    request.setAttribute("warehouse", warehouselist);
				
				page = "/presentation/Stockout.jsp";
			}
		
			//Add new merchandise with a voucher
			else if (param.equals("Submit")) {
				    System.out.println("this is working stock out");
				    String uname = (String) session.getAttribute("uname");
					int uid = (Integer) (session.getAttribute("uid"));
					session.setAttribute("uid", uid);
					session.setAttribute("uname", uname);
					
					String dat=request.getParameter("datePickerStockOut");
				    int fromwarehouse=Integer.parseInt(request.getParameter("cboWarehouse"));
					String type=request.getParameter("ty");
					int cust=Integer.parseInt(request.getParameter("cboName"));
					String re=request.getParameter("txtRemark");
					
					//To customer
					if(type.equals("To Customer")){
						System.out.println("this is customer");
						st.setStock_out_date(dat);
						st.setFromwarehouse_id(fromwarehouse);
						st.setTowarehouse_id(0);
						st.setCustomer_id(cust);
						st.setVr_no(request.getParameter("Vo"));
						st.setRemark(re);
						st.setCreateUserId(uid);
						st.setModifiedUserId(uid);
						st.setFlag(1);
				
					
						
						//refresh
						List<Stock_out> stockoutlist=stock_outService.selectAll();		
						if(j==1){
							ex="1";
							name=dat;
						}
						else{
							ex="2";
						 stockoutid=(int) stock_outService.entry(st); 
						}
						String typeindex=request.getParameter("hidtype");
						List<Stock_out> outlist=stock_outService.selectAll();
						request.setAttribute("st_out", outlist);
						request.setAttribute("exist",ex);
						request.setAttribute("contype", typeindex);
						request.setAttribute("date", request.getParameter("datePickerStockOut"));
						request.setAttribute("f", request.getParameter("cboWarehouse"));
						request.setAttribute("type", request.getParameter("ty"));
						request.setAttribute("sel", request.getParameter("cboName"));
						request.setAttribute("vou", request.getParameter("Vo"));
						request.setAttribute("remar", request.getParameter("txtRemark"));
						String[] merchandiseid=request.getParameterValues("merid");
						//String[] merchandise=request.getParameterValues("arrMerchandise");
						String[] qty=request.getParameterValues("arrtxtQty");
						String[] subunit=request.getParameterValues("cbosubunit");
						String[] voucher=request.getParameterValues("Vo");
						String[] remark=request.getParameterValues("txtRemark");
					  
						List<StockoutDetail> stdList=new ArrayList<StockoutDetail>();
				 
						for(int i=0; i<merchandiseid.length;i++){
				    	
				    		 StockoutDetail std=new StockoutDetail();
				    	  
				    		 //String zmerchandise=merchandise[i];
				    		 int zmerchandiseid=Integer.parseInt(merchandiseid[i]);
				    		 int zqty=Integer.parseInt(qty[i]);
				    		 int zsubunit=Integer.parseInt(subunit[i]);
				    		 String zremark=remark[i];
				    		 String zvoucher=voucher[i];
							 std.setStockoutid(stockoutid);
							 //std.setMerchandise(zmerchandise);
							 std.setMerchandise_id(zmerchandiseid);
							 std.setQty(zqty);
					    	std.setSubunit(zsubunit);
					    	 std.setRemark(zremark);
					    	 std.setVoucherno(zvoucher);
					    	 std.setCreated_user_id(uid);
					    	 std.setModified_user_id(uid);
					    	 std.setFlag(1);
					    	 stdList.add(std);

				    	  
				    }
				    stockoutdetailService.entry( stdList);
				  System.out.println("end of submit add");
				  
			
				  
				  //<----Stock Balance--->
				    System.out.println("It is not Working");
			     
				  String[]merid=request.getParameterValues("merid");
				  String[]qtybal=request.getParameterValues("arrtxtQty");
				  int warid=Integer.parseInt(request.getParameter("cboFromWarehouse"));
				  request.setAttribute("warid", warid);
				
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
				  
				  
				}
				
					//To Warehouse
					else if(type.equals("To Warehouse")){
						System.out.println("Warehouse to house");
						st.setStock_out_date(dat);
						st.setFromwarehouse_id(fromwarehouse);
						st.setTowarehouse_id(cust);
						st.setCustomer_id(0);
						st.setVr_no(request.getParameter("Vo"));
						st.setRemark(re);
						st.setCreateUserId(uid);
						st.setModifiedUserId(uid);
						st.setFlag(1);
				
					
						//refresh
						List<Stock_out> stockoutlist=stock_outService.selectAll();
						
						if(j==1){
							ex="1";
							name=dat;
						}
						else{
							ex="2";
						 stockoutid=(int) stock_outService.entry(st); 
						}
						
						
						String[] merchandiseid=request.getParameterValues("merid");
						//String[] merchandise=request.getParameterValues("arrMerchandise");
						String[] qty=request.getParameterValues("arrtxtQty");
						String[] subunit=request.getParameterValues("cbosubunit");
						String[] voucher=request.getParameterValues("Vo");
						String[] remark=request.getParameterValues("txtRemark");
					  
						List<StockoutDetail> stdList=new ArrayList<StockoutDetail>();
				 
						for(int i=0; i<merchandiseid.length;i++){
				    	
				    		 StockoutDetail std=new StockoutDetail();
				    	  
				    		 //String zmerchandise=merchandise[i];
				    		 int zmerchandiseid=Integer.parseInt(merchandiseid[i]);
				    		 int zqty=Integer.parseInt(qty[i]);
				    		 int zsubunit=Integer.parseInt(subunit[i]);
				    		 String zremark=remark[i];
				    		 String zvoucher=voucher[i];
							 std.setStockoutid(stockoutid);
							 //std.setMerchandise(zmerchandise);
							 std.setMerchandise_id(zmerchandiseid);
							 std.setQty(zqty);
					    	 std.setSubunit(zsubunit);
					    	 std.setRemark(zremark);
					    	 std.setVoucherno(zvoucher);
					    	 std.setCreated_user_id(uid);
					    	 std.setModified_user_id(uid);
					    	 std.setFlag(1);
					    	 stdList.add(std);

				    	  
				    }
				    stockoutdetailService.entry( stdList);
				  System.out.println("end of submit add");
				  
			
				  
				  //<----Stock Balance--->
				    System.out.println("It is not Working");
			     
				  String[]merid=request.getParameterValues("merid");
				  String[]qtybal=request.getParameterValues("arrtxtQty");
				  int warid=Integer.parseInt(request.getParameter("cboFromWarehouse"));
				
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
				    Stock_in stock=new Stock_in();
				    stock.setConarridate("-");	
					stock.setStockIndate(dat);
					stock.setSupId(0);
					stock.setVr_no(request.getParameter("Vo"));
					stock.setWarId(cust);
					stock.setRemark("From other warehose");
					stock.setCreateUserId(uid);
					stock.setModifiedUserId(uid);
					stock.setFlag(1);
					int stock_in_id=(int) stock_inService.entry(stock);
					
					//stock in detail insert
					List<Stock_InDetail> stdeailList=new ArrayList<Stock_InDetail>();
					for(int i=0;i<merchandiseid.length;i++){
					
						Stock_InDetail stdeail=new Stock_InDetail();
						
						//String zmerchandise=merchandise[i];
						int zmerchandiseid=Integer.parseInt(merchandiseid[i]);
						int zqty=Integer.parseInt(qty[i]);
						int zsubunit=Integer.parseInt(subunit[i]);
						String zremark=remark[i];
						String zvoucher=voucher[i];
					
					    stdeail.setStock_in_id(stock_in_id);
					    //stdeail.setMerchandise_name(zmerchandise);
					    stdeail.setMerchandise_id(zmerchandiseid);
					    stdeail.setQty(zqty);
					    stdeail.setSub_unit_id(zsubunit);
					    stdeail.setRemark(zremark);
					    stdeail.setVoucher_no(zvoucher);
					    stdeail.setCreated_user_id(uid);
					    stdeail.setModified_user_id(uid);
					    stdeail.setFlag(1);
					    stdeailList.add(stdeail);
				}
				stdservice.entry(stdeailList);
				
				//Stock in detail Balance
				 int towareid=Integer.parseInt(request.getParameter("towareid"));
				for(int i=0;i<merid.length;i++){
					
				   int zmerid=Integer.parseInt(merid[i]);
				   int zqtybal=Integer.parseInt(qtybal[i]);
				   List<Stock_Balance> balList=balanceservice.selectAll();
				   Stock_Balance stockba=new Stock_Balance();
					for(Stock_Balance sb:balList){
					   if(zmerid==sb.getMerchandise_id() && towareid==sb.getWarehouse_id()){
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
				  
				}
					//Damage Merchandise
					else if(type.equals("Damage")){
						System.out.println("damage");
						String[] merchandiseid=request.getParameterValues("merid");
						String[] merchandise=request.getParameterValues("arrMerchandise");
						String[] qty=request.getParameterValues("arrtxtQty");
						String[] subunit=request.getParameterValues("cbosubunit");
						String[] voucher=request.getParameterValues("Vo");
						String[] remark=request.getParameterValues("txtRemark");
					  
						List<Damage> dmlist=new ArrayList<Damage>();
				        Damage d=new Damage();
						for(int i=0; i<merchandiseid.length;i++){
				    	
				    		 StockoutDetail std=new StockoutDetail();
				    	  
				    		 String zmerchandise=merchandise[i];
				    		 int zmerchandiseid=Integer.parseInt(merchandiseid[i]);
				    		 int zqty=Integer.parseInt(qty[i]);
				    		 String zsubunit=subunit[i];
				    		 String zremark=remark[i];
				    		 
				    		 d.setDamage_date(request.getParameter("datePickerStockOut"));
							 d.setMerchandise(zmerchandise);
							 d.setMerchandise_id(zmerchandiseid);
							 d.setQty(zqty);
					    	 d.setSubunit(zsubunit);
					    	 d.setRemark(zremark);
					         d.setCreated_user_id(uid);
					    	 d.setModified_user_id(uid);
					    	 d.setFlag(1);
					    	 dmlist.add(d);

				    	  
				    }
						damageservice.entry(dmlist);
				  System.out.println("end of submit add");
				  
			
				  
				  //<----Stock Balance--->
				    System.out.println("It is not Working");
			     
				  String[]merid=request.getParameterValues("merid");
				  String[]qtybal=request.getParameterValues("arrtxtQty");
				  int warid=Integer.parseInt(request.getParameter("cboFromWarehouse"));
				
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
					}
					
				  	List<Warehouse> warehouselist = WarehouseService.selectAll();
					List<Customer> customerList = customerService.selectAllOn();
					List<Category> categoryList = category_service.selectAll();
					List<Sub_category> subcat=sub_category_service.selectAll();
					List<Brand> bl = brandService.selectAll();
					List<Merchandise> merchandiseList = manager.selectAll();
					List<SubUnit> subunitlist = subunitService.selectAll();
					List<SubCategoryAndBrand> sub_cat_brandList=sub_category_brandservice.selectAll();
				    List<Merchandise_Brand> merchandisebrandList=merchandise_brandservice.selectAll();
				    List<Stock_Balance> balancelist=balanceservice.selectAll();
				    List<Subunit_Merchandise> subunit_subcategoryList=subunit_subcategoryservice.selectAll();
				    List<Customer> customerList1=customerService.selectAll();
				    request.setAttribute("customerList1", customerList1);
				    request.setAttribute("unit_category", subunit_subcategoryList);
				    request.setAttribute("balanceList",balancelist);
				    request.setAttribute("merchandise_brand", merchandisebrandList);
					request.setAttribute("sub_cat_brand",sub_cat_brandList);
					request.setAttribute("warehouse", warehouselist);
					request.setAttribute("sub_cate",subcat);
					request.setAttribute("category", categoryList);
					request.setAttribute("bl", bl);
					request.setAttribute("merchandise", merchandiseList);
					request.setAttribute("customer", customerList);
					request.setAttribute("subunit",subunitlist);
			
				  page = "/presentation/Stockout.jsp";

			//	page="/presentation/notfound.jsp";
				}
			
			
			else if (param.equals("remove")) {
				String uname = (String) session.getAttribute("uname");
				int uid = (Integer) (session.getAttribute("uid"));
				session.setAttribute("uid", uid);
				session.setAttribute("uname", uname);
				
				int stockoutId = Integer.parseInt(request.getParameter("stock_outid"));
				stock_outService.remove(stockoutId);
				
				List<Warehouse> warehouselist = WarehouseService.selectAll();
				List<SubUnit> subunitlist = subunitService.selectAll();
				List<Customer> customerList = customerService.selectAllOn();
				List<Category> categoryList = category_service.selectAll();
				List<Sub_category> subcat=sub_category_service.selectAll();
				List<Brand> bl = brandService.selectAll();
				List<Merchandise> merchandiseList = manager.selectAll();
				List<StockoutDetail> stockoutdetaillist=stockoutdetailService.selectAll();
				List<SubCategoryAndBrand> sub_cat_brandList=sub_category_brandservice.selectAll();
			    List<Merchandise_Brand> merchandisebrandList=merchandise_brandservice.selectAll();
			    List<SubCategoryAndBrand> sub_cat_brandList1=sub_category_brandservice.selectAll();
			    List<Merchandise_Brand> merchandisebrandList1=merchandise_brandservice.selectAll();
			    List<Stock_out> stock_outList = stock_outService.selectAll();
			    List<Subunit_Merchandise> subunit_subcategoryList=subunit_subcategoryservice.selectAll();
			    List<Stock_Balance> balancelist=balanceservice.selectAll();
			    List<Customer> customerList1=customerService.selectAll();
			    request.setAttribute("customerList1", customerList1);
			    request.setAttribute("balanceList",balancelist);
			    request.setAttribute("unit_category", subunit_subcategoryList);
			    request.setAttribute("merchandise_brand", merchandisebrandList1);
				request.setAttribute("sub_cat_brand",sub_cat_brandList1);		
				request.setAttribute("subunit",subunitlist);
				request.setAttribute("stock_out", stock_outList);
				request.setAttribute("sub_cate",subcat);
				request.setAttribute("category", categoryList);
				request.setAttribute("bl", bl);
				request.setAttribute("merchandise", merchandiseList);
				request.setAttribute("customer", customerList);
				request.setAttribute("warehouse", warehouselist);
				request.setAttribute("stockoutdetail",stockoutdetaillist);
				page = "/presentation/Stockout.jsp";
			}
			
			else if(param.equals("Edit")){
				String uname = (String) session.getAttribute("uname");
				int uid = (Integer) (session.getAttribute("uid"));
				session.setAttribute("uid", uid);
				session.setAttribute("uname", uname);
				
			
				int fromwarehouse=Integer.parseInt(request.getParameter("cboWarehouse"));
				int towarehouse=Integer.parseInt(request.getParameter("cboToWarehouse"));
				int  cust=Integer.parseInt(request.getParameter("cboCustomer"));
	
				st.setStock_out_id(Integer.parseInt(request.getParameter("stock_outid")));
				st.setStock_out_date(request.getParameter("datePickerStockOut"));
				st.setFromwarehouse_id(fromwarehouse);
				st.setTowarehouse_id(towarehouse);
				st.setCustomer_id(cust);
				st.setVr_no(request.getParameter("Vo"));
				st.setRemark(request.getParameter("txtRemark"));
				st.setFlag(Integer.parseInt(request.getParameter("txtFlag")));
				stock_outService.edit(st);
				
				List<Warehouse> warehouselist = WarehouseService.selectAll();
				List<Customer> customerList = customerService.selectAllOn();
				List<Category> categoryList = category_service.selectAll();
				List<Sub_category> subcat=sub_category_service.selectAll();
				List<Brand> bl = brandService.selectAll();
				List<Merchandise> merchandiseList = manager.selectAll();
				List<Stock_out> userList = stock_outService.selectAll();
				List<StockoutDetail> stockoutdetaillist=stockoutdetailService.selectAll();
				List<SubUnit> subunitlist = subunitService.selectAll();
				List<SubCategoryAndBrand> sub_cat_brandList=sub_category_brandservice.selectAll();
			    List<Merchandise_Brand> merchandisebrandList=merchandise_brandservice.selectAll();
			    List<Subunit_Merchandise> subunit_subcategoryList=subunit_subcategoryservice.selectAll();
			    List<Stock_Balance> balancelist=balanceservice.selectAll();
			    List<Customer> customerList1=customerService.selectAll();
			    request.setAttribute("customerList1", customerList1);
			    request.setAttribute("balanceList",balancelist);
			    request.setAttribute("unit_category", subunit_subcategoryList);
			    request.setAttribute("merchandise_brand", merchandisebrandList);
				request.setAttribute("sub_cat_brand",sub_cat_brandList);
				request.setAttribute("subunit",subunitlist);
				request.setAttribute("stock_out", userList);
				request.setAttribute("sub_cate",subcat);
				request.setAttribute("category", categoryList);
				request.setAttribute("bl", bl);
				request.setAttribute("merchandise", merchandiseList);
				request.setAttribute("customer", customerList);
				request.setAttribute("stockoutdetail",stockoutdetaillist);
				request.setAttribute("stock_out", userList);
				request.setAttribute("warehouse", warehouselist);
				
				page = "/presentation/Stockout.jsp";
			}
			else if (param.equals("view")) {
				/*String uname = (String) session.getAttribute("uname");
				int uid = (Integer) (session.getAttribute("uid"));
				session.setAttribute("uid", uid);
				session.setAttribute("uname", uname);*/
			
				int stock_out_id = Integer.parseInt(request.getParameter("voucher"));
				Stock_out sto=stock_outService.selectStock_out(stock_out_id);
				List<StockoutDetail> detailvou = stockoutdetailService.selectAllVou(stock_out_id);
				request.setAttribute("voucher", detailvou);
				
				request.setAttribute("stock_out", sto);
				session.setAttribute("stock", stock_out_id);
				
				List<StockoutDetail> stockoutdetialList = stockoutdetailService.selectAll();
				List<Warehouse> warehouselist = WarehouseService.selectAll();
				List<Customer> customerList = customerService.selectAllOn();
				
				List<Category> categoryList = category_service.selectAll();
				List<Sub_category> subcat=sub_category_service.selectAll();
				List<Brand> bl = brandService.selectAll();
				List<Merchandise> merchandiseList = manager.selectAll();
				List<SubUnit> subunitlist = subunitService.selectAll();
				List<SubCategoryAndBrand> sub_cat_brandList=sub_category_brandservice.selectAll();
			    List<Merchandise_Brand> merchandisebrandList=merchandise_brandservice.selectAll();
			    List<Subunit_Merchandise> subunit_subcategoryList=subunit_subcategoryservice.selectAll();
			    List<Stock_Balance> balancelist=balanceservice.selectAll();
			    List<Customer> customerList1=customerService.selectAll();
			    request.setAttribute("customerList1", customerList1);
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

			else if (param.equals("stockoutdetaillist")) {
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
				request.setAttribute("start", "other");
				request.setAttribute("end", "other");
				request.setAttribute("search", "other");
				request.setAttribute("warehouse", warehouselist);

				page = "/presentation/stockOutDetail.jsp";
			}
			
			else if(param.equals("DailyStockout"))
			{
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
				request.setAttribute("start", "other");
				request.setAttribute("end", "other");
				request.setAttribute("search", "other");
				request.setAttribute("warehouse", warehouselist);
				page = "/presentation/stockOutreport.jsp";
			}
			//DAILY MERCHANDISE REPORT FROM
			else if(param.equals("DailyMerchandise"))
			{
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
				request.setAttribute("start", "other");
				request.setAttribute("end", "other");
				request.setAttribute("search", "other");
				request.setAttribute("warehouse", warehouselist);
				page = "/presentation/dailyout.jsp";
			}
			else if (param.equals("StockoutOrder")) {
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
				request.setAttribute("start", "other");
				request.setAttribute("end", "other");
				request.setAttribute("search", "other");
				request.setAttribute("warehouse", warehouselist);

				page = "/presentation/stockoutorder.jsp";
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

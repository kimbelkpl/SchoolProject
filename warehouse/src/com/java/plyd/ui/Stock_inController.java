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

//import com.sun.xml.internal.bind.v2.schemagen.xmlschema.list;


/**
 * Servlet implementation class Stock_inController
 */
@WebServlet("/Stock_inController")
public class Stock_inController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Stock_inController() {
        super();
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
	    String ex="";
	    Boolean isEqual=false;
		int j=0;
		String name="";
		int stock_in_id=0;
		if(param.equals("load")){
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			
			
			
			List<Stock_in> stock_inList = stock_inService.selectAll();
			List<Category> categoryList= categoryService.selectAll();
			List<Sub_category> subcategoryList=sub_category_service.selectAll();
			List<Brand> brandList=brandService.selectAll();
			List<Merchandise> merchandiseList = manager.selectAll();
			List<Basicunit> bauList=basicservice.selectAll();
			List<SubUnit> subunitList=subunitService.selectAll();
			List<Warehouse> warehouseList = WarehouseService.selectAll();
			List<Supplier> supplierList = supplierService.selectAllOn();
			List<SubCategoryAndBrand> sub_cat_brandList=sub_category_brandservice.selectAll();
		    List<Merchandise_Brand> merchandisebrandList=merchandise_brandservice.selectAll();
		    List<Subunit_Merchandise> subunit_subcategoryList=subunit_subcategoryservice.selectAll();
		    for(Merchandise_Brand a:merchandisebrandList){
		    	System.out.println("haha"+a.getBrand_id());
		    }
		    System.out.println("jjhkafkadfsjk");
		    List<Supplier> supplierList1 = supplierService.selectAll();
		    request.setAttribute("supplierList1", supplierList1);
		    request.setAttribute("unit_category", subunit_subcategoryList);
		    request.setAttribute("merchandise_brand", merchandisebrandList);
			request.setAttribute("sub_cat_brand",sub_cat_brandList);
			request.setAttribute("supplier", supplierList);
			request.setAttribute("warehouse", warehouseList);
			request.setAttribute("subunit", subunitList);
			request.setAttribute("basicunit", bauList);
			request.setAttribute("merchandise", merchandiseList);
			request.setAttribute("brand", brandList);
			request.setAttribute("subcategory", subcategoryList);
			request.setAttribute("category",categoryList);
			request.setAttribute("stock_in", stock_inList);
			
			page="/presentation/stockIn.jsp";
			System.out.println("This is load ");
			
		}
		
		//Add New Merchandise With a Voucher
		else if (param.equals("submit")){
			
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
		
			System.out.println("Submit is working");
			Stock_in st = new Stock_in();
			
			String vou=request.getParameter("txtVoucherNo");
			String rema=request.getParameter("txtRemark");
			int war=Integer.parseInt(request.getParameter("cbowh"));
			String type=request.getParameter("ty");
			String dat=request.getParameter("datePickerStockIn");

				st.setConarridate(request.getParameter("datePickerConArn"));	
				st.setStockIndate(dat);
				st.setSupId(Integer.parseInt(request.getParameter("cboSupplier")));
				st.setVr_no(vou);
				st.setWarId(war);
				st.setRemark(rema);
				st.setCreateUserId(uid);
				st.setModifiedUserId(uid);
				st.setFlag(1);
			
				session.setAttribute("vou", vou);
				session.setAttribute("rema", rema);
				session.setAttribute("war", war);
			
				//refresh
				List<Stock_in> stockoutlist=stock_inService.selectAll();
				
				
				if(j==1){
					ex="1";
				}
				else{
					ex="2";
					stock_in_id=(int) stock_inService.entry(st); 
				}
				request.setAttribute("exist", ex);
				request.setAttribute("date",request.getParameter("datePickerConArn") );
				request.setAttribute("datein",request.getParameter("datePickerStockIn") );
				request.setAttribute("war",request.getParameter("cbowh"));
				request.setAttribute("sup", request.getParameter("cboSupplier"));
				request.setAttribute("remar",request.getParameter("txtRemark") );
				request.setAttribute("vou",request.getParameter("txtVoucherNo"));
				
				
		
		
				//String[] merchandise=request.getParameterValues("cboMerchandise");
				String[] merchandiseid=request.getParameterValues("merid");
				String[] qty=request.getParameterValues("arrtxtQty");
				String[] subunit=request.getParameterValues("cbosubunit");
				String[] remark=request.getParameterValues("txtRemark");
				String[] voucher=request.getParameterValues("txtVoucherNo");
			
				List<Stock_InDetail> stdList=new ArrayList<Stock_InDetail>();
				for(int i=0;i<merchandiseid.length;i++){
				
					Stock_InDetail std=new Stock_InDetail();
					
					//String zmerchandise=merchandise[i];
					int zmerchandiseid=Integer.parseInt(merchandiseid[i]);
					int zqty=Integer.parseInt(qty[i]);
					int zsubunit=Integer.parseInt(subunit[i]);
					String zremark=remark[i];
					String zvoucher=voucher[i];
				
				    std.setStock_in_id(stock_in_id);
		    		//std.setMerchandise_name(zmerchandise);
		    		std.setMerchandise_id(zmerchandiseid);
		    		std.setQty(zqty);
		    		std.setSub_unit_id(zsubunit);
		    		std.setRemark(zremark);
		    		std.setVoucher_no(zvoucher);
		    		std.setCreated_user_id(uid);
		    		std.setModified_user_id(uid);
		    		std.setFlag(1);
		    		stdList.add(std);
			}
			stdservice.entry(stdList);
			
			
			
			
			//<======Stock Balance=====>
			
			String[] merid=request.getParameterValues("merid");
			String[] qtybal=request.getParameterValues("arrtxtQty");
			//int warid=Integer.parseInt(request.getParameter("cboWarehouse"));
			int warid=Integer.parseInt(request.getParameter("cbowh"));
			
			
			
			System.out.println(warid+"    from jsp ");
			request.setAttribute("warid", warid);
			
			for(int i=0;i<merid.length;i++){
				
			   int zmerid=Integer.parseInt(merid[i]);
			   int zqtybal=Integer.parseInt(qtybal[i]);
			   System.out.println("This is zmerid this is loop"+i);
			   System.out.println("This is zqtybal this is loop"+i);
			   List<Stock_Balance> balList=balanceservice.selectAll();
			   Stock_Balance stockbal=new Stock_Balance();
				for(Stock_Balance sb:balList){
				   if(zmerid==sb.getMerchandise_id() && warid==sb.getWarehouse_id()){
					    int balid=sb.getStock_balance_id();
						int balqty=sb.getQty();
						int newbal=0;
					    newbal=zqtybal+balqty;
					    System.out.println("this is new qty"+newbal+"  warehouse latest id  "+sb.getWarehouse_id());
					    
					    stockbal.setQty(newbal);
					    stockbal.setStock_balance_id(balid);
					    isEqual=true;
					    balanceservice.edit(stockbal);
				   	  }
				   
			}
				
				if(!isEqual){
					System.out.println(warid+"   to stock balance");
					   stockbal.setWarehouse_id(warid);
					   stockbal.setMerchandise_id(zmerid);
					   stockbal.setQty(zqtybal);
					   stockbal.setRemark(remark[i]);
					   balanceservice.entry(stockbal);
				}
			
			
			
			
			List<Stock_in> stock_inList = stock_inService.selectAll();
			List<SubCategoryAndBrand> sub_cat_brandList=sub_category_brandservice.selectAll();
			List<Category> categoryList= categoryService.selectAll();
			List<Sub_category> subcategoryList=sub_category_service.selectAll();
			List<Brand> brandList=brandService.selectAll();
			List<Merchandise> merchandiseList = manager.selectAll();
			List<Basicunit> bauList=basicservice.selectAll();
			List<SubUnit> subunitList=subunitService.selectAll();
			List<Warehouse> warehouseList = WarehouseService.selectAll();
			List<Supplier> supplierList = supplierService.selectAllOn();
		    List<Merchandise_Brand> merchandisebrandList=merchandise_brandservice.selectAll();
		    List<Subunit_Merchandise> subunit_subcategoryList=subunit_subcategoryservice.selectAll();
		    List<Supplier> supplierList1 = supplierService.selectAll();
		    request.setAttribute("supplierList1", supplierList1);
		    request.setAttribute("unit_category", subunit_subcategoryList);
		    request.setAttribute("merchandise_brand", merchandisebrandList);
			request.setAttribute("sub_cat_brand",sub_cat_brandList);
			request.setAttribute("supplier", supplierList);
			request.setAttribute("warehouse", warehouseList);
			request.setAttribute("subunit", subunitList);
			request.setAttribute("basicunit", bauList);
			request.setAttribute("merchandise", merchandiseList);
			request.setAttribute("brand", brandList);
			request.setAttribute("subcategory", subcategoryList);
			request.setAttribute("category",categoryList);
			request.setAttribute("stock_in", stock_inList);
		
			page="/presentation/stockIn.jsp";
		}
		}


		else if(param.equals("delete")){
			
			int stockid=Integer.parseInt(request.getParameter("uid"));
			stock_inService.remove(stockid);
			
			List<Stock_in> stock_inList = stock_inService.selectAll();
			List<Category> categoryList= categoryService.selectAll();
			List<Sub_category> subcategoryList=sub_category_service.selectAll();
			List<Brand> brandList=brandService.selectAll();
			List<Merchandise> merchandiseList = manager.selectAll();
			List<Basicunit> bauList=basicservice.selectAll();
			List<SubUnit> subunitList=subunitService.selectAll();
			List<Warehouse> warehouseList = WarehouseService.selectAll();
			List<Supplier> supplierList = supplierService.selectAllOn();
			List<SubCategoryAndBrand> sub_cat_brandList=sub_category_brandservice.selectAll();
			List<Merchandise_Brand> merchandisebrandList=merchandise_brandservice.selectAll();
			List<Subunit_Merchandise> subunit_subcategoryList=subunit_subcategoryservice.selectAll();
			List<Supplier> supplierList1 = supplierService.selectAll();
		    request.setAttribute("supplierList1", supplierList1);
		    request.setAttribute("unit_category", subunit_subcategoryList);
		    request.setAttribute("merchandise_brand", merchandisebrandList);
		    request.setAttribute("sub_cat_brand",sub_cat_brandList);
			request.setAttribute("supplier", supplierList);
			request.setAttribute("warehouse", warehouseList);
			request.setAttribute("subunit", subunitList);
			request.setAttribute("basicunit", bauList);
			request.setAttribute("merchandise", merchandiseList);
			request.setAttribute("brand", brandList);
			request.setAttribute("subcategory", subcategoryList);
			request.setAttribute("category",categoryList);
			request.setAttribute("stock_in", stock_inList);
			
			System.out.print("Success delete");
			page="/presentation/stockIn.jsp";
		}
		
		else if(param.equals("view")){
			/*String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);*/
			
			 stock_in_id=Integer.parseInt(request.getParameter("stockid"));
			Stock_in stock_in = (Stock_in) stock_inService.selectStock_in(stock_in_id);
			request.setAttribute("stock_in", stock_in);
			
			session.setAttribute("stockidses", stock_in_id);
			
			List<Stock_InDetail> detailvou=stdservice.selectAllVou(stock_in_id);
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
		    
		    request.setAttribute("stockDetail", detailvou);
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
		
          else if(param.equals("editform")){
			
			int stockid=Integer.parseInt(request.getParameter("uid"));
			Stock_in stock_in = (Stock_in) stock_inService.selectStock_in(stockid);
			
			request.setAttribute("stock_in", stock_in);
			page="/presentation/StockInEditForm.jsp";
		}
		
		else if(param.equals("Edit")){
			
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
			
			List<Stock_in> stock_inList = stock_inService.selectAll();
			List<Category> categoryList= categoryService.selectAll();
			List<Sub_category> subcategoryList=sub_category_service.selectAll();
			List<Brand> brandList=brandService.selectAll();
			List<Merchandise> merchandiseList = manager.selectAll();
			List<Basicunit> bauList=basicservice.selectAll();
			List<SubUnit> subunitList=subunitService.selectAll();
			List<Warehouse> warehouseList = WarehouseService.selectAll();
			List<Supplier> supplierList = supplierService.selectAllOn();
			List<SubCategoryAndBrand> sub_cat_brandList=sub_category_brandservice.selectAll();
			List<Merchandise_Brand> merchandisebrandList=merchandise_brandservice.selectAll();
			List<Subunit_Merchandise> subunit_subcategoryList=subunit_subcategoryservice.selectAll();
			List<Supplier> supplierList1 = supplierService.selectAll();
		    request.setAttribute("supplierList1", supplierList1);
		    request.setAttribute("unit_category", subunit_subcategoryList);
		    request.setAttribute("merchandise_brand", merchandisebrandList);
		    request.setAttribute("sub_cat_brand",sub_cat_brandList);
			request.setAttribute("supplier", supplierList);
			request.setAttribute("warehouse", warehouseList);
			request.setAttribute("subunit", subunitList);
			request.setAttribute("basicunit", bauList);
			request.setAttribute("merchandise", merchandiseList);
			request.setAttribute("brand", brandList);
			request.setAttribute("subcategory", subcategoryList);
			request.setAttribute("category",categoryList);
			request.setAttribute("stock_in", stock_inList);
			System.out.println("this is edit form");
	
			Stock_in st = new Stock_in();
			st.setStockInId(Integer.parseInt(request.getParameter("stock_in_id")));
			st.setConarridate(request.getParameter("datePickerConAr"));
			st.setStockIndate(request.getParameter("datePickerStockin"));
			st.setSupId(Integer.parseInt(request.getParameter("cboSupplier")));
			st.setVr_no(request.getParameter("txtVoucherNo"));
			st.setWarId(Integer.parseInt(request.getParameter("cbowh")));
			st.setRemark(request.getParameter("txtRemark"));
			st.setModifiedUserId(uid);
			st.setFlag(Integer.parseInt(request.getParameter("txtFlag")));
			stock_inService.edit(st);
			
			List<Stock_in> stock_outList = stock_inService.selectAll();
			request.setAttribute("stock_in", stock_outList);
			page = "/presentation/stockIn.jsp";
		}
		
		else if (param.equals("stockindetaillist")) {
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);

			List<Stock_in> stock_inList = stock_inService.selectAll();
			List<Category> categoryList = categoryService.selectAll();
			List<Sub_category> subcategoryList = sub_category_service
					.selectAll();
			List<Brand> brandList = brandService.selectAll();
			List<Merchandise> merchandiseList = manager.selectAll();
			List<Basicunit> bauList = basicservice.selectAll();
			List<SubUnit> subunitList = subunitService.selectAll();
			List<Warehouse> warehouseList = WarehouseService.selectAll();
			List<Supplier> supplierList = supplierService.selectAllOn();
			List<SubCategoryAndBrand> sub_cat_brandList = sub_category_brandservice.selectAll();
			List<Stock_InDetail> stdList = stdservice.selectAll();
			List<Supplier> supplierList1 = supplierService.selectAll();
		    request.setAttribute("supplierList1", supplierList1);
			request.setAttribute("stockindetail", stdList);
			request.setAttribute("sub_cat_brand", sub_cat_brandList);
			request.setAttribute("supplier", supplierList);
			request.setAttribute("warehouse", warehouseList);
			request.setAttribute("subunit", subunitList);
			request.setAttribute("basicunit", bauList);
			request.setAttribute("merchandise", merchandiseList);
			request.setAttribute("brand", brandList);
			request.setAttribute("subcategory", subcategoryList);
			request.setAttribute("category", categoryList);
			request.setAttribute("stock_in", stock_inList);
			request.setAttribute("start", "other");
			request.setAttribute("end", "other");
			request.setAttribute("search", "other");

			page = "/presentation/stockInDetail.jsp";
		}
		
		//For return
			else if (param.equals("Return")){
			
			String uname = (String) session.getAttribute("uname");
			int uid = (Integer) (session.getAttribute("uid"));
			session.setAttribute("uid", uid);
			session.setAttribute("uname", uname);
		
			System.out.println("Submit is working");
			Stock_in st = new Stock_in();
			
			String vou=request.getParameter("retxtVoucherNo");
			String rema=request.getParameter("retxtRemark");
			System.out.println("this is remark" +rema);
			int war=Integer.parseInt(request.getParameter("recbowh"));
			String type=request.getParameter("ty");
			String dat=request.getParameter("redatePickerStockIn");

				st.setConarridate("-");	
				st.setStockIndate(dat);
				st.setSupId(Integer.parseInt(request.getParameter("recboSupplier")));
				st.setVr_no(vou);
				st.setWarId(war);
				st.setRemark(rema);
				st.setCreateUserId(uid);
				st.setModifiedUserId(uid);
				st.setFlag(1);
			
				session.setAttribute("vou", vou);
				session.setAttribute("rema", rema);
				session.setAttribute("war", war);
			
				//refresh
				List<Stock_in> stockoutlist=stock_inService.selectAll();
				
				
				if(j==1){
					ex="1";
				}
				else{
					ex="3";
					stock_in_id=(int) stock_inService.entry(st); 
				}
				request.setAttribute("exist", ex);
				request.setAttribute("datein",request.getParameter("redatePickerStockIn") );
				request.setAttribute("war",request.getParameter("recbowh"));
				request.setAttribute("sup", request.getParameter("recboSupplier"));
				request.setAttribute("remar",request.getParameter("retxtRemark") );
				request.setAttribute("vou",request.getParameter("retxtVoucherNo"));
				
				//String[] merchandise=request.getParameterValues("cboMerchandise");
				String[] merchandiseid=request.getParameterValues("merid");
				String[] qty=request.getParameterValues("arrtxtQty");
				String[] subunit=request.getParameterValues("cbosubunit");
				String[] remark=request.getParameterValues("txtRemark");
				String[] voucher=request.getParameterValues("txtVoucherNo");
			
				List<Stock_InDetail> stdList=new ArrayList<Stock_InDetail>();
				for(int i=0;i<merchandiseid.length;i++){
				
					Stock_InDetail std=new Stock_InDetail();
					
					//String zmerchandise=merchandise[i];
					int zmerchandiseid=Integer.parseInt(merchandiseid[i]);
					int zqty=Integer.parseInt(qty[i]);
					int zsubunit=Integer.parseInt(subunit[i]);
					String zremark=remark[i];
					String zvoucher=voucher[i];
				
				    std.setStock_in_id(stock_in_id);
		    		//std.setMerchandise_name(zmerchandise);
		    		std.setMerchandise_id(zmerchandiseid);
		    		std.setQty(zqty);
		    		std.setSub_unit_id(zsubunit);
		    		std.setRemark(zremark);
		    		std.setVoucher_no(zvoucher);
		    		std.setCreated_user_id(uid);
		    		std.setModified_user_id(uid);
		    		std.setFlag(1);
		    		stdList.add(std);
			}
			stdservice.entry(stdList);
			
			
			
			
			//<======Stock Balance=====>
			
			String[] merid=request.getParameterValues("merid");
			String[] qtybal=request.getParameterValues("arrtxtQty");
			int warid=Integer.parseInt(request.getParameter("recboWarehouse"));
			request.setAttribute("warid", warid);
			
			for(int i=0;i<merid.length;i++){
				
			   int zmerid=Integer.parseInt(merid[i]);
			   int zqtybal=Integer.parseInt(qtybal[i]);
			   System.out.println("This is zmerid this is loop"+i);
			   System.out.println("This is zqtybal this is loop"+i);
			   List<Stock_Balance> balList=balanceservice.selectAll();
			   Stock_Balance stockbal=new Stock_Balance();
				for(Stock_Balance sb:balList){
				   if(zmerid==sb.getMerchandise_id() && warid==sb.getWarehouse_id()){
					    int balid=sb.getStock_balance_id();
						int balqty=sb.getQty();
						int newbal=0;
					    newbal=zqtybal+balqty;
					    System.out.println("this is new qty"+newbal);
					    stockbal.setQty(newbal);
					    stockbal.setStock_balance_id(balid);
					    balanceservice.edit(stockbal);
				   	  }
					
				}
			}
			
			
			
			
			List<Stock_in> stock_inList = stock_inService.selectAll();
			List<SubCategoryAndBrand> sub_cat_brandList=sub_category_brandservice.selectAll();
			List<Category> categoryList= categoryService.selectAll();
			List<Sub_category> subcategoryList=sub_category_service.selectAll();
			List<Brand> brandList=brandService.selectAll();
			List<Merchandise> merchandiseList = manager.selectAll();
			List<Basicunit> bauList=basicservice.selectAll();
			List<SubUnit> subunitList=subunitService.selectAll();
			List<Warehouse> warehouseList = WarehouseService.selectAll();
			List<Supplier> supplierList = supplierService.selectAllOn();
		    List<Merchandise_Brand> merchandisebrandList=merchandise_brandservice.selectAll();
		    List<Subunit_Merchandise> subunit_subcategoryList=subunit_subcategoryservice.selectAll();
		    List<Supplier> supplierList1 = supplierService.selectAll();
		    request.setAttribute("supplierList1", supplierList1);
		    request.setAttribute("unit_category", subunit_subcategoryList);
		    request.setAttribute("merchandise_brand", merchandisebrandList);
			request.setAttribute("sub_cat_brand",sub_cat_brandList);
			request.setAttribute("supplier", supplierList);
			request.setAttribute("warehouse", warehouseList);
			request.setAttribute("subunit", subunitList);
			request.setAttribute("basicunit", bauList);
			request.setAttribute("merchandise", merchandiseList);
			request.setAttribute("brand", brandList);
			request.setAttribute("subcategory", subcategoryList);
			request.setAttribute("category",categoryList);
			request.setAttribute("stock_in", stock_inList);
		
			page="/presentation/stockIn.jsp";
		}
		
		//STOCK IN DETAIL REPORT
			else if(param.equals("DailyReport")){
				String uname = (String) session.getAttribute("uname");
				int uid = (Integer) (session.getAttribute("uid"));
				session.setAttribute("uid", uid);
				session.setAttribute("uname", uname);

				List<Stock_in> stock_inList = stock_inService.selectAll();
				List<Category> categoryList = categoryService.selectAll();
				List<Sub_category> subcategoryList = sub_category_service
						.selectAll();
				List<Brand> brandList = brandService.selectAll();
				List<Merchandise> merchandiseList = manager.selectAll();
				List<Basicunit> bauList = basicservice.selectAll();
				List<SubUnit> subunitList = subunitService.selectAll();
				List<Warehouse> warehouseList = WarehouseService.selectAll();
				List<Supplier> supplierList = supplierService.selectAllOn();
				List<SubCategoryAndBrand> sub_cat_brandList = sub_category_brandservice.selectAll();
				List<Stock_InDetail> stdList = stdservice.selectAll();
				List<Supplier> supplierList1 = supplierService.selectAll();
			    request.setAttribute("supplierList1", supplierList1);
				request.setAttribute("stockindetail", stdList);
				request.setAttribute("sub_cat_brand", sub_cat_brandList);
				request.setAttribute("supplier", supplierList);
				request.setAttribute("warehouse", warehouseList);
				request.setAttribute("subunit", subunitList);
				request.setAttribute("basicunit", bauList);
				request.setAttribute("merchandise", merchandiseList);
				request.setAttribute("brand", brandList);
				request.setAttribute("subcategory", subcategoryList);
				request.setAttribute("category", categoryList);
				request.setAttribute("stock_in", stock_inList);
				request.setAttribute("start", "other");
				
				request.setAttribute("search", "other");

				page = "/presentation/stockInreport.jsp";
			}
		// DETAIL MERCHANDISE REPORT
			else if(param.equals("DailyMerchandise"))
			{
				String uname = (String) session.getAttribute("uname");
				int uid = (Integer) (session.getAttribute("uid"));
				session.setAttribute("uid", uid);
				session.setAttribute("uname", uname);

				List<Stock_in> stock_inList = stock_inService.selectAll();
				List<Category> categoryList = categoryService.selectAll();
				List<Sub_category> subcategoryList = sub_category_service
						.selectAll();
				List<Brand> brandList = brandService.selectAll();
				List<Merchandise> merchandiseList = manager.selectAll();
				List<Basicunit> bauList = basicservice.selectAll();
				List<SubUnit> subunitList = subunitService.selectAll();
				List<Warehouse> warehouseList = WarehouseService.selectAll();
				List<Supplier> supplierList = supplierService.selectAllOn();
				List<SubCategoryAndBrand> sub_cat_brandList = sub_category_brandservice.selectAll();
				List<Stock_InDetail> stdList = stdservice.selectAll();
				List<Supplier> supplierList1 = supplierService.selectAll();
			    request.setAttribute("supplierList1", supplierList1);
				request.setAttribute("stockindetail", stdList);
				request.setAttribute("sub_cat_brand", sub_cat_brandList);
				request.setAttribute("supplier", supplierList);
				request.setAttribute("warehouse", warehouseList);
				request.setAttribute("subunit", subunitList);
				request.setAttribute("basicunit", bauList);
				request.setAttribute("merchandise", merchandiseList);
				request.setAttribute("brand", brandList);
				request.setAttribute("subcategory", subcategoryList);
				request.setAttribute("category", categoryList);
				request.setAttribute("stock_in", stock_inList);
				request.setAttribute("start", "other");
				
				request.setAttribute("search", "other");

				page = "/presentation/dailyin.jsp";
			}
		
		getServletContext().getRequestDispatcher(page).forward(request,response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*"%>
<%@page import="com.java.plyd.service.*"%>
<html>
<head>
<title>StockIn Information</title>
<%@ include file="link.jsp"%>
<!-- Refresh function -->
<script>
var isbtnSubmit=false;
   		function existorNot(){
   			 if(arguments[0]=="2"){
   				document.getElementById("datePickerConArn").value=arguments[1];
   				document.getElementById("datePickerStockIn").value=arguments[2];
   				document.getElementById("cboWarehouse").value=arguments[3];
   				document.getElementById("cboSupplier").value=arguments[4];
   				document.getElementById("txtVoucherNo").value=arguments[5];
   				document.getElementById("txtRemark").value=arguments[6];
   			
   				$(document).ready(function(){
   					$('#btnAddNew').trigger('click');
   					
   				});
   			}
   			
   			  else if(arguments[0]=="3"){
   				document.getElementById("redatePickerStockIn").value=arguments[2];
  				document.getElementById("recboWarehouse").value=arguments[3];
  				document.getElementById("recboSupplier").value=arguments[4];
  				document.getElementById("retxtVoucherNo").value=arguments[5];
  				//document.getElementById("retxtRemark").value=arguments[6];  
  				
  				$(document).ready(function(){
 					$('#btnReturn').trigger('click');
 					
 				});
   			 } 

   		}
</script>


<!-- Start click event -->
<!-- For Combobox Event(start) -->
<!-- Start onchange combobox javascript-->
<script type="text/javascript" language="javascript">
function cat(){
	var fcbo=document.getElementById("cboCategory").value;
	var refcbo=document.getElementById("recboCategory").value;
	 <%List<Sub_category> sub_categoryList=(List<Sub_category>) request.getAttribute("subcategory");
	   List<Category> categoryList = (List<Category>) request.getAttribute("category");
	   
	   
	   String cate="";
	   String cateid="";
	   for(Category cat:categoryList){
		   cate+="\'"+cat.getName()+"\',";
		   cateid+="\'"+cat.getCategory_id()+"\',";
	   }
	   
		String subcatName="";
		String subcatid="";
		String subcatto="";
		for(Sub_category subcat:sub_categoryList){
			subcatName+="\'"+subcat.getName()+"\',";
			subcatid+="\'"+subcat.getCategory_id()+"\',";//inside of subcategory =category id
			subcatto+="\'"+subcat.getSub_category_id()+"\',";//inside of subcategory=subcategory id
			
			
		}%>
        var subcatidarr=[<%=subcatid%>];
	   	var subcatNamearr=[<%=subcatName%>];
	   	var categoryarr=[<%=cate%>];
	   	var cateidarr=[<%=cateid%>];
	    var subcattoarr=[<%=subcatto%>];

	    var scombo=document.getElementById("sub");
	    scombo.selectedIndex=0;
	  //clean combobox
	   	  if(scombo==0)
		{
		alert("Empty");
		}
	
	else
		{ 
		var i;
		for(i>=0;i=scombo.options.length-1;i--){
			scombo.remove(i);	
		}
		
		
		} 
	  
	
	    for(var j=0;j<categoryarr.length;j++)
	    	{
	           if(fcbo==categoryarr[j]){
	            	var s=j;
	                     for(var a=0;a<subcatidarr.length;a++){
	                	    if(cateidarr[s]==subcatidarr[a])
	                	    {
	                	    	for(var i=0;i<subcatidarr[a].length;i++)
			                     {
			                       var t=document.createElement("option");
					               t.text=subcatNamearr[a];
					               t.value=subcattoarr[a];
					               scombo.add(t);
			                     } 
	                	    
	                	    }
		                     
	                	    }  
	                     } 
	    	}
	    //for return
	     var rescombo=document.getElementById("resub");
	    rescombo.selectedIndex=0;
	    if(rescombo==0)
		{
		alert("Empty");
		}
	
	else
		{ 
		var i;
		for(i>=0;i=rescombo.options.length-1;i--){
			rescombo.remove(i);	
		}
		
		
		} 
	  
	
	    for(var j=0;j<categoryarr.length;j++)
	    	{
	           if(refcbo==categoryarr[j]){
	            	var s=j;
	                     for(var a=0;a<subcatidarr.length;a++){
	                	    if(cateidarr[s]==subcatidarr[a])
	                	    {
	                	    	for(var i=0;i<subcatidarr[a].length;i++)
			                     {
			                       var t=document.createElement("option");
					               t.text=subcatNamearr[a];
					               t.value=subcattoarr[a];
					               rescombo.add(t);
			                     } 
	                	    
	                	    }
		                     
	                	    }  
	                     } 
	    	}
	   
}
</script>
<!-- End onchange combobox javascript-->

<!-- Start second combobox -->
<script type="text/javascript">

  function secondcat(){

var secondcombo=document.getElementById("sub").value; 
var resecondcombo=document.getElementById("resub").value; 
	 <%List<Brand> brandList = (List<Brand>) request.getAttribute("brand");
	     List<SubCategoryAndBrand> sub_cat_brandList=(List<SubCategoryAndBrand>) request.getAttribute("sub_cat_brand");
	  
	      String brand="";
	      String brandid="";
	      String brandsubcatid="";
	      for(Brand bra:brandList){
	    	  brand+="\'"+bra.getName()+"\',";
	    	  brandid+="\'"+bra.getBrand_id()+"\',";
	      }
	      
	      String sub_brand_id="";
	   	  String sub_sub_cate_id="";
	   	  for(SubCategoryAndBrand scb:sub_cat_brandList){
	   		  sub_brand_id+="\'"+scb.getBrand_id()+"\',";
	   		  sub_sub_cate_id+="\'"+scb.getSub_category_id()+"\',";
	   	  }%>
	  
	    var subcatidarr=[<%=subcatid%>];
	   	var subcatNamearr=[<%=subcatName%>];
	   	var brandarr=[<%=brand%>];
	    var subcattoarr=[<%=subcatto%>];
	    var sub_brand_idarr=[<%=sub_brand_id%>];
	    var sub_sub_cate_idarr=[<%=sub_sub_cate_id%>];
	    var brandidarr=[<%=brandid%>];
		
	   	var thirdcombo=document.getElementById("third");
	   	thirdcombo.selectedIndex=0;
	   	if(thirdcombo==0){
		           alert("Empty");
		      }
	   	
	     else{
	        	var i;
				for(i>=0;i=thirdcombo.options.length-1;i--){
					thirdcombo.remove(i);	
					}
	       } 

	   	for(var i=0;i<sub_sub_cate_idarr.length;i++){
	   		
	   		 if(secondcombo==sub_sub_cate_idarr[i]){
	   		  
	   			var s=i;
	   			for(var j=0;j<brandidarr.length;j++){
	   				
	   				 if(sub_brand_idarr[s]==brandidarr[j]){
	   					var t=document.createElement("option");
			               t.text=brandarr[j];
			               t.value=brandidarr[j];
			               thirdcombo.add(t);
	   				} 
	   			} 
	   		} 
	   	}
	   	
	   	//for return
		var rethirdcombo=document.getElementById("rethird");
	   	rethirdcombo.selectedIndex=0;
	   	if(rethirdcombo==0){
		           alert("Empty");
		      }
	   	
	     else{
	        	var i;
				for(i>=0;i=rethirdcombo.options.length-1;i--){
					rethirdcombo.remove(i);	
					}
	       } 

	   	for(var i=0;i<sub_sub_cate_idarr.length;i++){
	   		
	   		 if(resecondcombo==sub_sub_cate_idarr[i]){
	   		  
	   			var s=i;
	   			for(var j=0;j<brandidarr.length;j++){
	   				
	   				 if(sub_brand_idarr[s]==brandidarr[j]){
	   					var t=document.createElement("option");
			               t.text=brandarr[j];
			               t.value=brandidarr[j];
			               rethirdcombo.add(t);
	   				} 
	   			} 
	   		} 
	   	}
	   	
	    // start sub_unit
	 	
		   	
			   	
  } 
  
  
  //Start for brand
  function  brand(){
	  var brand=document.getElementById("third").value;
	  var rebrand=document.getElementById("rethird").value;
	  <%List<Merchandise> merList = (List<Merchandise>) request.getAttribute("merchandise");
	     List<Merchandise_Brand> merbrandList=(List<Merchandise_Brand>) request.getAttribute("merchandise_brand");
	         
	         String merbrand_brandid="";
	         String merbrand_merid="";
	         for(Merchandise_Brand mb:merbrandList){
	        	 merbrand_brandid+="\'"+mb.getBrand_id()+"\',";
	        	 merbrand_merid+="\'"+mb.getMerchandise_id()+"\',";
	         }
	      
	        String mername="";
	        String merid="";
	       for(Merchandise  mer:merList){	  
	        	mername+="\'"+mer.getName()+"\',";
	        	merid+="\'"+mer.getMerchandise_id()+"\',";
	        }%> 
	        
	      var mernamearr=[<%=mername%>];
	        var meridarr=[<%=merid%>]; 
	        var merbrand_brandidarr=[<%=merbrand_brandid%>];
	        var merbrand_meridarr=[<%=merbrand_merid%>];
	        
	        
	        var fourthcombo=document.getElementById("cboMerchandise");
	        fourthcombo.selectedIndex=0;
		   	 if(fourthcombo==0){
			           alert("Empty");
			      }
		        else{
		        	var i;
					for(i>=0;i=fourthcombo.options.length-1;i--){
						fourthcombo.remove(i);	}
		       }
		   	 
		 	for(var i=0;i<merbrand_brandidarr.length;i++){
		   		
		   		 if(brand==merbrand_brandidarr[i]){
		   		  
		   			var s=i;
		 
		   			 for(var j=0;j<meridarr.length;j++){
		   				
		   				 if(merbrand_meridarr[s]==meridarr[j]){
		   					
		   					var t=document.createElement("option");
				               t.text=mernamearr[j];
				               t.value=meridarr[j];
				               fourthcombo.add(t);
		   				} 
		   			}  
		   		} 
		   	} 
		 	
		 	//for return brand
		 	 var refourthcombo=document.getElementById("recboMerchandise");
		        refourthcombo.selectedIndex=0;
			   	 if(refourthcombo==0){
				           alert("Empty");
				      }
			        else{
			        	var i;
						for(i>=0;i=refourthcombo.options.length-1;i--){
							refourthcombo.remove(i);	}
			       }
			   	 
			 	for(var i=0;i<merbrand_brandidarr.length;i++){
			   		
			   		 if(rebrand==merbrand_brandidarr[i]){
			   		  
			   			var s=i;
			 
			   			 for(var j=0;j<meridarr.length;j++){
			   				
			   				 if(merbrand_meridarr[s]==meridarr[j]){
			   					
			   					var t=document.createElement("option");
					               t.text=mernamearr[j];
					              	t.value=meridarr[j];
					               refourthcombo.add(t);
			   				} 
			   			}  
			   		} 
			   	}  
	  
  }
</script>
<!-- End Second Combobox -->

<!-- End click event -->
</head>
<body class="w3-container w3-light-gray"
	onload="existorNot('<%out.print(request.getAttribute("exist"));%>','<%out.print(request.getAttribute("date"));%>','<%out.print(request.getAttribute("datein"));%>','<%out.print(request.getAttribute("war"));%>','<%out.print(request.getAttribute("sup"));%>','<%out.print(request.getAttribute("vou"));%>','<%out.print(request.getAttribute("remar"));%>')">
	<%@include file="header.jsp"%>

	<div class="row panel-body p10">
		<!-- inserting the code for each operation -->
		<div class="col-sm-9">
			<div class="row p10">
				<div class="panel panel-default">
					<div class="panel-heading w3-container w3-light-blue p10">
						<button type="button"
							class="btn w3-container w3-light-blue p-header-btn"
							data-toggle="modal" data-target="#addNew" id="btnAddNew">
							<span class="glyphicon glyphicon-plus"></span> Add New
						</button>
						<button type="button"
							class="btn w3-container w3-light-blue p-header-btn"
							data-toggle="modal" data-target="#addReturn" id="btnReturn">
							<span class="glyphicon glyphicon-plus"></span>Return
						</button>
						<span class="dropdown">
							<button type="button"
								class="btn w3-container w3-light-blue p-header-btn dropdown-toggle"
								data-toggle="dropdown">
								<span class="glyphicon glyphicon-cog"></span> Tools <span
									class="caret"></span>
							</button>
							<ul class="dropdown-menu p10">
								<li
									class="w3-container w3-text-black w3-hover-blue w3-hover-text-white p10"><span
									class="glyphicon glyphicon-import"></span> Import Files</li>
								<li
									class="w3-container w3-text-black w3-hover-blue w3-hover-text-white p10"><span
									class="glyphicon glyphicon-export"></span> Export Files</li>
								<li></li>
							</ul>
						</span>
					</div>

					<!--end of Body column -->
					<!--Panel-->


					<div class="panel-body p10">
						<!-- start of search result table -->
						<style>
#search1 tbody tr:hover {
	background-color: skyblue;
	cursor: pointer;
}
</style>
						<table id="search1"
							class="table table-condensed table-bordered p10">
							<caption class="w3-container w3-text-black w3-myfont">StockIn
								Information Lists</caption>
							<thead class="w3-container w3-light-blue p10">
								<tr>
									<th>Container Arrival Date</th>
									<th>Stock In Date</th>
									<th>Supplier</th>
									<th>Voucher No</th>
									<th>Warehouse</th>
									<th>Remark</th>
									<th>Flag</th>
									<th>Option</th>
								</tr>
							</thead>


							<%
								IStock_inService  stock_inService= (IStock_inService) SpringBeanFactory
																	.getBean("Stock_inService");
																	List<Stock_in> stock_inList = stock_inService.selectAll();
																			IUserService userservice=(IUserService)SpringBeanFactory.getBean("UserService");
							%>

							<tbody>
								<%
									for (Stock_in stock_in : stock_inList) {
								%>
								<tr>
									<td>
										<%
											out.println(stock_in.getConarridate());
										%>
									</td>
									<td>
										<%
											out.println(stock_in.getStockIndate());
										%>
									</td>
									<td>
										<%
											if(stock_in.getSupId()==0)
																						        	{
																						        	out.println("-");
																						        	}
																						        	else{
																						        		out.println(stock_in.getSupId());
																						        	}
										%>
									</td>

									<td>
										<%
											out.println(stock_in.getVr_no());
										%>
									</td>
									<td>
										<%
											out.println(stock_in.getWarId());
										%>
									</td>
									<td>
										<%
											out.println(stock_in.getRemark());
										%>
									</td>
									<%
										User u2 = userservice.selectUser(stock_in.getCreateUserId());
																						User u1 = userservice.selectUser(stock_in.getModifiedUserId());
									%>
									<%
										if(stock_in .getFlag()==1){
									%>
									<td><font color="green">ON</font></td>
									<%
										} else {
									%>
									<td><font color="red">OFF</font></td>
									<%
										}
									%>


									<td class="dropdown">
										<button
											class="btn w3-container w3-white w3-text-blue w3-hover-blue w3-hover-text-white ptb dropdown-toggle"
											data-toggle="dropdown">
											<span class="glyphicon glyphicon-cog"></span>
										</button>
										<ul class="dropdown-menu">
											<li class="w3-container w3-hover-blue p10"
												onclick="goToView('<%out.print(stock_in.getStockInId());%>')"><span
												class="glyphicon glyphicon-eye-open"></span> View</li>
											<li class="w3-container w3-hover-blue p10"
												data-toggle="modal" data-target="#rowEd"
												onclick="stedit('<%out.print(stock_in.getStockInId());%>','<%out.print(stock_in.getConarridate());%>','<%out.print(stock_in.getStockIndate());%>','<%out.print(stock_in.getWarId());%>','<%out.print(stock_in.getSupId());%>','<%out.print(stock_in.getVr_no());%>','<%out.print(stock_in.getRemark());%>','<%out.print(stock_in.getFlag());%>')"><span
												class="glyphicon glyphicon-edit"></span> Edit</li>
											<%
												if(stock_in.getFlag()==1){
											%>
											<li class="w3-container w3-hover-blue p10"
												onclick="confirmDelete('<%out.print(stock_in.getStockInId());%>')">
												<span class="glyphicon glyphicon-remove-circle"></span>
												Delete
											</li>
											<%
												} else {
											%>
											<li class="w3-container w3-hover-red p10 disabled"><font
												color="gray"> <span
													class="glyphicon glyphicon-remove-circle"></span> Delete
											</font></li>
											<%
												}
											%>

										</ul> <script>
													//Go To View
													function goToView(){
														//alert(arguments[0]);
														location.href="/warehouse/Stock_inController?page=view&stockid="+arguments[0];
													}
													//End for Go to View
													
												  //Edit stock function
												   	  	 function stedit(){
													  document.forms["edit"]["stock_in_id"].value=arguments[0];
													  document.forms["edit"]["datePickerConAr"].value=arguments[1];
													  document.forms["edit"]["datePickerStockin"].value=arguments[2];
													  document.forms["edit"]["cboWarehouse"].value=arguments[3];
													  
													  if(arguments[4]=="0"){
														  var subunit= document.createElement("option");
															subunit.text ="-";
															subunit.value = "-1";
															document.forms["edit"]["cboSupplier"].add(subunit);
														  document.forms["edit"]["cboSupplier"].value="-1";
													  }
													  else
														  {														 
														  document.forms["edit"]["cboSupplier"].value=arguments[4];
														  }
													 
													  document.forms["edit"]["txtVoucherNo"].value=arguments[5];
													  document.forms["edit"]["txtRemark"].value=arguments[6];
													  document.forms["edit"]["flag"].value=arguments[7];
													  
														if(arguments[7]==1){
															document.getElementById("idtxtFlag1").checked=true;
															document.getElementById("idtxtFlag2").checked=false;
														}else{
															document.getElementById("idtxtFlag2").checked=true;
															document.getElementById("idtxtFlag1").checked=false;
														} 
													 } 
												  
													function confirmDelete() {
														
														var r=confirm("Are you sure to delete this row");
												  	if(r){
												  		location.href="/warehouse/Stock_inController?page=delete&uid="+arguments[0];
												  		}
													}
												
													
												</script>
									</td>
								</tr>
								<%
									}
								%>
							</tbody>

						</table>
						<!-- end of search result table -->
					</div>
				</div>
			</div>
		</div>
		<!-- end of inserting the code for each operation -->
		<!-- start of Modal for add new the row -->
		<div class="modal fade" id="addNew" role="dialog">
			<div class="modal-body">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header w3-container w3-light-blue p10">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Adding new StockIn data</h4>
					</div>
					<script>
function validate(){
	//var merid=document.getElementsByName("merid");
	var start=document.getElementById("datePickerConArn").value;
    var end=document.getElementById("datePickerStockIn").value;
    if(start>end){	
    	alert("container arrival date must be smaller than the stock in date");
		return false;
	}else{
		if(isbtnSubmit){
			if(confirm("Are You Sure To INSERT!!")){
				return true;
			}else
				{
				return false;
				}
		}
		return false;
		/* if(merid.length>0){
			if(confirm("Are You Sure To INSERT!!")){
				return true;
			}else
				{
				return false;
				}
		}else{
			alert("Firstly, You need to add data to table!\nClick 'Add Row' Button!");
			return false;
		} */
	}
}
function goaction() {
	isbtnSubmit=true;
	/* var value=document.getElementById('txtVoucherNo').value;
		location.href="/warehouse/Stock_inController?page=submit&txtVoucherNo="+value; */
		
}
</script>
					<form action='/warehouse/Stock_inController' onsubmit="return validate()" name="sample">
						<div class="container">
							<h2>Stock In</h2>
							<br> <br>
							<div class="row">
								<div class="col-sm-4">

									<label for="lblConArriDate">Container Arrival Date</label><br>
									<input type="date" class="form-control" id="datePickerConArn"
										name="datePickerConArn" required><br>

								</div>
								<div class="col-sm-4">
									<label for="lblStockInDate">Stock In Date</label><br> <input
										type="date" class="form-control" id="datePickerStockIn"
										name="datePickerStockIn" required><br>
								</div>
								<div class="col-sm-4">
									<label for="lblWarehouse">Warehouse</label><br>
									<div class="dropdown">
										<select class="form-control" id="cboWarehouse" name="cbowh"
											onchange="warehouse()" required>
											<option value="" disabled selected>Select WareHouse</option>

											<%
												List<Warehouse> warehouseList=(List<Warehouse>) request.getAttribute("warehouse");
																				        for(Warehouse ware:warehouseList){
											%>
											<option value=<%out.print(ware.getId());%>>
												<%
													out.println(ware.getWareName());
												%>
											</option>
											<%
												}
											%>
										</select>
										<!-- Start warehouse onchange -->
										<script>
function warehouse(){
	var ware=document.getElementById("cboWarehouse").value;
	//alert(ware+"   ware id");
	 <%String warename="";
	    String wareid="";
	    
	    for(Warehouse ware:warehouseList){
	    	warename+="\'"+ware.getWareName()+"\',";
	    	wareid+="\'"+ware.getId()+"\',";
	    }%>
	var warenamearr=[<%=warename%>];
	var wareidarr=[<%=wareid%>];
	var count=0;
	for(var i=0;i<warenamearr.length;i++){
		if(ware==warenamearr[i]){
			count=i;
			break;
		}
	  
	}
	document.getElementById("hid").value=wareidarr[count];
}



</script>

										<!-- Hidden -->

										<input type="hidden" id="hid" name="cboWarehouse"
											value="<%out.print(request.getAttribute("warid"));%>">
										<input type="hidden" id="merchandise"> <input
											type="hidden" id="supplier" name="supplier">

										<!-- end Warehouse onchang -->
									</div>
									<br> <br>
								</div>
							</div>





							<!-- Supplier -->
							<div class="row">
								<div class="col-sm-4">
									<label for="lblSupplier">Supplier</label><br>
									<div class="dropdown">
										<select class="form-control" id="cboSupplier"
											onchange="suplier()" name="cboSupplier" required>
											<option value="" disabled selected>Select Supplier</option>
											<%
												List<Supplier> supplierList =(List<Supplier>) request.getAttribute("supplier");
																				    	for(Supplier sup:supplierList){
											%>
											<option value=<%out.println(sup.getSupplier_id());%>>
												<%
													out.println(sup.getName());
												%>
											</option>
											<%
												}
											%>
										</select>
									</div>
								</div>
								<div class="col-sm-4">
									<label for="lblVNo">Voucher No</label><br> <input
										type="text" class="form-control" id="txtVoucherNo"
										name="txtVoucherNo" required><br> <br>
								</div>
								<div class="col-sm-4">
									<label for="lblVNo">Remark</label><br> <input type="text"
										class="form-control" id="txtRemark" name="txtRemark" required><br>
									<br>
								</div>
							</div>
						</div>


						<div class="container">
							<div class="row">
								<div class="col-sm-4">
									<label for="lblCategory">Category</label><br>
									<div class="dropdown">
										<select class="form-control" id="cboCategory" onchange="cat()"
											name="cboCategory" required>
											<option value="" disabled selected>Select Category</option>
											<%
												for(Category ca:categoryList){
											%>
											<option>
												<%
													out.println(ca.getName());
												%>
											</option>
											<%
												}
											%>
										</select>
									</div>
									<br> <br>
								</div>

								<div class="col-sm-4">
									<label for="lblWarehouse">SubCategory</label><br>
									<div class="dropdown">
										<select class="form-control" onchange="secondcat()"
											name="cboSubCategory" id="sub" required>
											<option value="" disabled selected>Select Sub Category</option>
										</select>
									</div>
									<br> <br>
								</div>

								<div class="col-sm-4">
									<label for="lblWarehouse">Brand</label><br>
									<div class="dropdown">
										<select class="form-control" id="third" onchange="brand()"
											name="cboBrand" required>
											<option value="" disabled selected>Select Brand</option>
										</select>
									</div>
									<br> <br>
								</div>

							</div>
							<!-- Catch id -->
							<script>
function mer(){
		 var mer=document.getElementById("cboMerchandise").value;
		 
		 var merchannamearr=[<%=mername%>];
		 var merchanidarr=[<%=merid%>];
		 var meridarr=[<%=merid%>];
		 var count=0;
		for(var i=0;i<merchannamearr.length;i++){
				if(mer==merchanidarr[i]){
				count=i;
				break;
				}
		}
		document.getElementById("merchandise").value=meridarr[count];	
		
		//start for subunit
		<%List<Subunit_Merchandise> unit_categoryList=(List<Subunit_Merchandise>) request.getAttribute("unit_category");
	 	  List<SubUnit> subunitlist=(List<SubUnit>) request.getAttribute("subunit");
		   
	 	   String newid="";
		   String newunitname="";
		   for(SubUnit sub:subunitlist){
			   newunitname+="\'"+sub.getName()+"\',";
			   newid+="\'"+sub.getSub_unit_id()+"\',";
			   
		   }
		   
		   
	
		   
		   String betsubunit="";
		   String betmerchandise="";
		   for(Subunit_Merchandise sub:unit_categoryList){
			   betsubunit+="\'"+sub.getSub_unit_id()+"\',";
			   betmerchandise+="\'"+sub.getmerchandise_id()+"\',";
		   }%>
		   
		   
  
	 	  var betsubunitarr=[<%=betsubunit%>];
		  var betmerchandisearr=[<%=betmerchandise%>];
		  var unitcbo=document.getElementById("cbosubunit");
		  unitcbo.selectedIndex=0;
		  
		   var newidarr=[<%=newid%>];
		   var newunitnamearr=[<%=newunitname%>]; 
		   
		   
		  
		  if(unitcbo==0)
		   {
		   alert("Empty");
		   }
	   else
		   {
		   var i;
		   for(i>0 ;i=unitcbo.options.length-1;i--){
			   unitcbo.remove(i);
		   }
		   }
		  
		  
		  
		 
		   	for(var i=0;i<merchannamearr.length;i++){
		   		
		   		
		   		  if(mer==merchanidarr[i]){
		   			
		   			 var s=i;
		   			for(var j=0;j<betmerchandisearr.length;j++){
		   				
		   				 if(merchanidarr[s]==betmerchandisearr[j]){
		   					 
		   					  var z=j;
		   					  for(var y=0;y<newidarr.length;y++){
		   						  if(betsubunitarr[z]==newidarr[y]){
		   					      var t=document.createElement("option");
				                  t.text=newunitnamearr[y];
				                  t.value=newidarr[y];
				                   unitcbo.add(t); 
		   						  }
		   					  }
		   				} 
		   			}  
		   		} 
		   	} 
		   	
		   	//end sub unit
	} 
</script>
							<!-- Catch supplier id -->


							<script type="text/javascript">
function suplier(){
	var sup=document.getElementById("cboSupplier").value;
	alert(sup+" from sup id");
	<%String supname="";
		String supid="";
		for(Supplier su:supplierList){
			supname+="\'"+su.getName()+"\',";
			supid+="\'"+su.getSupplier_id()+"\',";
		}%>
	var supnamearr=[<%=supname%>];
	var supidarr=[<%=supid%>];
	var count=0;
	
	//first check error
	
	/* for(var i=0;i<supnamearr.length;i++){
		if(sup==supnamearr[i]){
			count=i;
			break;
		}
	} */
	
	
	//document.getElementById("supplier").value=supidarr[count];
	
	//second check error
	
	document.getElementById("supplier").value=sup;

}
</script>

							<div class="row">
								<div class="col-sm-4">
									<label for="lblWarehouse">Merchandise</label><br>
									<div class="dropdown">
										<select class="form-control" id="cboMerchandise"
											onchange="mer()" required>
											<option value="" disabled selected>Select Merchandise</option>
										</select>
									</div>
									<br> <br>
								</div>

								<div class="col-sm-4">
									<label for="lblSubunit">Sub Unit</label><br> <select
										class="form-control" id="cbosubunit" name="cbosubunit"
										required>
										<option value="" disabled selected>Select Sub Unit</option>
									</select><br>
								</div>
								<div class="col-sm-4">
									<label for="lblWarehouse">Qty</label><br> <input
										type="text" class="form-control" id="txtQty" name="txtQty"
										required>
									<div id="name_error" class="var_error"></div>
									<br>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<center>
										<input type="submit" value="Add Row" id="add-row"
											class="btn btn-default w3-container w3-light-blue p10"
											name="" />
									</center>
								</div>
								<div class="col-sm-6">
									<center>
										<input type="button" value="Remove Row" id="delete-row"
											class="btn btn-default w3-container w3-light-blue p10"
											name="" />
									</center>

								</div>

							</div>
						</div>
						<br> <br>


						<!-- table -->
						<div class="container" id="tb1id" style="display: none">
							<style>
#table1 tbody tr {
	transition: all .25s ease-in-out
}

#table1 tbody tr:hover {
	background-color: skyblue;
	cursor: pointer;
}

.var_error {
	color: red;
}

.cor {
	color: blue;
}
</style>
							<table class="table" border="2" id="table1">
								<thead>
									<tr>
										<th>Merchandise Id</th>
										<!--  <th>Merchandise</th> -->
										<th>Qty</th>
										<th>Sub Unit</th>
										<th>Remark</th>
										<th>Voucher No</th>
										<th>Option</th>

									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>

						<!--footer modal -->

						<div class="modal-footer p10">

							<input type="submit" disabled="disabled" id="btnsubmit" name="page"
								class="btn btn-default w3-container w3-light-blue p10" onclick="goaction()" value="submit">
							<button type="reset"
								class="btn btn-default w3-container w3-light-blue p10">Cancel</button>
							<button type="button"
								class="btn btn-default w3-container w3-light-blue p10"
								data-dismiss="modal">Close</button>
						</div>
				</div>
			</div>
		</div>
		</form>
		<!-- end of the add new of the row -->

		<!-- start of Modal for stock return the row -->
		<div class="modal fade" id="addReturn" role="dialog">
			<div class="modal-body">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header w3-container w3-light-blue p10">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Adding Stock Return data</h4>
					</div>

					<form action="/warehouse/Stock_inController"
						onsubmit="return validate()" name="sample">
						<div class="container">
							<h2>Stock Return</h2>
							<br> <br>
							<div class="row">
								<div class="col-sm-4">
									<label for="lblStockInDate">Stock In Date</label><br> <input
										type="date" class="form-control" id="redatePickerStockIn"
										name="redatePickerStockIn" required><br>
								</div>
								<div class="col-sm-4">
									<label for="lblWarehouse">Warehouse</label><br>
									<div class="dropdown">
										<select class="form-control" id="recboWarehouse"
											name="recbowh" onchange="rewarehouse()">
											<option disabled selected>Select WareHouse</option>

											<%
												for(Warehouse ware:warehouseList){
											%>
											<option value=<%out.print(ware.getId());%>>
												<%
													out.println(ware.getWareName());
												%>
											</option>
											<%
												}
											%>
										</select>
										<!-- Start warehouse onchange -->
										<script>
function rewarehouse(){
	var ware=document.getElementById("recboWarehouse").value;
	 <%String warehousename="";
	    String warehouseid="";
	    
	    for(Warehouse ware:warehouseList){
	    	warehousename+="\'"+ware.getWareName()+"\',";
	    	warehouseid+="\'"+ware.getId()+"\',";
	    }%>
	var warenamearr=[<%=warehousename%>];
	var wareidarr=[<%=warehouseid%>];
	var count=0;
	
	//fifth check error
	/* for(var i=0;i<warenamearr.length;i++){
		if(ware==warenamearr[i]){
			count=i;
			break;
		}
	  
	} */
	//document.getElementById("rehid").value=wareidarr[count];
	
	document.getElementById("rehid").value=ware;
}
</script>

										<!-- Hidden -->

										<input type="hidden" id="rehid" name="recboWarehouse"
											value="<%out.print(request.getAttribute("warid"));%>">
										<input type="hidden" id="remerchandise"> <input
											type="hidden" id="supplier" name="supplier">

										<!-- end Warehouse onchange -->
									</div>
									<br> <br>
								</div>
								<div class="col-sm-4">
									<label for="lblSupplier">Supplier</label><br>
									<div class="dropdown">
										<select class="form-control" id="recboSupplier"
											onchange="suplier()" name="recboSupplier" required>
											<option disabled selected>Select Supplier</option>
											<%
												for(Supplier sup:supplierList){
											%>
											<option value=<%out.print(sup.getSupplier_id());%>>
												<%
													out.println(sup.getName());
												%>
											</option>
											<%
												}
											%>
										</select>
									</div>
								</div>
							</div>





							<!-- Supplier -->
							<div class="row">
								<div class="col-sm-4">
									<label for="lblVNo">Voucher No</label><br> <input
										type="text" class="form-control" id="retxtVoucherNo"
										name="retxtVoucherNo" required><br> <br>
								</div>
								<div class="col-sm-4">
									<label for="lblVNo">Remark</label><br> <input type="text"
										class="form-control" id="retxtRemark" name="retxtRemark"
										value="Return Stock" required><br> <br>
								</div>
							</div>
						</div>


						<div class="container">
							<div class="row">
								<div class="col-sm-4">
									<label for="lblCategory">Category</label><br>
									<div class="dropdown">
										<select class="form-control" id="recboCategory"
											onchange="cat()" name="cboCategory">
											<option disabled selected>Select Category</option>
											<%
												for(Category ca:categoryList){
											%>
											<option>
												<%
													out.println(ca.getName());
												%>
											</option>
											<%
												}
											%>
										</select>
									</div>
									<br> <br>
								</div>

								<div class="col-sm-4">
									<label for="lblWarehouse">SubCategory</label><br>
									<div class="dropdown">
										<select class="form-control" onchange="secondcat()"
											name="cboSubCategory" id="resub">
											<option disabled selected>Select Sub Category</option>
										</select>
									</div>
									<br> <br>
								</div>

								<div class="col-sm-4">
									<label for="lblWarehouse">Brand</label><br>
									<div class="dropdown">
										<select class="form-control" id="rethird" onchange="brand()"
											name="cboBrand">
											<option disabled selected>Select Brand</option>
										</select>
									</div>
									<br> <br>
								</div>

							</div>
							<!-- Catch id -->
							<script>
function meri(){
		 var mer=document.getElementById("recboMerchandise").value;
		 var merchannamearr=[<%=mername%>];
		 var merchanidarr=[<%=merid%>];
		 var meridarr=[<%=merid%>];
		 var count=0;
		for(var i=0;i<merchannamearr.length;i++){
				if(mer==merchannamearr[i]){
				count=i;
				break;
				}
		}
		document.getElementById("remerchandise").value=meridarr[count];	
		
	 	  var betsubunitarr=[<%=betsubunit%>];
		  var betmerchandisearr=[<%=betmerchandise%>];
		  var unitcbo=document.getElementById("recbosubunit");
		  unitcbo.selectedIndex=0;
		  
		   var newidarr=[<%=newid%>];
		   var newunitnamearr=[<%=newunitname%>]; 
		  
		  if(unitcbo==0)
		   {
		   alert("Empty");
		   }
	   else
		   {
		   var i;
		   for(i>0 ;i=unitcbo.options.length-1;i--){
			   unitcbo.remove(i);
		   }
		   }
		  

		   	for(var i=0;i<merchannamearr.length;i++){
		   		
		   		  if(mer==merchannamearr[i]){
		   		 
		   			 var s=i;
		   			for(var j=0;j<betmerchandisearr.length;j++){
		   				
		   				 if(merchanidarr[s]==betmerchandisearr[j]){
		   					 
		   					  var z=j;
		   					  for(var y=0;y<newidarr.length;y++){
		   						  if(betsubunitarr[z]==newidarr[y]){
		   					      var t=document.createElement("option");
				                  t.text=newunitnamearr[y];
				                  t.value=newidarr[y];
				                  
				                   unitcbo.add(t); 
		   						  }
		   					  }
		   				} 
		   			}  
		   		} 
		   	} 
		   	
		   	//end sub unit
	} 
</script>
							<!-- Catch supplier id -->
							<script type="text/javascript">
function suplier(){
	var sup=document.getElementById("cboSupplier").value;
	<%String suppliername="";
		String supplierid="";
		for(Supplier su:supplierList){
			suppliername+="\'"+su.getName()+"\',";
			supplierid+="\'"+su.getSupplier_id()+"\',";
		}%>
	var supnamearr=[<%=suppliername%>];
	var supidarr=[<%=supplierid%>];
	var count=0;
	
	//fourth check error
	/* for(var i=0;i<supnamearr.length;i++){
		if(sup==supnamearr[i]){
			count=i;
			break;
		}
	} */
	document.getElementById("supplier").value=supidarr[count];

}
</script>

							<div class="row">
								<div class="col-sm-4">
									<label for="lblWarehouse">Merchandise</label><br>
									<div class="dropdown">
										<select class="form-control" id="recboMerchandise"
											onchange="meri()">
											<option disabled selected>Select Merchandise</option>
										</select>
									</div>
									<br> <br>
								</div>

								<div class="col-sm-4">
									<label for="lblSubunit">Sub Unit</label><br> <select
										class="form-control" name="recbosubunit" id="recbosubunit"
										required>
										<option disabled selected>Select Basic Unit</option>
									</select><br>
								</div>
								<div class="col-sm-4">
									<label for="lblWarehouse">Qty</label><br> <input
										type="text" class="form-control" id="retxtQty" name="txtQty"
										required>
									<div id="name_err" class="var_error"></div>
									<br>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<center>
										<input type="button" value="Add Row" id="add-return"
											class="btn btn-default w3-container w3-light-blue p10"
											name="" />
									</center>
								</div>
								<div class="col-sm-6">
									<center>
										<input type="button" value="Remove Row" id="delete-return"
											class="btn btn-default w3-container w3-light-blue p10"
											name="" />
									</center>

								</div>

							</div>
						</div>
						<br> <br>


						<!-- table -->
						<div class="container">
							<style>
#table1 tbody tr {
	transition: all .25s ease-in-out
}

#table1 tbody tr:hover {
	background-color: skyblue;
	cursor: pointer;
}

.var_error {
	color: red;
}

.cor {
	color: #00e600;
	font-size: 20px;
}
</style>
							<table class="table" border="2" id="return">
								<thead>
									<tr>
										<th>Merchandise Id</th>
										<!-- <th>Merchandise</th> -->
										<th>Qty</th>
										<th>Sub Unit</th>
										<th>Remark</th>
										<th>Voucher No</th>
										<th>Option</th>

									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>

						<!--footer modal -->

						<div class="modal-footer p10">

							<input type="submit"
								class="btn btn-default w3-container w3-light-blue p10"
								name="page" value="Return">
							<button type="reset"
								class="btn btn-default w3-container w3-light-blue p10">Cancel</button>
							<button type="button"
								class="btn btn-default w3-container w3-light-blue p10"
								data-dismiss="modal">Close</button>
						</div>
				</div>
			</div>
		</div>
		</form>
		<!-- end of the add new of the row -->



		<div class="col-sm-3 p10">
			<!-- first notification panel 1 -->
			<div class="row">
				<div class="panel panel-default">
					<div class="panel-heading w3-container w3-light-blue p10">Panel
						Heading</div>
					<div class="panel-body">Panel Content</div>
				</div>
			</div>
			<!-- end of first notification panel 1 -->
			<!-- first notification panel 2 -->
			<div class="row">
				<div class="panel panel-default">
					<div class="panel-heading w3-container w3-light-blue p10">Panel
						Heading</div>
					<div class="panel-body">Panel Content</div>
				</div>
			</div>
			<!-- end of first notification panel 2 -->
			<!-- first notification panel 3 -->
			<div class="row">
				<div class="panel panel-default">
					<div class="panel-heading w3-container w3-light-blue p10">Panel
						Heading</div>
					<div class="panel-body">Panel Content</div>
				</div>
			</div>
			<!-- end of first notification panel 3 -->
		</div>
	</div>
	<!-- end of the body part of the body column -->
	</div>
	</div>
	<!-- end of 3 column dividing -->
	</div>
	<!-- Start add function -->
	<script src="jquery.js"></script>
	<script type="text/javascript">
<%String vou="";
 	for(Stock_in stin:stock_inList){
 		vou+="\'"+stin.getVr_no()+"\',";
 	}%>
var name_error= document.getElementById("name_error");
var isappear=0;
    $(document).ready(function(){
        $("#add-row").click(function(){
        	
        	var start=document.getElementById("datePickerConArn").value;
            var end=document.getElementById("datePickerStockIn").value;
            
            var brand=document.getElementById("third").value;
            var subcategory=document.getElementById("sub").value;
            var category=document.getElementById("cboCategory").value;
            var supplier=document.getElementById("cboSupplier").value;
            var warehouse=document.getElementById("cboWarehouse").value;
            
        	var voucherarr=[<%=vou%>];
        	 var subunit = $("#cbosubunit").val();
        	
             var remark = $("#txtRemark").val(); 
             
             var voucher=$("#txtVoucherNo").val();
            
             var merid=$("#cboMerchandise").val();
         
            var qty = $("#txtQty").val();
           
            
            if(qty=="" | voucher=="" | subunit==null | remark=="" | merid==null |
            	start=="" | end=="" | brand=="" | subcategory=="" | category=="" |
            	supplier=="" | warehouse==""){
            	
            }
            else{
            	
            for(var i=0;i<voucherarr.length;i++){
            	if(voucher==voucherarr[i]){ 	
            		var eqvou=voucherarr[i];
            		break;
            		
            	}
            }
            if(isNaN(qty)||qty<1){
            	txtQty.style.border = "3px solid red";
                name_error.textContent = "Please re-enter quantity";
                return false; 
      	    	document.getElementById("txtQty").value=null;
      	    }
            else if(eqvou==voucher){
            	alert("There is an existing voucher no in Stock In");
            	//$("#txtVoucherNo").focus();
            	document.getElementById('txtVoucherNo').focus();
            }
       
            else if(start<=end && eqvou!=voucher){
            	
            	if(isappear===0){
            		document.getElementById('tb1id').style.display='block';
            		
            	}
            	isappear=1;
           			 var markup = "<tr><td><center><input type='hidden' name='merid' value='"+merid+"'/>"+merid+"</center></td><td><input type='hidden' name='arrtxtQty' value='"+qty+"'/>" + qty +"</td><td><input type='hidden' name='cbosubunit' value='" + subunit +"'/>" + subunit +"</td><td><input type='hidden' name='txtRemark' value='"+remark+"'/>" + remark+"</td><td><input type='hidden' name='txtVoucherNo' value='"+voucher+"'/>"+voucher +"</td><td><input type='checkbox' name='record'  /></td></tr>";
           			 $("#table1 tbody").append(markup);
           			 txtQty.style.border = "3px solid #00e600";
            		 name_error.innerHTML ="<div class='cor'>Enough!!! </div>";
            		 document.getElementById("btnsubmit").disabled=false;
            		 isbtnSubmit=false;
           
            }
            else if(start>=end){	
            		alert("container arrival date must be smaller than the stock in date");
   					//$('#date_error').modal('show');
            }
            }
            
           
        });
        
        // Find and remove selected table rows
        $("#delete-row").click(function(){
      	  
            $("#table1 tbody").find('input[name="record"]').each(function(){
            	if($(this).is(":checked")){
                    $(this).parents("tr").remove();
                   
                }
            	
            	
            
            }); 
            
          var merid=document.getElementsByName("merid");
        	
        	 if(merid.length>0){
        		 document.getElementById('tb1id').style.display='block';
             	document.getElementById("btnsubmit").disabled=false;
        			
        		}else{
        			document.getElementById('tb1id').style.display='none';
                	document.getElementById("btnsubmit").disabled=true;
                	isappear=0;
        		} 
            
            	
        });
    });     
</script>
	<!--  End add function-->

	<!-- Return add function -->
	<script type="text/javascript">
		var name_error = document.getElementById("name_error");
		$(document)
				.ready(
						function() {
							$("#add-return")
									.click(
											function() {
												var merchandise = $(
														"#recboMerchandise")
														.val();
												var qty = $("#retxtQty").val();
												var subunit = $("#recbosubunit")
														.val();
												var remark = $("#retxtRemark")
														.val();
												var voucher = $(
														"#retxtVoucherNo")
														.val();
												var merid = $("#remerchandise")
														.val();

												if (isNaN(qty) || qty < 1) {
													retxtQty.style.border = "3px solid red";
													name_err.textContent = "Please re-enter quantity";
													return false;
													document
															.getElementById("retxtQty").value = null;
												} else {
													var markup = "_$ta_$ta_$ta_$ta_$ta_$tag____$ta_$ta_$tag____$tag________________________________________________"
															+ merid
															+ "_$ta_$ta_$tag____$tag_________________________________________________$tag_____$ta_$ta_$tag____$tag_________________________________________________$tag_____$tag_$ta_$ta_$tag____$tag_________________________________________________$tag_____$tag_$ta_$ta_$ta_$tag____$tag_________________________________________________$tag_____$tag_$ta_$tag__________________________________________________"
															+ qty
															+ "_$ta_$ta_$tag____$tag_________________________________________________$tag_____$tag_$ta_$tag___________________________________________________$tag_$ta_$ta_$tag____$tag_________________________________________________$tag_____$tag_$ta_$tag___________________________________________________$tag_$ta_$ta_$ta_$tag____$tag_________________________________________________$tag_____$tag_$ta_$tag___________________________________________________$tag_$ta_$tag__________________________________________________________"
															+ subunit
															+ "_$ta_$ta_$tag____$tag_________________________________________________$ta"
	</script>
	<!--  End Return add function -->

	<!-- Start Stock In Edit modal box -->
	<div class="modal fade" id="rowEd" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header w3-container w3-light-blue ">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Edit Stock in data</h4>
				</div>

				<!--  <div class="modal-body p10">
						          	<p>Stock In Edit</p>
						        </div> -->

				<form action="/warehouse/Stock_inController" name="edit">
					<input type="hidden" name="stockid"
						value="<%out.print(session.getAttribute("stockidses"));%>">
					<div class="container">

						<div class="row">
							<style>
td {
	text-align: left;
	padding: 5px;
	padding-left: 60px;
}
</style>
							<table>
								<input type="hidden" class="form-control"
									id="stock_in_detail_id" name="stock_in_id">
								<tbody align="right">

									<tr>
										<td><b>Container Arrival Date:</b></td>
										<td><input type="text" class="form-control"
											id="merchandise_name" name="datePickerConAr"></td>
									</tr>

									<tr>
										<td><b>Stock In Date:</b></td>
										<td><input type="text" class="form-control" id="qty"
											name="datePickerStockin"></td>
									</tr>
									<tr>
										<td><b>Warehose Name:</b></td>

										<td><select class="form-control" id="cboWarehouse"
											name="cbowh" onchange="warehouse()">
												<option disabled selected>Select WareHouse</option>
												<%
													for (Warehouse w : warehouseList) {
												%>
												<option value=<%out.print(w.getId());%>>
													<%
														out.print(w.getWareName());
													%>
												</option>
												<%
													}
												%>
										</select></td>
									</tr>
									<tr>
										<td><b>Suppler Name:</b></td>
										<td><select class="form-control" id="cboSupplier"
											onchange="suplier()" name="cboSupplier" required>
												<option disabled selected>Select Supplier</option>
												<%
													List<Supplier> supplierList1 = (List<Supplier>) request
															.getAttribute("supplierList1");
													for (Supplier sup : supplierList1) {
												%>

												<!-- third check error -->

												<option value=<%out.print(sup.getSupplier_id());%>>
													<%
														out.println(sup.getName());
													%>
												</option>
												<%
													}
												%>
										</select></td>
									</tr>
									<tr>
										<td><b>Voucher No:</b></td>
										<td><input type="text" class="form-control" id="Remark"
											name="txtVoucherNo"></td>
									</tr>
									<tr>
										<td><b>Remark:</b></td>
										<td><input type="text" class="form-control"
											id="txtRemark" name="txtRemark"></td>
									</tr>
									<tr>

										<td>Flag:</td>
										<td><input type="hidden" name="flag" id="flag" /> <input
											type="radio" value="1" name="txtFlag" id="idtxtFlag1" /><font
											color="green">ON</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" value="0" name="txtFlag" id="idtxtFlag2" /><font
											color="red">OFF</font></td>
									</tr>


								</tbody>
							</table>
						</div>

					</div>
					<br> <br>





					<!--footer modal -->

					<div class="modal-footer p10">

						<input type="submit" name="page" value="Edit"
							class="btn btn-default w3-container w3-light-blue p10">
						<button type="reset"
							class="btn btn-default w3-container w3-light-blue p10">Cancel</button>
						<button type="button"
							class="btn btn-default w3-container w3-light-blue p10"
							data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- End Stock In Edit modal box -->

	<!-- Logout modal box -->
	<div id="myModal1" class="modal fade" role="dialog">
		<div class="modal-dialog" style="width: 400px;">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<div class="control-label col-sm-5"></div>
					<div class="control-label col-sm-2">
						<h4 class="modal-title">Profile</h4>
					</div>
					<div class="control-label col-sm-4"></div>
					<div class="control-label col-sm-1">
						<button type="button" class="close" data-dismiss="modal">
							<font color="red">&times;</font>
						</button>
					</div>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" method="get" role="form"
						action="/warehouse/UserController">
						<div class="form-group">
							<div class="control-label col-sm-3"></div>
							<div class="control-label col-sm-6">
								<img class="imgprofile" alt="Profile"
									src="<%=request.getContextPath()%>/images/profile.jpg">
							</div>
							<div class="control-label col-sm-3"></div>
						</div>
						<div class="form-group">
							<div class="control-label col-sm-3"></div>
							<label class="control-label col-sm-3" for="email">Username:</label>
							<div class="col-sm-3">
								<label class="control-label"> <%
 	out.print(uname);
 %>
								</label>
							</div>
							<div class="control-label col-sm-3"></div>
						</div>
						<%
							IUser_LevelService userlevelservicej = (IUser_LevelService) SpringBeanFactory
									.getBean("User_LevelService");
							IUserService userservicej = (IUserService) SpringBeanFactory
									.getBean("UserService");
							User uj = userservicej.selectUser(uid);
							int lvid = uj.getUser_level_id();
							User_Level userj = userlevelservicej.selectUser_Level(lvid);
							String levelname = userj.getName();
						%>
						<div class="form-group">
							<div class="control-label col-sm-3"></div>
							<label class="control-label col-sm-3" for="pwd">Level:</label>
							<div class="col-sm-3">
								<label class="control-label"> <%
 	out.print(levelname);
 %>
								</label>
							</div>
							<div class="control-label col-sm-3"></div>
						</div>
						<div class="form-group">
							<div class="control-label col-sm-5"></div>
							<div class="col-sm-2">
								<input class="btn btn-info" type="submit" value="logout"
									name="page" />
							</div>
							<div class="control-label col-sm-5"></div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal box for date error -->

	<!-- Start Stock In Edit modal box -->
	<div class="modal fade" id="date_error" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header w3-container w3-light-blue ">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Error Message</h4>
				</div>

				<div class="modal-body p10">
					<p color='red'>Start date must be greater than the end date.</p>
				</div>
				<!--footer modal -->
				<div class="modal-footer p10">
					<button type="button"
						class="btn btn-default w3-container w3-light-blue p10"
						data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>

		<!-- end of the add new of the row -->
</body>
</html>
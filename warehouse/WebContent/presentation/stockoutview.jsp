<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*"%>
<%@page import="com.java.plyd.service.*"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
		<%@include file="link.jsp" %>

</head>


<!-- Start click event -->
<!-- For Combobox Event(start) -->
<!-- Start onchange combobox javascript-->
<script type="text/javascript" language="javascript">
function cat(){
	var fcbo=document.getElementById("cboCategory").value;
	var edfcbo=document.getElementById("edcboCategory").value;
	 <%List<Sub_category> sub_categoryList=(List<Sub_category>) request.getAttribute("sub_cate");
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
		}
		%>
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
	    
	    
	   //for edit form subcategory=====>
	    var edscombo=document.getElementById("edsub");
	    edscombo.selectedIndex=0;
	  //clean combobox
	   	  if(edscombo==0)
		{
		alert("Empty");
		}
	
	else
		{ 
		var i;
		for(i>=0;i=edscombo.options.length-1;i--){
			edscombo.remove(i);	
		}
		
		
		} 
	  
	
	    for(var j=0;j<categoryarr.length;j++)
	    	{
	           if(edfcbo==categoryarr[j]){
	            	var s=j;
	                     for(var a=0;a<subcatidarr.length;a++){
	                	    if(cateidarr[s]==subcatidarr[a])
	                	    {
	                	    	for(var i=0;i<subcatidarr[a].length;i++)
			                     {
			                       var t=document.createElement("option");
					               t.text=subcatNamearr[a];
					               t.value=subcattoarr[a];
					               edscombo.add(t);
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
var edsecondcombo=document.getElementById("edsub").value; 

	 <%List<Brand> brandList = (List<Brand>) request.getAttribute("bl");
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
	   	  }
	   	 
	     
	   %>
	  
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
	   	
	   	//for edit form brand list===>
	   	var edthirdcombo=document.getElementById("edthird");
	   	edthirdcombo.selectedIndex=0;
	   	if(edthirdcombo==0){
		           alert("Empty");
		      }
	   	
	     else{
	        	var i;
				for(i>=0;i=edthirdcombo.options.length-1;i--){
					edthirdcombo.remove(i);	
					}
	       } 

	   	for(var i=0;i<sub_sub_cate_idarr.length;i++){
	   		
	   		 if(edsecondcombo==sub_sub_cate_idarr[i]){
	   		  
	   			var s=i;
	   			for(var j=0;j<brandidarr.length;j++){
	   				
	   				 if(sub_brand_idarr[s]==brandidarr[j]){
	   					var t=document.createElement("option");
			               t.text=brandarr[j];
			               t.value=brandidarr[j];
			               edthirdcombo.add(t);
	   				} 
	   			} 
	   		} 
	   	}
	   	
	   	
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
		   }
		   %>

		   	
		   	//end sub unit
		   	
		   	
		   	
  } 
  
  
  //Start for brand
  function  brand(){
	  var brand=document.getElementById("third").value;
	  var edbrand=document.getElementById("edthird").value;
	  
	  <% List<Merchandise> merList = (List<Merchandise>) request.getAttribute("merchandise");
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
	        }  
	       
	        %> 
	        
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
				               fourthcombo.add(t);
		   				} 
		   			}  
		   		} 
		   	}  
		 	
		 	//for edit form merchandise===>
		 	var edfourthcombo=document.getElementById("edcboMerchandise");
	         edfourthcombo.selectedIndex=0;
		   	 if(edfourthcombo==0){
			           alert("Empty");
			      }
		        else{
		        	var i;
					for(i>=0;i=edfourthcombo.options.length-1;i--){
						edfourthcombo.remove(i);	}
		       }
		   	  
		 	for(var i=0;i<merbrand_brandidarr.length;i++){
		   		
		   		 if(edbrand==merbrand_brandidarr[i]){
		   		  
		   			var s=i;
		 
		   			 for(var j=0;j<meridarr.length;j++){
		   				
		   				 if(merbrand_meridarr[s]==meridarr[j]){
		   					
		   					var t=document.createElement("option");
				               t.text=mernamearr[j];
				               edfourthcombo.add(t);
		   				} 
		   			}  
		   		} 
		   	}  
	  
  }
</script>
<!-- End Second Combobox -->

<!-- End click event -->
<!-- for warehouse -->
<%List<Warehouse> warehouseList=(List<Warehouse>) request.getAttribute("warehouse");
       		String warename="";
       	    String wareid="";
       	    
       	    for(Warehouse ware:warehouseList){
       	    	warename+="\'"+ware.getWareName()+"\',";
       	    	wareid+="\'"+ware.getId()+"\',";
       	    }
       	%>



<body class="w3-container w3-light-gray">


	<%@include file="header.jsp" %>
				<!-- for body part of the body column -->
				<div class="row panel-body p10">
					<!-- inserting the code for each operation -->
					<div class="col-sm-9">
						<div class="row p10">
							<div class="panel panel-default">
						  		<div class="panel-heading w3-container w3-light-blue p10">
						  			<button type="button" class="btn w3-container w3-light-blue p-header-btn" data-toggle="modal" data-target="#addNew"><span class="glyphicon glyphicon-plus"></span> Add New</button> 
			  						<button type="button" class="btn w3-container w3-light-blue p-header-btn" data-toggle="modal" data-target="#search"><span class="glyphicon glyphicon-search"></span> Search</button>
			  						<span class="dropdown">
			  							<button type="button" class="btn w3-container w3-light-blue p-header-btn dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span> Tools <span class="caret"></span></button>
										  <ul class="dropdown-menu p10">
										    <li class="w3-container w3-text-black w3-hover-blue w3-hover-text-white p10"><span class="glyphicon glyphicon-import"></span> Import Files</li>
										    <li class="w3-container w3-text-black w3-hover-blue w3-hover-text-white p10"><span class="glyphicon glyphicon-export"></span> Export Files</li>
										    <li></li>
										  </ul>
			  						</span>			  						
						  		</div>
						  		<div class="panel-body p10">
								
						  		<!-- start of search result table -->
						  		 <%Stock_out stockout= (Stock_out) request.getAttribute("stock_out"); 
							       List<StockoutDetail> detailvou = (List<StockoutDetail>)  request.getAttribute("voucher");
						  		 %>
						  		  
						  		  
						  		 <label>Stock Out Date:&nbsp;&nbsp;&nbsp;</label><%out.print(stockout.getStock_out_date());%><label></label><br>
						  		 <label>From Warehouse:&nbsp;&nbsp;&nbsp;</label><label><input type="hidden" id="warehouse" value="<%out.print(stockout.getFromwarehouse_id());%>"><%out.println(stockout.getFromwarehouse_id());%></label><br>
						  		 <label>To Warehouse:&nbsp;&nbsp;&nbsp;</label><label><% if(stockout.getTowarehouse_id()==0) out.print("-");
						  		 														else{
						  		 															out.print(stockout.getTowarehouse_id());
						  		 														}%></label><br>
						  		 <label>Customer:&nbsp;&nbsp;&nbsp;</label><label><%if(stockout.getCustomer_id()==0)out.print("-");
						  		 													else{out.print(stockout.getCustomer_id());}
						  		 													%></label><br>
						  		 <label>Voucher No:&nbsp;&nbsp;&nbsp;</label><label><input type="hidden" id="voucher" value="<%out.print(stockout.getVr_no());%>"><%out.print(stockout.getVr_no());%></label><br>
						  		 <label>Remark:&nbsp;&nbsp;&nbsp;</label><label><input type="hidden" id="rema" value="<%out.print(stockout.getRemark());%>"><%out.print(stockout.getRemark());%></label><br>
						  		 <label></label> 
						  	<style>	
						  	           #table2 tbody tr{
										transition:all .25s ease-in-out
										}
										#table2 tbody tr:hover { background-color: skyblue; cursor:pointer;
										
										}
							</style>
						  		
						  			<table id="table2" class="table table-condensed table-bordered p10">
						  				
						 <caption class="w3-container w3-text-black w3-myfont">Stock Out Detail Information Lists</caption>
						 <h4 align="right"><a href="/warehouse/Stock_outController?page=stockoutform"> <font color="Blue" >Go To Main Page</font></a> </h4>
									    <thead class="w3-container w3-light-blue p10">
									      <tr>
									        <!-- <th>Stockout Detail ID</th>  -->
									        <th>Merchandise ID</th>
									        <th>Qty</th>
									        <th>Sub Unit</th>
									        <th>Remark</th>
									        <th>Flag</th>
									        <th>Options</th>
									      </tr>
									    </thead>
									    <tbody>
									    <%for (StockoutDetail s:detailvou) {%>
									    <%MerchandiseService mservice=(MerchandiseService)SpringBeanFactory.getBean("MerchandiseService");
									      Sub_category_service subservice=(Sub_category_service)SpringBeanFactory.getBean("Sub_category_service");
									      CategoryService catservice=(CategoryService)SpringBeanFactory.getBean("CategoryService");
									      Merchandise m=mservice.selectMerchandise(s.getMerchandise_id());
									      Sub_category sub=subservice.selectSub_category(m.getSub_category_id());
									      Category cat=catservice.selectCategory(sub.getCategory_id());
									      %>
									      <tr>
									        <td><% out.print(s.getMerchandise_id());%></td> 
									        <%-- <td><%out.print(s.getMerchandise()); %></td> --%>
									        <td><%out.print(s.getQty()); %></td>
									        <td><%out.print(s.getSubunit()); %></td>
									        <td><%out.print(s.getRemark()); %></td>
									        <% if (s.getFlag()==1){
									        	%><td> <font color="green">ON</font></td>
									        	<%}else { %>
									        <td><font color="red">OFF</font></td><%} %>
									        
									        <td class="dropdown">
									      
									        	<button class="btn w3-container w3-white w3-text-blue w3-hover-blue w3-hover-text-white ptb dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span>
									      		</button> 
									      		<ul class="dropdown-menu">
												    <!-- <li class="w3-container w3-hover-blue p10" data-toggle="modal" data-target="#rowView"><span class="glyphicon glyphicon-eye-open"></span> View</a></li> -->
												    <li class="w3-container w3-hover-blue p10" data-toggle="modal" data-target="#rowEd"
												    onclick="submit('<%out.print(s.getMerchandise_id());%>'<%-- ,'<%out.print(s.getMerchandise());%>' --%>,'<%out.print(s.getQty());%>','<%out.print(s.getSubunit());%>','<%out.print(s.getRemark());%>','<%out.print(s.getFlag());%>','<%out.print(s.getStockoutdetail_id());%>','<%out.print(cat.getName());%>','<%out.print(m.getSub_category_id());%>','<%out.print(m.getBrand_id());%>')"><span class="glyphicon glyphicon-edit"></span> Edit</a></li>
												      <%if(s.getFlag()==1){ %>				
													    <li class="w3-container w3-hover-blue p10" onclick="confirmDelete('<%out.print(s.getStockoutdetail_id());%>','<%out.print(s.getStockoutid());%>')"> 
													    	<span class="glyphicon glyphicon-remove-circle"></span> Delete</li>
												    <%} else { %>
												    	<li class="w3-container w3-hover-red p10 disabled"> <font color="gray">
													    	<span class="glyphicon glyphicon-remove-circle"></span>Delete</font></li>
												    <%} %>
												</ul>
												
													<script>
									
												
											function submit(){ 
													 	document.forms["edit"]["merchandise_id"].value=arguments[0];
												 	    //document.forms["edit"]["edcboMerchandise"].value=arguments[1];
														document.forms["edit"]["txtQty"].value=arguments[1];
														//document.forms["edit"]["edcbosubunit"].value=arguments[2];
														document.forms["edit"]["txtRemark"].value=arguments[3]; 
														document.forms["edit"]["flag"].value=arguments[4];
														document.forms["edit"]["stock_out_detail_id"].value=arguments[5];
														
														 //alert("category:"+arguments[7]);
														document.getElementById("edcboCategory").value=arguments[6];
														cat();
														//alert("sub category:"+arguments[8]);
														document.getElementById("edsub").value=arguments[7];
														secondcat();
														//alert("brand:"+arguments[9]);
														document.getElementById("edthird").value=arguments[8];
														brand();
														//alert(arguments[1]);
														//document.forms["edit"]["edcboMerchandise"].value=arguments[1];
														meri();
														//alert(arguments[3]);
														//document.forms["edit"]["edcbosubunit"].value=arguments[2]; 
														
														//for hidden input
														document.getElementById("himerchandise_id").value=arguments[0];
														//document.getElementById("himername").value=arguments[1];
													    document.getElementById("hiqty").value=arguments[1];
														document.getElementById("hisubunit").value=arguments[2];
														document.getElementById("hiremark").value=arguments[3];
														document.getElementById("hiflag").value=arguments[4];
														
														
														if(arguments[5]==1){
															document.getElementById("idtxtFlag1").checked=true;
															document.getElementById("idtxtFlag2").checked=false;
														}else{
															document.getElementById("idtxtFlag2").checked=true;
															document.getElementById("idtxtFlag1").checked=false;
														} 
														
														var ware=document.getElementById("warehouse").value;
												       	var warenamearr=[<%=warename%>];
												       	var wareidarr=[<%=wareid%>];
												       	var count=0;
												       	for(var i=0;i<warenamearr.length;i++){
												       		if(ware==warenamearr[i]){
												       			count=i;
												       			break;
												       		}
												       	}
												       	
												       	document.getElementById("edware").value=wareidarr[count]; 	 	
													}
											function confirmDelete() {
												
												var r=confirm("Are you sure to delete this row");
												
										  	if(r){
										  		location.href="/warehouse/stockoutdetailController?page=delete&uid="+arguments[0]+"&id="+arguments[1];
										  		}
											}
												
											</script>
												

												
									        </td>
									      </tr>
									     <%} %>
									     <tr></tr>
									    </tbody>
									  </table>
						  			
						  		 
						  			<!-- end of search result table -->
						  		</div>
							</div>
						</div>
					</div>
					
					<!-- end of inserting the code for each operation -->
                               <%
                             
							        List<StockoutDetail> stdList = (List<StockoutDetail>) request.getAttribute("stockoutdetail");
							        String deailvoucher="";		
							        String voucher=stockout.getVr_no();
							        for(StockoutDetail d:stdList){
								     
							        	deailvoucher+="\'"+d.getVoucherno()+"\',";
							        			}
							 
								%> 
								
					<!-- start of all modal for column Edition -->

<!-- Start Edit Modal Box -->
					<div class="modal fade" id="rowEd" role="dialog">
					    <div class="modal-md">
					    
					      <!-- Modal content-->
					      	<div class="modal-content">
					        	<div class="modal-header w3-container w3-light-blue ">
					         		<button type="button" class="close" data-dismiss="modal">&times;</button>
					          		<h4 class="modal-title">Edit Stock Out Detail Data</h4>
					       		</div>
					       
						        <div class="modal-body p10">
						        <br>
						          	<!-- <p>Stock Out Detail Edit</p> -->
						        </div>

								<form action="/warehouse/stockoutdetailController" name="edit">
								<input type="hidden" name="stockid" value="<%out.print(session.getAttribute("stock"));%>">
								
	<div class="container">

<div class="row">
<style>

	td{
		text-align: left;
        padding: 5px;
	    padding-left: 60px;
}
</style>
<div class="col-sm-6">
<table >
 <tbody align="right">

 	<tr>
	<td><b>Category:</b></td>
	<td><select class="form-control" id="edcboCategory" onchange="cat()">
      <option disabled selected>Select Category</option>
      <% for(Category ca:categoryList){%>
      <option><%out.println(ca.getName()); %></option>
      <%}%>
      </select></td>
	</tr>
		<tr>
	<td><b>Sub Category:</b></td>
	<td>  <select class="form-control" onchange="secondcat()" name="cboSubCategory" id="edsub">
      <option disabled selected>Select Category</option>
      </select>
      </td>
	
	</tr>

		<tr>
	<td><b>Brand:</b></td>
	<td><select class="form-control" id="edthird" name="cboBrand" onchange="brand()">
      <option disabled selected>Select Brand</option>
      </select></td>
	</tr>
</tbody>
</table>
</div>
<div class="col-sm-6">
<table >
 <tbody align="right">
 <input type="hidden" class="form-control" id="merchandise_id" name="merchandise_id">

	<script>
function meri(){
		 var mer=document.getElementById("edcboMerchandise").value;
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
		document.getElementById("merchandise_id").value=meridarr[count];
		
		var betsubunitarr=[<%=betsubunit%>];
		  var betmerchandisearr=[<%=betmerchandise%>];
		  var edunitcbo=document.getElementById("edcbosubunit");
		  edunitcbo.selectedIndex=0;
		  
		   var newidarr=[<%=newid%>];
		   var newunitnamearr=[<%=newunitname%>]; 
		  
		  if(edunitcbo==0)
		   {
		   alert("Empty");
		   }
	   else
		   {
		   var i;
		   for(i>0 ;i=edunitcbo.options.length-1;i--){
			   edunitcbo.remove(i);
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
				                   edunitcbo.add(t); 
		   						  }
		   					  }
		   				} 
		   			}  
		   		} 
		   	} 
	} 
</script>
		<tr>
	<td><b>Merchandise Name:</b></td>
	<td>  <select class="form-control"  id="edcboMerchandise" name="Merchandise" onchange="meri()">
      <option disabled selected>Select Merchandise</option>
      <%for(Merchandise m:merList) {%>
      <option><%out.print(m.getName() );%></option>
      <%}%>
      </select>
      </td>
	
	</tr>

		<tr>
	<td><b>Quantity:</b></td>
	<td><input type="text" class="form-control" id="txtQty" name="txtQty"></td>
	</tr>
		<tr>
	<td><b>Sub Unit:</b></td>
	<td><select class="form-control" id="edcbosubunit" name="cbosubunit" required>
<option disabled selected>Select Sub Unit</option>
 <%-- <%for(SubUnit s:subunitlist){ %>
<option value=<%out.print(s.getSub_unit_id()); %>><%out.print(s.getName()); %></option>
<%} %> --%>
</select></td>
	</tr>
		<tr>
	<td><b>Remark:</b></td>
	<td><input type="text" class="form-control" id="txtRemark" name="txtRemark"></td>
	</tr>
	<tr>
	
	<td><b>Flag:</b></td>
<td> 	<input type="hidden" name="flag" id="flag" />
    <input type="radio" value="1" name="txtFlag" id="idtxtFlag1"/><font color="green">ON</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="radio" value="0" name="txtFlag" id="idtxtFlag2"/><font color="red">OFF</font></td>
	</tr>
</tbody>
</table>
<!-- hidden edit input tag-->
<input type="hidden" id="stock_out_detail_id" name="stock_out_detail_id">

<input type="hidden" id="himerchandise_id" name="himerchandise_id">
<input type="hidden" id="himername" name="himername">
<input type="hidden" id="hiqty" name="hiqty">
<input type="hidden" id="hisubunit" name="hisubunit">
<input type="hidden" id="hiremark" name="hiremark">
<input type="hidden" id="hiflag" name="hiflag">
<input type="hidden" id="edware" name="edware">
</div>
</div>

     </div>
      <br>
      <br>



 

<!--footer modal -->

    <div class="modal-footer p10">
						        	
    <input type="submit" name="page" value="Edit" class="btn btn-default w3-container w3-light-blue p10" >
    <button type="reset" class="btn btn-default w3-container w3-light-blue p10">Cancel</button>
    <button type="button" class="btn btn-default w3-container w3-light-blue p10" data-dismiss="modal">Close</button>
	</div>
</form>
</div>					      
</div>
</div>
		<!-- End Edit Modal Box -->
		
		<!-- Hidden -->
<input type="hidden" id="merchandise" >

						<!-- hello -->
						<!-- start of Modal for add new the row -->
					<div class="modal fade" id="addNew" role="dialog">
					    <div class="modal-body">
					    
					      <!-- Modal content-->
					      	<div class="modal-content">
					      	  <div class="modal-header w3-container w3-light-blue p10">
					         		<button type="button" class="close" data-dismiss="modal">&times;</button>
					          	<h4 class="modal-title">Adding New Merchandise</h4>
					       		</div>
					  <form action="/warehouse/stockoutdetailController">
					  <input type="hidden" name="stock" value="<%out.print(session.getAttribute("stock"));%>">
					  
                   <div class="container">
                   <!-- <h2>Stock In Detail</h2> --><br><br>
                   </div>
                   <!-- hidden -->
       				<input type="hidden" id="remark" name="rema">
       				<input type="hidden" id="vou" name="vou">
     			    <input type="hidden" id="ware" name="ware">
                   <div class="container">
                      <div class="row">
                        <div class="col-sm-4">
                              <label for="lblCategory">Category</label><br>
                               <div class="dropdown">
                              <select class="form-control" id="cboCategory" onchange="cat()" name="cboCategory" required>
       <option disabled selected>Select Category</option>
      <% for(Category ca:categoryList){%>
      <option><%out.println(ca.getName()); %></option>
      <%}%>
      </select>
      </div> <br><br>
      </div>

<div class="col-sm-4">
      <label for="lblWarehouse">SubCategory</label><br>
      <div class="dropdown">
      <select class="form-control" onchange="secondcat()" name="cboSubCategory" id="sub" required>
      <option disabled selected>Select Sub Category</option>
      </select>
      </div> <br><br>
      </div>

      <div class="col-sm-4">
      <label for="lblWarehouse">Brand</label><br>
      <div class="dropdown">
      <select class="form-control" id="third" name="cboBrand" onchange="brand()" required>
      <option disabled selected>Select Brand</option>
      </select>
      </div> <br><br>
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
				if(mer==merchannamearr[i]){
				count=i;
				break;
				}
		}
		document.getElementById("merchandise").value=meridarr[count];	
		
		  
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
	} 
</script> 
     <div class="row">
       <div class="col-sm-4">
      <label for="lblWarehouse">Merchandise</label><br>
      <div class="dropdown">
      <select class="form-control" name="cboMerchandise" id="cboMerchandise" onchange="mer()" required>
      <option disabled selected>Select Merchandise</option>
      </select>
      </div> <br><br>
      </div>
<div class="col-sm-4">
      <label for="lblWarehouse">Qty</label><br>
      <input type="text" class="form-control" id="Qty" name="txtQty" required>
      <div id="name_error" class="var_error"></div>
      <br>
      </div>
<div class="col-sm-4">
<label for="lblSubunit">Sub Unit</label><br>
<select class="form-control" id="cbosubunit" name="cbosubunit" required>
<option disabled selected>Select Sub Unit</option>
</select><br>


</div>
</div>
<div class="row">
     <div class="col-sm-6">
     <center><input type="button" class="btn btn-default w3-container w3-light-blue p10" value="Add" id="add-row" name=""/></center>
     </div>
     <div class="col-sm-6">
     <center><input type="button" class="btn btn-default w3-container w3-light-blue p10" value="Remove" id="delete-row" name=""/></center>
     
     </div>
     
     </div>
     </div>
      <br>
      <br>


<!-- table -->
<div class="container">
<style>
#table1 tbody tr{
transition:all .25s ease-in-out
}
#table1 tbody tr:hover { background-color: skyblue; cursor:pointer;

}

.var_error{
    color: red;
  }
.cor{
  color:#00e600;
}

</style>
 <table class="table" border="2" id="table1" >
      <thead>
      <tr>
        <th>Merchandise Id</th> 
		<th>Merchandise Name</th>
		<th>Qty</th>
		<th>Sub Unit</th>
		<th>Options</th>
      </tr> 
      </thead>
      <tbody>
      
      </tbody>
</table>
  </div>

<!--footer modal -->

    <div class="modal-footer p10">
						        	
    <input type="submit" class="btn btn-default w3-container w3-light-blue p10" name="page" value="submit">
    <button type="reset" class="btn btn-default w3-container w3-light-blue p10">Cancel</button>
    <button type="button" class="btn btn-default w3-container w3-light-blue p10" data-dismiss="modal">Close</button>
	</div>
</form>
</div>
</div>				      
</div>

					<!-- end of the add new of the row -->

					


					<!-- end of the all modal for column Editioin -->


					<%@include file="right.jsp" %>
	<!-- Start add function -->
<script src="jquery.js"></script>

<%List<Stock_Balance> sList=(List<Stock_Balance>) request.getAttribute("balanceList");
 	 String qty="";
  	 String bal_merid="";
  	 String bal_warid="";
 	 for(Stock_Balance s:sList){
	  	qty+="\'"+s.getQty()+"\',";
		bal_merid+="\'"+s.getMerchandise_id()+"\',";
		bal_warid+="\'"+s.getWarehouse_id()+"\',";
	  }
%>


  
<script type="text/javascript">
var bal_meridarr=[<%=bal_merid%>];
var bal_qtyarr=[<%=qty%>];
var bal_waridarr=[<%=bal_warid%>];
    $(document).ready(function(){
        $("#add-row").click(function(){
            var name_error= document.getElementById("name_error");
      	  var txtQty=document.getElementById("Qty");
        	
        	/*write to input tag*/
        var ware=document.getElementById("warehouse").value;
       	var warenamearr=[<%=warename%>];
       	var wareidarr=[<%=wareid%>];
       	var count=0;
       	for(var i=0;i<warenamearr.length;i++){
       		if(ware==warenamearr[i]){
       			count=i;
       			break;
       		}
       	}
       	
       	document.getElementById("ware").value=wareidarr[count];
 
        	var rema=$("#rema").val();
        	var vou=$("#voucher").val();
        	document.getElementById("remark").value=rema;	
        	document.getElementById("vou").value=vou; 
        	/*write to input tag*/
        	
        	
            var merchandise = $("#cboMerchandise").val();
            var qty = $("#Qty").val();
            var subunit = $("#cbosubunit").val();
            var merid=$("#merchandise").val();
            
            var merid=document.getElementById("merchandise").value;
      	    var qty=parseInt(document.getElementById("Qty").value);
      	    
      	    var warid=document.getElementById("ware").value;
      	    
      	    if(isNaN(qty)||qty<1){
      	    	txtQty.style.border = "3px solid red";
                name_error.innerHTML = "Please re-enter quantity";
                return false;
      	    	document.getElementById("Qty").value=null;
      	    }
      	    
      	    else{
      	    for(var i=0;i<bal_qtyarr.length;i++){
      		   if(merid==bal_meridarr[i] && warid==bal_waridarr[i]){
      			  var s=i;
      			  if(bal_qtyarr[s]>=qty){
            var markup = "<tr><td><center><input type='hidden' name='merid' value='"+merid+"'/>"+merid+"</center></td><td><input type='hidden' name='cboMerchandise' value= '"+merchandise+"'/>" + merchandise + "</td><td><input type='hidden' name='arrtxtQty' value='"+qty+"'/>"+qty+"</td><td><input type='hidden' name='cbosubunit' value='" + subunit +"'/>" + subunit +"</td><td><input type='checkbox' name='record'  /> <input type='hidden' name='balindex' value='"+s+"'/></td></tr>";
            $("#table1 tbody").append(markup);
            txtQty.style.border = "3px solid #00e600";
            name_error.innerHTML ="<div class='cor'>Enough!!!</div>";
      			  }
      			else if(bal_qtyarr[s]<qty){
  				txtQty.style.border = "3px solid red";
                name_error.innerHTML =bal_qtyarr[s]+"  quantities are remaining in this merchandise";               
  			  } 
      		  }
      	    }
      	    }
        });
        
        // Find and remove selected table rows
        $("#delete-row").click(function(){
      	  var result=0;
      	  var qtyarr=document.getElementsByName('arrtxtQty');
      	  var balanceqty=document.getElementsByName('balindex');
      	  var i=0;
      	  
      	//alert("remove");
            $("#table1 tbody").find('input[name="record"]').each(function(){
            	if($(this).is(":checked")){
            	  
            	   var r=parseInt(qtyarr[i].value);
            	   var resultbal=balanceqty[i].value;
                			  result=resultbal;
                			  bal_qtyarr[resultbal]=bal_qtyarr[resultbal]+r;
                              
                			  
        				
     			 
                    $(this).parents("tr").remove();
                    i--; 
     			
                }
            	
            	i++;
            });
        });
    });     
</script>
<!--  End add function-->

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*"%>
<%@page import="com.java.plyd.service.*"%>

<html>
<head>
<title>StockIn Information</title>
<%@ include file="link.jsp" %>
</head>

<body>
<body class="w3-container w3-light-gray">
	<%@ include file="header.jsp" %>

				<div class="row panel-body p10">
					<!-- inserting the code for each operation -->
					<div class="col-sm-9">
						<div class="row p10">
							<div class="panel panel-default">
								<!-- <div class="panel-heading w3-container w3-light-blue p10">
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
						  		</div> -->

								<!--end of Body column -->
								<!--Panel-->


								<div class="panel-body p10">
									<!-- start of search result table -->

									<script type="text/javascript">
						  			function checkDate()
						  			{
						  				var start=document.getElementById("sdid").value;
						  				var end=document.getElementById("edid").value;
						  				
						  				
						  				if(start=="")
					  					{
					  					alert(start+"empty");
					  					return false;
					  					}
					  				else
					  					{
						  				
						  				if(start<=end)
						  					{
						  					//alert(start +"true");
						  					return true;
						  					}
						  				else
						  					{
						  					alert(end +"your start date must be less than end date");
						  					return false;
						  					}
					  					}
						  			}
						  		</script>

									<form action="/warehouse/Stock_inDetailController"
										onsubmit="return checkDate()">
										<div class="row">
											<div class="col-sm-4">
												<input type="date" id="sdid" name="startdtxt" value="02-02-2016"
													placeholder="Start Date" />
											</div>

											<div class="col-sm-4">
												<input type="date" name="enddtxt" id="edid"
													placeholder="End Date" />
											</div>
											<div class="col-sm-4">
												<input class="btn btn-default w3-light-blue" type="submit" value="Search"
													name="page" />
											</div>
										</div>

									</form>
												<style>
#stockinSearch tbody tr{
transition:all .25s ease-in-out
}
#stockinSearch tbody tr:hover { background-color: skyblue; cursor:pointer;

}
</style>
			
									<table id="stockinSearch"
										class="table table-condensed table-bordered p10">
										<thead class="w3-container w3-light-blue p10">
											<tr>
												<th>Container Arrival Date</th>
												<th>Stock In Date</th>
												<th>MerchandiseID</th>
												<!-- <th>Merchandise Name</th> -->
												<th>Qty</th>
												<th>Sub Unit</th>
												<th>Remark</th>
												<!-- <th>Flag</th> -->
											</tr>
										</thead>


										<%
										String startdate=(String)request.getAttribute("start");
										String enddate=(String)request.getAttribute("end");
										String search=(String)request.getAttribute("search");
										System.out.println(startdate+"  from jsp start date\t"+enddate+"  end date");
										Stock_in stockIn=new Stock_in();
										boolean t=true;
											IStock_InDetailService stdservice=(IStock_InDetailService) SpringBeanFactory
											.getBean("Stock_InDetailService");
									   	IStock_inService  stock_inService= (IStock_inService) SpringBeanFactory
										.getBean("Stock_inService");
									   	List<Stock_in> stock_inList=null;
									   	
									   	if(search.equals("search"))
									   	{%>
									   	<script>
									   	//alert("hi");
									   	var st='<%=startdate%>';
									   	var et='<%=enddate%>';
									   //	alert(st+"  start"+et+" end");
									   		document.getElementById("sdid").value="11/01/2015";
							  				document.getElementById("edid").value="12/03/2016";
							  				
							  			</script>
							  				
							  			<%
									   		stockIn.setStockIndate(startdate);
									   		stockIn.setEnddate(enddate);
									   		try{
									   			stock_inList = stock_inService.selectAllByDate(stockIn);
									   			t=true;
									   			System.out.println(t+"\tT");
									   		}catch(NullPointerException ne)
									   		{
									   			t=false;
									   			System.out.println(t+"There is no data entries from catch");
									   		}
									   		
									   		if(stock_inList==null | stock_inList.equals("")| stock_inList.equals(null))
									   		{
									   			t=false;
									   			System.out.println(t+"There is no data entries");
									   		}
									   		else
									   			System.out.println(t+"  from else ");
									   		
									   	}
									   	else
									   	{
									   		 stock_inList = stock_inService.selectAll();
									   	}
								
								List<Stock_InDetail>stdList=stdservice.selectAll();
												IUserService userservice=(IUserService)SpringBeanFactory.getBean("UserService");
										%>

										<tbody>
											<%
												for(Stock_in s:stock_inList){
																																		for (Stock_InDetail stock : stdList) {
											%>
											<tr>
												<%
													if(s.getStockInId()==stock.getStock_in_id()) {
												%>
												<td>
													<%
														out.println(s.getConarridate());
													%>
												</td>
												<td>
													<%
														out.println(s.getStockIndate());
													%>
												</td>

												<td>
													<%
														out.println(stock.getMerchandise_id());
													%>
												</td>
												<%-- <td>
													<%
														out.println(stock.getMerchandise_name());
													%>
												</td> --%>
												<td>
													<%
														out.println(stock.getQty());
													%>
												</td>
												<td>
													<%
														out.println(stock.getSub_unit_id());
													%>
												</td>
												<td>
													<%
														out.println(stock.getRemark());
													%>
												</td>
												<%
													User u2 = userservice.selectUser(stock.getCreated_user_id());
																																								User u1 = userservice.selectUser(stock.getModified_user_id());
												%>
												<%-- <%
													if(stock .getFlag()==1){
												%>
												<td><font color="green">ON</font></td>
												<%
													} else {
												%>
												<td><font color="red">OFF</font></td>
												<%
													}
												%> --%>


												 
														<%
															}
														%>
														<%
															}
														%>
												
											
											</tr>
											<%
												}
											%>
											There is no data entries.
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
									<h4 class="modal-title">Adding new StockIN data</h4>
								</div>

								<div class="modal-body p10">
									<p>StockIn Entry</p>
								</div>

								<form action="/warehouse/Stock_inController"
									onsubmit="return validate()" name="sample">
									<div class="container">
										<h2>Stock In</h2>
										<br> <br>
										<div class="row">
											<div class="col-sm-4">

												<label for="lblConArriDate">Container Arrival Date</label><br>
												<input type="date" class="form-control" value="Enter"
													id="datePickerConArn" name="datePickerConArn" required><br>

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
														onchange="warehouse()">
														<option disabled selected>Select WareHouse</option>

														<%
															List<Warehouse> warehouseList=(List<Warehouse>) request.getAttribute("warehouse");
													        for(Warehouse ware:warehouseList){
														%>
														<option>
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

													<input type="hidden" id="hid" name="cboWarehouse">
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
														<option disabled selected>Select Supplier</option>
														<%
															List<Supplier> supplierList =(List<Supplier>) request.getAttribute("supplier");
																																						    	for(Supplier sup:supplierList){
														%>
														<option>
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
												<label for="lblVNo">Remark</label><br> <input
													type="text" class="form-control" id="txtRemark"
													name="txtRemark" required><br> <br>
											</div>
										</div>
									</div>


									<div class="container">
										<div class="row">
											<div class="col-sm-4">
												<label for="lblCategory">Category</label><br>
												<div class="dropdown">
													<select class="form-control" id="cboCategory"
														onchange="cat()" name="cboCategory">
														<option disabled selected>Select Category</option>
														<%--      <% for(Category ca:categoryList){%>
      <option><%out.println(ca.getName()); %></option>
      <%}%> --%>
													</select>
												</div>
												<br> <br>
											</div>

											<div class="col-sm-4">
												<label for="lblWarehouse">SubCategory</label><br>
												<div class="dropdown">
													<select class="form-control" onchange="secondcat()"
														name="cboSubCategory" id="sub">
														<option disabled selected>Select Sub Category</option>
													</select>
												</div>
												<br> <br>
											</div>

											<div class="col-sm-4">
												<label for="lblWarehouse">Brand</label><br>
												<div class="dropdown">
													<select class="form-control" id="third" onchange="brand()"
														name="cboBrand">
														<option disabled selected>Select Brand</option>
													</select>
												</div>
												<br> <br>
											</div>

										</div>
										<!-- Catch id -->
										<%-- <script>
function mer(){
		 var mer=document.getElementById("cboMerchandise").value;
		 var merchannamearr=[<%=merchanname%>];
		 var merchanidarr=[<%=merchanid%>];
		 var meridarr=[<%=merid%>];
		 var count=0;
		for(var i=0;i<merchannamearr.length;i++){
				if(mer==merchannamearr[i]){
				count=i;
				break;
				}
		}
		document.getElementById("merchandise").value=meridarr[count];	
	}
</script> --%>
										<!-- Catch supplier id -->
										<script type="text/javascript">
function suplier(){
	var sup=document.getElementById("cboSupplier").value;
	<%String supname="";
		String supid="";
		for(Supplier su:supplierList){
			supname+="\'"+su.getName()+"\',";
			supid+="\'"+su.getSupplier_id()+"\',";
		}%>
	var supnamearr=[<%=supname%>];
	var supidarr=[<%=supid%>];
	var count=0;
	for(var i=0;i<supnamearr.length;i++){
		if(sup==supnamearr[i]){
			count=i;
			break;
		}
	}
	document.getElementById("supplier").value=supidarr[count];

}
</script>

			<div class="row">
				<div class="col-sm-4">
					<label for="lblWarehouse">Merchandise</label><br>
					<div class="dropdown">
						<select class="form-control" id="cboMerchandise"
							onchange="mer()">
							<option disabled selected>Select Merchandise</option>
							
						</select>
					</div>
					<br> <br>
				</div>
				<div class="col-sm-4">
					<label for="lblWarehouse">Qty</label><br> <input
						type="text" class="form-control" id="txtQty" name="txtQty"
						required><br>
				</div>
				<div class="col-sm-4">
					<label for="lblSubunit">Sub Unit</label><br> <select
						class="form-control" id="cbosubunit" name="cbosubunit"
						required>
						<option disabled selected>Select Basic Unit</option>
					</select><br>


				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<center>
						<input type="button" value="Add" class="add-row" name="" />
					</center>
				</div>
				<div class="col-sm-6">
					<center>
						<input type="button" value="Remove" class="delete-row"
							name="" />
					</center>

				</div>

			</div>
		</div>
		<br> <br>


		<!-- table -->
		<div class="container">
			<style>
#table1 tbody tr{
transition:all .25s ease-in-out
}
#table1 tbody tr:hover { background-color: skyblue; cursor:pointer;

}
</style>
										<table class="table" border="2" id="table1">
                                           <thead>
											<tr id="t1">
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
											name="page" value="submit">
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
    $(document).ready(function(){
        $(".add-row").click(function(){
            var merchandise = $("#cboMerchandise").val();
            var qty = $("#txtQty").val();
            var subunit = $("#cbosubunit").val();
            var remark = $("#txtRemark").val();  
            var voucher=$("#txtVoucherNo").val();
            var merid=$("#merchandise").val();
            var markup = "<tr><td><center><input type='hidden' name='merid' value='"+merid+"'/>"+merid+"</center></td><td><input type='hidden' name='cboMerchandise' value= '" + merchandise +"'/>" + merchandise + "</td><td><input type='hidden' name='txtQty' value='"+qty+"'/>" + qty +"</td><td><input type='hidden' name='cbosubunit' value='" + subunit +"'/>" + subunit +"</td><td><input type='hidden' name='txtRemark' value='"+remark+"'/>" + remark+"</td><td><input type='hidden' name='txtVoucherNo' value='"+voucher+"'/>"+voucher +"</td><td><input type='checkbox' name='record'  /> </td></tr>";
            $("#table1 tbody").append(markup);
        });
        
        // Find and remove selected table rows
         $(".delete-row").click(function(){
            $("#table1 tbody").find('input[name="record"]').each(function(){
            	if($(this).is(":checked")){
                    $(this).parents("tr").remove();
                }
            });
        });
    });     
</script>

	<!--  End add function-->

	<!-- Start Stock In Edit modal box -->
	<div class="modal fade" id="rowEd" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header w3-container w3-light-blue ">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Edit StockIN data</h4>
				</div>

				<div class="modal-body p10">
					<p>Stock In Detail Edit</p>
				</div>

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
								<tbody align="right">

									<tr>
										<td><b>Stock In id:</b></td>
										<td><input type="text" class="form-control"
											id="stock_in_detail_id" name="stock_in_id"></td>
									</tr>
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
										<td><b>Warehose Id:</b></td>

										<td><select class="form-control" id="cboWarehouse"
											name="cbowh" onchange="warehouse()">
												<option disabled selected>Select WareHouse</option>
												<%
													for (Warehouse w : warehouseList) {
												%>
												<option>
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
													for (Supplier sup : supplierList) {
												%>
												<option>
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

</body>
</html>
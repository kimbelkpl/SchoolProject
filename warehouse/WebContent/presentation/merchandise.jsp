<%@page
	import="org.springframework.expression.spel.support.ReflectionHelper.ArgumentsMatchInfo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="com.java.plyd.service.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Merchandise Page</title>
<%@ include file="link.jsp"%>  
</head>
<body class="w3-container w3-light-gray"
	onload="existOrNot('<%out.print(request.getAttribute("exist")); %>','<%out.print(request.getAttribute("name")); %>',
	'<%out.print(request.getAttribute("txtcategory"));%>','<%out.print(request.getAttribute("subcategory"));%>',
	'<%out.print(request.getAttribute("txtsubcategory"));%>','<%out.print(request.getAttribute("brand"));%>',
	'<%out.print(request.getAttribute("txtbasicunit"));%>','<%out.print(request.getAttribute("txtsubunit"));%>',
	'<%out.print(request.getAttribute("txtname"));%>','<%out.print(request.getAttribute("txtconvertionunit"));%>',
	'<%out.print(request.getAttribute("txtconvertionvalue"));%>','<%out.print(request.getAttribute("txtunitprice"));%>',
	'<%out.print(request.getAttribute("mid"));%>')">
	
		<%
		IMerchandiseService mService=(IMerchandiseService) SpringBeanFactory.getBean("MerchandiseService");
		ISub_category_service scService=(ISub_category_service) SpringBeanFactory.getBean("Sub_category_service");
		ICategoryService cService=(ICategoryService)SpringBeanFactory.getBean("CategoryService");
		IBrandService brandService=(IBrandService) SpringBeanFactory.getBean("BrandService");
		ISubCategoryAndBrandService subandbrandservice=(ISubCategoryAndBrandService)SpringBeanFactory.getBean("SubCategoryAndBrandService");
		IBasicunitService bService = (IBasicunitService) SpringBeanFactory.getBean("BasicunitService");
		ISubUnitService suService = (ISubUnitService) SpringBeanFactory.getBean("SubUnitService");%>
		<!--  for category to subcategory new and edit -->
		
		<%@ include file="header.jsp"%>
		<!-- for body part of the body column -->
				<div class="row panel-body p10">
					<!-- inserting the code for each operation -->
					<div class="col-sm-9">
						<div class="row p10">
							<div class="panel panel-default">
						  		<div class="panel-heading w3-container w3-light-blue p10">
						  			<button type="button" class="btn w3-container w3-light-blue p-header-btn" data-toggle="modal" data-target="#addNew" id="btnAddNew"><span class="glyphicon glyphicon-plus"></span>Add New Merchandise</button> 
			  						<!-- <button type="button" class="btn w3-container w3-light-blue p-header-btn" data-toggle="modal" data-target="#search"><span class="glyphicon glyphicon-search"></span> Search</button> -->
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
			<div>
				<table class="table table-condensed table-bordered p10" id="example">
					<caption class="w3-container w3-text-black w3-myfont">Merchandise
						Information Lists</caption>

					<thead class="w3-container w3-light-blue p10">
						<tr>
							<th>Name</th>
							<th>Sub Category</th>
							<th>Brand</th>
							<th>Sub Unit</th>
							<th>Convertion Unit</th>
							<th>Convertion Value</th>
							<th>Unit price</th>
							<!-- <th>Flag</th> -->
							<th>Options</th>
						</tr>
					</thead>
					<tbody>
						<%
							List<Merchandise> mList = (List<Merchandise>) mService.selectAll();
							for (Merchandise m : mList) {
						%>

						<tr>
							<td>
								<%
									out.print(m.getName());
								%>
							</td>
							<%
								Sub_category sc = scService.selectSub_category(m.getSub_category_id());
								Brand b = brandService.selectBrand(m.getBrand_id());
								SubUnit su = suService.selectSubUnit(m.getSub_unit_id());
								SubUnit con = suService.selectSubUnit(m.getConvertion_unit_id());
							%>
							<td>
								<%
									out.print(sc.getName());
								%>
							</td>
							<td>
								<%
									out.print(b.getName());
								%>
							</td>
							<td>
								<%
									out.print(su.getName());
								%>
							</td>
							<td>
								<%
									out.print(con.getName());
								%>
							</td>
							<td>
								<%
									out.print(m.getConvertion_value());
								%>
							</td>
							<td>
								<%
									out.print(m.getUnit_price());
								%>
							</td>

							<%-- <%
							if(m.getFlag()==1){
						%>
							<td><font color="green">ON</font></td>
							<%
							} else{
						%>
							<td><font color="red">OFF</font></td>
							<%
							}
						%> --%>

							<td class="dropdown">
								<button
									class="btn w3-container w3-white w3-text-blue w3-hover-blue w3-hover-text-white ptb dropdown-toggle"
									data-toggle="dropdown">
									<span class="glyphicon glyphicon-cog"></span>
								</button>
								<ul class="dropdown-menu">
									<li class="w3-container w3-hover-blue p10" data-toggle="modal"
										data-target="#rowView" 
										onclick="view('<%out.print(m.getName()); %>','<%out.print(m.getSub_category_id()); %>',
										'<%out.print(m.getBrand_id()); %>',
										'<%out.print(m.getSub_unit_id()); %>','<%out.print(su.getSub_unit_id()); %>',
										'<%out.print(m.getConvertion_value()); %>','<%out.print(m.getUnit_price()); %>',
										'<%out.print(m.getCreated_user_id()); %>','<%out.print(m.getModified_user_id()); %>',
										'<%out.print(m.getCreated_date()); %>','<%out.print(m.getModified_date()); %>')"><span
										class="glyphicon glyphicon-eye-open"></span> View</li>
									<li class="w3-container w3-hover-blue p10" data-toggle="modal"
										data-target="#rowEd"
										onclick="edit('<%out.print(m.getMerchandise_id()); %>','<%out.print(m.getName()); %>',
										'<%out.print(sc.getCategory_id()); %>','<%out.print(m.getSub_category_id()); %>',
										'<%out.print(m.getBrand_id()); %>','<%out.print(m.getSub_unit_id()); %>',
										'<%out.print(m.getConvertion_unit_id()); %>','<%out.print(m.getConvertion_value()); %>',
										'<%out.print(m.getUnit_price()); %>','<%out.print(m.getFlag()); %>',
										'<%out.print(su.getBasic_unit_id()); %>')" id="btnEdit<%out.print(m.getMerchandise_id()); %>"><span
										class="glyphicon glyphicon-edit"></span> Edit</li>
									<%if(m.getFlag()==1){ %>
									<li class="w3-container w3-hover-blue p10"
										onclick="confirmDelete('<%out.print(m.getMerchandise_id());%>')">
										<span class="glyphicon glyphicon-remove-circle"></span> Delete
										<%}else{ %>
									
									<li class="w3-container w3-hover-blue p10 disabled"><font
										color="gray"> <span
											class="glyphicon glyphicon-remove-circle"></span> Delete
									</font> <%} %></li>
								</ul> 

							</td>
						</tr>
						<%
														}
													%>
					</tbody>
				</table>
			</div>
			<!-- end of search result table -->
		</div>
		</div>
		</div>
		</div>
		<!-- end of inserting the code for each operation -->

		<!-- start of all modal for column Edition -->

		<!-- start of Modal for add new the row -->
		<div class="modal fade" id="addNew" role="dialog">
			<div class="modal-dialog" style="width: 80%;" align="center">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header w3-container w3-light-blue p10">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Adding New Merchandise</h4>
					</div>
					<form action="/warehouse/MerchandiseController" onsubmit="return validate()" name="forms">
					<div class="modal-body p10">

						<div class="row container-fluid">
						
							<div class="col-sm-4">
								

									<table>
										<tr>
											<td><label for="lblCategory">Category </label></td>
										</tr>
										<tr>
											<td><%
												ICategoryService caService = (ICategoryService) SpringBeanFactory
														.getBean("CategoryService");
												List<Category> cList = (List<Category>) cService.selectAll();
											%> <select name="cboCategory" id="cboCategory"  class="u-full-width form-control"
												onchange='cat("new")' style="width: 100%;">
													<option value="-1">Choose yours</option>

													<%
																			for (Category c : cList) {
																		%>
													<option value="<%out.print(c.getCategory_id());%>">
														<%
																				out.print(c.getName());
																			%>
													</option>
													<%
																			}
																		%>
																		
																<option onclick="showNewCateDiv()" class="addBrandSub" id="addcate">Add New Category</option>
						
											</select></td>
											<script type="text/javascript">
									function showNewCateDiv(){
										document.getElementById("newCateDiv").style.display="block";
										document.getElementById("newBasicDiv").style.display="none";
										document.getElementById("newSubCategoryDiv").style.display="none";
										document.getElementById("newSubUnitDiv").style.display="none";
										document.getElementById("newBrandDiv1").style.display="none";
										document.getElementById("newBrandDiv").style.display="none";

									}
									function hideNewCateDiv(){
										document.getElementById("newCateDiv").style.display="none";
									}
								</script>
											</tr>
										<tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td><label for="lblBasicUnit">Base Type</label></td>
										</tr>
										<tr>
											<td>
												<%
											List<Basicunit> buList = (List<Basicunit>)bService.selectAll();
											%> <select name="cboBasicUnit" id="cboBasicUnit"  class="u-full-width form-control"
												onchange='bunit("new")' style="width: 100%;">
													<option value="-1">Choose yours</option>
													<%
																			for (Basicunit bu : buList) {
																		%>
													<option value="<%out.print(bu.getBasic_unit_id());%>">
														<%
																				out.print(bu.getName());
																			%>
													</option>
													<%
																			}
																		%>
																		<option onclick="showNewBasicDiv()" class="addBrandSub" id="addbasic">Add New Base Type</option>
											</select>
											</td>
											</tr>
											<script type="text/javascript">
									function showNewBasicDiv(){
										document.getElementById("newBasicDiv").style.display="block";
										document.getElementById("newCateDiv").style.display="none";
										document.getElementById("newSubCategoryDiv").style.display="none";
										document.getElementById("newSubUnitDiv").style.display="none";
										document.getElementById("newBrandDiv1").style.display="none";
										document.getElementById("newBrandDiv").style.display="none";

									}
									function hideNewBasicDiv(){
										document.getElementById("newBasicDiv").style.display="none";
									}
								</script>
										<tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											</tr>
											<tr>
										<td><label for="lblName">Merchandise Name</label></td></tr>
										<tr>
										<td><input type="text" id="lblName" name="txtName" class="u-full-width form-control" placeholder="Merchandise Name" required /></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
								</table>
						
						
							</div>
							<div class="col-sm-4">
								<table>
									<tr>
										<td><label for="lblSubCategory">Sub Category </label></td>
									</tr>
									<tr>
										<td><select name="cboSubCategory" id="cboSubCategory"  class="u-full-width form-control"
											onchange='sc("new")' style="width: 100%;">
												<option value="-1">Choose yours</option>
												
										</select></td>
									</tr>
									<script type="text/javascript">
									function showNewSubCategoryDiv(){
										document.getElementById("newSubCategoryDiv").style.display="block";
										document.getElementById("newCateDiv").style.display="none";
										document.getElementById("newBasicDiv").style.display="none";
										document.getElementById("newSubUnitDiv").style.display="none";
										document.getElementById("newBrandDiv1").style.display="none";
										document.getElementById("newBrandDiv").style.display="none";

									}
									function hideNewSubCategoryDiv(){
										document.getElementById("newSubCategoryDiv").style.display="none";
									}
								</script>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td><label for="lblSubUnit">Sub Units </label></td>
									</tr>
									<tr>
										<td><select name="cboSubUnit" id="cboSubUnitid" onchange='ex("new")' class="u-full-width form-control"
											style="width: 100%;">
												<option value="-1">Choose yours</option>

										</select></td>
									</tr>
									<script type="text/javascript">
									function showNewSubUnitDiv(){
										document.getElementById("newSubUnitDiv").style.display="block";
										document.getElementById("newCateDiv").style.display="none";
										document.getElementById("newBasicDiv").style.display="none";
										document.getElementById("newSubCategoryDiv").style.display="none";
										document.getElementById("newBrandDiv1").style.display="none";
										document.getElementById("newBrandDiv").style.display="none";

									}
									function hideNewSubUnitDiv(){
										document.getElementById("newSubUnitDiv").style.display="none";
									}
								</script>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										</tr>
										<tr>
										<td><label for="lblConvertionValue">Convertion
												Value</label></td></tr>
												<tr>
										<td><input type="text" id="idConvertionValue"  class="u-full-width form-control" 
											name="txtConvertionValue" placeholder="Convertion Value" required /></td>
										<td><p id="conValueAlert"></p></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
								</table>
								
								<!-- for remodal start-->
								<input type="hidden" id="btnsubcater" onclick="showNewSubCategoryDiv()"/>
								<input type="hidden" id="btnsubur" onclick="showNewSubUnitDiv()"/>
								<input type="hidden" id="btnbrandr" onclick="showNewBrandDiv1()"/>
								<input type="hidden" id="edsubcater" onclick="showNewSubCategoryDiv2()"/>
								<input type="hidden" id="edsubunitr" onclick="showNewSubUnitDiv1()"/>
								<input type="hidden" id="edbrandr" onclick="showNewBrandDiv3()"/>
								<input type="hidden" id="hidtype" name="hidtype"/>
								<input type="hidden" id="hidtype1" name="hidtype1"/>
								<input type="hidden" id="hidtype2" name="hidtype2"/>
								<!-- for remodal end-->
								
								<!-- here -->
							<!-- add new category -->
						<div class="row" id="newCateDiv" style="display:none;">
								<div class="col-sm-1"></div>
								<div class="col-sm-10" style="border-style: solid;border-radius:30px;border-color: skyblue;">
								<center><h4>Add New Category</h4></center>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-5">
											<label for="lblName">Category</label>
										</div>
										<div class="col-sm-5">
											<input class="u-full-width form-control" type="text" name="txtcate1" id="idtxtcate1" placeholder="Name" required/>
										</div>
										<div class="col-sm-1"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-5">
											<label for="lblRemark">Remark</label>
										</div>
										<div class="col-sm-5">
											<input class="u-full-width form-control" type="text" name="txtRemark1" id="idtxtRemark1" placeholder="Remark" required/>
										</div>
										<div class="col-sm-1"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-5">
											<button type="button" class="btn btn-primary" onclick="AddNewCategory()" id="btnAddSubCate">Add Category</button>
										</div>
										<script type="text/javascript">
											function AddNewCategory(){
												if(document.getElementById("idtxtcate1").value!=""){
													var cateName=document.getElementById("idtxtcate1").value;
													var remark1=document.getElementById("idtxtRemark1").value;
													location.href="/warehouse/CategoryController?page=AddCate&cateName="+cateName+"&txtRemark1="+remark1;
												}
												else 
													alert("Enter category name!");
											}
										</script>
										<div class="col-sm-5">
											<button class="btn btn-primary" type="button" onclick="hideNewCateDiv()" id="hideCategory">Cancel</button>
										</div>
										<div class="col-sm-1"></div>
									</div><br>
								</div>
								<div class="col-sm-1"></div>
							</div>
							
							<!-- end new category -->
							
							<!-- add new brand -->
								
								<div class="row" id="newBrandDiv1">
								<div class="col-sm-1"></div>
								<div class="col-sm-10" style="border-style: solid;border-radius:15px;border-color: skyblue;">
								<center><h4>Add Brand</h4></center>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-5">
											<label for="lblName">Brand Name</label>
										</div>
										<div class="col-sm-5">
											<input class="u-full-width form-control" type="text" name="txtbrand2" id="idtxtbrand2" placeholder="Name" required/>
										</div>
										<div class="col-sm-1"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-5">
											<label for="lblRemark">Remark</label>
										</div>
										<div class="col-sm-5">
											<input class="u-full-width form-control" type="text" name="txtRemark6" id="idtxtRemark6" placeholder="Remark" required/>
										</div>
										<div class="col-sm-1"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-5">
											<button type="button" class="btn btn-primary" onclick="AddNewBrand1()">Add Brand</button>
										</div>
										<script type="text/javascript">
											function AddNewBrand1(){
												if(document.getElementById("idtxtbrand2").value!=""){
													var subcategory=document.getElementById("cboSubCategory").value;
													var bName=document.getElementById("idtxtbrand2").value;
													var remark6=document.getElementById("idtxtRemark6").value;
													var category=document.getElementById("cboCategory").value;
													var subcategory1=document.getElementById("hidtype").value;
												location.href="/warehouse/BrandController?page=AddBrand1&txtbrand21="+bName+"&subcategory="+subcategory+"&txtRemark6="
														+remark6+"&category="+category+"&subcategory1="+subcategory1;
												}
												else
													alert("Enter Brand Name!");
											}
										</script>
										<div class="col-sm-5">
											<button class="btn btn-primary" type="button" onclick="hideNewBrandDiv1()" id="hideBrand">Cancel</button>
										</div>
										<div class="col-sm-1"></div>
									</div><br>
								</div>
								<div class="col-sm-1"></div>
							</div>	
								<!-- end new brand -->
							
							<!-- add new basic unit -->
							<div class="row" id="newBasicDiv" style="display:none;">
								<div class="col-sm-1"></div>
								<div class="col-sm-10" style="border-style: solid;border-radius:15px;border-color: skyblue;">
								<center><h4>Add Base Type</h4></center>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-5">
											<label for="lblName">Base Type</label>
										</div>
										<div class="col-sm-5">
											<input class="u-full-width form-control" type="text" name="txtBasic" id="idtxtBasic" placeholder="Name" required/>
										</div>
										<div class="col-sm-1"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-5">
											<label for="lblRemark">Remark</label>
										</div>
										<div class="col-sm-5">
											<input class="u-full-width form-control" type="text" name="txtRemark2" id="idtxtRemark2" placeholder="Remark" required/>
										</div>
										<div class="col-sm-5"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-5">
											<button type="button" class="btn btn-primary" onclick="AddNewBasic()">Add</button>
										</div>
										<script type="text/javascript">
											function AddNewBasic(){
												if(document.getElementById("idtxtBasic").value!=""){
													var buName=document.getElementById("idtxtBasic").value;
													var remark2=document.getElementById("idtxtRemark2").value;
													var category=document.getElementById("cboCategory").value;
													var subcategory=document.getElementById("hidtype").value;
													var brand=document.getElementById("hidtype1").value;
													
												location.href="/warehouse/BasicUnitController?page=AddBasic&buName="+buName+"&txtRemark2="+remark2+"&category="+category+"&subcategory="+subcategory+"&brand="+brand;
												}
												else 
													alert("Enter Base Type!");
											}
										</script>
										<div class="col-sm-5">
											<button class="btn btn-primary" type="button" onclick="hideNewBasicDiv()" id="hideBrand">Cancel</button>
										</div>
										<div class="col-sm-1"></div>
									</div><br>
								</div>
								<div class="col-sm-1"></div>
							</div>
							
							<!-- end new basic unit -->
								<!-- end -->
								
								<!-- add new sub unit -->
							<div class="row" id="newSubUnitDiv" style="display:none;">
								<div class="col-sm-1"></div>
								<div class="col-sm-10" style="border-style: solid;border-radius:15px;border-color: skyblue;">
								<center><h4>Add Sub Unit</h4></center>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-5">
											<label for="lblName">Sub Unit</label>
										</div>
										<div class="col-sm-5">
											<input class="u-full-width form-control" type="text" name="txtSubUnit" id="idtxtSubUnit" placeholder="Name" required/>
										</div>
										<div class="col-sm-5"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-5">
											<label for="lblRemark">Remark</label>
										</div>
										<div class="col-sm-5">
											<input class="u-full-width form-control" type="text" name="txtRemark3" id="idtxtRemark3" placeholder="Remark" required/>
										</div>
										<div class="col-sm-1"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-5">
											<button type="button" class="btn btn-primary" onclick="AddNewSubUnit()">Add</button>
										</div>
										<script type="text/javascript">
											function AddNewSubUnit(){
												if(document.getElementById("idtxtSubUnit").value!=""){
													var suName=document.getElementById("idtxtSubUnit").value;
													var remark3=document.getElementById("idtxtRemark3").value;
													var category=document.getElementById("cboCategory").value;
													var subcategory=document.getElementById("hidtype").value;
													var brand=document.getElementById("hidtype1").value;
													var cboBasic=document.getElementById("cboBasicUnit").value;
													
												location.href="/warehouse/SubUnitController?page=AddSubUnit&suName="+suName+"&txtRemark3="+remark3+"&cboBasic="+cboBasic
														+"&category="+category+"&subcategory="+subcategory+"&brand="+brand;
												}
												else 
													alert("Enter Sub Unit!");
											}
										</script>
										<div class="col-sm-5">
											<button class="btn btn-primary" type="button" onclick="hideNewSubUnitDiv()" id="hideBrand">Cancel</button>
										</div>
										<div class="col-sm-1"></div>
									</div><br>
								</div>
								<div class="col-sm-1"></div>
							</div>
							
							<!-- end new sub unit -->
							
							<!-- add new subcategory -->
							<div class="row" id="newSubCategoryDiv">
								<div class="col-sm-1"></div>
								<div class="col-sm-10" style="border-style: solid;border-radius:15px;border-color: skyblue;">
								<center><h4>Add SubCategory</h4></center>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-5">
										<input type="hidden" id="idNo" value=" ">
											<label for="lblName">Sub Category</label>
										</div>
										<div class="col-sm-5">
											<input class="u-full-width form-control" type="text" name="txtsubcate1" id="idtxtsubcate1" placeholder="Name" required/>
										</div>
										<div class="col-sm-1"></div>
									</div><br>
									
									<div class="row">
								<div class="col-sm-1"></div>
								<div class="col-sm-5">
									<label for="brand">Brand</label>
								</div>
								<div class="col-sm-5">
									<div class="col-sm-10 btn btn-default btnDropdown"  data-toggle="dropdown" id="btnDropdown">
			  					<%IBrandService brand_service = (IBrandService) SpringBeanFactory
			  							.getBean("BrandService");
								  List<Brand> bl1=brand_service.selectAll();
								%>
									Select Brand(s)&nbsp;&nbsp;<span class="caret"></span></div>
			  						<ul class="dropdown-menu dropdown-menu-right droplist">
			  						<%for(Brand b:bl1){ %>
			  						<li>&nbsp;&nbsp;<input type="checkbox" name="brand1" value="<%out.print(b.getBrand_id());%>"/><%out.print(b.getName()); %></li>
			  						<%} %>
			  						<li onclick="showNewBrandDiv()" class="addBrandSub" id="subcatebrand">Add new brand</li>
			  						</ul>
								</div>
								<script type="text/javascript">
									function showNewBrandDiv(){
										document.getElementById("newBrandDiv").style.display="block";
											document.getElementById("newSubCategoryDiv").style.display="none";
											document.getElementById("newCateDiv").style.display="none";
											document.getElementById("newBasicDiv").style.display="none";
											document.getElementById("newSubUnitDiv").style.display="none";
											document.getElementById("newBrandDiv1").style.display="none";
									}
									function hideNewBrandDiv(){
										document.getElementById("newBrandDiv").style.display="none";
										document.getElementById("newSubCategoryDiv").style.display="block";
									}
								</script>
								<div class="col-sm-1"></div>
							</div><br>
							
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-5">
											<label for="lblRemark">Remark</label>
										</div>
										<div class="col-sm-5">
											<input class="u-full-width form-control" type="text" name="txtRemark4" id="idtxtRemark4" placeholder="Remark" required/>
										</div>
										<div class="col-sm-1"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-5">
											<button type="button" class="btn btn-primary" onclick="AddNewSubCategory()">Add</button>
										</div>
										<script type="text/javascript">
											function AddNewSubCategory(){
												var bran=document.getElementsByName("brand1");
												var branArray=new Array();
												var k=0;
												for ( var i = 0; i < bran.length; i++) {
													if(bran[i].checked){
														branArray[k]=bran[i].value;
														k++;
													}
												
											}
												if(document.getElementById("idtxtsubcate1").value!="" && branArray!=""){
													var brand=document.getElementsByName("brand1");
													var cate=document.getElementById("cboCategory").value;
													var sName=document.getElementById("idtxtsubcate1").value;
													var remark4=document.getElementById("idtxtRemark4").value;
													var category=document.getElementById("cboCategory").value;
													var brandArray=new Array();
													var f=0;
													for ( var i = 0; i < brand.length; i++) {
														if(brand[i].checked){
															brandArray[f]=brand[i].value;
															f++;
														}
													
												}
													
													location.href="/warehouse/Sub_category_controller?page=AddNewSubCategory&txtsubcate1="+sName+
															"&txtRemark4="+remark4+"&brand1="+brandArray+"&cate="+cate+"&category="+category;
												}
												else
													alert("Enter SubCategory & Select Brand(s)!");							
											}
										</script>
										<div class="col-sm-5">
											<button class="btn btn-primary" type="button" onclick="hideNewSubCategoryDiv()" id="hideBrand">Cancel</button>
										</div>
										<div class="col-sm-1"></div>
									</div><br>
								</div>
								<div class="col-sm-1"></div>
							</div>
							
							<!-- inside of add new subcategory brand -->
									<div class="row" id="newBrandDiv">
								<div class="col-sm-1"></div>
								<div class="col-sm-10" style="border-style: solid;border-radius:15px;border-color: skyblue;">
								<center><h4>Add Brand</h4></center>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-5">
											<label for="lblName">Brand Name</label>
										</div>
										<div class="col-sm-5">
											<input class="u-full-width form-control" type="text" name="txtbrand1" id="idtxtbrand1" placeholder="Name" required/>
										</div>
										<div class="col-sm-1"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-5">
											<label for="lblRemark">Remark</label>
										</div>
										<div class="col-sm-5">
											<input class="u-full-width form-control" type="text" name="txtRemark5" id="idtxtRemark5" placeholder="Remark" required/>
										</div>
										<div class="col-sm-1"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-5">
											<button type="button" class="btn btn-primary" onclick="AddNewBrand()">Add Brand</button>
										</div>
										<script type="text/javascript">
											function AddNewBrand(){
												if(document.getElementById("idtxtbrand1").value!=""){
													var bName=document.getElementById("idtxtbrand1").value;
													var remark5=document.getElementById("idtxtRemark5").value;
													var subcategory=document.getElementById("idtxtsubcate1").value;
													var cate=document.getElementById("cboCategory").value;
													
												location.href="/warehouse/BrandController?page=AddNewBrand&txtbrand1="+bName+"&txtRemark5="+remark5+
														"&subcategory="+subcategory+"&cate="+cate;
												}
												else 
													alert("Enter Brand Name!");
											}
										</script>
										<div class="col-sm-5">
											<button class="btn btn-primary" type="button" onclick="hideNewBrandDiv()" id="hideBrand">Cancel</button>
										</div>
										<div class="col-sm-1"></div>
									</div><br>
									</div>
									<div class="col-sm-1"></div>
									</div>
									<!-- end inside of add new subcategory brand -->
							
							<!-- end new subcategory -->
								
							</div>
							<div class="col-sm-4">
								<table>

									<tr>
										<td><label for="lblBrand">Brand</label></td>
									</tr>
									<tr>
										<td><select name="cboBrand" id="cboBrand"  class="u-full-width form-control"
											style="width: 100%;">
												<option value="-1">Choose yours</option>
										</select></td>
										</tr>
										<script type="text/javascript">
									function showNewBrandDiv1(){
										document.getElementById("newBrandDiv1").style.display="block";
										document.getElementById("newCateDiv").style.display="none";
										document.getElementById("newBasicDiv").style.display="none";
										document.getElementById("newSubCategoryDiv").style.display="none";
										document.getElementById("newSubUnitDiv").style.display="none";
										document.getElementById("newBrandDiv").style.display="none";

									}
									function hideNewBrandDiv1(){
										document.getElementById("newBrandDiv1").style.display="none";
									}
								</script>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td><label for="lblConvertionUnit">Convertion
												Unit </label></td>
									</tr>
									<tr>
										<td><select name="cboConvertionUnit"  class="u-full-width form-control"
											id="cboConvertionUnit" style="width: 100%;">
												<option value="-1">Choose yours</option>
										</select></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td><label for="lblUnitPrice">Unit Price</label></td></tr>
										<tr>
										<td><input type="text" id="idUnitPrice"  class="u-full-width form-control"  
											name="txtUnitPrice" placeholder="Unit Price" required /></td>
										<td><p id="unitPriceAlert"></p></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
								</table>
								
							</div>
						<br>
						</div>
					</div>
					<div class="modal-footer p10">
						<button type="submit"
							class="btn btn-default w3-container w3-light-blue p10"
							name="page" value="Add">Add</button>
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
	<!-- end of the add new of the row -->
	
	<!-- start of Modal for view the row -->
	<div class="modal fade" id="rowView" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header w3-container w3-light-blue p10">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Showing Each Merchandise Information</h4>
				</div>
				<form>
					<div class="modal-body p10">
						<!-- <span style="font-size: 2em" id="user"
								class="glyphicon glyphicon-user"></span><br>  -->
						<div class="row">
						<div class="col-sm-1"></div>
						<div class="col-sm-5">
						<p><label>Merchandise Name:</label></p>
						<p><label>Sub Category:</label></p>
						<p><label>Brand:</label></p>
						<p><label>Sub Unit:</label></p>
						<p><label>Convertion Unit:</label></p>
						<p><label>Convertion Value:</label></p>
						<p><label>Unit Price:</label></p>
						<p><label>Created User Id:</label></p>
						<p><label>Modified User Id:</label></p>
						<p><label>Created Date:</label></p>
						<p><label>Modified Date:</label></p>
						</div>
						
						<div class="col-sm-4">
						<label><p id="viewname"></p></label>
						<label><p id="viewsubcategory"></label></p>
						<label><p id="viewbrand"></label></p>
						<label><p id="viewsubunit"></label></p>
						<label><p id="viewconvertionunit"></label></p>
						<label><p id="viewconvertionvalue"></label></p>
						<label><p id="viewunitprice"></label></p>
						<label><p id="viewcreateduserid"></label></p>
						<label><p id="viewmodifieduserid"></label></p>
						<label><p id="viewcreateddate"></label></p>
						<label><p id="viewmodifieddate"></label></p>
						</div>
						<!-- <div class="col-sm-2"></div> -->
						</div>
					</div>
					<div class="modal-footer p10">
						<button type="button"
							class="btn btn-default w3-container w3-light-blue p10"
							data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- end of the view of the row --> 


	<!-- start of Modal for edition the row -->
	<div class="modal fade" id="rowEd" role="dialog">
		<div class="modal-dialog" style="width: 80%;" align="center">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header w3-container w3-light-blue p10">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Editing Merchandise Information</h4>
				</div>
				<form action="/warehouse/MerchandiseController" method="post" onsubmit="return confirmEdit()">
					<div class="modal-body p10">
					<div class="row">
						<div class="col-sm-4">
								

									<table>
										<tr>
											<td><input class="u-full-width form-control" type="hidden"
												name="txtId" id="idtxtid" /></td>
										</tr>
										<tr>
											<td><label for="lblUnitPrice">Category</label></td>
										</tr>
										<tr>
											<td><select name="cboCategory" id="idcboCategory" class="u-full-width form-control"
											onchange='cat("edit")' style="width: 100%;">

												<option value="-1">Choose Yours</option>
													<%
														List<Category> cl1=(List<Category>) caService.selectAll();
														for(Category sc:cl1){
													%>
												<option value="<%out.print(sc.getCategory_id()); %>">
												<%out.print(sc.getName()); %>
												</option>
												
										<%
											}
										%>
										<option onclick="showNewCateDiv1()" class="addBrandSub" id="edcater">Add New Category</option>

										</select></td>
										
									</tr>
									<script type="text/javascript">
									function showNewCateDiv1(){
										document.getElementById("newCateDiv1").style.display="block";
										document.getElementById("newBasicDiv1").style.display="none";
										document.getElementById("newSubCategoryDiv2").style.display="none";
										document.getElementById("newSubUnitDiv1").style.display="none";
										document.getElementById("newBrandDiv3").style.display="none";
										document.getElementById("newBrandDiv2").style.display="none";
									}
									function hideNewCateDiv1(){
										document.getElementById("newCateDiv1").style.display="none";
									}
								</script>
										<tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td><label for="lblBrand">Base Type</label></td>
										</tr>
										<tr>	
											<td><select name="cboBasicUnit" id="idcboBasicUnit" onchange='bunit("edit")' class="u-full-width form-control"
												style="width: 100%;">
											<option value="-1">Choose yours</option>
													<%
														for (Basicunit bu : buList) {
																		%>
													<option value="<%out.print(bu.getBasic_unit_id());%>">
														<%
																out.print(bu.getName());
															%>
													</option>
													<%
															}
												%>
												<option onclick="showNewBasicDiv1()" class="addBrandSub" id="edbasicr" >Add New Base Type</option>
											</select></td>
										</tr>
										<script type="text/javascript">
									function showNewBasicDiv1(){
										document.getElementById("newBasicDiv1").style.display="block";
										document.getElementById("newCateDiv1").style.display="none";
										document.getElementById("newSubCategoryDiv2").style.display="none";
										document.getElementById("newSubUnitDiv1").style.display="none";
										document.getElementById("newBrandDiv3").style.display="none";
										document.getElementById("newBrandDiv2").style.display="none";
									}
									function hideNewBasicDiv1(){
										document.getElementById("newBasicDiv1").style.display="none";
									}
								</script>
										<tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											</tr>
											<tr>
										<td><label for="lblName">Name</label></td></tr>
										<tr>
										<td><input class="u-full-width form-control" type="text" pattern="^[a-zA-Z]+[a-z A-Z 0-9 -_- -w-]+$"
											name="txtName" id="idtxtName" /></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
									</table>
									<!-- add new category -->
						
						<div class="row" id="newCateDiv1" style="display:none;" align="right">
								<div class="col-sm-1"></div>
								<div class="col-sm-10" style="border-style: solid;border-radius:20px;border-color: skyblue;">
								<center><h4>Add New Category</h4></center>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-5">
											<label for="lblName">Category Name</label>
										</div>
										<div class="col-sm-5">
											<input class="u-full-width form-control" type="text" name="txtcate1" id="idtxtcate11" placeholder="Name" />
										</div>
										<div class="col-sm-1"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-5">
											<label for="lblRemark">Remark</label>
										</div>
										<div class="col-sm-5">
											<input class="u-full-width form-control" type="text" name="txtRemark1" id="idtxtRemark11" placeholder="Remark" />
										</div>
										<div class="col-sm-1"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-5">
											<button type="button" class="btn btn-primary" onclick="AddNewCategory1()" id="btnAddSubCate">Add Category</button>
										</div>
										<script type="text/javascript">
											function AddNewCategory1(){
												if(document.getElementById("idtxtcate11").value!=""){
													var id=document.getElementById("idtxtid").value;
													var cateName=document.getElementById("idtxtcate11").value;
													var remark1=document.getElementById("idtxtRemark11").value;
												location.href="/warehouse/CategoryController?page=AddCateEdit&cateName="+cateName+"&txtRemark1="+remark1+"&id="+id;
												}
												else 
													alert("Enter Category Name!");
											}
										</script>&nbsp;&nbsp;&nbsp;
										<div class="col-sm-5">
											<button class="btn btn-primary" type="button" onclick="hideNewCateDiv1()" id="hideCategory">Cancel</button>
										</div>
										<div class="col-sm-1"></div>
									</div><br>
								</div>
								<div class="col-sm-1"></div>
							</div>
							
							
							<!-- end new category -->
							<!-- add new basic unit -->
							<div class="row" id="newBasicDiv1" style="display:none;">
								<div class="col-sm-1"></div>
								<div class="col-sm-10" style="border-style: solid;border-radius:15px;border-color: skyblue;">
								<center><h4>Add Base Type</h4></center>
									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-4">
											<label for="lblName">Base Type Name</label>
										</div>
										<div class="col-sm-4">
											<input class="u-full-width form-control" type="text" name="txtBasic" id="idtxtBasic1" placeholder="Name" />
										</div>
										<div class="col-sm-2"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-4">
											<label for="lblRemark">Remark</label>
										</div>
										<div class="col-sm-4">
											<input class="u-full-width form-control" type="text" name="txtRemark2" id="idtxtRemark21" placeholder="Remark" />
										</div>
										<div class="col-sm-2"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-4">
											<button type="button" class="btn btn-primary" onclick="AddNewBasic1()">Add</button>
										</div>
										<script type="text/javascript">
											function AddNewBasic1(){
												if(document.getElementById("idtxtBasic1").value!=""){
												var id=document.getElementById("idtxtid").value;
													var buName=document.getElementById("idtxtBasic1").value;
													var remark2=document.getElementById("idtxtRemark21").value;
													
												location.href="/warehouse/BasicUnitController?page=AddBasicEdit&buName="+buName+"&txtRemark2="+remark2+"&mid="+id;
												}
												else 
													alert("Enter BasicUnit!");
											}
										</script>
										<div class="col-sm-4">
											<button class="btn btn-primary" type="button" onclick="hideNewBasicDiv1()" id="hideBrand">Cancel</button>
										</div>
										<div class="col-sm-2"></div>
									</div><br>
								</div>
								<div class="col-sm-1"></div>
							</div>
							
							<!-- end new basic unit -->
							</div>
							<div class="col-sm-4">
								<table>
									<tr>
										<td><label for="lblUnitPrice">Sub Category</label></td>
									</tr>
									<tr>
										<td><select name="cboSubCategory" id="idcboSubCategory" onchange='sc("edit")'
											class="u-full-width form-control" style="width: 100%;">
											<option value="-1">select subcategory </option>
											<%
												List<Sub_category> scl1=scService.selectAll();
												for(Sub_category sc:scl1){
											%>
											<option value="<%out.print(sc.getSub_category_id()); %>">
												<%out.print(sc.getName()); %>
											</option>
										<%
											}
											%>
										</select></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
									<script type="text/javascript">
									function showNewSubCategoryDiv2(){
										document.getElementById("newSubCategoryDiv2").style.display="block";
										document.getElementById("newCateDiv1").style.display="none";
										document.getElementById("newBasicDiv1").style.display="none";
										document.getElementById("newSubUnitDiv1").style.display="none";
										document.getElementById("newBrandDiv3").style.display="none";
										document.getElementById("newBrandDiv2").style.display="none";
									}
									function hideNewSubCategoryDiv2(){
										document.getElementById("newSubCategoryDiv2").style.display="none";
									}
								</script>
									<tr>
										<td><label for="lblSubUnit">Sub Unit</label></td>
									</tr>
									<tr>	
										<td><select name="cboSubUnit" id="idcboSubUnit" class="u-full-width form-control"
											style="width: 100%;">
											<option value="-1">select subunit</option>
												<%
														List<SubUnit> sbc=(List<SubUnit>) suService.selectAll();
														for(SubUnit sb:sbc){
													%>
											<option value="<%out.print(sb.getSub_unit_id()); %>">
												<%out.print(sb.getName()); %>
											</option>
											<%
														}
													%>

										</select></td>
									</tr>
									<script type="text/javascript">
									function showNewSubUnitDiv1(){
										document.getElementById("newSubUnitDiv1").style.display="block";
										document.getElementById("newCateDiv1").style.display="none";
										document.getElementById("newBasicDiv1").style.display="none";
										document.getElementById("newSubCategoryDiv2").style.display="none";
										document.getElementById("newBrandDiv3").style.display="none";
										document.getElementById("newBrandDiv2").style.display="none";
									}
									function hideNewSubUnitDiv1(){
										document.getElementById("newSubUnitDiv1").style.display="none";
									}
								</script>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										</tr>
										<tr>
										<td><label for="lblConvertionValue">Convertion Value</label></td></tr>
											<tr>
										<td><input class="u-full-width form-control" type="text" pattern="[0-9.-]+$"
											name="txtConvertionValue" id="idtxtCovertionValue" />
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
								</table>
								<!-- add new subcategory -->
							<div class="row" id="newSubCategoryDiv2" style="display:none">
								<div class="col-sm-1"></div>
								<div class="col-sm-13" style="border-style: solid;border-radius:40px;border-color: skyblue;">
								<center><h4>Add SubCategory</h4></center>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-4">
										<input type="hidden" id="idNo" value=" ">
											<label for="lblName">Sub Category</label>
										</div>
										<div class="col-sm-6">
											<input class="u-full-width form-control" type="text" name="txtsubcate1" id="idtxtsubcate19" placeholder="Name" />
										</div>
										<div class="col-sm-1"></div>
									</div><br>
									
									<div class="row">
								<div class="col-sm-1"></div>
								<div class="col-sm-4">
									<label for="brand">Brand</label>
								</div>
								<div class="col-sm-6">
									<div class="col-sm-12 btn btn-default btnDropdown"  data-toggle="dropdown" id="btnDropdown">
			  					<%IBrandService brand_service1 = (IBrandService) SpringBeanFactory
			  							.getBean("BrandService");
								  List<Brand> bl12=brand_service1.selectAll();
								%>
									Select Brand(s)&nbsp;&nbsp;<span class="caret"></span></div>
			  						<ul class="dropdown-menu dropdown-menu-right droplist">
			  						<%for(Brand b:bl12){ %>
			  						<li>&nbsp;&nbsp;<input type="checkbox" name="brand11" value="<%out.print(b.getBrand_id());%>"/><%out.print(b.getName()); %></li>
			  						<%} %>
			  						<li onclick="showNewBrandDiv2()" class="addBrandSub" id="subcatebrand1">Add New brand</li>
			  						</ul>
								</div>
								<script type="text/javascript">
									function showNewBrandDiv2(){
										document.getElementById("newBrandDiv2").style.display="block";
											document.getElementById("newSubCategoryDiv2").style.display="none";
											document.getElementById("newCateDiv1").style.display="none";
											document.getElementById("newBasicDiv1").style.display="none";
											document.getElementById("newSubUnitDiv1").style.display="none";
											document.getElementById("newBrandDiv3").style.display="none";
									}
									function hideNewBrandDiv2(){
										document.getElementById("newBrandDiv2").style.display="none";
										document.getElementById("newSubCategoryDiv2").style.display="block";
									}
								</script>
								<div class="col-sm-1"></div>
							</div><br>
							
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-4">
											<label for="lblRemark">Remark</label>
										</div>
										<div class="col-sm-6">
											<input class="u-full-width form-control" type="text" name="txtRemark4" id="idtxtRemark44" placeholder="Remark" />
										</div>
										<div class="col-sm-1"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-4">
											<button type="button" class="btn btn-primary" onclick="AddNewSubCategory2()">Add</button>
										</div>
										<script type="text/javascript">
											function AddNewSubCategory2(){
												var bran=document.getElementsByName("brand11");
												var branArray=new Array();
												var g=0;
												for ( var i = 0; i < bran.length; i++) {
													if(bran[i].checked){
														branArray[g]=bran[i].value;
														g++;
													}
												
											}
												if(document.getElementById("idtxtsubcate19").value!="" && branArray!=""){
												var id=document.getElementById("idtxtid").value;
												var cate=document.getElementById("idcboCategory").value;
													var sName=document.getElementById("idtxtsubcate19").value;
													var remark4=document.getElementById("idtxtRemark44").value;
													var brand=document.getElementsByName("brand11");
													var brandArray=new Array();
													var f=0;
													for ( var i = 0; i < brand.length; i++) {
														if(brand[i].checked){
															brandArray[f]=brand[i].value;
															f++;
														}
													
												}
													
													location.href="/warehouse/Sub_category_controller?page=AddNewSubCategoryE&txtsubcate1="+sName+
															"&txtRemark4="+remark4+"&brand1="+brandArray+"&cate="+cate+"&mid="+id;
												}
												else 
													alert("Enter SubCategory & Select Brand(s)!");
															
												
											}
										</script>
										<div class="col-sm-6">
											<button class="btn btn-primary" type="button" onclick="hideNewSubCategoryDiv2()" id="hideBrand">Cancel</button>
										</div>
										<div class="col-sm-1"></div>
									</div><br>
								</div>
								<div class="col-sm-1"></div>
							</div>
							
							<!-- inside of add new subcategory brand -->
									<div class="row" id="newBrandDiv2" style="display:none">
								<div class="col-sm-1"></div>
								<div class="col-sm-10" style="border-style: solid;border-radius:15px;border-color: skyblue;">
								<center><h4>Add Brand</h4></center>
									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-4">
											<label for="lblName">Brand Name</label>
										</div>
										<div class="col-sm-4">
											<input class="u-full-width form-control" type="text" name="txtbrand1" id="idtxtbrand11" placeholder="Name" />
										</div>
										<div class="col-sm-2"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-4">
											<label for="lblRemark">Remark</label>
										</div>
										<div class="col-sm-4">
											<input class="u-full-width form-control" type="text" name="txtRemark5" id="idtxtRemark15" placeholder="Remark" />
										</div>
										<div class="col-sm-2"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-4">
											<button type="button" class="btn btn-primary" onclick="AddNewBrand2()">Add Brand</button>
										</div>
										<script type="text/javascript">
											function AddNewBrand2(){
												if(document.getElementById("idtxtbrand11").value!=""){
												var id=document.getElementById("idtxtid").value;
													var bName=document.getElementById("idtxtbrand11").value;
													var remark5=document.getElementById("idtxtRemark15").value;
													
												location.href="/warehouse/BrandController?page=AddNewBrandE&txtbrand1="+bName+"&txtRemark5="+remark5+"&mid="+id;
												}
												else 
													alert("Enter Brand Name!");
											}
										</script>
										<div class="col-sm-4">
											<button class="btn btn-primary" type="button" onclick="hideNewBrandDiv2()" id="hideBrand">Cancel</button>
										</div>
										<div class="col-sm-2"></div>
									</div><br>
									</div>
									<div class="col-sm-1"></div>
									</div>
									<!-- end inside of add new subcategory brand -->
							
							<!-- end new subcategory -->
								
								<!-- add new sub unit -->
							<div class="row" id="newSubUnitDiv1" style="display:none;">
								<div class="col-sm-1"></div>
								<div class="col-sm-10" style="border-style: solid;border-radius:15px;border-color: skyblue;">
								<center><h4>Add Sub Unit</h4></center>
									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-4">
											<label for="lblName">Sub Unit</label>
										</div>
										<div class="col-sm-4">
											<input class="u-full-width form-control" type="text" name="txtSubUnit" id="idtxtSubUnit1" placeholder="Name" />
										</div>
										<div class="col-sm-2"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-4">
											<label for="lblRemark">Remark</label>
										</div>
										<div class="col-sm-4">
											<input class="u-full-width form-control" type="text" name="txtRemark3" id="idtxtRemarks" placeholder="Remark" />
										</div>
										<div class="col-sm-2"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-4">
											<button type="button" class="btn btn-primary" onclick="AddNewSubUnit1()">Add</button>
										</div>
										<script type="text/javascript">
											function AddNewSubUnit1(){
												if(document.getElementById("idtxtSubUnit1").value!=""){
												var id=document.getElementById("idtxtid").value;
													var suName=document.getElementById("idtxtSubUnit1").value;
													var remark3=document.getElementById("idtxtRemarks").value;
													var cboBasic=document.getElementById("idcboBasicUnit").value;
													
												location.href="/warehouse/SubUnitController?page=AddSubUnit1E&suName="+suName+"&txtRemark3="+remark3+"&cboBasic="+cboBasic+"&mid="+id;
												}
												else 
													alert("Enter SubUnit!");
											}
										</script>
										<div class="col-sm-4">
											<button class="btn btn-primary" type="button" onclick="hideNewSubUnitDiv1()" id="hideBrand">Cancel</button>
										</div>
										<div class="col-sm-2"></div>
									</div><br>
								</div>
								<div class="col-sm-1"></div>
							</div>
							
							<!-- end new sub unit -->
							</div>
							<div class="col-sm-4">
								<table>

									<tr>
										<td><label for="lblBrand">Brand</label></td>
									</tr>
									<tr>	
										<td><select   name="cboBrand" id="idcboBrand" class="u-full-width form-control"
											style="width: 100%;">
										<option value="-1">select brand </option>
										</select></td>
									</tr>
									<script type="text/javascript">
									function showNewBrandDiv3(){
										document.getElementById("newBrandDiv3").style.display="block";
										document.getElementById("newCateDiv1").style.display="none";
										document.getElementById("newBasicDiv1").style.display="none";
										document.getElementById("newSubCategoryDiv2").style.display="none";
										document.getElementById("newSubUnitDiv1").style.display="none";
										document.getElementById("newBrandDiv2").style.display="none";
									}
									function hideNewBrandDiv3(){
										document.getElementById("newBrandDiv3").style.display="none";
									}
								</script>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td><label for="lblConvertionUnit">Convertion Unit</label></td>
									</tr>
									<tr>		
										<td><select name="cboConvertionUnit" class="u-full-width form-control"
											id="idcboConvertionUnit" style="width: 100%;">
										<option value="-1">select subunit</option>
											<%
														for(SubUnit sb:sbc){
														%>
										<option value="<%out.print(sb.getSub_unit_id()); %>">
											<%out.print(sb.getName()); %>
										</option>
											<%
															}
														%>

										</select></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td><label for="lblConvertionValue">Unit Price</label></td></tr>
											<tr>
										<td><input class="u-full-width form-control" type="text" 
											name="txtUnitPrice" id="idtxtUnitPrice" />
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>
										<div class="row">
										<div class="col-sm-6">
										<label for="cboFlag">Flag</label>
										</div>
										<div class="col-sm-6">
										<label><input type="radio" name="txtFlag" id="idFlag11"
											value="1">On</label> &nbsp;&nbsp;<label><input type="radio"
											name="txtFlag" id="idFlag22" value="0">Off</label>
											</div>
											</div>
										</td>
									</tr>
								</table>
								<!-- add new brand -->
								
								<div class="row" id="newBrandDiv3" style="display:none">
								<div class="col-sm-1"></div>
								<div class="col-sm-10" style="border-style: solid;border-radius:15px;border-color: skyblue;">
								<center><h4>Add Brand</h4></center>
									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-4">
											<label for="lblName">Brand Name</label>
										</div>
										<div class="col-sm-4">
											<input class="u-full-width form-control" type="text" name="txtbrand2" id="idtxtbrand22" placeholder="Name" />
										</div>
										<div class="col-sm-2"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-4">
											<label for="lblRemark">Remark</label>
										</div>
										<div class="col-sm-4">
											<input class="u-full-width form-control" type="text" name="txtRemark6" id="idtxtRemark16" placeholder="Name" />
										</div>
										<div class="col-sm-2"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-4">
											<button type="button" class="btn btn-primary" onclick="AddNewBrand3()">Add Brand</button>
										</div>
										<script type="text/javascript">
											function AddNewBrand3(){
												if(document.getElementById("idtxtbrand22").value!=""){
												var id=document.getElementById("idtxtid").value;
													var subcategory=document.getElementById("idcboSubCategory").value;
													var bName=document.getElementById("idtxtbrand22").value;
													var remark6=document.getElementById("idtxtRemark16").value;
												location.href="/warehouse/BrandController?page=AddBrand1E&txtbrand21="+bName+"&subcategory="+subcategory+"&txtRemark6="+remark6+"&mid="+id;
												}
												else 
													alert("Enter Brand Name!");
											}
										</script>
										<div class="col-sm-4">
											<button class="btn btn-primary" type="button" onclick="hideNewBrandDiv3()" id="hideBrand">Cancel</button>
										</div>
										<div class="col-sm-2"></div>
									</div><br>
								</div>
								<div class="col-sm-1"></div>
							</div>	
								<!-- end new brand -->
							</div>
						</div>
						<br>

					<div class="modal-footer p10">
						<input type="submit"
							class="btn btn-default w3-container w3-light-blue p10"
							name="page" value="Edit" />
						<button type="reset"
							class="btn btn-default w3-container w3-light-blue p10">Cancel</button>
						<button type="button"
							class="btn btn-default w3-container w3-light-blue p10"
							data-dismiss="modal">Close</button>
					</div>
					</div>
					
				</form>

			</div>
		</div>
	</div>
	<!-- end of the edition of the row -->
	<!-- end of the all modal for column Editioin -->

	<%@ include file="right.jsp"%>
	<!-- function validate -->
		<script type="text/javascript" language="javascript">
function validate(){
	 if(document.forms.cboCategory.value=="-1"){
		 alert("Please choose Category!");
		 return false;
	 }
	 if(document.forms.cboSubCategory.value=="-1"){
		 alert("Please choose Sub Category!");
		 return false;
	 }
	 if(document.forms.cboBrand.value=="-1"){
		 alert("Please choose Brand!");
		 return false;
	 } 
	 if(document.forms.cboBasicUnit.value=="-1"){
		 alert("Please choose Base Type!");
		 return false;
	 }
	 
	 if(document.forms.cboSubUnit.value=="-1"){
		 alert("Please choose Sub Unit!");
		 return false;
	 } 
	 if(document.forms.cboConvertionUnit.value=="-1"){
		 alert("Please choose Convertion Unit!");
		 
		 return false;
	 }
	 if(!/^[a-zA-Z]+[a-z A-Z 0-9 -_- -w-]+$/.test(document.forms.txtName.value)){
		 alert("Do not start Merchandise Name with a number!");
		 return false;
	 }
	 if(!/[0-9.-]+$/.test(document.forms.txtConvertionValue.value)){
		 alert("Do not enter character in Convertion Value!");
		 return false;
	 }if(!/[0-9.-]+$/.test(document.forms.txtUnitPrice.value)){
		 alert("Do not enter character in Unit Price!");
		 return false;
	 }
	 }
	
function existOrNot(){
	if(arguments[0]=="1"){
		alert (arguments[1]+" is already exits!\nPlease Insert Brand name at Start of merchandise name");
		$(document).ready(function(){
			$('#btnAddNew').trigger('click');
		});
		$(document).ready(function(){
			$('#addcate').trigger('click');
		});
	}
	else if(arguments[0]=="15"){
		alert (arguments[1]+" is already exits!");
		$(document).ready(function(){
			$('#btnAddNew').trigger('click');
		});
		showNewBasicDiv();
		document.getElementById("cboCategory").value=arguments[2];
		var type=parseInt(arguments[4]);
		document.getElementById("cboCategory").onchange();
		document.getElementById("cboSubCategory").options[type].selected=true;
		var type=parseInt(arguments[5]);
		 document.getElementById("cboSubCategory").onchange();
		document.getElementById("cboBrand").options[type].selected=true;
}
	else if(arguments[0]=="16"){
		alert (arguments[1]+" is already exits!");
		$(document).ready(function(){
		$('#btnAddNew').trigger('click');
	});
		$(document).ready(function(){
			$('#btnsubcater').trigger('click');
		});
		document.getElementById("cboCategory").value=arguments[2];
}
	else if(arguments[0]=="17"){
		alert (arguments[1]+" is already exits!");
		$(document).ready(function(){
		$('#btnAddNew').trigger('click');
		
	});
		$(document).ready(function(){
			$('#subcatebrand').trigger('click');
			
		});
		document.getElementById("idtxtsubcate1").value=arguments[3];
		document.getElementById("cboCategory").value=arguments[2];
}
	else if(arguments[0]=="18"){
		alert (arguments[1]+" is already exits!");
		document.getElementById("cboCategory").value=arguments[2];
		var type=parseInt(arguments[4]);
		 document.getElementById("cboCategory").onchange();
		document.getElementById("cboSubCategory").options[type].selected=true;
		$(document).ready(function(){
			$('#btnAddNew').trigger('click');
		});
			$(document).ready(function(){
				$('#btnbrandr').trigger('click');
			});
}
	else if(arguments[0]=="19"){
		alert (arguments[1]+" is already exits!");
		$(document).ready(function(){
		$('#btnAddNew').trigger('click');
	});
		$(document).ready(function(){
			$('#btnsubur').trigger('click');
		});
		document.getElementById("cboCategory").value=arguments[2];
		var type=parseInt(arguments[4]);
		 document.getElementById("cboCategory").onchange();
		document.getElementById("cboSubCategory").options[type].selected=true;
		var type=parseInt(arguments[5]);
		 document.getElementById("cboSubCategory").onchange();
		document.getElementById("cboBrand").options[type].selected=true;
		document.getElementById("cboBasicUnit").value=arguments[6];
}
	else if(arguments[0]=="20"){
		alert (arguments[1]+" is already exits!");
		var aaa=arguments[12];
		$(document).ready(function(){
		$('#btnEdit'+aaa).trigger('click');
	});
		$(document).ready(function(){
			$('#edcater').trigger('click');
		});
}
	else if(arguments[0]=="21"){
		alert (arguments[1]+" is already exits!");
		var aaa=arguments[12];
		$(document).ready(function(){
		$('#btnEdit'+aaa).trigger('click');
	});
		$(document).ready(function(){
			$('#edbasicr').trigger('click');
		});
}
	else if(arguments[0]=="22"){
		alert (arguments[1]+" is already exits!");
		var aaa=arguments[12];
		document.getElementById("idcboCategory").value=arguments[2];
		$(document).ready(function(){
		$('#btnEdit'+aaa).trigger('click');
	});
		$(document).ready(function(){
			$('#edsubcater').trigger('click');
		});
}
	else if(arguments[0]=="23"){
		alert (arguments[1]+" is already exits!");
		var aaa=arguments[12];
		$(document).ready(function(){
		$('#btnEdit'+aaa).trigger('click');
	});
		$(document).ready(function(){
			$('#edsubunitr').trigger('click');
		});
}
	else if(arguments[0]=="24"){
		alert (arguments[1]+" is already exits!");
		var aaa=arguments[12];
		$(document).ready(function(){
		$('#btnEdit'+aaa).trigger('click');
	});
		$(document).ready(function(){
			$('#edbrandr').trigger('click');
		});
}
	else if(arguments[0]=="25"){
		alert (arguments[1]+" is already exits!");
		var aaa=arguments[12];
		$(document).ready(function(){
		$('#btnEdit'+aaa).trigger('click');
	});
		$(document).ready(function(){
			$('#subcatebrand1').trigger('click');
		});
}
	
		else if(arguments[0]=="2"){
		alert("Add Category Successfully!");
		$(document).ready(function(){
		$('#btnAddNew').trigger('click');
	});
		$(document).ready(function(){
			$('#addcate').trigger('click');
		});
		}
		else if(arguments[0]=="3"){
			alert("Add 3 Successfully!");
			$(document).ready(function(){
				$('#btnAddNew').trigger('click');
			});
			showNewBasicDiv();
			document.getElementById("cboCategory").value=arguments[2];
			var type=parseInt(arguments[4]);
			document.getElementById("cboCategory").onchange();
			document.getElementById("cboSubCategory").options[type].selected=true;
			var type=parseInt(arguments[5]);
			 document.getElementById("cboSubCategory").onchange();
			document.getElementById("cboBrand").options[type].selected=true;
}
		else if(arguments[0]=="4"){
			alert("Add sub category Successfully!");
			$(document).ready(function(){
			$('#btnAddNew').trigger('click');
		});
			$(document).ready(function(){
				$('#btnsubcater').trigger('click');
			});
			document.getElementById("cboCategory").value=arguments[2];
}
		else if(arguments[0]=="5"){
			alert("Add sub category brand Successfully!");
			$(document).ready(function(){
			$('#btnAddNew').trigger('click');
			
		});
			$(document).ready(function(){
				$('#subcatebrand').trigger('click');
				
			});
			document.getElementById("idtxtsubcate1").value=arguments[3];
			document.getElementById("cboCategory").value=arguments[2];
}

		else if(arguments[0]=="7"){
			alert("Add sub basic unit 7 Successfully!");
			$(document).ready(function(){
			$('#btnAddNew').trigger('click');
		});
			$(document).ready(function(){
				$('#btnsubur').trigger('click');
			});
			document.getElementById("cboCategory").value=arguments[2];
			var type=parseInt(arguments[4]);
			 document.getElementById("cboCategory").onchange();
			document.getElementById("cboSubCategory").options[type].selected=true;
			var type=parseInt(arguments[5]);
			 document.getElementById("cboSubCategory").onchange();
			document.getElementById("cboBrand").options[type].selected=true;
			document.getElementById("cboBasicUnit").value=arguments[6];
}
		else if(arguments[0]=="8"){
			alert("Add brand 8 Successfully!");
			document.getElementById("cboCategory").value=arguments[2];
			var type=parseInt(arguments[4]);
			 document.getElementById("cboCategory").onchange();
			document.getElementById("cboSubCategory").options[type].selected=true;
			$(document).ready(function(){
				$('#btnAddNew').trigger('click');
			});
				$(document).ready(function(){
					$('#btnbrandr').trigger('click');
				});
}
	
	
		else if(arguments[0]=="6"){
			alert("Add Edit Successfully!");
			var aaa=arguments[12];
			$(document).ready(function(){
			$('#btnEdit'+aaa).trigger('click');
		});
			$(document).ready(function(){
				$('#subcatebrand1').trigger('click');
			});
}
		else if(arguments[0]=="9"){
			alert("Add Edit Successfully!");
			var aaa=arguments[12];
			$(document).ready(function(){
			$('#btnEdit'+aaa).trigger('click');
		});
			$(document).ready(function(){
				$('#edcater').trigger('click');
			});
}
		else if(arguments[0]=="10"){
			alert("Add Edit Successfully!");
			var aaa=arguments[12];
			$(document).ready(function(){
			$('#btnEdit'+aaa).trigger('click');
		});
			$(document).ready(function(){
				$('#edbasicr').trigger('click');
			});
}
		else if(arguments[0]=="11"){
			alert("Add Edit Successfully!");
			var aaa=arguments[12];
			$(document).ready(function(){
			$('#btnEdit'+aaa).trigger('click');
		});
			$(document).ready(function(){
				$('#edbrandr').trigger('click');
			});
}
		else if(arguments[0]=="12"){
			alert("Add Edit Successfully!");
			var aaa=arguments[12];
			document.getElementById("idcboCategory").value=arguments[2];
			$(document).ready(function(){
			$('#btnEdit'+aaa).trigger('click');
		});
			$(document).ready(function(){
				$('#edsubcater').trigger('click');
			});
}
		else if(arguments[0]=="13"){
			alert("Add Edit Successfully!");
			var aaa=arguments[12];
			$(document).ready(function(){
			$('#btnEdit'+aaa).trigger('click');
		});
			$(document).ready(function(){
				$('#edsubunitr').trigger('click');
			});
}
		else if(arguments[0]=="14"){
			alert("Add Merchandise Successfully!");
			document.getElementById("cboCategory").value=arguments[2];
			var type=parseInt(arguments[4]);
			alert(arguments[0]+"0 "+arguments[2]+"2 "+arguments[4]+"4 "+arguments[5]+"5  "+arguments[6]+"6 "+arguments[7]+"7"+arguments[8]+" 8");
			 document.getElementById("cboCategory").onchange();
			document.getElementById("cboSubCategory").options[type].selected=true;
			var type=parseInt(arguments[5]);
			 document.getElementById("cboSubCategory").onchange();
			document.getElementById("cboBrand").options[type].selected=true;
			document.getElementById("cboBasicUnit").value=arguments[6];
			
			var type=parseInt(arguments[7]);
			
			document.getElementById("cboBasicUnit").options[1].selected=true;
			
			 document.getElementById("cboBasicUnit").onchange();
			 
			document.getElementById("cboSubUnitid").options[type].selected=true;
			document.getElementById("cboSubUnitid").onchange();
			
			document.getElementById("lblName").value=arguments[8];
			
			document.getElementById("cboConvertionUnit").value=arguments[9];
			document.getElementById("idConvertionValue").value=arguments[10];
			document.getElementById("idUnitPrice").value=arguments[11];
			$(document).ready(function(){
				$('#btnAddNew').trigger('click');
			});
}
}
			function cat(x) {
				//for add new button category
				if(x=="new"){
				var fcombo = document.getElementById("cboCategory").value;
				var sccombo = document.getElementById("cboSubCategory");
				
				<%
				   List<Sub_category> sub_categoryList= scService.selectAll();
					String scname="";
					String scid="";
					String sccid="";
					for(Sub_category subcat:sub_categoryList){
						scname+="\'"+subcat.getName()+"\',";
						sccid+="\'"+subcat.getCategory_id()+"\',";//inside of subcategory =category id
						scid+="\'"+subcat.getSub_category_id()+"\',";//inside of subcategory=subcategory id
						
					}%>
					var sccidarr = [
				<%=sccid%>
					];
						var scnamearr = [
				<%=scname%>
					];		
				var scidarr=[<%=scid%>
						                 ];
						
						//clean combobox
						if (sccombo == 0) {
							alert("Empty");
						}

						else {
							var i;
							for (i >= 0; i = sccombo.options.length - 1; i--) {
								sccombo.remove(i);
							}

						}
					for ( var a = 0; a < sccidarr.length; a++) {
							if (fcombo == sccidarr[a]) {
								var sc = document.createElement("option");			
								sc.text = scnamearr[a];
								sc.value = scidarr[a];
								sccombo.add(sc);
							}

						}
					var newSubCategory=document.createElement("option");
					newSubCategory.text="Add New Sub Category";
					newSubCategory.id="addsubca";
					newSubCategory.onclick=function(){
						showNewSubCategoryDiv();
					};
					sccombo.add(newSubCategory);
				
			}
				//for edit button category
				else if(x=="edit"){
					var fcombo = document.getElementById("idcboCategory").value;
					var sccombo = document.getElementById("idcboSubCategory");
						var sccidarr = [
					<%=sccid%>
						];
							var scnamearr = [
					<%=scname%>
						];		
					var scidarr=[<%=scid%>
							                 ];
							
							//clean combobox
							if (sccombo == 0) {
								alert("Empty");
							}

							else {
								var i;
								for (i >= 0; i = sccombo.options.length - 1; i--) {
									sccombo.remove(i);
								}

							}
						for ( var a = 0; a < sccidarr.length; a++) {
								if (fcombo == sccidarr[a]) {
									var sc = document.createElement("option");
									sc.text = scnamearr[a];
									sc.value = scidarr[a];
									sccombo.add(sc);
								}

							}
						var newSubCategory=document.createElement("option");
						newSubCategory.text="Add New Sub Category";
						newSubCategory.onclick=function(){
							showNewSubCategoryDiv2();
						};
						
						sccombo.add(newSubCategory);
				}

			}
		// for subcategory to brand new and edit 
			function sc(x){
				if(x=="new"){
					var fcombo = document.getElementById("cboSubCategory").value;
					var bcombo = document.getElementById("cboBrand");
					var ffcombo = document.getElementById("cboSubCategory");
					var typeindex=ffcombo.selectedIndex;
		   			document.getElementById("hidtype").value=typeindex;
					<%
					   List<Brand> bl = brandService.selectAll();
					  List<SubCategoryAndBrand> scandbrandl=subandbrandservice.selectAll();
					   String sabscid="";
					   String sabbid="";
					   for(SubCategoryAndBrand scandbrand:scandbrandl){ 
						   sabscid+="\'"+scandbrand.getSub_category_id()+"\',";
						   sabbid+="\'"+scandbrand.getBrand_id()+"\',";
					   }%>
					   var sabscidarr=[ <%= sabscid %>];
					   var sabbidarr=[<%= sabbid%>];
					   var bidarr=[];
					   var j=0;
					   for(var i=0;i<sabscidarr.length;i++){
						   if(sabscidarr[i]==fcombo){
							  bidarr[j++]=sabbidarr[i];
						   }
					   }
						<%
						String bbid="";
						String bbname="";
						for(Brand brand:bl){
							bbname+="\'"+brand.getName()+"\',";//name of brand table
							bbid+="\'"+brand.getBrand_id()+"\',";//brand id of brand table
							
						}%>
						var bbidarr = [
					<%=bbid%>
						];
							var bbnamearr = [
					<%=bbname%>
						];
													
							//clean combobox
							if (bcombo == 0) {
								alert("Empty");
							}
							else {
								var i;
								for (i >= 0; i = bcombo.options.length - 1; i--) {
									bcombo.remove(i);
								}

							}						
					for ( var j = 0; j < bidarr.length; j++) {
						for(var p=0;p<bbidarr.length;p++){
									if (bidarr[j] == bbidarr[p]) {
										var b = document.createElement("option");
										b.text = bbnamearr[p];
										b.value = bbidarr[p];
										bcombo.add(b);
									}
								}
					}
						var newbrand = document.createElement("option");
						newbrand.text = "Add New Brand";
						newbrand.onclick = function(){
							showNewBrandDiv1();
						};
						bcombo.add(newbrand);	
					}
				else if(x=="edit"){
					var fcombo = document.getElementById("idcboSubCategory").value;
					var bcombo = document.getElementById("idcboBrand");	
					 var sabscidarr=[ <%= sabscid %>];
					   var sabbidarr=[<%= sabbid%>];
					   var bidarr=[];
					   var j=0;
					   for(var i=0;i<sabscidarr.length;i++){
						   if(sabscidarr[i]==fcombo){
							  bidarr[j++]=sabbidarr[i];
						   }
					   }
						
						var bbidarr = [
					<%=bbid%>
						];
							var bbnamearr = [
					<%=bbname%>
						];
													
							//clean combobox
							if (bcombo == 0) {
								alert("Empty");
							}
							else {
								var i;
								for (i >= 0; i = bcombo.options.length - 1; i--) {
									bcombo.remove(i);
								}

							}						
					for ( var j = 0; j < bidarr.length; j++) {
						for(var p=0;p<bbidarr.length;p++){
									if (bidarr[j] == bbidarr[p]) {
										var b = document.createElement("option");
										b.text = bbnamearr[p];
										b.value = bbidarr[p];
										bcombo.add(b);
									}
								}
						
							}
					var newbrand = document.createElement("option");
					newbrand.text = "Add New Brand";
					newbrand.onclick = function(){
						showNewBrandDiv3();
					};
					bcombo.add(newbrand);
				}
					
				}
	//for basicunit to subunit and convertionunit new and edit 
			function bunit(x) {
				if(x=="new"){
				var fcombo = document.getElementById("cboBasicUnit").value;
				var sucombo = document.getElementById("cboSubUnitid");
				var concombo = document.getElementById("cboConvertionUnit");
				var ffcombo = document.getElementById("cboBrand");
				var typeindex=ffcombo.selectedIndex;
	   			document.getElementById("hidtype1").value=typeindex;
				
				<%
				List<SubUnit> suList= suService.selectAll();
						String suname="";
						String suid="";
						String subuid="";
						for(SubUnit su:suList){
							suname+="\'"+su.getName()+"\',";
							subuid+="\'"+su.getBasic_unit_id()+"\',";//basic unit id of subunit table
							suid+="\'"+su.getSub_unit_id()+"\',";//subunit id of subunit table
							
						}%>
						var sunamearr = [
					<%=suname%>
						];
							var subuidarr = [
					<%=subuid%>
						];
							
					var suidarr=[<%=suid%>];
					var cvidarr=[<%=suid%>];
							//clean combobox
							if (sucombo == 0) {
								alert("Empty");
							}

							else {
								var i;
								for (i >= 0; i = sucombo.options.length - 1; i--) {
									sucombo.remove(i);
								}
								var k;
								for (k >= 0; k = concombo.options.length - 1; k--) {
									concombo.remove(k);
								}

							}
									for ( var a = 0; a < subuidarr.length; a++) {
										if (fcombo == subuidarr[a]) {
									//creating subunit combobox
											var subunit= document.createElement("option");
											subunit.text = sunamearr[a];
											subunit.value = suidarr[a];
											sucombo.add(subunit);
									//creating convertion unit combobox 	
											var conunit=document.createElement("option");
											conunit.text = sunamearr[a];
											conunit.value=cvidarr[a];
											concombo.add(conunit);
										}
									}
									var newSubUnit=document.createElement("option");
									newSubUnit.text="Add New Sub Unit";
									newSubUnit.onclick=function(){
										showNewSubUnitDiv();
									};
									sucombo.add(newSubUnit);
						
				}
				else if(x=="edit"){
					var fcombo = document.getElementById("idcboBasicUnit").value;
					var sucombo = document.getElementById("idcboSubUnit");
					var concombo = document.getElementById("idcboConvertionUnit");
							var sunamearr = [
						<%=suname%>
							];
								var subuidarr = [
						<%=subuid%>
							];
								
						var suidarr=[<%=suid%>];
						var cvidarr=[<%=suid%>];
								//clean combobox
								if (sucombo == 0) {
									alert("Empty");
								}

								else {
									var i;
									for (i >= 0; i = sucombo.options.length - 1; i--) {
										sucombo.remove(i);
									}
									var k;
									for (k >= 0; k = concombo.options.length - 1; k--) {
										concombo.remove(k);
									}

								}
										for ( var a = 0; a < subuidarr.length; a++) {
											if (fcombo == subuidarr[a]) {
										//creating subunit combobox
												var subunit= document.createElement("option");
												subunit.text = sunamearr[a];
												subunit.value = suidarr[a];
												sucombo.add(subunit);
										//creating convertion unit combobox 	
												var conunit=document.createElement("option");
												conunit.text = sunamearr[a];
												conunit.value=cvidarr[a];
												concombo.add(conunit);
											}
										}
										var newSubUnit=document.createElement("option");
										newSubUnit.text="Add New Sub Unit";
										newSubUnit.onclick=function(){
											showNewSubUnitDiv1();
										};
										sucombo.add(newSubUnit);
							
				}			
			}
			function ex(){
				var ffcombo = document.getElementById("cboSubUnitid");
				
	   			var typeindex=ffcombo.selectedIndex;
	   			//alert(typeindex+"  from ex hidetype2");
	   			document.getElementById("hidtype2").value=typeindex;
				
				
			}

								function edit(){
									document.getElementById("idtxtid").value=arguments[0];
									document.getElementById("idtxtName").value=arguments[1];
									document.getElementById("idcboCategory").value=arguments[2];
									document.getElementById("idcboSubCategory").value=arguments[3];
									document.getElementById("idcboBrand").value=arguments[4];
									document.getElementById("idcboSubUnit").value=arguments[5];
									document.getElementById("idcboConvertionUnit").value=arguments[6];
									document.getElementById("idtxtCovertionValue").value=arguments[7];
									document.getElementById("idtxtUnitPrice").value=arguments[8];
									if(arguments[9]==1){
										document.getElementById("idFlag11").checked=true;
										document.getElementById("idFlag22").checked=false;
									}else{
										document.getElementById("idFlag11").checked=false;
										document.getElementById("idFlag22").checked=true;
									}
									document.getElementById("idcboBasicUnit").value=arguments[10];
									//subcategory to category
									cat("edit");	
									document.getElementById("idcboSubCategory").value=arguments[3];
									//end subcategory to category
									//subcategory to brand
									sc("edit");
									document.getElementById("idcboBrand").value=arguments[4];
									//end subcategory to brand
									//subunit to basicunit
									bunit("edit");
									document.getElementById("idcboSubUnit").value=arguments[5];
									document.getElementById("idcboConvertionUnit").value=arguments[6];
									//end subunit to basicunit 
								}
					
							
								function confirmDelete() {
									var r = confirm("Are you sure to delete this row?");
									if (r) {
										location.href = "/warehouse/MerchandiseController?page=remove&s&merchandise_id="
												+ arguments[0];
									};
								}
								function confirmEdit(){
									if(confirm("Are you sure you want to edit?")){
										return true;
									}
									else 
										return false;
								}
								function view(){
									//document.getElementById("viewid").innerHTML=arguments[0];
									document.getElementById("viewname").innerHTML=arguments[0];
									document.getElementById("viewsubcategory").innerHTML=arguments[1];
									document.getElementById("viewbrand").innerHTML=arguments[2];
									document.getElementById("viewsubunit").innerHTML=arguments[3];
									document.getElementById("viewconvertionunit").innerHTML=arguments[4];
									document.getElementById("viewconvertionvalue").innerHTML=arguments[5];
									document.getElementById("viewunitprice").innerHTML=arguments[6];
									document.getElementById("viewcreateduserid").innerHTML=arguments[7];
									document.getElementById("viewmodifieduserid").innerHTML=arguments[8];
									document.getElementById("viewcreateddate").innerHTML=arguments[9];
									document.getElementById("viewmodifieddate").innerHTML=arguments[10];
									/* if(arguments[12]==1){
										document.getElementById("idFlag1").checked=true;
										document.getElementById("idFlag2").checked=false;
									}else{
										document.getElementById("idFlag1").checked=false;
										document.getElementById("idFlag2").checked=true;
									} */
								}
								</script>
	
</body>
</html>
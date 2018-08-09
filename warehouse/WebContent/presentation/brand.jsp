<%@page import="org.springframework.expression.spel.support.ReflectionHelper.ArgumentsMatchInfo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*"%>
<%@page import="com.java.plyd.service.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Brand Page</title>
	<%@ include file="link.jsp" %>
		<script>
	 function existOrNot(){
		 if(arguments[0]=="1"){
			 alert(arguments[1]+" is already exist!\nIf you don't see it there, please edit in subcategory page");
			 $(document).ready(function(){
					$('#btnAddNew').trigger('click');
				});
			document.getElementById("newSubCategoryDiv").style.display="block";
			document.getElementById("idtxtName").value=arguments[2];
			var a=arguments[3];
			a=a.replace(/ /gi,"");
			var subcategory=document.getElementsByName("subcategory");
			var res=a.split(",");
			for ( var i = 0; i < res.length; i++) {
				for(var j=0;j<subcategory.length;j++){
					if(res[i]==subcategory[j].value){
						subcategory[j].checked=true;
					}
				}
			}

			document.getElementById("idtxtRemark").value=arguments[4];
			document.getElementById("idtxtName1").value=arguments[5];
			document.getElementById("idcboCategory").value=arguments[6];
			document.getElementById("idtxtRemark1").value=arguments[7];
		 }else if(arguments[0]=="2"){
			 		alert("SubCategory is added successully.");
					$(document).ready(function(){
						$('#btnAddNew').trigger('click');
					});
					$(document).ready(function(){
						$('#btnDropdown').trigger('click');
					});
					document.getElementById("idtxtName").value=arguments[2];
					var a=arguments[3];
					a=a.replace(/ /gi,"");
					var subcategory=document.getElementsByName("subcategory");
					var res=a.split(",");
					for ( var i = 0; i < res.length; i++) {
						for(var j=0;j<subcategory.length;j++){
							if(res[i]==subcategory[j].value){
								subcategory[j].checked=true;
							}
						}
					}

					document.getElementById("idtxtRemark").value=arguments[4];
		}else if(arguments[0]=="3"){
			alert(arguments[1]+" is already exist");
			$(document).ready(function(){
				$('#btnAddNew').trigger('click');
			});
			document.getElementById("idtxtName").value=arguments[2];
			var a=arguments[3];
			a=a.replace(/ /gi,"");
			var subcategory=document.getElementsByName("subcategory");
			var res=a.split(",");
			for ( var i = 0; i < res.length; i++) {
				for(var j=0;j<subcategory.length;j++){
					if(res[i]==subcategory[j].value){
						subcategory[j].checked=true;
					}
				}
			}

			document.getElementById("idtxtRemark").value=arguments[4];
			
		}else if(arguments[0]=="4"){
			alert("Brand is added Successfully.");
			$(document).ready(function(){
				$('#btnAddNew').trigger('click');
			});
		}else if(arguments[0]=="5"){
			alert(arguments[1]+" is already exist!\nIf you don't see it there, please edit in subcategory page");
			var aaa=arguments[9];
			 $(document).ready(function(){
					$("#btnSubmit"+aaa).trigger('click');
				});
			 document.getElementById("newSubCategoryDiv1").style.display="block";
			 document.getElementById("idtxtId2").value=arguments[9];
				document.getElementById("idtxtName2").value=arguments[2];
				var subcategory1=document.getElementsByName("subcategory2");
				var a=arguments[3];
				var res=a.split(",");
				for ( var i = 0; i < res.length; i++) {
					for(var j=0;j<subcategory1.length;j++){
						if(res[i]==subcategory1[j].value){
							//alert(res[i]+"march"+subcategory1[j].value);
							subcategory1[j].checked=true;
						}
					}
				}
				document.getElementById("idtxtRemark2").value=arguments[4];
				document.getElementById("idtxtName3").value=arguments[5];
				document.getElementById("idcboCategory2").value=arguments[6];
				document.getElementById("idtxtRemark3").value=arguments[7];
				if(arguments[8]=="1"){
					document.getElementById("idtxtFlag1").checked=true;
					document.getElementById("idtxtFlag2").checked=false;
				}else {
					document.getElementById("idtxtFlag2").checked=true;
					document.getElementById("idtxtFlag1").checked=false;
				}

			
		}else if(arguments[0]=="6"){
			var aaa=arguments[9];
			 $(document).ready(function(){
					$("#btnSubmit"+aaa).trigger('click');
				});
			 $(document).ready(function(){
					$("#btnDropdown2").trigger('click');
				});
			 document.getElementById("idtxtId2").value=arguments[9];
				document.getElementById("idtxtName2").value=arguments[2];
				var subcategory1=document.getElementsByName("subcategory2");
				var a=arguments[3];
				var res=a.split(",");
				for ( var i = 0; i < res.length; i++) {
					for(var j=0;j<subcategory1.length;j++){
						if(res[i]==subcategory1[j].value){
							//alert(res[i]+"march"+subcategory1[j].value);
							subcategory1[j].checked=true;
						}
					}
				}
				document.getElementById("idtxtRemark2").value=arguments[4];
				if(arguments[8]=="1"){
					document.getElementById("idtxtFlag1").checked=true;
					document.getElementById("idtxtFlag2").checked=false;
				}else {
					document.getElementById("idtxtFlag2").checked=true;
					document.getElementById("idtxtFlag1").checked=false;
				}		
		}else if(arguments[0]=="7"){
			alert("Edit Successful");
		}
		 
	 }
	</script>
</head>
<body class="w3-container w3-light-gray" onload="existOrNot(
	'<%out.print(request.getAttribute("exist")); %>','<%out.print(request.getAttribute("name")); %>',
	'<%out.print(request.getAttribute("txtName")); %>','<%out.print(request.getAttribute("subcategory")); %>',
	'<%out.print(request.getAttribute("txtRemark")); %>','<%out.print(request.getAttribute("txtName1")); %>',
	'<%out.print(request.getAttribute("cboCategory")); %>','<%out.print(request.getAttribute("txtRemark1")); %>',
	'<%out.print(request.getAttribute("txtFlag")); %>','<%out.print(request.getAttribute("txtId"));%>')">
	<%@ include file="header.jsp" %>
					<!-- inserting the code for each operation -->
					<div class="col-sm-9">
						<div class="row p10">
							<div class="panel panel-default">
						  		<div class="panel-heading w3-container w3-light-blue p10">
						  			<button type="button" class="btn w3-container w3-light-blue p-header-btn" data-toggle="modal" data-target="#addNew" id="btnAddNew"><span class="glyphicon glyphicon-plus"></span> Add New</button> 
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
						  			<table class="table table-condensed table-bordered p10" id="example">
						  				<caption class="w3-container w3-text-black w3-myfont">Brand Information Lists</caption>
									    <thead class="w3-container w3-light-blue p10">
									      <tr>
									        <th>Name</th>
							        		<th>Remark</th>
											<th>Flag</th>
									        <th>Options</th>
									      </tr>
									    </thead>
									    <tbody>
									      <%IBrandService brandservice = (IBrandService) SpringBeanFactory
									.getBean("BrandService");
									IUserService userservice=(IUserService)SpringBeanFactory.getBean("UserService");
					    			List<Brand> b1=null;
					    			User u=userservice.selectUser(uid);
					    			b1=brandservice.selectAllforadmin();
					      			for(Brand b:b1 ){
									%>
										<tr>
											<td><%out.print( b.getName()); %></td>
											<%System.out.print(b.getName());%>
											<td><%out.print(b.getRemark()); %></td>
											<%System.out.print(b.getRemark());%>
											<%
												
													User u2 = userservice.selectUser(b.getCreated_user_id());
													User u1 = userservice.selectUser(b.getModified_user_id());
											%>
											<%if(b .getFlag()==1){ %>
											<td> <font color="green">ON</font></td>
											<%} else { %>
											<td><font color="red">OFF</font></td>
											<%} %>
											<%System.out.print(b.getFlag());%>
											<%ISubCategoryAndBrandService subandbrandService=(ISubCategoryAndBrandService)SpringBeanFactory.getBean("SubCategoryAndBrandService");
											  List<SubCategoryAndBrand> sadl=subandbrandService.selectSubCategoryAndBrandByBrandId(b.getBrand_id());
											  int length=0;int j=0;
											  for(SubCategoryAndBrand sad:sadl){
											  	length++;
											  }
											  String[] subcategoryArr=new String[length];
											  for(SubCategoryAndBrand sad:sadl){
												  subcategoryArr[j]=Integer.toString(sad.getSub_category_id());
												  j++;
											  }
											  String subcategory=Arrays.toString(subcategoryArr);
											  subcategory=subcategory.substring(1, subcategory.length()-1);
											  %>
									        <td class="dropdown">
									        	<button class="btn w3-container w3-white w3-text-blue w3-hover-blue w3-hover-text-white ptb dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span>
									      		</button>
									      		 <ul class="dropdown-menu">
												    <li class="w3-container w3-hover-blue p10" data-toggle="modal" data-target="#rowView" onclick="rowView('<%out.print(b.getName());%>','<%out.print(b.getRemark());%>','<%out.print(u2.getName());%>','<%out.print(u1.getName());%>','<%out.print(b.getCreated_date());%>','<%out.print(b.getModified_date());%>','<%out.print(b.getFlag());%>')"><span class="glyphicon glyphicon-eye-open"></span> View</a></li>
												    <li class="w3-container w3-hover-blue p10" data-toggle="modal" id="btnSubmit<%out.print(b.getBrand_id()); %>" data-target="#rowEd" onclick="submit('<%out.print(b.getBrand_id());%>','<%out.print(b.getName());%>','<%out.print(subcategory); %>','<%out.print(b.getRemark());%>','<%out.print(b.getFlag());%>')"><span class="glyphicon glyphicon-edit"></span> Edit</a></li>
												   <%if(b.getFlag()==1){ %>				
													    <li class="w3-container w3-hover-blue p10" onclick="confirmDelete('<%out.print(b.getBrand_id());%>')"> 
													    	<span class="glyphicon glyphicon-remove-circle"></span> Delete</li>
												    <%} else { %>
												    	<li class="w3-container w3-hover-red p10 disabled"> <font color="gray">
													    	<span class="glyphicon glyphicon-remove-circle"></span> Delete</font></li>
												    <%} %>
												</ul>
												<script>
													var name1;
													var subcategory1;
													var remark1;
													var flag1;
													function submit(){
														name1=arguments[1];
														remark1=arguments[3];
														flag1=arguments[4];
														document.getElementById("idtxtId2").value=arguments[0];
														document.getElementById("idtxtName2").value=arguments[1];
														var subcategory=document.getElementsByName("subcategory2");
														var a=arguments[2];
														
														a=a.replace(/ /gi,"");
														var res=a.split(",");
														for ( var i = 0; i < res.length; i++) {
															for(var j=0;j<subcategory.length;j++){
																if(res[i]==subcategory[j].value){
																	subcategory[j].checked=true;
																}
															}
														}
														subcategory1=res;
														document.getElementById("idtxtRemark2").value=arguments[3];
														if(arguments[4]=="1"){
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
												  			location.href="/warehouse/BrandController?page=remove&bid="+arguments[0];
												  		}
													}
												</script>
									        </td>
									      </tr>
									       <%} %>
									    </tbody>
									  </table>
						  			<!-- end of search result table -->
						  		</div>
							</div>
						</div>
					</div>
					<!-- end of inserting the code for each operation -->

					<!-- start of all modal for column Edition -->

					<!-- start of Modal for add new the row -->
					<div class="modal fade" id="addNew" role="dialog">
					    <div class="modal-dialog">
					    
					      <!-- Modal content-->
					      	<div class="modal-content">
					        	<div class="modal-header w3-container w3-light-blue p10">
					         		<button type="button" class="close" data-dismiss="modal">&times;</button>
					          		<h4 class="modal-title">Adding New Brand</h4>
					       		</div>
					       		<script type="text/javascript">
									function validate(){
										var subcategory=document.getElementsByName("subcategory");
										var temp=false;
										for ( var i = 0; i < subcategory.length; i++) {
											if(subcategory[i].checked){
												temp=true;
											}
										}
										if(temp){
											return true;
										}else {
											alert("Please select subcategory(s)");
											return false;
										}
									}
								</script>
								
					       		<form onsubmit="return validate()" name="sample" action="/warehouse/BrandController">
						        <div class="modal-body p10">
						<!-- start subcategory insert form -->

							<br>
							<div class="row">
								<div class="col-sm-1"></div>
								<div class="col-sm-4 right">
									<label for="lblName">Brand Name</label>
								</div>
								<div class="col-sm-5">
									<input class="u-full-width form-control" type="text"name="txtName" id="idtxtName" required />
								</div>
								<div class="col-sm-2"></div>
							</div><br>
							<div class="row">
								<div class="col-sm-1"></div>
								<div class="col-sm-4 right">
									<label for="brand">SubCategory</label>
								</div>
								<%ISub_category_service category_service = (ISub_category_service) SpringBeanFactory
			  							.getBean("Sub_category_service");
								  List<Sub_category> scl=category_service.selectAll();
								%>
								<div class="col-sm-5">
									<input type="text" class="form-control2" name="cboUserlevel" id="subCategoryInput" placeholder="Select SubCategory(s)"  onkeyup="filterSubCategory()" autocomplete="off"><button type="button" class="btn6" data-toggle="dropdown" id="btn6"><span class="caret"></span></button>
			  						<ul class="dropdown-menu dropdown-menu-center menu dropdown-content droplist">
			  						<%for(Sub_category sc:scl){ %>
			  						<li name="combobox">&nbsp;&nbsp;<input type="checkbox" name="subcategory" value="<%out.print(sc.getSub_category_id());%>"/><%out.print(sc.getName()); %></li>
			  						<%} %>
			  						<li id="noMatchingSentenceForSubCategory" class="noMatchingSentence">no matching data found.Click the follwing button.</li>
			  						<li onclick="showNewSubCategoryDiv()" class="addBrandSub">Add new subcategory</li>
			  						</ul>
								</div>
								<script type="text/javascript">
									function showNewSubCategoryDiv(){
										document.getElementById("newSubCategoryDiv").style.display="block";
									}
									function hideNewSubCategoryDiv(){
										document.getElementById("newSubCategoryDiv").style.display="none";
									}
								</script>
								<div class="col-sm-2"></div>
							</div><br>
							<div class="row">
								<div class="col-sm-1"></div>
								<div class="col-sm-4 right">
									<label for="lblRemark">Remark</label>
								</div>
								<div class="col-sm-5">
									<input class="u-full-width form-control" type="text" name="txtRemark" id="idtxtRemark" required />
								</div>
								<div class="col-sm-2"></div>
							</div><br>
							<div class="row" id="newSubCategoryDiv">
								<div class="col-sm-1"></div>
								<div class="col-sm-10" style="border-style: solid;border-radius:15px;border-color: skyblue;">
								<center><h4>Add SubCategory</h4></center>
									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-4">
											<label for="lblName">SubCategory Name</label>
										</div>
										<div class="col-sm-4">
											<input class="u-full-width form-control" type="text" name="txtName1" id="idtxtName1" />
										</div>
										<div class="col-sm-2"></div>
									</div><br>
									<%ICategoryService categoryService=(ICategoryService) SpringBeanFactory.getBean("CategoryService"); 
									  List<Category> cl=categoryService.selectAll();%>
									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-4">
											<label for="lblCategory">Category</label>
										</div>
										<div class="col-sm-4">
											<select name="cboCategory" id="idcboCategory" style="width: 100%;">
												<% for(Category ca:cl){ %>
												<option value="<% out.print(ca.getCategory_id()); %>">
													<% out.print(ca.getName()); %>
												</option>
												<% } %>
											</select>
										</div>
										<div class="col-sm-2"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-4">
											<label for="lblRemark">Remark</label>
										</div>
										<div class="col-sm-4">
											<input class="u-full-width form-control" type="text" name="txtRemark1" id="idtxtRemark1"/>
										</div>
										<div class="col-sm-2"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-4">
											<button type="button" class="btn btn-primary" onclick="AddNewSubCategory()">Add SubCategory</button>
										</div>
										<script type="text/javascript">
											function AddNewSubCategory(){
													var bName=document.getElementById("idtxtName").value;
													var subcategory=document.getElementsByName("subcategory");
													var remark=document.getElementById("idtxtRemark").value;
													var sName=document.getElementById("idtxtName1").value;
													var remark1=document.getElementById("idtxtRemark1").value;
													var category=document.getElementById("idcboCategory").value;
													var subCategoryArray=new Array();
													var f=0;
													for ( var i = 0; i < subcategory.length; i++) {
														if(subcategory[i].checked){
															subCategoryArray[f]=subcategory[i].value;
															f++;
														}
													
													}
													location.href="/warehouse/Sub_category_controller?page=AddSubCategory&txtName1="+sName+
															"&txtRemark1="+remark1+"&cboCategory="+category+"&txtName="+bName+"&subcategory="+
															subCategoryArray+"&txtRemark="+remark;
												
											}
										</script>
										<div class="col-sm-4">
											<button class="btn btn-primary" type="button" onclick="hideNewSubCategoryDiv()" id="hideBrand">Cancel</button>
										</div>
										<div class="col-sm-2"></div>
									</div><br>
								</div>
								<div class="col-sm-1"></div>
							</div>
						<!-- End subcategory insert form -->
					</div>
						        <div class="modal-footer p10">
						        	<button type="submit" class="btn btn-default w3-container w3-light-blue p10" value="BrandAdd" name="page">Add</button>
						          	<button type="reset" class="btn btn-default w3-container w3-light-blue p10" data-dismiss="modal">Close</button>
						        </div>
						        </form>
					      	</div>					      
					    </div>
					</div>
					<!-- end of the add new of the row -->

					<!-- start of Modal for edition the row -->
					<div class="modal fade" id="search" role="dialog">
					    <div class="modal-dialog">
					    
					      <!-- Modal content-->
					      	<div class="modal-content">
					        	<div class="modal-header w3-container w3-light-blue p10">
					         		<button type="button" class="close" data-dismiss="modal">&times;</button>
					          		<h4 class="modal-title">Searching Customer By Options</h4>
					       		</div>
					       		<form>
						        <div class="modal-body p10">
						          	<p>Some text in the modal.</p>
						        </div>
						        <div class="modal-footer p10">
						        	<button type="submit" class="btn btn-default w3-container w3-light-blue p10">Search</button>
						        	<button type="reset" class="btn btn-default w3-container w3-light-blue p10">Cancel</button>
						          	<button type="button" class="btn btn-default w3-container w3-light-blue p10" data-dismiss="modal">Close</button>
						        </div>
						        </form>
					      	</div>						      
					    </div>
					</div>
					<!-- end of the edition of the row -->
					
					<script type="text/javascript">
					function rowView(){
						document.getElementById("brandname").innerHTML=arguments[0];
						document.getElementById("remark").innerHTML=arguments[1];
						document.getElementById("createdUser").innerHTML=arguments[2];
						document.getElementById("modifiedUser").innerHTML=arguments[3];
						document.getElementById("createdDate").innerHTML=arguments[4];
						document.getElementById("modifiedDate").innerHTML=arguments[5];
						if(arguments[6]=="1"){
							document.getElementById("flag").innerHTML="ON";
						}else document.getElementById("flag").innerHTML="OFF";
					}
					</script>
					<!-- start of Modal for view the row -->
					<div class="modal fade" id="rowView" role="dialog">
					    <div class="modal-dialog" >
					    
					      <!-- Modal content-->
					      	<div class="modal-content">
					        	<div class="modal-header w3-container w3-light-blue p10">
					         		<button type="button" class="close" data-dismiss="modal">&times;</button>
					          		<h4 class="modal-title">Showing Each Brand Information</h4>
					       		</div>
					       		<form>
						        <div class="modal-body p10" style="height:430px;">
						          	
						          		<div class="form-group">
											<label class="control-label col-sm-6 right" for="brandname">Brand name:</label>
												<div class="col-sm-3">
													<label class="control-label" id="brandname"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="remark">Remark:</label>
												<div class="col-sm-3">
													<label class="control-label" id="remark"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="createdUser">Created User Name:</label>
												<div class="col-sm-3">
													<label class="control-label" id="createdUser"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="modifiedUser">Modified User Name</label>
												<div class="col-sm-3">
													<label class="control-label" id="modifiedUser"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="createdDate">Created Date:</label>
												<div class="col-sm-3">
													<label class="control-label" id="createdDate"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="modifiedDate">Modified Date:</label>
												<div class="col-sm-3">
													<label class="control-label" id="modifiedDate"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="flag">Flag:</label>
												<div class="col-sm-3">
													<label class="control-label" id="flag"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div>
										
						          	
						        </div>
						        <div class="modal-footer p10">
						          	<button type="button" class="btn btn-default w3-container w3-light-blue p10" data-dismiss="modal">Close</button>
						        </div>
						        </form>
					      	</div>						      
					    </div>
					</div>
					<!-- end of the view of the row -->


					<!-- start of Modal for edition the row -->
					<div class="modal fade" id="rowEd" role="dialog">
					    <div class="modal-dialog">
					    
					      <!-- Modal content-->
					      	<div class="modal-content">
					        	<div class="modal-header w3-container w3-light-blue p10">
					         		<button type="button" class="close" data-dismiss="modal">&times;</button>
					          		<h4 class="modal-title">Editing Brand Information</h4>
					       		</div>
					       		<script>
					       		 function confirmEdit(){
					       			var subcategory=document.getElementsByName("subcategory2");
									var temp=false;
									for ( var i = 0; i < subcategory.length; i++) {
										if(subcategory[i].checked){
											temp=true;
										}
									}
									if(temp){
										if(confirm("Are you sure to edit!")){
						       				 return true;
						       			 }else return false;
									}else {
										alert("Please select subcategory(s)");
										return false;
									}
					       		 }
								</script>
								<script type="text/javascript">
								function beforeSubmit(){
									var name=document.getElementById("idtxtName2").value;
									var subcategory=document.getElementsByName("subcategory2");
									var remark=document.getElementById("idtxtRemark2").value;
									var flag;var subCheck=false;
									if(document.getElementById("idtxtFlag1").checked){
										flag="1";
									}else flag="0";
									var subArray=new Array();
									var f=0;
									for ( var i = 0; i < subcategory.length; i++) {
										if(subcategory[i].checked){
											subArray[f]=subcategory[i].value;
											f++;
										}
									
									}
									if(subcategory1.length==subArray.length){
										for(var i=0;i<subcategory1.length;i++){
											if(subcategory1[i]==subArray[i]){
												subCheck=true;
											}else subCheck=false;
										}
									}else subCheck=false;
									//if(brandCheck){
										//document.getElementById("btnSubmit").disabled=true;
									//}else document.getElementById("btnSubmit").disabled=false;
									if(name1!=name||remark1!=remark||flag1!=flag||subCheck==false){
										document.getElementById("btnSubmit").disabled=false;
									}else document.getElementById("btnSubmit").disabled=true;
								}
								</script>
					       		<form onsubmit="return confirmEdit()" name="sample" action="/warehouse/BrandController">
						        <div class="modal-body p10">
						<!-- start subcategory insert form -->

							<br>
							<div class="row">
								<div class="col-sm-1"></div>
								<div class="col-sm-4"></div>
								<div class="col-sm-5">
									<input class="u-full-width form-control" type="hidden" name="txtId" id="idtxtId2" required />
								</div>
								<div class="col-sm-2"></div>
							</div><br>
							<div class="row">
								<div class="col-sm-1"></div>
								<div class="col-sm-4">
									<label for="lblName">New Brand Name</label>
								</div>
								<div class="col-sm-5">
									<input class="u-full-width form-control" type="text" name="txtName" id="idtxtName2" onkeyup="beforeSubmit()" required />
								</div>
								<div class="col-sm-2"></div>
							</div><br>
							<div class="row">
								<div class="col-sm-1"></div>
								<div class="col-sm-4">
									<label for="subcategory">SubCategory</label>
								</div>
								<div class="col-sm-5">
			  						<input type="text" class="form-control2" id="subCategoryEditFromBrand" placeholder="Select SubCategory(s)"  onkeyup="filterSubCategoryEdit()" autocomplete="off"><button type="button" class="btn6" data-toggle="dropdown" id="btnDropdown2"><span class="caret"></span></button>
			  						<ul class="dropdown-menu dropdown-menu-center menu dropdown-content droplist">
			  						<%for(Sub_category sc:scl){ %>
			  						<li name="combobox1">&nbsp;&nbsp;<input type="checkbox" name="subcategory2" onclick="beforeSubmit()" value="<%out.print(sc.getSub_category_id());%>"/><%out.print(sc.getName()); %></li>
			  						<%} %>
			  						<li id=noMatchingSentenceSubCategoryFromBrandEdit class="noMatchingSentence">no matching data found.Click the follwing button.</li>
			  						<li onclick="showNewSubCategoryDiv1()" class="addBrandSub">Add new subcategory</li>
			  						</ul>
								</div>
								<script type="text/javascript">
									function showNewSubCategoryDiv1(){
										document.getElementById("newSubCategoryDiv1").style.display="block";
									}
									function hideNewSubCategoryDiv1(){
										document.getElementById("newSubCategoryDiv1").style.display="none";
									}
								</script>
								<div class="col-sm-2"></div>
							</div><br>
							<div class="row">
								<div class="col-sm-1"></div>
								<div class="col-sm-4">
									<label for="lblRemark">Remark</label>
								</div>
								<div class="col-sm-5">
									<input class="u-full-width form-control" type="text" name="txtRemark" id="idtxtRemark2" onkeyup="beforeSubmit()" required />
								</div>
								<div class="col-sm-2"></div>
							</div><br>
							<div class="row">
								<div class="col-sm-2"></div>
								<div class="col-sm-4">
									<label for="lblFlag">Flag</label>
								</div>
								<div class="col-sm-5">
									<input type="radio" name="txtFlag" id="idtxtFlag1" onclick="beforeSubmit(this.value)" value="1"/><font color="green">ON</font>
									<input type="radio" name="txtFlag" id="idtxtFlag2" onclick="beforeSubmit(this.value)" value="0"/><font color="red">OFF</font>
								</div>
								<div class="col-sm-2"></div>
							</div><br>
							<div class="row" id="newSubCategoryDiv1">
								<div class="col-sm-1"></div>
								<div class="col-sm-10" style="border-style: solid;border-radius:15px;border-color: skyblue;">
								<center><h4>Add SubCategory</h4></center>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-4">
											<label for="lblName">SubCategory Name</label>
										</div>
										<div class="col-sm-5">
											<input class="u-full-width form-control" type="text" name="txtName1" id="idtxtName3" />
										</div>
										<div class="col-sm-2"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-4">
											<label for="lblCategory">Category</label>
										</div>
										<div class="col-sm-5">
											<select name="cboCategory" id="idcboCategory2" style="width: 100%;">
												<% for(Category ca:cl){ %>
												<option value="<% out.print(ca.getCategory_id()); %>">
													<% out.print(ca.getName()); %>
												</option>
												<% } %>
											</select>
										</div>
										<div class="col-sm-2"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-4">
											<label for="lblRemark">Remark</label>
										</div>
										<div class="col-sm-5">
											<input class="u-full-width form-control" type="text" name="txtRemark1" id="idtxtRemark3"/>
										</div>
										<div class="col-sm-2"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-4">
											<button type="button" class="btn btn-primary" onclick="AddNewSubCategory1()">Add SubCategory</button>
										</div>
										<script type="text/javascript">
											function AddNewSubCategory1(){
													var id=document.getElementById("idtxtId2").value;
													var bName=document.getElementById("idtxtName2").value;
													var subcategory=document.getElementsByName("subcategory2");
													var remark=document.getElementById("idtxtRemark2").value;
													var sName=document.getElementById("idtxtName3").value;
													var remark1=document.getElementById("idtxtRemark3").value;
													var category=document.getElementById("idcboCategory2").value;
													var flag;
													if(document.getElementById("idtxtFlag1").checked){
														flag="1";
													}else flag="2";
													var subCategoryArray=new Array();
													var f=0;
													for ( var i = 0; i < subcategory.length; i++) {
														if(subcategory[i].checked){
															subCategoryArray[f]=subcategory[i].value;
															f++;
														}
													
													}
													location.href="/warehouse/Sub_category_controller?page=AddSubCategoryEdit&txtName1="+sName+
															"&txtRemark1="+remark1+"&cboCategory="+category+"&txtName="+bName+"&subcategory="+
															subCategoryArray+"&txtRemark="+remark+"&txtFlag="+flag+"&txtId="+id;
												
											}
										</script>
										<div class="col-sm-5">
											<button class="btn btn-primary" type="button" onclick="hideNewSubCategoryDiv1()" >Cancel</button>
										</div>
										<div class="col-sm-2"></div>
									</div><br>
								</div>
								<div class="col-sm-1"></div>
							</div>
						<!-- End subcategory insert form -->
					</div>
		        <div class="modal-footer p10">
		        	<input type="submit" class="btn btn-default w3-container w3-light-blue p10" name="page" id="btnSubmit" value="Edit" disabled/>
		          	<button type="reset" class="btn btn-default w3-container w3-light-blue p10" data-dismiss="modal">Close</button>
		        </div>
		        </form>
	      	</div>					      
	    </div>
	</div>
	<!-- end of the edition of the row -->
	
	<!-- end of the all modal for column Editioin -->
	<%@ include file="right.jsp" %>
				
</body>
</html>
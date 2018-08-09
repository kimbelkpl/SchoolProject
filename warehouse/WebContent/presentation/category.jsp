<%@page import="org.springframework.expression.spel.support.ReflectionHelper.ArgumentsMatchInfo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="com.java.plyd.service.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category Page</title>
	<%@ include file="link.jsp" %>
	<!-- Exist or not -->
	<script>
	 function existOrNot(){
		 if(arguments[0]=="1"){
			 document.getElementById("txtName").value=arguments[3];
			 document.getElementById("txtRemark").value=arguments[4];
			 alert(arguments[1]+" is already exist!");
			 $(document).ready(function(){
					$('#btnAddNew').trigger('click');
				});
		 }else if(arguments[0]=="2"){
			 alert("Can't Delete!\n "+arguments[1]+" is using in sub_category!");
		 }
		 else if(arguments[0]=="3"){
			 var r=confirm("Are you sure to delete this row!");
			 if(r){
				 location.href="/warehouse/CategoryController?page=sureRemove&id="+arguments[2];
			 }
		 }
		 else if(arguments[0]=="4"){
			 alert("Add Successful");
			 $(document).ready(function(){
					$('#btnAddNew').trigger('click');
				});
		 }else if(arguments[0]=="5"){
			 alert("Can't change flag to off!\n "+arguments[1]+" is using in sub_category!");
			 document.getElementById("idtxtId").value=arguments[2];
			 document.getElementById("idtxtName").value=arguments[3];
			 document.getElementById("idtxtRemark").value=arguments[4];
			 if(arguments[5]=="1"){
				 document.getElementById("idtxtFlag1").checked=true;
			 }else document.getElementById("idtxtFlag2").checked=true;
			 $(document).ready(function(){
					$('#btnSubmit1').trigger('click');
				});
		 }else if(arguments[0]=="6"){
			 
			 if(confirm("Are you sure to Edit!")){
				 location.href="/warehouse/CategoryController?page=sureEdit&txtId="+arguments[2]+"&txtName="+arguments[3]
				 +"&txtRemark="+arguments[4]+"&txtFlag="+arguments[5];
			 }
		 }
	 }
	</script>
	<!-- End of script Exist or not -->
</head>

<body class="w3-container w3-light-gray" onload="existOrNot(
	'<%out.print(request.getAttribute("exist")); %>','<%out.print(request.getAttribute("name")); %>',
	'<%out.print(request.getAttribute("confirmId"));%>',
	'<%out.print(request.getAttribute("txtName")); %>','<%out.print(request.getAttribute("txtRemark")); %>',
	'<%out.print(request.getAttribute("txtFlag")); %>')">
		<%@ include file="header.jsp" %>
				<!-- for body part of the body column -->
				<div class="row panel-body p10">
					<!-- inserting the code for each operation -->
					<div class="col-sm-9">
						<div class="row p10">
							<div class="panel panel-default">
						  		<div class="panel-heading w3-container w3-light-blue p10">
						  			<button type="button" class="btn w3-container w3-light-blue p-header-btn" data-toggle="modal" data-target="#addNew" id="btnAddNew"><span class="glyphicon glyphicon-plus" id=""></span> Add New</button> 
			  						<!-- <button type="button" class="btn w3-container w3-light-blue p-header-btn" data-toggle="modal" data-target="#search"><span class="glyphicon glyphicon-sear/ch"></span> Search</button> -->
			  						<span class="dropdown">
			  							<button type="button" class="btn w3-container w3-light-blue p-header-btn dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span> Tools <span class="caret"></span></button>
										  <ul class="dropdown-menu p10">
										    <li class="w3-container w3-text-black w3-hover-blue w3-hover-text-white p10"><span class="glyphicon glyphicon-import"></span> Import Files</li>
										    <li class="w3-container w3-text-black w3-hover-blue w3-hover-text-white p10"><span class="glyphicon glyphicon-export"></span> Export Files</li>
										    <li></li>
										  </ul>
			  						</span>
			  									  						
						  		</div>
						  		<input type="hidden" id="btnSubmit1" class="btn" data-toggle="modal" data-target="#rowEd">
						  		<div class="panel-body p10">
						  			<!-- start of search result table -->
						  			<table class="table table-condensed table-bordered p10" id="example">
						  				<caption class="w3-container w3-text-black w3-myfont">Category Information Lists</caption>
									    <thead class="w3-container w3-light-blue p10">
									      <tr>
									        <th>Name</th>
							        		<th>Remark</th>
											<th>Flag</th>
									        <th>Options</th>
									      </tr>
									    </thead>
									    <tbody>
									      <% ICategoryService category_service = (ICategoryService) SpringBeanFactory
											.getBean("CategoryService");
									      String i;
							    			IUserService userservice=(IUserService)SpringBeanFactory.getBean("UserService");
							    			List<Category> c;
							    			User u=userservice.selectUser(uid);
							    			System.out.print("uid"+uid);
							    			System.out.print("  level"+ u.getUser_level_id());
							    				c=category_service.selectAllforadmin();
									      	for(Category ca:c){
											%>
									      	<tr>
									        <td><%out.print(ca.getName()); %></td>
									        <td><%out.print(ca.getRemark()); %></td>
									        <%
												IUserService user_service = (IUserService) SpringBeanFactory
													.getBean("UserService");
												User u1 = user_service.selectUser(ca.getCreated_user_id());
												User u2 = user_service.selectUser(ca.getModified_user_id());
											%>
											<%if(ca.getFlag()==1){ %>
											<td> <font color="green">ON</font></td>
											<%} else { %>
											<td><font color="red">OFF</font></td>
											<%} %>
									        <td class="dropdown">
									        	<button class="btn w3-container w3-white w3-text-blue w3-hover-blue w3-hover-text-white ptb dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span>
									      		</button>
									      		<ul class="dropdown-menu">
												    <li class="w3-container w3-hover-blue p10" data-toggle="modal" data-target="#rowView" onclick="rowView('<%out.print(ca.getName());%>',
						           						'<%out.print(ca.getRemark());%>','<%out.print(u1.getName());%>','<%out.print(u2.getName());%>','<%out.print(ca.getCreated_date());%>',
								  						'<%out.print(ca.getModified_date());%>','<%out.print(ca.getFlag());%>')"><span class="glyphicon glyphicon-eye-open"></span> View</a></li>
												    <li class="w3-container w3-hover-blue p10" data-toggle="modal" data-target="#rowEd"
												     onclick="submit('<%out.print(ca.getCategory_id());%>','<%out.print(ca.getName());%>','<%out.print(ca.getRemark());%>','<%out.print(ca.getFlag());%>')"><span class="glyphicon glyphicon-edit"></span> Edit</a></li>
												    <%if(ca.getFlag()==1){ %>				
													    <li class="w3-container w3-hover-blue p10" onclick="confirmDelete('<%out.print(ca.getCategory_id());%>')"> 
													    	<span class="glyphicon glyphicon-remove-circle"></span> Delete</li>
												    <%} else { %>
												    	<li class="w3-container w3-hover-red p10 disabled"> <font color="gray">
													    	<span class="glyphicon glyphicon-remove-circle"></span> Delete</font></li>
												    <%} %>
												</ul>
												<script>
													var name1;
													var remark1;
													var flag1;
													function submit(){
														name1=arguments[1];
														remark1=arguments[2];
														flag1=arguments[3];
														document.getElementById("idtxtId").value=arguments[0];
														document.getElementById("idtxtName").value=arguments[1];
														document.getElementById("idtxtRemark").value=arguments[2];
														if(arguments[3]==1){
															document.getElementById("idtxtFlag1").checked=true;
															document.getElementById("idtxtFlag2").checked=false;
														}else{
															document.getElementById("idtxtFlag2").checked=true;
															document.getElementById("idtxtFlag1").checked=false;
														}
														
													}
													function confirmDelete() {
												
												  			location.href="/warehouse/CategoryController?page=remove&id="+arguments[0];
												  		
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
					          		<h4 class="modal-title">Adding New Category</h4>
					       		</div>
					       		<form onsubmit="return validate()" name="sample" action="/warehouse/CategoryController">
						        <div class="modal-body p10">
						          	<center>
						          		<table>
										        <tr>
										        <td><label for="lblName">Category Name</label></td><td><input
										              class="u-full-width form-control" type="text" name="txtName" id="txtName" required/></td>
										        </tr>
										        <tr>
										        <td>&nbsp;</td><td>&nbsp;</td>
										        </tr>
										        <tr>
										        <td><label for="lblRemark">Remark</label></td><td><input
										              class="u-full-width form-control" type="text" name="txtRemark" id="txtRemark" required/></td>
										        </tr>
										        <tr>
										        <td>&nbsp;</td><td>&nbsp;</td>
										        </tr>
										 </table>
						          	</center>
						        </div>
						        <div class="modal-footer p10">
						        	<input type="submit" class="btn btn-default w3-container w3-light-blue p10" value="Add" name="page"/>
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
						        	<button type="button" class="btn btn-default w3-container w3-light-blue p10" data-dismiss="modal">Close</button>
						        </div>
						        </form>
					      	</div>						      
					    </div>
					</div>
					<!-- end of the edition of the row -->

					<script type="text/javascript">
					function rowView(){
						document.getElementById("categoryname").innerHTML=arguments[0];
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
					          		<h4 class="modal-title">Showing Each Category Information</h4>
					       		</div>
					       		<form>
						        <div class="modal-body p10" style="height:430px;">
						          	
						          		<div class="form-group">
											<label class="control-label col-sm-6 right" for="categoryname">Category name:</label>
												<div class="col-sm-3">
													<label class="control-label" id="categoryname"></label>
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
					          		<h4 class="modal-title">Editing Category Information</h4>
					       		</div>
								<script>
									function beforeSubmit(){
										var name=document.getElementById("idtxtName").value;
										var remark=document.getElementById("idtxtRemark").value;
										var flag;
										if(document.getElementById("idtxtFlag1").checked){
											flag="1";
										}else flag="0";
										if(name1!=name||remark1!=remark||flag1!=flag){
											document.getElementById("btnSubmit").disabled=false;
										}else document.getElementById("btnSubmit").disabled=true;
									}
				
								</script>
					       		<form name="sample" action="/warehouse/CategoryController">
						        <div class="modal-body p10">
						          	   	<center>
									        <table>
									        <tr>
										        <td></td>
										        <td><input
										              class="u-full-width form-control" type="hidden" name="txtId" value="a" id="idtxtId"/>
										         </td></tr>
									       <tr> 
									       		<td><label for="lblName">Enter New Category Name</label></td>
									       		<td><input
									              class="u-full-width form-control" type="text" name="txtName" id="idtxtName" value="a" onkeyup="beforeSubmit()" autocomplete="off" required/></td>
									        </tr>
									        <tr>
									        <td>&nbsp;</td><td>&nbsp;</td>
									        </tr>
									        <tr>
									        <td><label for="lblRemark">Enter New Remark</label></td><td><input
									              class="u-full-width form-control" type="text" name="txtRemark" id="idtxtRemark" value="a" onkeyup="beforeSubmit()" autocomplete="off" required/></td>
									        </tr>
									        <tr>
									        <td>&nbsp;</td><td>&nbsp;</td>
									        </tr>
									        <tr>
									        <td><label for="lblflag">Enter Flag</label></td>
									        <td><input type="radio" value="1" name="txtFlag" id="idtxtFlag1" onchange="beforeSubmit(this.value)"/><font color="green">ON</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									          	<input type="radio" value="0" name="txtFlag" id="idtxtFlag2" onchange="beforeSubmit(this.value)"/><font color="red">OFF</font></td>
									        </tr>
									        <tr>
									        <td>&nbsp;</td><td>&nbsp;</td>
									        
									        </table></center>
						        </div>
						        <div class="modal-footer p10">
						        	<input type="submit" class="btn btn-default w3-container w3-light-blue p10" id="btnSubmit" name="page" value="Edit" disabled/>
						        	<button type="button" class="btn btn-default w3-container w3-light-blue p10" data-dismiss="modal">Close</button>
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
<%@page import="org.springframework.expression.spel.support.ReflectionHelper.ArgumentsMatchInfo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*"%>
<%@page import="com.java.plyd.service.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Page</title>
<%@ include file="link.jsp" %>
<script>
function existOrNot(){
	if(arguments[0]=="1"){
		alert (arguments[1]+" is already exits!");
		$(document).ready(function(){
			$('#btnAddNew').trigger('click');
			
		});
		document.getElementById("txtName").value=arguments[2];
		document.getElementById("txtAddress").value=arguments[3];
		document.getElementById("txtPhoneNo").value=arguments[4];
		document.getElementById("txtEmail").value=arguments[5];
		document.getElementById("txtRemark").value=arguments[6];
		
		
		
		
	}
	else if(arguments[0]=="2"){
		alert("Add Successful");
		$(document).ready(function(){
			$('#btnAddNew').trigger('click');
		});
	}
}
</script>
</head>
<body class="w3-container w3-light-gray" onload="existOrNot('<%out.print(request.getAttribute("exist")); %>','<%out.print(request.getAttribute("name")); %>',
															'<%out.print(request.getAttribute("txtName")); %>','<%out.print(request.getAttribute("txtAddress")); %>',
															'<%out.print(request.getAttribute("txtPhoneNo")); %>','<%out.print(request.getAttribute("txtEmail")); %>',
															'<%out.print(request.getAttribute("txtRemark")); %>')">

	<%@ include file="header.jsp"%>
		<!-- for body part of the body column -->
				<div class="row panel-body p10">
					<!-- inserting the code for each operation -->
					<div class="col-sm-9">
						<div class="row p10">
							<div class="panel panel-default">
						  		<div class="panel-heading w3-container w3-light-blue p10">
						  			<button type="button" class="btn w3-container w3-light-blue p-header-btn" data-toggle="modal" data-target="#addNew" id="btnAddNew"><span class="glyphicon glyphicon-plus"></span>Add New Customer</button> 
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
						  				<caption class="w3-container w3-text-black w3-myfont">Customer Information Lists</caption>
									    <thead class="w3-container w3-light-blue p10">
									      <tr>
									        <th>Name</th>
									        <th>Address</th>
									        <th>Phone_No</th>
									        <th>Email</th>
							        		<th>Remark</th>
											<!-- <th>Flag</th> -->
									        <th>Options</th>
									      </tr>
									    </thead>
									    <tbody>
									      <% ICustomerService customer_service = (ICustomerService) SpringBeanFactory
											.getBean("CustomerService");
									      String i;
							    			IUserService userservice=(IUserService)SpringBeanFactory.getBean("UserService");
							    			List<Customer> c;
							    			User u=userservice.selectUser(uid);
							    			System.out.print("uid"+uid);
							    			System.out.print("  level"+ u.getUser_level_id());
							    			if(u.getUser_level_id()==1){
							    				c=customer_service.selectAll();
							    			}
							    			else{
							    				c=customer_service.selectAll();
							    			}
									      
									      
									      	for(Customer ca:c){
											%>
									      	<tr>
									        <td><%out.print(ca.getName()); %></td>
									        <td><%out.print(ca.getAddress()); %></td>
									        <td><%out.print(ca.getPhone_no()); %></td>
									        <td><%out.print(ca.getEmail()); %></td>
									        <td><%out.print(ca.getRemark()); %></td>
									        <%
												IUserService user_service = (IUserService) SpringBeanFactory
													.getBean("UserService");
												User u2 = user_service.selectUser(ca.getCreated_user_id());
												User u1 = user_service.selectUser(ca.getModified_user_id());
											%>
									        <%-- <% if(ca.getFlag()==1){ %>
									        <td><font color="green">ON</font></td>
									        <%} else{ %>
									        <td><font color="red">OFF</font></td>
									        <%} %> --%>
									        <td class="dropdown">
									        	<button class="btn w3-container w3-white w3-text-blue w3-hover-blue w3-hover-text-white ptb dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span>
									      		</button> 
									      		<ul class="dropdown-menu">
												    <li class="w3-container w3-hover-blue p10" data-toggle="modal" data-target="#rowView"
												    onclick="rowView('<%out.print(ca.getName()); %>','<%out.print(ca.getAddress()); %>','<%out.print(ca.getPhone_no()); %>',
												    				 '<%out.print(ca.getEmail()); %>','<%out.print(ca.getRemark()); %>','<%out.print(u2.getName()); %>',
												    				 '<%out.print(u1.getName()); %>','<%out.print(ca.getCreated_date()); %>','<%out.print(ca.getModified_date()); %>',
												    				 '<%out.print(ca.getFlag()); %>')"><span class="glyphicon glyphicon-eye-open"></span> View</a></li>
												    <li class="w3-container w3-hover-blue p10" data-toggle="modal" data-target="#rowEd"
												     onclick="submit('<%out.print(ca.getCustomer_id());%>','<%out.print(ca.getName());%>','<%out.print(ca.getAddress());%>','<%out.print(ca.getPhone_no());%>','<%out.print(ca.getEmail());%>','<%out.print(ca.getRemark());%>','<%out.print(ca.getFlag());%>')"><span class="glyphicon glyphicon-edit"></span> Edit</a></li>
												     <%if(ca.getFlag()==1){ %>
												    <li class="w3-container w3-hover-blue p10" onclick="confirmDelete('<%out.print(ca.getCustomer_id());%>','<%out.print(ca.getCustomer_id());%>')"> 
												    	<span class="glyphicon glyphicon-remove-circle"></span> Delete</li>
												    	<%} else{ %>
												    	<li class="w3-container w3-hover-red p10 disable"><font color="gray">
												    	<span class="glyphicon glyphicon-remove-circle"></span>Delete</font></li>
												    	<%} %>
												</ul>
												<script>
													function submit(){
														document.getElementById("idtxtId").value=arguments[0];
														document.getElementById("idtxtName").value=arguments[1];
														document.getElementById("idtxtAddress").value=arguments[2];
														document.getElementById("idtxtPhoneNo").value=arguments[3];
														document.getElementById("idtxtEmail").value=arguments[4];
														document.getElementById("idtxtRemark").value=arguments[5];
														if(arguments[6]==1){
															document.getElementById("idtxtFlag1").checked=true;
															document.getElementById("idtxtFlag2").checked=false;
														}else{
															document.getElementById("idtxtFlag1").checked=false;
															document.getElementById("idtxtFlag2").checked=true;
														}
														
													}
													function confirmDelete() {
												
														var r=confirm("Are you sure to delete this row");
												  		if(r){
												  			location.href="/warehouse/CustomerController?page=remove&id="+arguments[0];
												  		}
													}
												</script>
									        </td>
									      </tr>
									     <%} %>
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
					    <div class="modal-dialog">
					    
					      <!-- Modal content-->
					      	<div class="modal-content">
					        	<div class="modal-header w3-container w3-light-blue p10">
					         		<button type="button" class="close" data-dismiss="modal">&times;</button>
					          		<h4 class="modal-title">Adding New Customer</h4>
					       		</div>
					       		<form onsubmit="return validate()" name="sample" action="/warehouse/CustomerController">
						        <div class="modal-body p10">
						          	<center>
						          		<table>
										        <tr>
										        <td><label for="lblName">Name</label></td><td><input
										              class="u-full-width form-control" type="text" name="txtName" id="txtName" required placeholder="Name"/></td>
										        </tr>
										        <tr>
										        <td>&nbsp;</td><td>&nbsp;</td>
										        </tr>
										        <tr>
										        <td><label for="lblAddress">Address</label></td><td><input
										              class="u-full-width form-control" type="text" name="txtAddress" id="txtAddress" required placeholder="Address"/></td>
										        </tr>
										        <tr>
										        <td>&nbsp;</td><td>&nbsp;</td>
										        </tr>
										        <tr>
										        <td><label for="lblPhoneNo">Phone_No</label></td><td><input
										              class="u-full-width form-control" type="text" name="txtPhoneNo" pattern="\++[0-9\s]+|[0-9\s]+" id="txtPhoneNo" required placeholder="Phone No"/></td>
										        </tr>
										        <tr>
										        <td>&nbsp;</td><td>&nbsp;</td>
										        </tr>
										        <tr>
										        <td><label for="lblEmail">Email</label></td><td><input
										              class="u-full-width form-control" type="text" name="txtEmail" pattern="[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" id="txtEmail" required placeholder="Email"/></td>
										        </tr>
										        <tr>
										        <td>&nbsp;</td><td>&nbsp;</td>
										        </tr>
										        <tr>
										        <td><label for="lblRemark">Remark</label></td><td><input
										              class="u-full-width form-control" type="text" name="txtRemark" id="txtRemark" required placeholder="Remark"/></td>
										        </tr>
										        <tr>
										        <td>&nbsp;</td><td>&nbsp;</td>
										        </tr>
										 </table>
						          	</center>
						        </div>
						        <div class="modal-footer p10">
						        	<input type="submit" class="btn btn-default w3-container w3-light-blue p10" value="Add" name="page"/>
						        	<button type="reset" class="btn btn-default w3-container w3-light-blue p10">Cancel</button>
						          	<button type="button" class="btn btn-default w3-container w3-light-blue p10" data-dismiss="modal">Close</button>
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
						document.getElementById("rv_customer_name").innerHTML=arguments[0];
						document.getElementById("rv_customer_address").innerHTML=arguments[1];
						document.getElementById("rv_customer_phone").innerHTML=arguments[2];
						document.getElementById("rv_customer_email").innerHTML=arguments[3];
						document.getElementById("rv_customer_remark").innerHTML=arguments[4];
						document.getElementById("rv_createdUser").innerHTML=arguments[5];
						document.getElementById("rv_modifiedUser").innerHTML=arguments[6];
						document.getElementById("rv_createdDate").innerHTML=arguments[7];
						document.getElementById("rv_modifiedDate").innerHTML=arguments[8];
						if(arguments[9]==1){
							document.getElementById("rv_flag").innerHTML="ON";
						}else document.getElementById("rv_flag").innerHTML="OFF";
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
											<label class="control-label col-sm-6 right" for="rv_customer_name">Customer name:</label>
												<div class="col-sm-3">
													<label class="control-label" id="rv_customer_name"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="rv_customer_address">Address:</label>
												<div class="col-sm-3">
													<label class="control-label" id="rv_customer_address"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="rv_customer_phone">Phone No:</label>
												<div class="col-sm-3">
													<label class="control-label" id="rv_customer_phone"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="rv_customer_email">Email:</label>
												<div class="col-sm-3">
													<label class="control-label" id="rv_customer_email"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="rv_customer_remark">Remark:</label>
												<div class="col-sm-3">
													<label class="control-label" id="rv_customer_remark"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="rv_createdUser">Created User Name:</label>
												<div class="col-sm-3">
													<label class="control-label" id="rv_createdUser"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="rv_modifiedUser">Modified User Name</label>
												<div class="col-sm-3">
													<label class="control-label" id="rv_modifiedUser"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="rv_createdDate">Created Date:</label>
												<div class="col-sm-3">
													<label class="control-label" id="rv_createdDate"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="rv_modifiedDate">Modified Date:</label>
												<div class="col-sm-3">
													<label class="control-label" id="rv_modifiedDate"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="rv_flag">Flag:</label>
												<div class="col-sm-3">
													<label class="control-label" id="rv_flag"></label>
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
					          		<h4 class="modal-title">Editing Customer Information</h4>
					       		</div>
					       		<script type="text/javascript">
					       		function confirmEdit(){
					       			if(confirm("Are you sure to edit")){
					       				return true;
					       				
					       			}else{
					       				return false;
					       			}
					       		}</script>
					       		<form onsubmit="return confirmEdit()" name="sample" action="/warehouse/CustomerController">
						        <div class="modal-body p10">
						          	   	<center>
									        <table>
									        <tr>
										        <td></td>
										        <td><input
										              class="u-full-width form-control" type="hidden" name="txtId" value="a" id="idtxtId"/>
										         </td></tr>
									       <tr> 
									       		<td><label for="lblName">Customer Name</label></td>
									       		<td><input
									              class="u-full-width form-control" type="text" name="txtName" id="idtxtName" value="a" required/></td>
									        </tr>
									        <tr>
									        <td>&nbsp;</td><td>&nbsp;</td>
									        </tr>
									         <tr> 
									       		<td><label for="lblAddresss">Customer Address</label></td>
									       		<td><input
									              class="u-full-width form-control" type="text" name="txtAddress" id="idtxtAddress" value="a" required/></td>
									        </tr>
									        <tr>
									        <td>&nbsp;</td><td>&nbsp;</td>
									        </tr>
									        <tr> 
									       		<td><label for="lblPhoneNo">Customer Phone_No</label></td>
									       		<td><input
									              class="u-full-width form-control" type="text" name="txtPhoneNo" id="idtxtPhoneNo" pattern="\++[0-9\s]+|[0-9\s]+" value="a" required/></td>
									        </tr>
									        <tr>
									        <td>&nbsp;</td><td>&nbsp;</td>
									        </tr>
									         <tr> 
									       		<td><label for="lblEmail">Enter New Customer Email</label></td>
									       		<td><input
									              class="u-full-width form-control" type="text" name="txtEmail" id="idtxtEmail" pattern="[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" id="txtEmail" value="a" required/></td>
									        </tr>
									        <tr>
									        <td>&nbsp;</td><td>&nbsp;</td>
									        </tr>
									        <tr>
									        <td><label for="lblRemark">Customer Remark</label></td><td><input
									              class="u-full-width form-control" type="text" name="txtRemark" id="idtxtRemark" value="a" required/></td>
									        </tr>
									        <tr>
									        <td>&nbsp;</td><td>&nbsp;</td>
									        </tr>
									        <tr>
									        <td><label for="lblflag">Flag</label></td>
									        <td><input type="radio" value="1" name="txtFlag" id="idtxtFlag1" /><font color="green">ON</font>&nbsp;&nbsp;&nbsp;
									        <input type="radio" value="0" name="txtFlag" id="idtxtFlag2" /><font color="red">OFF</font></td>
									        </tr>
									        <tr>
									        <td>&nbsp;</td><td>&nbsp;</td>
									        
									        </table></center>
						        </div>
						        <div class="modal-footer p10">
						        	<input type="submit" class="btn btn-default w3-container w3-light-blue p10" name="page" value="Edit"/>
						        	<button type="reset" class="btn btn-default w3-container w3-light-blue p10">Cancel</button>
						          	<button type="button" class="btn btn-default w3-container w3-light-blue p10" data-dismiss="modal">Close</button>
						        </div>
						        </form>
					      	</div>					      
					    </div>
					</div>
					<!-- end of the edition of the row -->
					
					<!-- start for the profile -->
					<div id="myModal1" class="modal fade" role="dialog">
					<div class="modal-dialog" style="width:400px;">
					<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
							<div class="control-label col-sm-5"></div>
							<div class="control-label col-sm-2">
								<h4 class="modal-title">Profile</h4>
							</div>
							<div class="control-label col-sm-4"></div>
							<div class="control-label col-sm-1">
									<button type="button" class="close" data-dismiss="modal"><font color="red">&times;</font></button>
							</div>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" method="get" role="form" action="/Customer/UserController">
									<div class="form-group">
										<div class="control-label col-sm-3"></div>
										<div class="control-label col-sm-6">
										<img class="imgprofile" alt="Profile" src="<%=request.getContextPath()%>/images/profile.jpg">
										</div>
										<div class="control-label col-sm-3"></div>
									</div>
									<div class="form-group">
										<div class="control-label col-sm-3"></div>
										<label class="control-label col-sm-3" for="email">Username:</label>
											<div class="col-sm-3">
												<label class="control-label"><%out.print(uname);%></label>
											</div>
										<div class="control-label col-sm-3"></div>
									</div>
									<%
									IUser_LevelService userlevelservicej = (IUser_LevelService) SpringBeanFactory
									.getBean("User_LevelService");
									IUserService userservicej = (IUserService) SpringBeanFactory
									.getBean("UserService");
										User uj=userservicej.selectUser(uid);	
										int lvid=uj.getUser_level_id();
										User_Level userj=userlevelservicej.selectUser_Level(lvid);
										String levelname=userj.getName();
									%>
									<div class="form-group">
										<div class="control-label col-sm-3"></div>
										<label class="control-label col-sm-3" for="pwd">Level:</label>
										<div class="col-sm-3">
											<label class="control-label"><%out.print(levelname); %></label>
										</div>
										<div class="control-label col-sm-3"></div>
									</div>
									<div class="form-group">
									<div class="control-label col-sm-5"></div>
									<div class="col-sm-2">
											
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
					<!-- end for the profile -->

					<!-- end of the all modal for column Editioin -->
					<%@ include file="right.jsp" %>
				
</body>
</html>
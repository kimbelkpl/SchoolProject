<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*"%>
<%@page import="com.java.plyd.service.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Base Type Page</title>
<%@ include file="link.jsp" %>

<script>
	function existOrNot(){ 
		if(arguments[0]=="1")
			{alert (arguments[1]+" is already exists!");
			$('#idAdd').click();
			}
		else if(arguments[0]=="0"){
			
			alert("Successful!");
			$('#idAdd').click();
		}
		else if(arguments[0]=="3")
			{
			alert("Can't change this!\n"+arguments[1]+"is using in sub unit.");
			}
		else if(arguments[0]=="4"){
			alert("Can't delete this unit!\n"+arguments[1]+"is still use in Sub Unit.");
		}
		
	}
</script>

</head>
<body class="w3-container w3-light-gray" onload="existOrNot(
	'<%out.print(request.getAttribute("exist")); %>','<%out.print(request.getAttribute("name")); %>')">
	<div class="container-fluid">
		<%@ include file="header.jsp"%>
		<!-- for body part of the body column -->
				<div class="row panel-body p10">
					<!-- inserting the code for each operation -->
					<div class="col-sm-9">
						<div class="row p10">
							<div class="panel panel-default">
						  		<div class="panel-heading w3-container w3-light-blue p10">
						  			<button type="button" id="idAdd" class="btn w3-container w3-light-blue p-header-btn" data-toggle="modal" data-target="#addNew"><span class="glyphicon glyphicon-plus"></span> Add New</button> 
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
						  			<div>
						  			<!-- start of search result table -->
						  			<table class="table table-condensed table-bordered p10" id="example">
						  				<caption class="w3-container w3-text-black w3-myfont">Base Type Information Lists</caption>
									    <thead class="w3-container w3-light-blue p10">
									      <tr>
									        <th>Name</th>
							        		<th>Remark</th>
							        	<!-- 	<th>Created user name</th>
											<th>Modified user name</th>	 -->
											<th>Flag</th>
									        <th>Options</th>
									      </tr>
									    </thead>
									    <tbody>
									      <%IBasicunitService basicunitservice = (IBasicunitService) SpringBeanFactory
						.getBean("BasicunitService");
						IUserService userservice=(IUserService)SpringBeanFactory.getBean("UserService");
		    			List<Basicunit> bc1=null;
		    			User u=userservice.selectUser(uid);
		    			if(u.getUser_level_id()==1){
		    				bc1=basicunitservice.selectAllforadmin();
		    			}
		    			else{
		    				bc1=basicunitservice.selectAll();
		    			}
		      	
		      	for(Basicunit bc:bc1 ){
				%>
							<tr>
								<td><%out.print( bc.getName()); %></td>
								<%System.out.print(bc.getName());%>
								<td><%out.print(bc.getRemark()); %></td>
								<%System.out.print(bc.getRemark());%>
								<%
									
										User u2 = userservice.selectUser(bc.getCreated_user_id());
										User u1 = userservice.selectUser(bc.getModified_user_id());
								%>
								
								<% if(bc.getFlag()==1){ %>
							<td><font color="green">ON</font></td>
						<% }else{ %>
							<td><font color="red">OFF</font></td>
						<%}%>	
								
								<%System.out.print(bc.getFlag());%>
									        <td class="dropdown">
									        	<button class="btn w3-container w3-white w3-text-blue w3-hover-blue w3-hover-text-white ptb dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span>
									      		</button> 
									      		<ul class="dropdown-menu">
												    <li class="w3-container w3-hover-blue p10" data-toggle="modal" data-target="#rowView" 
												    onclick="viewbasic('<%out.print(bc.getBasic_unit_id()); %>','<%out.print(bc.getName()); %>','<%out.print(bc.getRemark()); %>','<%out.print(u2.getName()); %>',
												    					'<%out.print(u1.getName()); %>','<%out.print(bc.getCreated_date()); %>','<%out.print(bc.getModified_date()); %>',
												    					'<%out.print(bc.getFlag()); %>')"; 
												    ><span class="glyphicon glyphicon-eye-open"></span> View</li>
												    <li class="w3-container w3-hover-blue p10" data-toggle="modal" data-target="#rowEd" onclick="submit('<%out.print(bc.getBasic_unit_id());%>','<%out.print(bc.getName());%>','<%out.print(bc.getRemark());%>','<%out.print(bc.getFlag());%>')"><span class="glyphicon glyphicon-edit"></span> Edit</li>
												    <% if(bc.getFlag()==1){ %>
									<li class="w3-container w3-hover-blue p10 "
									onclick="confirmDelete('<%out.print(bc.getBasic_unit_id());%>')"><span
									class="glyphicon glyphicon-remove-circle"></span> Delete</li>
									<%}else { %>
									
								<li class="w3-container w3-hover-blue p10 disabled"><font color="gray"></font><span
									class="glyphicon glyphicon-remove-circle"></span> Delete</li>
									<%} %>
												</ul>
												<script>
													function submit(){
														document.getElementById("idtxtbId").value=arguments[0];
														document.getElementById("idtxtbName").value=arguments[1];
														document.getElementById("idtxtbRemark").value=arguments[2];
														//document.getElementById("idtxtbFlag").value=arguments[3];
														
														if(arguments[3]==1){
															document.getElementById("idtxtbFlag1").checked=true;
															document.getElementById("idtxtbFlag2").checked=false;
														}else{
															document.getElementById("idtxtbFlag2").checked=true;
															document.getElementById("idtxtbFlag1").checked=false;
														}
													}
													function confirmDelete() {
						
														var r=confirm("Are you sure to delete this row");
												  		if(r){
												  			location.href="/warehouse/BasicUnitController?page=remove&buid="+arguments[0];
												  		}
													}
													
													function viewbasic() {
														
														document
																.getElementById("txtName").innerHTML = arguments[1];
														document
																.getElementById("txtRemark").innerHTML = arguments[2];
														
														document
																.getElementById("txtCuId").innerHTML = arguments[3];
														document
																.getElementById("txtMuId").innerHTML = arguments[4];
														document
																.getElementById("txtCd").innerHTML = arguments[5];
														document
																.getElementById("txtMd").innerHTML = arguments[6];
														if(arguments[7]==1){
															document.getElementById("txtFlag").innerHTML="ON";
														}else document.getElementById("txtFlag").innerHTML="OFF";
														
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
					          		<h4 class="modal-title">Adding New Base Type</h4>
					       		</div>
					       		<form onsubmit="return validate()" name="sample" action="/warehouse/BasicUnitController">
						        <div class="modal-body p10">
						          	<center>
						          		<table>
										        <tr>
										        <td><label for="lblName">Name</label></td><td><input
										              class="u-full-width form-control" type="text" name="txtabName" id="txtabName" required/></td>
										        </tr>
										        <tr>
										        <td>&nbsp;</td><td>&nbsp;</td>
										        </tr>
										        <tr>
										        <td><label for="lblRemark">Remark</label></td><td><input
										              class="u-full-width form-control" type="text" name="txtabRemark" id="txtabRemark" required/></td>
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
					          		<h4 class="modal-title">Searching Basic Type By Options</h4>
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

					<!-- start of Modal for view the row -->
					<div class="modal fade" id="rowView" role="dialog">
					    <div class="modal-dialog" >
					    
					      <!-- Modal content-->
					      	<div class="modal-content">
					        	<div class="modal-header w3-container w3-light-blue p10">
					         		<button type="button" class="close" data-dismiss="modal">&times;</button>
					          		<h4 class="modal-title">Showing Each Basic Information</h4>
					       		</div>
					       		<form>
						        <div class="modal-body p10" style="height:350px;">
						          	
						          		<div class="form-group">
											<label class="control-label col-sm-6 right" for="txtName">Base Type name:</label>
												<div class="col-sm-3">
													<label class="control-label" id="txtName"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="txtRemark">Remark:</label>
												<div class="col-sm-3">
													<label class="control-label" id="txtRemark"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="createdUser">Created User Name:</label>
												<div class="col-sm-3">
													<label class="control-label" id="txtCuId"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="modifiedUser">Modified User Name</label>
												<div class="col-sm-3">
													<label class="control-label" id="txtMuId"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="createdDate">Created Date:</label>
												<div class="col-sm-3">
													<label class="control-label" id="txtCd"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="modifiedDate">Modified Date:</label>
												<div class="col-sm-3">
													<label class="control-label" id="txtMd"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="flag">Flag:</label>
												<div class="col-sm-3">
													<label class="control-label" id="txtFlag"></label>
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
					          		<h4 class="modal-title">Editing Base Type Information</h4>
					       		</div>
					       		<form onsubmit="return validate()" name="sample" action="/warehouse/BasicUnitController" method="post">
						        <div class="modal-body p10">
						          	   	<center>
									        <table>
									        <tr>
										        <td></td>
										        <td><input
										              class="u-full-width form-control" type="hidden" name="txtbId" value="" id="idtxtbId"/>
										         </td></tr>
									       <tr> 
									       		<td><label for="lblName">Enter New Base Type Name</label></td><td><input
									              class="u-full-width form-control" type="text" name="txtbName" value="aaa" id="idtxtbName" required/></td>
									        </tr>
									        <tr>
									        <td>&nbsp;</td><td>&nbsp;</td>
									        </tr>
									        <tr>
									        <td><label for="lblRemark">Enter New Remark</label></td><td><input
									              class="u-full-width form-control" type="text" name="txtbRemark" value="" id="idtxtbRemark" required/></td>
									        </tr>
									        <tr>
									        <td>&nbsp;</td><td>&nbsp;</td>
									        </tr>
									        <tr>
									        <td><label for="lblflag">Flag</label></td>
									        <td><input type="radio" name="txtbFlag" id="idtxtbFlag1"
									              value="1" required/><font color="green">ON</font>&nbsp;&nbsp;&nbsp;&nbsp; 
									              <input type="radio" name="txtbFlag" id="idtxtbFlag2"
									              value="0" required/><font color="red">OFF</font></td>

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
					
					<!-- end of the all modal for column Editioin -->
					<%@ include file="right.jsp" %>
				
</body>
</html>
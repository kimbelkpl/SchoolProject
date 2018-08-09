<%@page import="com.java.plyd.service.SpringBeanFactory"%>
<%@page import="com.java.plyd.service.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>

<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Warehouse System</title>
<%@ include file="link.jsp" %>

</head>

<body class="w3-container w3-light-gray" onload="checkname()">
	
	<%@ include file="header.jsp" %>
			<!-- for body part of the body column -->
			<div class="row panel-body p10">
			
				<!-- inserting the code for each operation -->
				
				
				
				<div class="col-sm-9">
					<div class="row p10">
						<div class="panel panel-default">
							<div class="panel-heading w3-container w3-light-blue p10">
								<button type="button" id="newForm""
									class="btn w3-container w3-light-blue p-header-btn"
									data-toggle="modal" data-target="#addNew">
									<span class="glyphicon glyphicon-plus"></span> Add New
								</button>
								<!-- <button type="button"
										class="btn w3-container w3-light-blue p-header-btn"
										data-toggle="modal" data-target="#search">
										<span class="glyphicon glyphicon-search"></span> Search
									</button> -->
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
							
							<div class="panel-body p10">
								<!-- start of search result table -->
								<table class="table table-condensed table-bordered p10"
									id="example">
									<caption class="w3-container w3-text-black w3-myfont">Warehouse
										Information Lists</caption>
									<thead class="w3-container w3-light-blue p10">
										<tr>
											<th>Name</th>
											<th>Address</th>
											<th>PhoneNo</th>
											<th>Remark</th>
											<!-- <th>Create User ID</th>
												<th>Modify User ID</th> -->
											<th>Flag</th>
											<th>Options</th>
										</tr>
									</thead>
									<tbody>

										<%
										IUserService user_service = (IUserService) SpringBeanFactory
										.getBean("UserService");
												IWarehouseService wareService=(IWarehouseService)SpringBeanFactory.getBean("WarehouseService");
																List<Warehouse> ware=(List<Warehouse>)wareService.selectAll();

																						for (Warehouse wh : ware) {
											%>

										<tr>

											<td>
												<%
														out.println(wh.getWareName());
													%>
											</td>
											<td>
												<%
														out.println(wh.getWareAddress());
													%>
											</td>
											<td>
												<%
														out.println(wh.getWarePhone());
													%>
											</td>
											<td>
												<%
														out.println(wh.getWareRemark());
													%>
											</td>
											
											<%
												User userCreateName=user_service.selectUser(wh.getWareCreatedID());
												
												User userModifyName=user_service.selectUser(wh.getWareModifiedID()); 
																	         
												%>

											

											<%
													if(wh.getWareflag()==1)
													{
														%>
											<td><font color="green"> <% out.println("ON"); %>
											</font></td>
											<%
													}
													else
													{
														%>
											<td><font color="red"> <% out.println("OFF"); %>
											</font></td>
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
														data-toggle="modal" data-target="#rowView"
														onclick="viewsubmit('<%out.print(wh.getWareName());%>','<%out.print(wh.getWareAddress());%>','<%out.print(wh.getWarePhone());%>','<%out.print(wh.getWareRemark());%>','<%out.print(userCreateName.getName());%>','<%out.print(userModifyName.getName());%>','<%out.print(wh.getWareCreatedDate());%>','<%out.print(wh.getWareModifiedDate());%>','<%out.print(wh.getWareflag());%>')"><span
														class="glyphicon glyphicon-eye-open"></span> View</li>
													<li class="w3-container w3-hover-blue p10" id='editM'
														data-toggle="modal" data-target="#rowEd"
														onclick="submit('<%out.print(wh.getId());%>','<%out.print(wh.getWareName());%>','<%out.print(wh.getWareAddress());%>','<%out.print(wh.getWarePhone());%>','<%out.print(wh.getWareRemark());%>','<%out.print(wh.getWareflag());%>')"><span
														class="glyphicon glyphicon-edit"></span> Edit</a></li>

													<%if(wh.getWareflag()==1){ %>
													<li class="w3-container w3-hover-blue p10"
														onclick="confirmDelete('<%out.print(wh.getId());%>','<%out.print(wh.getId());%>')">
														<span class="glyphicon glyphicon-remove-circle"></span>
														Delete
													</li>
													<%}else{ %>
													<li class="w3-container w3-hover-red p10 disabled"><font
														color="gray"> <span
															class="glyphicon glyphicon-remove-circle"></span> Delete
													</font></li>
													<%} %>


												</ul>
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

				<!-- start of all modal for column Edition -->

				<!-- start of Modal for add new the row -->


				<div class="modal fade" id="addNew"  data-keyboard="false" data-backdrop="static" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header w3-container w3-light-blue p10">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Adding New Warehouse</h4>
							</div>
							<form name="addform" action="/warehouse/WarehouseController" 
								>
								<div class="modal-body p10">

									<center><table>
										<input type="hidden" name="warehousecmid"
											value="<%out.print(session.getAttribute("uid"));%>" />

										


										<tr>
											<td>Enter Name :</td>
											<td><input type="text" name="txtName" id="nid"
												class="u-full-width form-control" placeholder="Name" required
												 /></td>
										</tr>
										<tr>
													<!-- <td>&nbsp;&nbsp;</td> -->
													<td>&nbsp;&nbsp;</td>
												</tr>
										<tr>
											<td>Enter Address :</td>
											<td><input type="text" name="txtAddr" id="aid"
												class="u-full-width form-control" placeholder="Address" required
												 /></td>
										</tr>
										<tr>
													<!-- <td>&nbsp;&nbsp;</td> -->
													<td>&nbsp;&nbsp;</td>
												</tr>
										<tr>
											<td>Enter Phone :</td>
											<td><input type="text" name="txtPhone" id="pid"
												class="u-full-width form-control" title="Enter Only Digit" pattern="\++[0-9\s]+|[0-9\s]+" placeholder="Phone" required
												 /></td>
										</tr>
											<tr>
													<!-- <td>&nbsp;&nbsp;</td> -->
													<td>&nbsp;&nbsp;</td>
												</tr>
										<tr>
											<td>Remark :</td>
											<td><input type="text" name="txtRemark" id="rid"
												class="u-full-width form-control"  placeholder="Remark" required
												 /></td>
										</tr>
									</table>
									</center>

												<tr>
													
													<td>&nbsp;&nbsp;</td>
												</tr>
								</div>
								<div class="modal-footer p10">
									
											<button type="submit" class="btn btn-default w3-container w3-light-blue p10" name="page" value="Add">Add</button>
						        	<button type="reset" onclick="resetButtonValidate('addform')" class="btn btn-default w3-container w3-light-blue p10">Cancel</button>
						          	<button type="button" class="btn btn-default w3-container w3-light-blue p10" data-dismiss="modal">Close</button>
								</div>
							</form>
							
						</div>
					</div>
				</div>
				<!-- end of the add new of the row -->
				<!-- start of Modal for edition the row -->
				
				<!-- end of the edition of the row -->

				
				<!-- start of Modal for view the row -->
					<div class="modal fade" id="rowView"  data-keyboard="false" data-backdrop="static" role="dialog">
					    <div class="modal-dialog" >
					    
					      <!-- Modal content-->
					      	<div class="modal-content">
					        	<div class="modal-header w3-container w3-light-blue p10">
					         		<button type="button" class="close" data-dismiss="modal">&times;</button>
					          		<h4 class="modal-title">Showing Each Warehouse Information</h4>
					       		</div>
					       		<form>
						        <div class="modal-body p10" style="height:430px;">
						          	
						          		
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="txtName"> Name:</label>
												<div class="col-sm-3">
													<label class="control-label" id="txtName"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="txtAddr"> Address:</label>
												<div class="col-sm-3">
													<label class="control-label" id="txtAddr"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="txtPhone"> Phone No</label>
												<div class="col-sm-3">
													<label class="control-label" id="txtPhone"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="txtRemark"> Remark:</label>
												<div class="col-sm-3">
													<label class="control-label" id="txtRemark"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="txtcid"> Created User Name:</label>
												<div class="col-sm-3">
													<label class="control-label" id="txtcid"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="txtmid">Modified User Name:</label>
												<div class="col-sm-3">
													<label class="control-label" id="txtmid"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div>
										<br>
										
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="flag">Created Date:</label>
												<div class="col-sm-3">
													<label class="control-label" id="txtcdate"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="flag">Modified Date:</label>
												<div class="col-sm-3">
													<label class="control-label" id="txtmdate"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="flag">Flag:</label>
												<div class="col-sm-3">
													<label class="control-label" id="txtflag"></label>
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
				<div class="modal fade" id="rowEd" data-keyboard="false" data-backdrop="static" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header w3-container w3-light-blue p10">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Editing Warehouse Information</h4>
							</div>
							<form name="edit" action="/warehouse/WarehouseController"
								onsubmit="return validate()">

								<div class="modal-body p10">
									<center><table>
										<input type="hidden" name="warehousecmid"
											value="<%out.print(session.getAttribute("uid"));%>" />
										<input type="hidden" name="radioflag" value="1" />
										<input type="hidden" name="eid"/>
										<tr>
													<!-- <td>&nbsp;&nbsp;</td> -->
													<td>&nbsp;&nbsp;</td>
												</tr>
										<tr>
											<td>Enter Name :</td>
											<td><input type="text" name="txtName"
												class="u-full-width form-control" required></td>
										</tr>
										<tr>
													<!-- <td>&nbsp;&nbsp;</td> -->
													<td>&nbsp;&nbsp;</td>
												</tr>

										<tr>
											<td>Enter Address :</td>
											<td><input type="text" name="txtAddress"
												class="u-full-width form-control" required></td>
										</tr>
										<tr>
													<!-- <td>&nbsp;&nbsp;</td> -->
													<td>&nbsp;&nbsp;</td>
												</tr>

										<tr>
											<td>Enter Phone No :</td>
											<td><input type="text" name="txtPhone"
												class="u-full-width form-control" pattern="\++[0-9\s]+|[0-9\s]+" title="Enter Only Digit" required></td>
										</tr>
										<tr>
													<!-- <td>&nbsp;&nbsp;</td> -->
													<td>&nbsp;&nbsp;</td>
												</tr>

										<tr>
											<td>Remark:</td>
											<td><input type="text" name="txtRemark"
												class="u-full-width form-control" required></td>
										</tr>
										<tr>
													<!-- <td>&nbsp;&nbsp;</td> -->
													<td>&nbsp;&nbsp;</td>
												</tr>

										<tr>
											<td>Flag:</td>
											<td><input type="radio" id="radioen" name="disradio"
												value="1" checked="checked" /><font color="green">&nbsp;ON</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
												id="radiodis" name="disradio" value="0"> <font color="red">&nbsp;OFF</font></td>
										</tr>

									</table>
									</center>
								</div>
								<div class="modal-footer p10">
									<button type="submit"
										class="btn btn-default w3-container w3-light-blue p10"
										name="page" value="Edit">Edit</button>&nbsp;&nbsp;
									<button type="reset" onclick="resetButtonValidate('edit')"
										class="btn btn-default w3-container w3-light-blue p10">Cancel</button>&nbsp;&nbsp;
									<button type="button"
										class="btn btn-default w3-container w3-light-blue p10"
										data-dismiss="modal">Close</button>
								</div>
							</form>
							
						</div>
					</div>
				</div>
				<!-- end of the edition of the row -->

				<!-- end of the all modal for column Editioin -->
		<%@ include file="right.jsp" %>
		
		<!-- for all warehouse functions -->
		<%@ include file="warehousefunction.jsp" %>
</body>
</html>
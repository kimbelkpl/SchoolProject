<!DOCTYPE html>
<%@page import="java.util.*" %>
<%@page import="com.java.plyd.service.*"%>

<html>
<head>
<title>Sub Unit Page</title>
<%@ include file="link.jsp"%>
<script>
	 function existOrNot(){
		 
		 
		 if(arguments[0]=="1"){
			 alert(" already exist!");
			 $('#idAdd').click();
		 
		 }
		 else if(arguments[0]=="0"){
			 alert("Successful!");
			 $('#idAdd').click();
		 }
		 else if(arguments[0]=="3"){
			 //alert("Delete Successful");
		 }else if(arguments[0]=="4"){
			 document.getElementById("txtasName").value=arguments[2];
			 document.getElementById("txtasRemark").value=arguments[3];
			 document.getElementById("cboBasicUnit").value=arguments[4];
			 $('#idAdd').click();
			 alert("Basic Unit is add successful!!");
		 }else if(arguments[0]=="5"){
			
			 document.getElementById("idtxtsName").value=arguments[2];
			 document.getElementById("idtxtsRemark").value=arguments[3];
			 document.getElementById("idcbosBasicunit").value=arguments[4];
			 document.getElementById("idtxtName2").value=arguments[5];
			 document.getElementById("idtxtRemark2").value=arguments[6];
			 document.getElementById("idtxtsId").value=arguments[7];
			 var aaaa=arguments[7];
			 if(arguments[8]=="1"){
				 document.getElementById("idtxtsFlag1").checked="true";
			 }else{
				 document.getElementById("idtxtsFlag2").checked="true";
			 }
			 $('#btnSubmit'+aaaa).click();
			 document.getElementById("newBasicUnitDiv1").style.display="block";
			 alert(arguments[1]+" is already exist!");
		 }else if(arguments[0]=="6"){
			 var aaaa=arguments[7];
			 $('#btnSubmit'+aaaa).click();
			 alert("Basic Unit is add successful!")
		 }
		 
		
	 }
	</script>

</head>
<body class="w3-container w3-light-gray" onload="existOrNot('<%out.print(request.getAttribute("exist")); %>','<%out.print(request.getAttribute("name")); %>',
'<%out.print(request.getAttribute("txtName")); %>','<%out.print(request.getAttribute("txtRemark")); %>',
'<%out.print(request.getAttribute("cboBasicUnit")); %>','<%out.print(request.getAttribute("txtName1")); %>',
'<%out.print(request.getAttribute("txtRemark1")); %>',
'<%out.print(request.getAttribute("txtId")); %>','<%out.print(request.getAttribute("txtFlag")); %>')">
	<div class="container-fluid">
		<%@ include file="header.jsp"%>
		<!-- for body part of the body column -->
				<div class="row panel-body p10">
					<!-- inserting the code for each operation -->
		<div class="col-sm-9">
						<div class="row p10">
							<div class="panel panel-default">
						  		<div class="panel-heading w3-container w3-light-blue p10">
						  			<button type="button" id="idAdd" class="btn w3-container w3-light-blue p-header-btn" data-toggle="modal" data-target="#addNew" ><span class="glyphicon glyphicon-plus"></span> Add New</button> 
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
				<caption class="w3-container w3-text-black w3-myfont">Sub Unit
					Information Lists</caption>
				<thead class="w3-container w3-light-blue p10">
					<tr>
						<th>Sub Unit Name</th>
						<th>Basic Unit Name</th>
						<th>Remark</th>
					<!--  	<th>Created User</th>
						<th>Modified User</th>	-->
						<th>Flag</th>
						<th>Option</th>
					</tr>
				</thead>
				<tbody>
					<%
				List<SubUnit> su1;
				IUserService userservice = (IUserService) SpringBeanFactory
						.getBean("UserService");
				ISubUnitService subunitservice = (ISubUnitService) SpringBeanFactory
						.getBean("SubUnitService");
				IBasicunitService basicunitservice = (IBasicunitService) SpringBeanFactory
						.getBean("BasicunitService");
				User user1 = userservice.selectUser(uid);
				System.out.println(user1.getUser_level_id()+"error");
				if (user1.getUser_level_id() == 1) {
					su1 = subunitservice.selectAllforadmin();
				} else {
					su1 = subunitservice.selectAll();
				}

				for (SubUnit su : su1) {
			%>
					<tr>
						<td>
							<%
						out.print(su.getName());
					%>
						</td>
						<%
					System.out.print(su.getName());
				%>
						<%
					Basicunit b =basicunitservice.selectBasicunit(su.getBasic_unit_id());
				%>
						<td>
							<%
						out.print(b.getName());
					%>
						</td>
						<%
					System.out.print(b.getName());
				%>
						<td>
							<%
						out.print(su.getRemark());
					%>
						</td>
						<%
						
						User u = userservice.selectUser(su.getCreated_user_id());
						User u1 = userservice.selectUser(su.getModified_user_id());
				%>
						
						<% if(su.getFlag()==1){ %>
							<td><font color="green">ON</font></td>
						<% }else{ %>
							<td><font color="red">OFF</font></td>
						<%}%>							
						
						<td class="dropdown">
							<button
								class="btn w3-container w3-white w3-text-blue w3-hover-blue w3-hover-text-white ptb dropdown-toggle"
								data-toggle="dropdown">
								<span class="glyphicon glyphicon-cog"></span>
							</button>
							<ul class="dropdown-menu">
								<li class="w3-container w3-hover-blue p10" data-toggle="modal"
									data-target="#rowView" onclick="viewsubmit('<%out.print(su.getSub_unit_id()); %>','<%out.print(b.getName()); %>','<%out.print(su.getName()); %>',
									'<%out.print(su.getRemark()); %>','<%out.print(u.getName()); %>','<%out.print(u1.getName()); %>','<%out.print(su.getCreated_date()); %>',
									'<%out.print(su.getModified_date()); %>','<%out.print(su.getFlag()); %>')"><span class="glyphicon glyphicon-eye-open"></span> View</li>
								<li class="w3-container w3-hover-blue p10" data-toggle="modal"
									data-target="#rowEd" id="btnSubmit<%out.print(su.getSub_unit_id()); %>" onclick="submit('<%out.print(su.getSub_unit_id());%>','<%out.print(su.getName());%>',
												     				'<%out.print(b.getBasic_unit_id());%>','<%out.print(su.getRemark());%>','<%out.print(su.getFlag());%>')"><span class="glyphicon glyphicon-edit"></span>Edit</li>
			 						<% if(su.getFlag()==1){ %>
									<li class="w3-container w3-hover-blue p10 "
									onclick="confirmDelete('<%out.print(su.getSub_unit_id());%>')"><span
									class="glyphicon glyphicon-remove-circle"></span> Delete</li>
									<%}else { %>
									
								<li class="w3-container w3-hover-blue p10 disabled"><font color="gray"></font><span
									class="glyphicon glyphicon-remove-circle"></span> Delete</li>
									<%} %>
							</ul> <script>
							function submit(){
								document.getElementById("idtxtsId").value=arguments[0];
								document.getElementById("idtxtsName").value=arguments[1];
								document.getElementById("idcbosBasicunit").value=arguments[2];
								document.getElementById("idtxtsRemark").value=arguments[3];
								//document.getElementById("idtxtsFlag").value=arguments[4];
							if(arguments[4]==1){
								document.getElementById("idtxtsFlag1").checked=true;
								document.getElementById("idtxtsFlag2").checked=false;
							}else{
								document.getElementById("idtxtsFlag2").checked=true;
								document.getElementById("idtxtsFlag1").checked=false;
							}
					}
							function confirmDelete() {
								   // var r=confirm("Are you sure to delete this row");
								    if (confirm("Do you want to delete really!")) {
								       location.href="/warehouse/SubUnitController?page=remove&scid="+arguments[0];
								    } else {
								        alert("Cann't delete it...")
								    }
								}
							function viewsubmit() {
								document
										.getElementById("txtBuId").innerHTML = arguments[1];
								document
										.getElementById("txtName").innerHTML = arguments[2];
								document
										.getElementById("txtRemark").innerHTML = arguments[3];
								
								document
										.getElementById("txtCuId").innerHTML = arguments[4];
								document
										.getElementById("txtMuId").innerHTML = arguments[5];
								document
										.getElementById("txtCd").innerHTML = arguments[6];
								document
										.getElementById("txtMd").innerHTML = arguments[7];
								if(arguments[8]==1){
									document.getElementById("txtFlag").innerHTML="ON";
								}else document.getElementById("txtFlag").innerHTML="OFF";
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

	<!-- start of all modal for column Edition -->

	<!-- start of Modal for add new the row -->
	<div class="modal fade" id="addNew" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header w3-container w3-light-blue p10">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Adding New Subunit</h4>
				</div>
				<form onsubmit="return validate()" name="sample"
					action="/warehouse/SubUnitController" method="post">
					<div class="modal-body p10">

	<!-- start subunit insert form -->
				<% 
				List<Basicunit> bl;
				bl=basicunitservice.selectAll();
				%><div class="row">
				    <div class="col-sm-3"></div>
				    <div class="col-sm-6">
						<table>
							<tr>
								<td><label for="lblName">Sub unit Name</label></td>
								<td><input class="u-full-width form-control" type="text"
										name="txtasName" id="txtasName" required /></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td><label for="lblCategory">Basic unit</label></td>
									<td><select id="cboBasicUnit" name="cboBasicunit" style="width: 100%;" class="u-full-width form-control">
											<% for(Basicunit ba:bl){ %>
											<option value="<% out.print(ba.getBasic_unit_id()); %>">
												<% out.print(ba.getName()); %>
											</option>
											<% } %>
											<option style="background-color: blue;color:white;" onclick="showNewBasicUnitDiv()">Add new Basic Unit</option>
									</select></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
								<tr>
									<td><label for="lblRemark">Remark</label></td>
									<td><input class="u-full-width form-control" type="text"
										name="txtasRemark" id="txtasRemark" required /></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
							</table>
						  </div>
						  <div class="col-sm-3"></div>
						</div>
						<script type="text/javascript">
							function showNewBasicUnitDiv(){
			          			document.getElementById("newBasicUnitDiv").style.display="block";
			          		}
			          		function hideNewBasicUnitDiv(){
			          			document.getElementById("newBasicUnitDiv").style.display="none";
			          		}
						</script>
						<div class="row displayNone" id="newBasicUnitDiv">
										<div class="col-sm-1"></div>
										<div class="col-sm-10" style="border-style: solid;border-radius:15px;border-color: skyblue;">
										<center><h4>Add Basic Unit</h4></center>
											<div class="row">
												<div class="col-sm-2"></div>
												<div class="col-sm-4">
													<label for="lblName">Basic Unit Name</label>
												</div>
												<div class="col-sm-4">
													<input class="u-full-width form-control" type="text" name="txtName1" id="idtxtName1" />
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
													<button type="button" class="btn btn-primary" onclick="AddNewBasicUnit()">Add Basic Unit</button>
												</div>
												<script type="text/javascript">
													function AddNewBasicUnit(){
														var subname=document.getElementById("txtasName").value;
														var remark=document.getElementById("txtasRemark").value;
														var cbo=document.getElementById("cboBasicUnit").value;
														var bname=document.getElementById("idtxtName1").value;
														var remark1=document.getElementById("idtxtRemark1").value;
														
														if(bname.length>0&&remark1.length>0){
															location.href="/warehouse/BasicUnitController?page=AddFromSubUnitAdd&txtName1="+bname+"&txtRemark1="+remark1
															+"&txtName="+subname+"&txtRemark="+remark+"&cboBasicUnit="+cbo;
														}else{
															if(bname.length==0){
																alert("Please fill in Basic Unit Name!");
															}else{
																alert("Please fill in Basic Unit Remark!");
															}
														}
													}
												</script>
												
												<div class="col-sm-4">
													<button class="btn btn-primary" type="button" onclick="hideNewBasicUnitDiv()" id="hideBasicUnitDiv">Cancel</button>
												</div>
												<div class="col-sm-2"></div>
											</div><br>
										</div>
										<div class="col-sm-1"></div>
									</div>
			<!-- End subunit insert form -->
			</div>
					<div class="modal-footer p10">
						<input type="submit" name="page"
							class="btn btn-default w3-container w3-light-blue p10"
							value="Add"> <input type="reset"
							class="btn btn-default w3-container w3-light-blue p10"
							value="Cancel"> <input type="button"
							class="btn btn-default w3-container w3-light-blue p10"
							data-dismiss="modal" value="Close">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- end of the add new of the row -->

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
						        <div class="modal-body p10" style="height:400px;">
						          	
						          		<div class="form-group">
											<label class="control-label col-sm-6 right" for="txtName">Subunit name:</label>
												<div class="col-sm-3">
													<label class="control-label" id="txtName"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											<label class="control-label col-sm-6 right" for="txtName">Basic unit name:</label>
												<div class="col-sm-3">
													<label class="control-label" id="txtBuId"></label>
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
					    <%
					    	List<Basicunit> blist=basicunitservice.selectAll();
					    %>
					      <!-- Modal content-->
					      	<div class="modal-content">
					        	<div class="modal-header w3-container w3-light-blue p10">
					         		<button type="button" class="close" data-dismiss="modal">&times;</button>
					          		<h4 class="modal-title">Editing Sub unit Information</h4>
					       		</div>
					       		<script type="text/javascript">
					       			function comfirmEdit(){
					       				if(comfirm("Do you want to edit")){
					       					return true;
					       				}
					       				else{
					       					return false;
					       				}
					       			}
					       		
					       		</script>
					       		<form onsubmit="return comfirmEdit()" name="sample" action="/warehouse/SubUnitController" method="post">
						        <div class="modal-body p10">
						          	 <div class="row">
						          	    <div class="col-sm-2"></div>
						          	     <div class="col-sm-8">
						          		<table style="width:100%;">
									     	<tr>
									        <td><input
									              class="u-full-width form-control" type="hidden" name="txtsId" id="idtxtsId"
									              value=""/></td>
									        </tr>
									        <tr>
									        	<td><label>Enter new name</label></td>
									        	<td><input class="u-full-width form-control" type="text" name="txtsName" id="idtxtsName"
									        		value="" required/>
									            </td>
									        </tr>
									        <tr>
									        <td>&nbsp;</td>
									        <td>&nbsp;</td>
									        </tr><tr>
									        	<td><label>Basic unit</label></td>
									        	<td><select name="cbosBasicunit" id="idcbosBasicunit" style="width:100%;" class="u-full-width form-control">
									        			<%
							        			
							        				for(Basicunit ba:blist){ %>
							        				<%System.out.println(ba.getBasic_unit_id()+"ID"); %>
														<option value="<% out.print(ba.getBasic_unit_id()); %>">
																		<% out.print(ba.getName()); %>
														</option>
														
												<% } %>
												<option style="background-color: blue;color:white;" onclick="showNewBasicUnitDiv1()">Add new Basic Unit</option>
									        		</select>
									            </td>
									        </tr>
									        <tr>
									        <td>&nbsp;</td><td>&nbsp;</td>
									        </tr>
									        <tr>
									        	<td><label>Enter new Remark</label></td>
									        	<td><input class="u-full-width form-control" type="text" name="txtsRemark" id="idtxtsRemark" 
									        		value="aa" required/>
									        	</td>
									        </tr>
									         <tr>
									        <td>&nbsp;</td><td>&nbsp;</td>
									        </tr>
									        <tr>
									        <td><label>Enter new flag</label></td>
									       <!--  <td><input class="u-full-width form-control" type="text" name="txtsFlag" id="idtxtsFlag"
									              value="aa" required/></td>-->
									             <td><input type="radio" name="txtsFlag" id="idtxtsFlag1"
									              value="1" required/><font color="green">ON</font>
									              &nbsp;&nbsp;&nbsp;&nbsp;
									              <input type="radio" name="txtsFlag" id="idtxtsFlag2"
									              value="0" required/><font color="red">OFF</font></td>
									        </tr>
									        <tr>
									        <td>&nbsp;</td>
									        <td>&nbsp;</td>
									        </tr>
									    
									        </table>
									      </div>
									      <div class="col-sm-2"></div>
									    </div>
									    <script type="text/javascript">
											function showNewBasicUnitDiv1(){
							          			document.getElementById("newBasicUnitDiv1").style.display="block";
							          		}
							          		function hideNewBasicUnitDiv1(){
							          			document.getElementById("newBasicUnitDiv1").style.display="none";
							          		}
										</script>
										<div class="row displayNone" id="newBasicUnitDiv1">
										<div class="col-sm-1"></div>
										<div class="col-sm-10" style="border-style: solid;border-radius:15px;border-color: skyblue;">
										<center><h4>Add Basic Unit</h4></center>
											<div class="row">
												<div class="col-sm-2"></div>
												<div class="col-sm-4">
													<label for="lblName">Basic Unit Name</label>
												</div>
												<div class="col-sm-4">
													<input class="u-full-width form-control" type="text" name="txtName2" id="idtxtName2" />
												</div>
												<div class="col-sm-2"></div>
											</div><br>
											<div class="row">
												<div class="col-sm-2"></div>
												<div class="col-sm-4">
													<label for="lblRemark">Remark</label>
												</div>
												<div class="col-sm-4">
													<input class="u-full-width form-control" type="text" name="txtRemark2" id="idtxtRemark2"/>
												</div>
												<div class="col-sm-2"></div>
											</div><br>
											<div class="row">
												<div class="col-sm-2"></div>
												<div class="col-sm-4">
													<button type="button" class="btn btn-primary" onclick="AddNewBasicUnit1()">Add Basic Unit</button>
												</div>
												<script type="text/javascript">
													function AddNewBasicUnit1(){
														var id=document.getElementById("idtxtsId").value;
														var subname=document.getElementById("idtxtsName").value;
														var remark=document.getElementById("idtxtsRemark").value;
														var cbo=document.getElementById("idcbosBasicunit").value;
														var flag;
														if(document.getElementById("idtxtsFlag1").checked){
															flag=1;
														}else{
															flag=0;
														}
														var bname=document.getElementById("idtxtName2").value;
														var remark1=document.getElementById("idtxtRemark2").value;
														if(bname.length>0&&remark1.length>0){
															location.href="/warehouse/BasicUnitController?page=AddFromSubUnitEdit&txtName1="+bname+"&txtRemark1="+remark1
																+"&txtName="+subname+"&txtRemark="+remark+"&cboBasicUnit="+cbo+"&txtId="+id+"&txtFlag="+flag;
														}else{
															if(bname.length==0){
																alert("Please fill in Basic Unit Name!");
															}else{
																alert("Please fill in Basic Unit Remark!");
															}
														}
													}
												</script>
												
												<div class="col-sm-4">
													<button class="btn btn-primary" type="button" onclick="hideNewBasicUnitDiv1()" id="hideBasicUnitDiv">Cancel</button>
												</div>
												<div class="col-sm-2"></div>
											</div><br>
										</div>
										<div class="col-sm-1"></div>
									</div>
						     
						        </div>
						        <div class="modal-footer p10">
						        	<input type="submit" class="btn btn-default w3-container w3-light-blue p10"  name="page" value="Edit">
						        	<button type="reset" class="btn btn-default w3-container w3-light-blue p10">Cancel</button>
						          	<button type="button" class="btn btn-default w3-container w3-light-blue p10" data-dismiss="modal">Close</button>
						        </div>
						        </form>
					      	</div>					      
					    </div>
					</div>
					<!-- end of the edition of the row -->	
	<!-- end of the all modal for column Editioin -->
	<%@ include file="right.jsp"%>

</body>
</html>
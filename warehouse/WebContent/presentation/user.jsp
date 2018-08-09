<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*"%>
<%@page import="com.java.plyd.service.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Page</title>
<%@include file="link.jsp" %>
	<script>
	 function existOrNot(){

		 var a = document.getElementsByName("combobox");
			document.getElementById("myInput").value=a[0].innerHTML;
			//alert(arguments[0]);
		 if(arguments[0]=="1"){
			 alert(arguments[1]+" is already exist!");
			 document.getElementById("txtName").value=arguments[2];
			 document.getElementById("myInput").value=arguments[3];
			 document.getElementById("txtPassword1").value=arguments[4];
			 document.getElementById("txtPassword2").value=arguments[4];
			 $(document).ready(function(){
					$('#btnAddNew').trigger('click');
				});
		 }else if(arguments[0]=="2"){
			 alert("Add Successful");
			 $(document).ready(function(){
					$('#btnAddNew').trigger('click');
				});
		 }else if(arguments[0]=="3"){
			 alert(arguments[1]+" is already exist!");
			 document.getElementById("txtName").value=arguments[2];
			 document.getElementById("myInput").value=arguments[3];
			 document.getElementById("txtPassword1").value=arguments[4];
			 document.getElementById("txtPassword2").value=arguments[5];
			 document.getElementById("idtxtName1").value=arguments[6];
			 document.getElementById("idtxtRemark1").value=arguments[7];
			 document.getElementById("newUserLevelDiv").style.display="block";
			 $(document).ready(function(){
					$('#btnAddNew').trigger('click');
				});
		 }else if(arguments[0]=="4"){
			 alert("User Level is added successful!");
			
			 $(document).ready(function(){
					$('#btnAddNew').trigger('click');
				});
			 document.getElementById("txtName").value=arguments[2];
			 document.getElementById("myInput").value=arguments[3];
			 document.getElementById("txtPassword1").value=arguments[4];
			 document.getElementById("txtPassword2").value=arguments[5];
			 $(document).ready(function(){
					$('#btn6').trigger('click');
				});
		 }else if(arguments[0]=="5"){
			 alert(arguments[1]+" is already exist!");
			 var aaaa=arguments[9]
			 	document.getElementById("idtxtId").value=arguments[9];
				document.getElementById("idtxtName").value=arguments[2];
				document.getElementById("idcbouserlevel").value=arguments[3];
				
				if(arguments[8]==1){
					document.getElementById("idtxtFlag1").checked="true";
				}else document.getElementById("idtxtFlag2").checked="true";
				document.getElementById("idtxtNameEd").value=arguments[6];
				document.getElementById("idtxtRemarkEd").value=arguments[7];
				document.getElementById("newUserLevelDiv1").style.display="block";
			 $(document).ready(function(){
					$('#btnAutoClickEdit'+aaaa).trigger('click');
				});
			 document.getElementById("newUserLevelDiv1").style.display="block";
		 }else if(arguments[0]=="6"){
			 alert("UserLevel is added successful!");
			 var aaaa=arguments[9];
			 document.getElementById("idtxtId").value=arguments[9];
				document.getElementById("idtxtName").value=arguments[2];
				document.getElementById("idcbouserlevel").value=arguments[3];
				
				if(arguments[8]==1){
					document.getElementById("idtxtFlag1").checked="true";
				}else document.getElementById("idtxtFlag2").checked="true";
			 $(document).ready(function(){
					$('#btnAutoClickEdit'+aaaa).trigger('click');
				});
			 $(document).ready(function(){
					$('#btn7').trigger('click');
				});
		 }else if(arguments[0]=="7"){
			 alert(arguments[1]+" is already exist");
			 var aaaa=arguments[9];
			 $(document).ready(function(){
					$('#btnAutoClickEdit'+aaaa).trigger('click');
				});
			alert(aaaa);
			 document.getElementById("idtxtId").value=arguments[9];
				document.getElementById("idtxtName").value=arguments[2];
				document.getElementById("idcbouserlevel").value=arguments[3];
				
				if(arguments[8]==1){
					document.getElementById("idtxtFlag1").checked="true";
				}else document.getElementById("idtxtFlag2").checked="true";
			 
		 }
	 }
	</script>
</head>
<body class="w3-container w3-light-gray" onload="existOrNot(
	'<%out.print(request.getAttribute("exist")); %>','<%out.print(request.getAttribute("name")); %>',
	'<%out.print(request.getAttribute("txtName")); %>','<%out.print(request.getAttribute("cboUserlevel")); %>',
	'<%out.print(request.getAttribute("txtPassword")); %>','<%out.print(request.getAttribute("txtPassword2")); %>',
	'<%out.print(request.getAttribute("txtUserLevel1")); %>','<%out.print(request.getAttribute("txtRemark1")); %>',
	'<%out.print(request.getAttribute("txtFlag")); %>','<%out.print(request.getAttribute("confirmId")); %>')">
	<%@ include file="header.jsp" %>
					<!-- for body part of the body column -->
				<div class="row panel-body p10">
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
						  		<div class="panel-body p10 ">
						  			<div>
						  			
						  			
						  			
						  			<!-- start of search result table -->
						  			<table class="table table-condensed table-bordered p10" id="example" >
						  				<caption class="w3-container w3-text-black w3-myfont">User Information Lists</caption>
									    <thead class="w3-container w3-light-blue p10">
									      <tr>
									        <th>User Name</th>
											<th>User Level Name</th>
											<th>Flag</th>
									        <th>Options</th>
									      </tr>
									    </thead>
									    <tbody>
									      <%
											IUser_LevelService user_level_service = (IUser_LevelService) SpringBeanFactory
													.getBean("User_LevelService");
											IUserService user_service = (IUserService) SpringBeanFactory
													.getBean("UserService");
											List<User> user = user_service.selectAll();
			
											for (User u : user) {
										%>
										<tr>
											<td>
												<%
													out.print(u.getName());
												%>
											</td>
											
											<%
												User_Level userlevel= user_level_service.selectUser_Level(u.getUser_level_id());
											%>
											<td>
												<%
													out.print(userlevel.getName());
												%>
											</td>
											<%
												User user1= user_service.selectUser(u.getCreated_user_id());
												User user2=user_service.selectUser(u.getModified_user_id());
											%>
											</td>
											<%if(u.getFlag()==1){ %>
											<td> <font color="green">ON</font></td>
											<%} else { %>
											<td><font color="red">OFF</font></td>
											<%} %>
									        <td class="dropdown">
									        	<button class="btn w3-container w3-white w3-text-blue w3-hover-blue w3-hover-text-white ptb dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span>
									      		</button>
									      		<ul class="dropdown-menu">
												    <li class="w3-container w3-hover-blue p10" data-toggle="modal" data-target="#rowView"
												     onclick="rowView('<%out.print(u.getName());%>','<%out.print(userlevel.getName());%>',
												     				  '<%out.print(user1.getName());%>','<%out.print(user2.getName());%>','<%out.print(u.getCreated_date());%>',
												     				  '<%out.print(u.getModified_date());%>','<%out.print(u.getFlag());%>')"><span class="glyphicon glyphicon-eye-open"></span> View</a></li>
												    <li class="w3-container w3-hover-blue p10" data-toggle="modal" data-target="#rowEd"
												     id="btnAutoClickEdit<%out.print(u.getUser_id());%>" onclick="submit('<%out.print(u.getUser_id());%>','<%out.print(u.getName());%>',
												     				'<%out.print(userlevel.getName());%>','<%out.print(u.getFlag());%>')"><span class="glyphicon glyphicon-edit"></span> Edit</a></li>
												     <%if(u.getFlag()==1){ %>				
													    <li class="w3-container w3-hover-blue p10" onclick="confirmDelete('<%out.print(u.getUser_id());%>')"> 
													    	<span class="glyphicon glyphicon-remove-circle"></span> Delete</li>
												    <%} else { %>
												    	<li class="w3-container w3-hover-red p10 disabled"> <font color="gray">
													    	<span class="glyphicon glyphicon-remove-circle"></span> Delete</font></li>
												    <%} %>
												</ul>
												<script>
													function rowView(){
														document.getElementById("username").innerHTML=arguments[0];
														document.getElementById("level").innerHTML=arguments[1];
														document.getElementById("createdUser").innerHTML=arguments[2];
														document.getElementById("modifiedUser").innerHTML=arguments[3];
														document.getElementById("createdDate").innerHTML=arguments[4];
														document.getElementById("modifiedDate").innerHTML=arguments[5];
														if(arguments[6]==1){
															document.getElementById("flag").innerHTML="ON";
														}else{
															document.getElementById("flag").innerHTML="OFF";
														}
													}
													var name1;
													var remark1;
													var flag1;
													function submit(){
														name1=arguments[1];
														userlevel1=arguments[2];
														flag1=arguments[3];
														document.getElementById("idtxtId").value=arguments[0];
														document.getElementById("idtxtName").value=arguments[1];
														document.getElementById("idcbouserlevel").value=arguments[2];
														if(arguments[3]==1){
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
												  			location.href="/warehouse/UserController?page=remove&id="+arguments[0];
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
					</div>
					<!-- end of inserting the code for each operation -->

					<!-- start of all modal for column Edition -->

					<!-- start of Modal for add new the row -->
					<div class="modal fade" id="addNew" role="dialog">
					    <div class="modal-dialog">
					    <script type="text/javascript">
					    	function validate(){
					    		var forReturn=0;
					    		var a=document.getElementById("txtPassword1").value;
					    		var b=document.getElementById("txtPassword2").value;
					    		var match=false;
					    		if(a==b){
					    			match=true;
					    		}else {
					    			match=false;
					    		}
					    		a = document.getElementsByName("combobox");
								var is=0;
								for (var i = 0; i < a.length; i++) {
									if(document.getElementById("myInput").value.toUpperCase()==a[i].innerHTML.toUpperCase()){
										forReturn=a[i].value;
										is=1;
										break;
									}else {
										is=0;
									}
								}
								if(match==false){
									alert("Password and Confirm Password don't match.");
									return false;
								}else if(is==0){
										alert(document.getElementById("myInput").value+"is not have in list\n select again please!");
										return false;
									}else{
										document.getElementById("myInput").value=forReturn;
										return true;
									}
					    	}
					    </script>
					    
					      <!-- Modal content-->
					      	<div class="modal-content">
					        	<div class="modal-header w3-container w3-light-blue p10">
					         		<button type="button" class="close" data-dismiss="modal">&times;</button>
					          		<h4 class="modal-title">Adding New User</h4>
					       		</div>
					       		<form onsubmit="return validate()" name="sample" action="/warehouse/UserController" method="post">
						        <div class="modal-body p10">
						          	<div class="row">
						          		<div class="col-sm-1"></div>
						          		<div class="col-sm-4 right"><label for="txtName">Name</label></div>
						          		<div class="col-sm-5"><input class="u-full-width form-control" type="text" name="txtName" id="txtName" required/></div>
						          		<div class="col-sm-2"></div>
						          	</div><br>
						          	<div class="row">
						          		<div class="col-sm-1"></div>
						          		<div class="col-sm-4 right"><label for="cboUserlevel">User-Level</label></div>
						          		<div class="col-sm-5">
							        		<input type="text" class="form-control2" name="cboUserlevel" id="myInput"  onkeyup="filterFunction()" autocomplete="off" required><button type="button" class="btn6" data-toggle="dropdown" id="btn6"><span class="caret" style="margin-left:-1px;"></span></button>
												<ul class="dropdown-menu dropdown-menu-center menu dropdown-content droplist">
											<%
											User_LevelService ulservice=(User_LevelService)SpringBeanFactory.getBean("User_LevelService");
											List<User_Level> ulevelList = ulservice.selectAll();
														        			
											for(User_Level ulevel:ulevelList){ %>
												<li class="combobox" name="combobox" value="<% out.print(ulevel.getUser_level_id()); %>" onclick="show(this.innerHTML)"><% out.print(ulevel.getName()); %></li>
											<% } %>
												<li id="noMatchingSentence" class="noMatchingSentence">no matching data found.Click the follwing button.</li>
												<li class="combobox addBrandSub" onclick="shownewUserLevelDiv()">New Userlevel</li>
										</ul>
							        </div>
							        	<div class="col-sm-2"></div>
						          	</div><br>
						          		<script type="text/javascript">
						          		function shownewUserLevelDiv(){
						          			document.getElementById("newUserLevelDiv").style.display="block";
						          		}
						          		function hidenewUserLevelDiv(){
						          			document.getElementById("newUserLevelDiv").style.display="none";
						          		}
										</script>
						          	<div class="row">
						          		<div class="col-sm-1"></div>
						          		<div class="col-sm-4 right"><label for="txtPassword">Password</label></div>
						          		<div class="col-sm-5"><input onkeyup="passwordStrong(this.value)" class="u-full-width form-control" type="password" name="txtPassword" id="txtPassword1" pattern=".{9,}[a-zA-Z0-9._%+-/!@#$%^&*]+" title="Only number, character and ._%+-/!@#$%^&* .Must contain at least 10 characters" required/></div>
						          		<div class="col-sm-2"></div>
						          	</div><br>
						          	<!-- script for password or not  // progress bar-->
						          	<script type="text/javascript">
						          		function passwordStrong(){
						          			if(arguments[0].length>0){
						          				document.getElementById("p").style.display="block";
						          				//alert("haha is "+arguments[0].match(/[!@#$%^&*-_+.]/g)!=null);
						          				//alert(arguments[0].match(/[\!\@\#\$\%\^\&\*\-\_\+\.]/g));
						          				if(arguments[0].length>=10){
						          					if((arguments[0].match(/[0-9]/g)!=null)&& (arguments[0].match(/[\!\@\#\$\%\^\&\*\-\_\+\.]/g)!=null)){
						          						document.getElementById("pbar").style.width="100%";
							          					document.getElementById("pbar").style.backgroundColor="green";
							          					document.getElementById("span").innerHTML="Very Strong";
						          					}else if((arguments[0].match(/[0-9]/g)!=null)||(arguments[0].match(/[\!\@\#\$\%\^\&\*\-\_\+\.]/g)!=null)){
						          						document.getElementById("pbar").style.width="75%";
							          					document.getElementById("pbar").style.backgroundColor="orange";
							          					document.getElementById("span").innerHTML="Strong";
						          					}else {
						          						document.getElementById("pbar").style.width="50%";
							          					document.getElementById("pbar").style.backgroundColor="yellow";
							          					document.getElementById("span").innerHTML="Medium";
						          					}
						          				}else {
						          					document.getElementById("pbar").style.width="20%";
						          					document.getElementById("pbar").style.backgroundColor="red";
						          					document.getElementById("span").innerHTML="Weak";
						          				}
						          			}else document.getElementById("p").style.display="none";
						          		}
						          		document.getElementById("txtPassword1").addEventListener("blur",FocusOut,true);
						          		document.getElementById("txtPassword1").addEventListener("focus",FocusIn,true);
						          		function FocusOut(){
						          			document.getElementById("p").style.display="none";
						          		}
						          		function FocusIn(){
						          			if(document.getElementById("txtPassword1").value.length>0){
						          				document.getElementById("p").style.display="block";
						          			}else document.getElementById("p").style.display="none";
						          		}
						          	</script>
						          	<!-- end for progress bar script -->
						          	
						          	<!-- for progress bar -->
						          	<div class="row">
						          		<div class="col-sm-4"></div>
						          		<div class="col-sm-6">
											<div class="progress" id="p" style="display: none;">
												<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" ariavaluemax="100" style="width:15%;background-color: red;" id="pbar"><span id="span">Weak</span>
												</div>
											</div>
										</div>
						          		<div class="col-sm-2"></div>
						          	</div>
						          	<!-- end for progress bar -->
						          	<div class="row">
						          		<div class="col-sm-1"></div>
						          		<div class="col-sm-4 right"><label for="txtPassword">Confirm Password</label></div>
						          		<div class="col-sm-5"><input class="u-full-width form-control" type="password" name="txtPassword2" id="txtPassword2" required/></div>
						          		<div class="col-sm-2"></div>
						          	</div><br>
						          	<div class="row displayNone" id="newUserLevelDiv">
										<div class="col-sm-1"></div>
										<div class="col-sm-10" style="border-style: solid;border-radius:15px;border-color: skyblue;">
										<center><h4>Add UserLevel</h4></center>
											<div class="row">
												<div class="col-sm-2"></div>
												<div class="col-sm-4">
													<label for="lblName">User Level Name</label>
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
													<button type="button" class="btn btn-primary" onclick="AddNewUserLevel()">Add UserLevel</button>
												</div>
												<script type="text/javascript">
													function AddNewUserLevel(){
															var un=document.getElementById("txtName").value;
															var ul=document.getElementById("myInput").value;
															var p1=document.getElementById("txtPassword1").value;
															var p2=document.getElementById("txtPassword2").value;
															var uln=document.getElementById("idtxtName1").value;
															var remark=document.getElementById("idtxtRemark1").value;
															alert(uln);
														var method="post";
														var path="/warehouse/User_LevelController";
														var form=document.createElement("form");
														form.setAttribute("method",method);
														form.setAttribute("action",path);
														var userName=document.createElement("input");
														userName.setAttribute("type","hidden");
														userName.setAttribute("name","txtName");
														userName.setAttribute("value",un);
														form.appendChild(userName);
														var userLevel=document.createElement("input");
														userLevel.setAttribute("type","hidden");
														userLevel.setAttribute("name","txtUserLevel");
														userLevel.setAttribute("value",ul);
														form.appendChild(userLevel);
														var Password1=document.createElement("input");
														Password1.setAttribute("type","hidden");
														Password1.setAttribute("name","txtPassword1");
														Password1.setAttribute("value",p1);
														form.appendChild(Password1);
														var Password2=document.createElement("input");
														Password2.setAttribute("type","hidden");
														Password2.setAttribute("name","txtPassword2");
														Password2.setAttribute("value",p2);
														form.appendChild(Password2);
														var UserLevelName=document.createElement("input");
														UserLevelName.setAttribute("type","hidden");
														UserLevelName.setAttribute("name","txtUserLevel1");
														UserLevelName.setAttribute("value",uln);
														form.appendChild(UserLevelName);
														var Remark1=document.createElement("input");
														Remark1.setAttribute("type","hidden");
														Remark1.setAttribute("name","txtRemark1");
														Remark1.setAttribute("value",remark);
														form.appendChild(Remark1);
														var button=document.createElement("input");
														button.setAttribute("type","hidden");
														button.setAttribute("name","page");
														button.setAttribute("value","AddFromUserAdd");
														form.appendChild(button);
														document.body.appendChild(form);
														form.submit();
													}
												</script>
												<div class="col-sm-4">
													<button class="btn btn-primary" type="button" onclick="hidenewUserLevelDiv()" id="hideNewUserLevelDiv">Cancel</button>
												</div>
												<div class="col-sm-2"></div>
											</div><br>
										</div>
										<div class="col-sm-1"></div>
									</div>
						        </div>
						        <div class="modal-footer p10">
						        	<input type="submit" class="btn btn-default w3-container w3-light-blue p10" value="Add" name="page"/>
						        	
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
					          		<h4 class="modal-title">Showing Each Customer Information</h4>
					       		</div>
					       		<form>
						        <div class="modal-body p10" style="height:430px;">
						          	
						          		<div class="form-group">
											<label class="control-label col-sm-6 right" for="username">Username:</label>
												<div class="col-sm-3">
													<label class="control-label" id="username"></label>
												</div>
											<div class="control-label col-sm-3"></div>
										</div><br>
										<div class="form-group">
											
											<label class="control-label col-sm-6 right" for="level">User Level:</label>
												<div class="col-sm-3">
													<label class="control-label" id="level"></label>
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
					          		<h4 class="modal-title">Editing User Information</h4>
					       		</div>
					       		<script>
					       		function beforeSubmit(){
									var name=document.getElementById("idtxtName").value;
									var userlevel=document.getElementById("idcbouserlevel").value;
									var flag;
									if(document.getElementById("idtxtFlag1").checked){
										flag="1";
									}else flag="0";
									if(name1!=name||userlevel1!=userlevel||flag1!=flag){
										document.getElementById("btnSubmit").disabled=false;
									}else document.getElementById("btnSubmit").disabled=true;
								}
					       		 function confirmEdit(){
					       			var forReturn=0;
					       			var a=document.getElementsByName("combobox1");
					       			var is=0;
									for (var i = 0; i < a.length; i++) {
										if(document.getElementById("idcbouserlevel").value.toUpperCase()==a[i].innerHTML.toUpperCase()){
											forReturn=a[i].value;
											is=1;
											break;
										}else {
											is=0;
										}
									}
									if(is==1){
					       			 if(confirm("Are you sure to edit!")){
					       				document.getElementById("idcbouserlevel").value=forReturn;
					       				 return true;
					       			 }else return false;
									}else {
										alert(document.getElementById("idcbouserlevel").value+"is not have in list\n select again please!");
										return false;
									}
					       		 }
					       		</script>
					       		<form onsubmit="return confirmEdit()" name="sample" action="/warehouse/UserController">
						        <div class="modal-body p10">
						        	<div class="row">
						          		<div class="col-sm-1"></div>
						          		<div class="col-sm-9"><input class="u-full-width form-control" type="hidden" name="txtId" id="idtxtId" value="1"/></div>
						          		<div class="col-sm-2"></div>
						          	</div><br>
						          	<div class="row">
						          		<div class="col-sm-1"></div>
						          		<div class="col-sm-4 right"><label>Enter new name</label></div>
						          		<div class="col-sm-5"><input class="u-full-width form-control" type="text" name="txtName" id="idtxtName" value="a" onkeyup="beforeSubmit()" autocomplete="off" required/></div>
						          		<div class="col-sm-2"></div>
						          	</div><br>
						          	<div class="row">
						          		<div class="col-sm-1"></div>
						          		<div class="col-sm-4 right"><label>User-Level</label></div>
						          		<div class="col-sm-5"><input type="text" class="form-control2" name="cbouserlevel" id="idcbouserlevel" onkeyup="filterFunction1()" autocomplete="off" required><button type="button" class="btn6" data-toggle="dropdown" id="btn7"><span class="caret"></span></button>
												<ul class="dropdown-menu dropdown-menu-center menu dropdown-content droplist">
											<%	
											for(User_Level ulevel:ulevelList){ %>
												<li class="combobox" name="combobox1" value="<% out.print(ulevel.getUser_level_id()); %>" onclick="show1(this.innerHTML)"><% out.print(ulevel.getName()); %></li>
											<% } %>
												<li id="noMatchingSentence1" class="noMatchingSentence">no matching data found.Click the follwing button.</li>
												<li class="combobox addBrandSub" onclick="shownewUserLevelDiv1()">New Userlevel</li>
										</ul></div>
										<script type="text/javascript">
						          		function shownewUserLevelDiv1(){
						          			document.getElementById("newUserLevelDiv1").style.display="block";
						          		}
						          		function hidenewUserLevelDiv1(){
						          			document.getElementById("newUserLevelDiv1").style.display="none";
						          		}
										</script>
						          		<div class="col-sm-2"></div>
						          	</div><br>
						          	<div class="row">
						          		<div class="col-sm-1"></div>
						          		<div class="col-sm-4 right"><label>Enter new flag</label></div>
						          		<div class="col-sm-5"><input type="radio" value="1" name="txtFlag" id="idtxtFlag1" onclick="beforeSubmit(this.value)"/><font color="green">ON</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									          	<input type="radio" value="0" name="txtFlag" id="idtxtFlag2" onclick="beforeSubmit(this.value)"/><font color="red">OFF</font></div>
						          		<div class="col-sm-2"></div>
						          	</div><br>
						          	<div class="row displayNone" id="newUserLevelDiv1">
										<div class="col-sm-1"></div>
										<div class="col-sm-10" style="border-style: solid;border-radius:15px;border-color: skyblue;">
										<center><h4>Add UserLevel</h4></center>
											<div class="row">
												<div class="col-sm-2"></div>
												<div class="col-sm-4">
													<label for="lblName">User Level Name</label>
												</div>
												<div class="col-sm-4">
													<input class="u-full-width form-control" type="text" name="txtName1" id="idtxtNameEd" />
												</div>
												<div class="col-sm-2"></div>
											</div><br>
											<div class="row">
												<div class="col-sm-2"></div>
												<div class="col-sm-4">
													<label for="lblRemark">Remark</label>
												</div>
												<div class="col-sm-4">
													<input class="u-full-width form-control" type="text" name="txtRemark1" id="idtxtRemarkEd"/>
												</div>
												<div class="col-sm-2"></div>
											</div><br>
											<div class="row">
												<div class="col-sm-2"></div>
												<div class="col-sm-4">
													<button type="button" class="btn btn-primary" onclick="AddNewUserLevel1()">Add UserLevel</button>
												</div>
												<script type="text/javascript">
													function AddNewUserLevel1(){
															var id=document.getElementById("idtxtId").value;
															var un=document.getElementById("idtxtName").value;
															var ul=document.getElementById("idcbouserlevel").value;
															var flag=0;
															var uln=document.getElementById("idtxtNameEd").value;
															var remark=document.getElementById("idtxtRemarkEd").value;
															if(document.getElementById("idtxtFlag1").checked){
																flag=1;
															}else flag=0;
															//alert("jjjjj");
														var method="get";
														var path="/warehouse/User_LevelController";
														var form=document.createElement("form");
														form.setAttribute("method",method);
														form.setAttribute("action",path);
														var Id=document.createElement("input");
														Id.setAttribute("type","hidden");
														Id.setAttribute("name","txtId");
														Id.setAttribute("value",id);
														form.appendChild(Id);
														var userName=document.createElement("input");
														userName.setAttribute("type","hidden");
														userName.setAttribute("name","txtName");
														userName.setAttribute("value",un);
														form.appendChild(userName);
														var userLevel=document.createElement("input");
														userLevel.setAttribute("type","hidden");
														userLevel.setAttribute("name","txtUserLevel");
														userLevel.setAttribute("value",ul);
														form.appendChild(userLevel);
														var Flag=document.createElement("input");
														Flag.setAttribute("type","hidden");
														Flag.setAttribute("name","txtFlag");
														Flag.setAttribute("value",flag);
														form.appendChild(Flag);
														var UserLevelName=document.createElement("input");
														UserLevelName.setAttribute("type","hidden");
														UserLevelName.setAttribute("name","txtUserLevel1");
														UserLevelName.setAttribute("value",uln);
														form.appendChild(UserLevelName);
														var Remark1=document.createElement("input");
														Remark1.setAttribute("type","hidden");
														Remark1.setAttribute("name","txtRemark1");
														Remark1.setAttribute("value",remark);
														form.appendChild(Remark1);
														var button=document.createElement("input");
														button.setAttribute("type","hidden");
														button.setAttribute("name","page");
														button.setAttribute("value","AddFromUserEdit");
														form.appendChild(button);
														document.body.appendChild(form);
														form.submit();
													}
												</script>
												<div class="col-sm-4">
													<button class="btn btn-primary" type="button" onclick="hidenewUserLevelDiv1()" id="hideNewUserLevelDiv1">Cancel</button>
												</div>
												<div class="col-sm-2"></div>
											</div><br>
										</div>
										<div class="col-sm-1"></div>
									</div>
						        </div>
						        <div class="modal-footer p10">
						        	<input type="submit" id="btnSubmit" class="btn btn-default w3-container w3-light-blue p10" name="page" value="Edit" disabled/>
						        	
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
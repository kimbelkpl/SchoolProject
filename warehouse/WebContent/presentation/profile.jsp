<%@page import="org.springframework.expression.spel.support.ReflectionHelper.ArgumentsMatchInfo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*"%>
<%@page import="com.java.plyd.service.*"%>
	<%String uname1=(String)session.getAttribute("uname");
int uid1=((Integer)(session.getAttribute("uid")));
session.setAttribute("uname", uname1);
session.setAttribute("uid",uid1);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Profile</title>
	<%@ include file="link.jsp" %>
		<script type="text/javascript">
		function changePassword(){
		var c=document.getElementById("idtxtCurrentPassword").value;
		var a=document.getElementById("idtxtNewPassword").value;
		var b=document.getElementById("idtxtConfirmPassword").value;
		if(c==a){
			alert("New Password is same with Current Password!");
			return false;
		}else 
		if(a==b){
			return true;
		}
		else{
			alert("Passwords don't match");
			return false;
			}
		}
		function forPasswordWrong(){
			if(arguments[0]=="3"){
				alert("Current Password Wrong!");
			}
		}
	</script></head>
<body class="w3-container w3-light-gray"  onload="forPasswordWrong('<%out.print(request.getAttribute("exist")); %>')">
	<%@ include file="header.jsp"%>
				<!-- for body part of the body column -->
				<div class="row panel-body p10">
					<!-- inserting the code for each operation -->
					<div class="col-sm-9">
						<div class="row p10">
							<div class="panel panel-default">
						  		<div class="panel-body p10">
						  			<div class="col-sm-12">
						  				<div class="col-sm-3"></div>
						  				<div class="col-sm-6">
						  				<center><img class="imgprofile" alt="Profile" src="<%=request.getContextPath()%>/images/profile.jpg">
						  				<br><br>
						  				<div class="row">
						  						<label class="control-label" for="username">Username:</label>
												<label class="control-label break"><%out.print(uname1);%></label>
										</div><br>
										<%
									IUser_LevelService userlevelservicej = (IUser_LevelService) SpringBeanFactory
									.getBean("User_LevelService");
									IUserService userservicej = (IUserService) SpringBeanFactory
									.getBean("UserService");
										User uj=userservicej.selectUser(uid1);	
										int lvid=uj.getUser_level_id();
										User_Level userj=userlevelservicej.selectUser_Level(lvid);
										String levelname=userj.getName();
									%>
										<div class="row">
											<label class="control-label" for="username">Level:</label>
												<label class="control-label break"><%out.print(levelname); %></label>
										</div><br>
										<div class="row">
											<a data-toggle="modal" data-target="#newPassword" id="ChangePassword"><font color="blue"><u>Click here to Change Password</u></font></a>
										</div>
										<br><br>
						  				</center>
						  				
						  				</div>
						  				<div class="col-sm-3"></div>
						  			</div>
						  		</div>
							</div>
						</div>
					</div>
				<div id="newPassword" class="modal fade" role="dialog">
					<div class="modal-dialog" style="width:500px;height:500px;">
					<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header w3-container w3-light-blue p10">
								<div class="control-label col-sm-2"></div>
								<div class="control-label col-sm-7">
									<h4 class="modal-title">Change Password</h4>
								</div>
								<div class="control-label col-sm-2"></div>
								<div class="control-label col-sm-1">
										<button type="button" class="close" data-dismiss="modal"><font color="red">&times;</font></button>
								</div>
							</div>
							<form onsubmit="return changePassword()" method="get" action="/warehouse/UserController">
							<div class="modal-body">
								
									
									<div class="form-group row">
										<div class="control-label col-sm-1"></div>
										<label class="control-label col-sm-5 right" for="currentPassword">Current Password:</label>
											<div class="col-sm-5">
												<input type="password" name="txtPassword" placeholder="Current Password" class="u-full-width form-control" id="idtxtCurrentPassword" required/>
											</div>
										<div class="control-label col-sm-1"></div>
									</div><br>
									<div class="form-group row">
										<div class="control-label col-sm-1"></div>
										<label class="control-label col-sm-5 right" for="newPassword" >New Password:</label>
											<div class="col-sm-5">
												<input onkeyup="passwordStrong(this.value)" placeholder="New Password" class="u-full-width form-control" type="password" name="txtNewPassword" id="idtxtNewPassword" pattern=".{9,}[a-zA-Z0-9._%+-/!@#$%^&*]+" title="Only number, character and ._%+-/!@#$%^&* .Must contain at least 10 characters" required/>
											</div>
										<div class="control-label col-sm-1"></div>
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
									<div class="form-group row">
										<div class="control-label col-sm-1"></div>
										<label class="control-label col-sm-5 right" for="confirmPassword">Confirm Password:</label>
											<div class="col-sm-5">
												<input type="password" value="" class="u-full-width form-control" placeholder="Confirm Password" name="txtConfirmPassword" id="idtxtConfirmPassword" required/>
											</div>
										<div class="control-label col-sm-1"></div>
									</div><br>
									
									
							</div>
							<div class="modal-footer">
								<input type="submit" value="ChangePassword" name="page" class="btn btn-default w3-container w3-light-blue p10">
								<button type="button" class="btn btn-default w3-container w3-light-blue p10" data-dismiss="modal">Close</button>
							</div>
							</form>
						</div>
					</div>
				</div>					
					<!-- end of the all modal for column Editioin -->
					<%@ include file="right.jsp" %>
				
</body>
</html>
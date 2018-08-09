<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*"%>
<%@page import="com.java.plyd.service.*"%>

<html>
<head>
	<title>StockIn Information</title>
	<%@ include file="link.jsp" %>

<body class="w3-container w3-light-gray" onload="existorNot('<%out.print(request.getAttribute("exist"));%>','<%out.print(request.getAttribute("date"));%>','<%out.print(request.getAttribute("datein"));%>','<%out.print(request.getAttribute("war"));%>','<%out.print(request.getAttribute("sup"));%>','<%out.print(request.getAttribute("vou"));%>','<%out.print(request.getAttribute("remar"));%>')">
	<%@include file="header.jsp" %>

<div class="row panel-body p10">
					<!-- inserting the code for each operation -->
					<div class="col-sm-9">
						<div class="row p10">
							<div class="panel panel-default">
							
							<div class="panel-heading w3-container w3-light-blue p10"></div>
						  		<!--Panel-->


                                  <div class="panel-body p10">
						  			<!-- start of search result table -->
						  			
						  			<table id="example" class="table table-condensed table-bordered p10">
						  				<caption class="w3-container w3-text-black w3-myfont">Damage Information Lists</caption>
									    <thead class="w3-container w3-light-blue p10">
									      <tr>
									        <th>Damage Date</th>
									        <th>Merchandise Name</th>
									        <th>Quantity</th>
									        <th>Sub Unit</th>
									         <th>Remark</th>
									      </tr>
									    </thead>
									    
									     
				       <%List<Damage> dlist=(List<Damage>) request.getAttribute("damage");%>
		
						<tbody>
	                	<%
							for (Damage d : dlist) {
						%>					
											 <tr>
						 			        <td><%out.println(d.getDamage_date());%></td>
									        <td><%out.println(d.getMerchandise());%></td>
									        <td><%out.println(d.getQty());%></td>
									        <td><%out.println(d.getSubunit());%></td>
										    <td><%out.println(d.getRemark());%></td> 
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




					

					<div class="col-sm-3 p10">
						<!-- first notification panel 1 -->
						<div class="row">
							<div class="panel panel-default">
						  		<div class="panel-heading w3-container w3-light-blue p10">Panel Heading</div>
						  		<div class="panel-body">Panel Content</div>
							</div>
						</div>
						<!-- end of first notification panel 1 -->
						<!-- first notification panel 2 -->
						<div class="row">
							<div class="panel panel-default">
						  		<div class="panel-heading w3-container w3-light-blue p10">Panel Heading</div>
						  		<div class="panel-body">Panel Content</div>
							</div>
						</div>
						<!-- end of first notification panel 2 -->
						<!-- first notification panel 3 -->
						<div class="row">
							<div class="panel panel-default">
						  		<div class="panel-heading w3-container w3-light-blue p10">Panel Heading</div>
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
<!-- Logout modal box -->
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
				<form class="form-horizontal" method="get" role="form" action="/warehouse/UserController">
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
							<input class="btn btn-info" type="submit" value="logout" name="page"/>
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
</body>
</html>
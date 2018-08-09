<!DOCTYPE html>

<%@page import="java.util.*" %>

<%@page import="com.java.plyd.service.*"%>

<html>

<head>

<title>Sub Category Page</title>

<%@ include file="link.jsp"%>
<style>
.btn6{
	padding-top: 3px;
	padding-bottom: 4px;
}
</style>
<script>

	 function existOrNot(){
		 a = document.getElementsByName("combobox");
		document.getElementById("idcboCategory").value=a[0].innerHTML;
		 if(arguments[0]=="1"){
			 document.getElementById("idtxtName").value=arguments[2];
			 document.getElementById("idcboCategory").value=arguments[3];
			 var a=arguments[4];
			 a=a.replace(/ /gi,"");
			 var brand=document.getElementsByName("brand");
				var res=a.split(",");
				for ( var i = 0; i < res.length; i++) {
					for(var j=0;j<brand.length;j++){
						if(res[i]==brand[j].value){
							brand[j].checked=true;
						}
					}
				}
				document.getElementById("idtxtRemark").value=arguments[5];
			 $(document).ready(function(){
					$('#btnAddNew').trigger('click');
				});
			 alert(arguments[1]+" is already exist!");
			
		 }else if(arguments[0]=="2"){
			 alert("SubCategory is Added Sucessfully");
			 $(document).ready(function(){
					$('#btnAddNew').trigger('click');
				});
		 }else  if(arguments[0]=="3"){
			 document.getElementById("idtxtName").value=arguments[2];
			 document.getElementById("idcboCategory").value=arguments[3];
			 var a=arguments[4];
			 a=a.replace(/ /gi,"");
			 var brand=document.getElementsByName("brand");
				var res=a.split(",");
				for ( var i = 0; i < res.length; i++) {
					for(var j=0;j<brand.length;j++){
						if(res[i]==brand[j].value){
							brand[j].checked=true;
						}
					}
				}
				document.getElementById("idtxtRemark").value=arguments[5];
				document.getElementById("idtxtName1").value=arguments[6];
				document.getElementById("idtxtRemark1").value=arguments[7];
			 $(document).ready(function(){
					$('#btnAddNew').trigger('click');
				});
			 document.getElementById("newBrandDiv").style.display="block";
			 alert(arguments[1]+" is already exist!\nIf you don't see it there, please edit in brand page");
			
		 }else if(arguments[0]=="4"){
			 alert("Brand is Added Sucessfully");
			 document.getElementById("idtxtName").value=arguments[2];
			 document.getElementById("idcboCategory").value=arguments[3];
			 var a=arguments[4];
			 a=a.replace(/ /gi,"");
			 var brand=document.getElementsByName("brand");
				var res=a.split(",");
				for ( var i = 0; i < res.length; i++) {
					for(var j=0;j<brand.length;j++){
						if(res[i]==brand[j].value){
							brand[j].checked=true;
						}
					}
				}
				document.getElementById("idtxtRemark").value=arguments[5];
			 $(document).ready(function(){
					$('#btnAddNew').trigger('click');
				});
			 $(document).ready(function(){
					$('#btnDropdown').trigger('click');
				});
		 }else if(arguments[0]=="5"){
			 alert("Edit Successful");
		 }else if(arguments[0]=="6"){
				var aaaa=arguments[9];
				$(document).ready(function(){
					$("#btnSubmit"+aaaa).trigger('click');
				});
				 document.getElementById("newBrandDiv1").style.display="block";
				 alert(arguments[1]+" is already exist!\nIf you don't see it there, please edit in brand page");
				 document.getElementById("idtxtName2").value=arguments[2];
				 document.getElementById("idcboCategory2").value=arguments[3];
				 
				 var a=arguments[4];
				 a=a.replace(/ /gi,"");
				 var brand=document.getElementsByName("brand2");
					var res=a.split(",");
					for ( var i = 0; i < res.length; i++) {
						for(var j=0;j<brand.length;j++){
							if(res[i]==brand[j].value){
								brand[j].checked=true;
							}
						}
					}
					document.getElementById("idtxtRemark2").value=arguments[5];
					document.getElementById("idtxtName3").value=arguments[6];
					document.getElementById("idtxtRemark3").value=arguments[7];
					document.getElementById("idtxtId2").value=arguments[9];
					
					if(arguments[8]=="1"){
						document.getElementById("idtxtFlag1").checked=true;
						document.getElementById("idtxtFlag2").checked=false;
					}else {
						document.getElementById("idtxtFlag2").checked=true;
						document.getElementById("idtxtFlag1").checked=false;
					}
					
		 }else if(arguments[0]=="7"){
			 var aaaa=arguments[9];
			 $(document).ready(function(){
					$("#btnSubmit"+aaaa).trigger('click');
				});
			 $(document).ready(function(){
					$("#btnDropdownFromSubEdit").trigger('click');
				});
			 alert("Brand is added successfully");
			 document.getElementById("idtxtName2").value=arguments[2];
			 document.getElementById("idcboCategory2").value=arguments[3];
			 var a=arguments[4];
			 a=a.replace(/ /gi,"");
			 var brand=document.getElementsByName("brand2");
				var res=a.split(",");
				for ( var i = 0; i < res.length; i++) {
					for(var j=0;j<brand.length;j++){
						if(res[i]==brand[j].value){
							brand[j].checked=true;
						}
					}
				}
				document.getElementById("idtxtRemark2").value=arguments[5];
				document.getElementById("idtxtName3").value=arguments[6];
				document.getElementById("idtxtRemark3").value=arguments[7];
				document.getElementById("idtxtId2").value=arguments[9];
				if(arguments[8]=="1"){
					document.getElementById("idtxtFlag1").checked=true;
					document.getElementById("idtxtFlag2").checked=false;
				}else {
					document.getElementById("idtxtFlag2").checked=true;
					document.getElementById("idtxtFlag1").checked=false;
				}
		 }else if(arguments[0]=="8"){
			 document.getElementById("idtxtName").value=arguments[2];
			 document.getElementById("idcboCategory").value=arguments[3];
			 var a=arguments[4];
			 a=a.replace(/ /gi,"");
			 var brand=document.getElementsByName("brand");
				var res=a.split(",");
				for ( var i = 0; i < res.length; i++) {
					for(var j=0;j<brand.length;j++){
						if(res[i]==brand[j].value){
							brand[j].checked=true;
						}
					}
				}
				document.getElementById("idtxtRemark").value=arguments[5];
				document.getElementById("idtxtNameFromSubAdd").value=arguments[6];
				document.getElementById("idtxtRemarkFromSubAdd").value=arguments[7];
			 $(document).ready(function(){
					$('#btnAddNew').trigger('click');
				});
			 document.getElementById("newCategoryDiv").style.display="block";
			 alert(arguments[1]+" is already exist!\nIf you don't see it there, please edit in category page");		 
		}else if(arguments[0]=="9"){
			alert("Category is added successfully.");
			document.getElementById("idtxtName").value=arguments[2];
			document.getElementById("idcboCategory").value=arguments[6];
			 var a=arguments[4];
			 a=a.replace(/ /gi,"");
			 var brand=document.getElementsByName("brand");
				var res=a.split(",");
				for ( var i = 0; i < res.length; i++) {
					for(var j=0;j<brand.length;j++){
						if(res[i]==brand[j].value){
							brand[j].checked=true;
						}
					}
				}
			document.getElementById("idtxtRemark").value=arguments[5];
			 $(document).ready(function(){
					$('#btnAddNew').trigger('click');
				});
		}else if(arguments[0]=="10"){
			 var aaaa=arguments[9];
			 $(document).ready(function(){
					$('#btnSubmit'+aaaa).trigger('click');
				});
			 document.getElementById("idtxtId2").value=arguments[9];
			 document.getElementById("idtxtName2").value=arguments[2];
			 document.getElementById("idcboCategory2").value=arguments[3];
			 var a=arguments[4];
			 a=a.replace(/ /gi,"");
			 var brand=document.getElementsByName("brand2");
				var res=a.split(",");
				for ( var i = 0; i < res.length; i++) {
					for(var j=0;j<brand.length;j++){
						if(res[i]==brand[j].value){
							brand[j].checked=true;
						}
					}
				}
				document.getElementById("idtxtRemark2").value=arguments[5];
				document.getElementById("idtxtNameFromSubEdit").value=arguments[6];
				document.getElementById("idtxtRemarkFromSubEdit").value=arguments[7];
				if(arguments[8]=="1"){
					document.getElementById("idtxtFlag1").checked=true;
					document.getElementById("idtxtFlag2").checked=false;
				}else {
					document.getElementById("idtxtFlag2").checked=true;
					document.getElementById("idtxtFlag1").checked=false;
				}
			 document.getElementById("newCategoryDiv1").style.display="block";
			 alert(arguments[1]+" is already exist!\nIf you don't see it there, please edit in category page");		 
		}else if(arguments[0]=="11"){
			alert("Category is added successfully.");
			var aaaa=arguments[9];
			 $(document).ready(function(){
					$('#btnSubmit'+aaaa).trigger('click');
				});
			 $(document).ready(function(){
					$('#btnDropdownCategoryFromSubEdit').trigger('click');
				});
			 document.getElementById("idtxtId2").value=arguments[9];
			 document.getElementById("idtxtName2").value=arguments[2];
			 document.getElementById("idcboCategory2").value=arguments[3];
			 var a=arguments[4];
			 a=a.replace(/ /gi,"");
			 var brand=document.getElementsByName("brand2");
				var res=a.split(",");
				for ( var i = 0; i < res.length; i++) {
					for(var j=0;j<brand.length;j++){
						if(res[i]==brand[j].value){
							brand[j].checked=true;
						}
					}
				}
				document.getElementById("idtxtRemark2").value=arguments[5];
				if(arguments[8]=="1"){
					document.getElementById("idtxtFlag1").checked=true;
					document.getElementById("idtxtFlag12").checked=false;
				}else {
					document.getElementById("idtxtFlag2").checked=true;
					document.getElementById("idtxtFlag1").checked=false;
				}
		}
	 }

	</script>

</head>

<body class="w3-container w3-light-gray" onload="existOrNot(

	'<%out.print(request.getAttribute("exist")); %>','<%out.print(request.getAttribute("name")); %>',
	'<%out.print(request.getAttribute("txtName"));%>','<%out.print(request.getAttribute("cboCategory"));%>',
	'<%out.print(request.getAttribute("brand"));%>','<%out.print(request.getAttribute("txtRemark"));%>',
	'<%out.print(request.getAttribute("txtName1"));%>','<%out.print(request.getAttribute("txtRemark1"));%>',
	'<%out.print(request.getAttribute("txtFlag")); %>','<%out.print(request.getAttribute("txtId"));%>')">

	<div class="container-fluid">

		<%@ include file="header.jsp"%>

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


		<div class="panel-body p10">

			<!-- start of search result table -->

			<table class="table table-condensed table-bordered p10" id="example">

				<caption class="w3-container w3-text-black w3-myfont">Sub Category

					Information Lists</caption>

				<thead class="w3-container w3-light-blue p10">

					<tr>

						<th>Sub Category Name</th>

						<th>Category</th>

						<th>Remark</th>

						<th>Flag</th>

						<th>Option</th>

					</tr>

				</thead>

				<tbody>

					<%

				List<Sub_category> sc1;

				IUserService userservice = (IUserService) SpringBeanFactory

						.getBean("UserService");

				ISub_category_service sub_category_service = (ISub_category_service) SpringBeanFactory

						.getBean("Sub_category_service");

				ICategoryService category_service = (ICategoryService) SpringBeanFactory

						.getBean("CategoryService");

				User user1 = userservice.selectUser(uid);

				System.out.println(user1.getUser_level_id()+"error");
				ISubCategoryAndBrandService subandbrandService=(ISubCategoryAndBrandService) SpringBeanFactory.getBean("SubCategoryAndBrandService");
				sc1 = sub_category_service.selectAllforadmin();
				for (Sub_category sc : sc1) {

			%>

					<tr>

						<td>

							<%

						out.print(sc.getName());

					%>

						</td>

						<%

					System.out.print(sc.getName());

				%>

						<%

					Category c = category_service.selectCategory(sc

								.getCategory_id());

				%>

						<td>

							<%

						out.print(c.getName());

					%>

						</td>

						<%

					System.out.print(c.getName());

				%>

						<td>

							<%

						out.print(sc.getRemark());

					%>

						</td>

						<%

						

						User u = userservice.selectUser(sc.getCreated_user_id());

						User u1 = userservice.selectUser(sc.getModified_user_id());

				%>

						<%if(sc.getFlag()==1){ %>

						<td> <font color="green">ON</font></td>

						<%} else { %>

						<td><font color="red">OFF</font></td>

						<%} %>

						<td class="dropdown">

							<button

								class="btn w3-container w3-white w3-text-blue w3-hover-blue w3-hover-text-white ptb dropdown-toggle"

								data-toggle="dropdown">

								<span class="glyphicon glyphicon-cog"></span>

							</button>
							<% 
							List<SubCategoryAndBrand> s=subandbrandService.selectSubCategoryAndBrandBySubCategoryId(sc.getSub_category_id());
							int tt=0;
							for(SubCategoryAndBrand hhh:s){
								tt++;
							}
							int[] brandArr=new int[tt];int i1=0;
							for(SubCategoryAndBrand hhh:s){
								brandArr[i1]= hhh.getBrand_id();
								i1++;
							}
							String brand=Arrays.toString(brandArr);
							brand=brand.substring(1,brand.length()-1);
							%>

							<ul class="dropdown-menu">

								<li class="w3-container w3-hover-blue p10" data-toggle="modal"

									data-target="#rowView" onclick="rowView('<%out.print(sc.getName());%>', '<%out.print(c.getName());%>', '<%out.print(sc.getRemark());%>','<%out.print(u.getName());%>','<%out.print(u1.getName());%>','<%out.print(sc.getCreated_date());%>',
								   '<%out.print(sc.getModified_date());%>','<%out.print(sc.getFlag());%>')"><span

									class="glyphicon glyphicon-eye-open"></span> View</a></li>

								<li class="w3-container w3-hover-blue p10" data-toggle="modal"

									data-target="#rowEd" id="btnSubmit<%out.print(sc.getSub_category_id());%>" onclick="submit('<%out.print(sc.getSub_category_id());%>','<%out.print(sc.getName());%>',

												     				'<%out.print(c.getName());%>','<%out.print(brand);%>','<%out.print(sc.getRemark());%>','<%out.print(sc.getFlag());%>')"
												     				 ><span class="glyphicon glyphicon-edit" id="li<%out.print(sc.getSub_category_id());%>"></span>Edit</li>
								<%if(sc.getFlag()==1){ %>				

									<li class="w3-container w3-hover-blue p10" onclick="confirmDelete('<%out.print(sc.getSub_category_id());%>')"> 

									<span class="glyphicon glyphicon-remove-circle"></span> Delete</li>

								<%} else { %>

									<li class="w3-container w3-hover-red p10 disabled"> <font color="gray">

									<span class="glyphicon glyphicon-remove-circle"></span> Delete</font></li>

								<%} %>

							</ul> 
							<script>
							var name1;
							var category1;
							var brand1;
							var remark1;
							var flag1;
							
							function submit(){
								name1=arguments[1];
								category1=arguments[2];
								remark1=arguments[4];
								flag1=arguments[5];
								document.getElementById("idtxtId2").value=arguments[0];

								document.getElementById("idtxtName2").value=arguments[1];

								document.getElementById("idcboCategory2").value=arguments[2];
								 var a=arguments[3];
								 a=a.replace(/ /gi,"");
								 var brand=document.getElementsByName("brand2");
								 for(var j=0;j<brand.length;j++){
											brand[j].checked=false;
									}
									var res=a.split(",");
									brand1=res;
									for ( var i = 0; i < res.length; i++) {
										for(var j=0;j<brand.length;j++){
											if(res[i]==brand[j].value){
												brand[j].checked=true;
											}
										}
									}

								document.getElementById("idtxtRemark2").value=arguments[4];

								if(arguments[5]==1){

									document.getElementById("idtxtFlag1").checked=true;

									document.getElementById("idtxtFlag2").checked=false;

								}else{

									document.getElementById("idtxtFlag2").checked=true;

									document.getElementById("idtxtFlag1").checked=false;

								}

							}

							function confirmDelete() {

							   // var r=confirm("Are you sure to delete this row");

							    if (confirm("Do you want to delete really!")) {

							       location.href="/warehouse/Sub_category_controller?page=remove&scid="+arguments[0];

							    } else {

							       // alert("Cann't delete it...");

							    }

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

					<h4 class="modal-title">Adding New SubCategory</h4>

				</div>
				<script type="text/javascript">
					function validate(){
						var forReturn=0;
						var brand=document.getElementsByName("brand");
						var temp=false;
						for ( var i = 0; i < brand.length; i++) {
							if(brand[i].checked){
								temp=true;
							}
						}
						a = document.getElementsByName("combobox");
						var is=0;
						for (var i = 0; i < a.length; i++) {
							if(document.getElementById("idcboCategory").value.toUpperCase()==a[i].innerHTML.toUpperCase()){
								forReturn=a[i].value;
								is=1;
								break;
							}else {
								is=0;
							}
						}
						if(temp==true&&is==1){
							document.getElementById("idcboCategory").value=forReturn;
							return true;
						}else {
							if(temp!=true){
								alert("Please select brand(s)");
								return false;
							}else if(is==0){
								alert(document.getElementById("idcboCategory").value+"is not have in list\n select again please!");
								return false;
							}
						}
					}
				</script>
				<form onsubmit="return validate()" name="sample" action="/warehouse/Sub_category_controller" method="post">

					<div class="modal-body p10">
						<!-- start subcategory insert form -->

						<% 
							List<Category> cl;
			
							cl=category_service.selectAll();
						%>
							<br>
							<div class="row">
								<div class="col-sm-1"></div>
								<div class="col-sm-4">
									<label for="lblName">Sub Category Name</label>
								</div>
								<div class="col-sm-5">
									<input class="u-full-width form-control" type="text"name="txtName" id="idtxtName" required />
								</div>
								<div class="col-sm-2"></div>
							</div><br>
							<div class="row">
								<div class="col-sm-1"></div>
								<div class="col-sm-4">
									<label for="lblCategory">Category</label>
								</div>
								<div class="col-sm-5">
								<input type="text" class="form-control2" name="cboCategory" id="idcboCategory"  onkeyup="filterFunction2()" autocomplete="off" required><button type="button" class="btn6" data-toggle="dropdown" id="btn6"><span class="caret"></span></button>
												<ul class="dropdown-menu dropdown-menu-center menu dropdown-content droplist">	        			
											<% for(Category ca:cl){ %>
												<li class="combobox" name="combobox" value="<% out.print(ca.getCategory_id()); %>" onclick="show2(this.innerHTML)"><% out.print(ca.getName()); %></li>
											<% } %>
												<li id="noMatchingSentence" class="noMatchingSentence">no matching data found.Click the follwing button.</li>
												<li class="combobox addBrandSub" onclick="shownewCategoryDiv()">New Category</li>
										</ul>
								</div>
								<div class="col-sm-2"></div>
							</div><br>
							<script type="text/javascript">
								function shownewCategoryDiv(){
									document.getElementById("newCategoryDiv").style.display="block";
									document.getElementById("newBrandDiv").style.display="none";
								}
								function hidenewCategoryDiv(){
									document.getElementById("newCategoryDiv").style.display="none";
									document.getElementById("newBrandDiv").style.display="none";
								}
							</script>
							<div class="row">
								<div class="col-sm-1"></div>
								<div class="col-sm-4">
									<label for="brand">Brand</label>
								</div>
								<%IBrandService brand_service = (IBrandService) SpringBeanFactory
			  							.getBean("BrandService");
								  List<Brand> bl=brand_service.selectAll();
								%>
								<div class="col-sm-5">
									<input type="text" class="form-control2" name="cboUserlevel" id="brandInput" placeholder="Select Brand(s)"  onkeyup="filterBrand()" autocomplete="off"><button type="button" class="btn6" data-toggle="dropdown" id="btnDropdown"><span class="caret"></span></button>
			  						<ul class="dropdown-menu dropdown-menu-center menu dropdown-content droplist">
			  						<%for(Brand b:bl){ %>
			  						<li name="combobox1">&nbsp;&nbsp;<input type="checkbox" name="brand" value="<%out.print(b.getBrand_id());%>"/><%out.print(b.getName()); %></li>
			  						<%} %>
			  						<li id="noMatchingSentenceForBrand" class="noMatchingSentence">no matching data found.Click the follwing button.</li>
			  						<li onclick="showNewBrandDiv()" class="addBrandSub">Add new brand</li>
			  						</ul>
								</div>
								<script type="text/javascript">
									function showNewBrandDiv(){
										document.getElementById("newCategoryDiv").style.display="none";
										document.getElementById("newBrandDiv").style.display="block";
									}
									function hideNewBrandDiv(){
										document.getElementById("newBrandDiv").style.display="none";
										document.getElementById("newCategoryDiv").style.display="none";
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
									<input class="u-full-width form-control" type="text" name="txtRemark" id="idtxtRemark" required />
								</div>
								<div class="col-sm-2"></div>
							</div><br>
							<div class="row" id="newBrandDiv">
								<div class="col-sm-1"></div>
								<div class="col-sm-10" style="border-style: solid;border-radius:15px;border-color: skyblue;">
								<center><h4>Add Brand</h4></center>
									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-4">
											<label for="lblName">Brand Name</label>
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
											<button type="button" class="btn btn-primary" onclick="AddNewBrand()">Add Brand</button>
										</div>
										<script type="text/javascript">
											function AddNewBrand(){
													var subName=document.getElementById("idtxtName").value;
													var category=document.getElementById("idcboCategory").value;
													var brand=document.getElementsByName("brand");
													var remark=document.getElementById("idtxtRemark").value;
													var bName=document.getElementById("idtxtName1").value;
													var remark1=document.getElementById("idtxtRemark1").value;
													var brandArray=new Array();
													var f=0;
													for ( var i = 0; i < brand.length; i++) {
														if(brand[i].checked){
															brandArray[f]=brand[i].value;
															f++;
														}
													
												}
												if(bName.length>0&&remark1.length>0){
													location.href="/warehouse/BrandController?page=AddBrand&txtName="+subName+"&category="+category
													+"&brand="+brandArray+"&txtRemark="+remark+"&txtName1="+bName+"&txtRemark1="+remark1;
												}else{
													
													if(bName.length<=0&&remark1.length<=0){
														alert("Please fill in brand and remark.");
													}else if(bName.length<=0){
														alert("Please fill in brand.");
													}else {
														alert("Please fill in remark");
													}
												}
											}
										</script>
										<div class="col-sm-4">
											<button class="btn btn-primary" type="button" onclick="hideNewBrandDiv()" id="hideBrand">Cancel</button>
										</div>
										<div class="col-sm-2"></div>
									</div><br>
								</div>
								<div class="col-sm-1"></div>
							</div>
							<div class="row displayNone" id="newCategoryDiv">
								<div class="col-sm-1"></div>
								<div class="col-sm-10" style="border-style: solid;border-radius:15px;border-color: skyblue;">
								<center><h4>Add Category</h4></center>
									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-4">
											<label for="lblName">Category Name</label>
										</div>
										<div class="col-sm-4">
											<input class="u-full-width form-control" type="text" name="txtNameFromSubAdd" id="idtxtNameFromSubAdd" />
										</div>
										<div class="col-sm-2"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-4">
											<label for="lblRemark">Remark</label>
										</div>
										<div class="col-sm-4">
											<input class="u-full-width form-control" type="text" name="txtRemarkFromSubAdd" id="idtxtRemarkFromSubAdd"/>
										</div>
										<div class="col-sm-2"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-4">
											<button type="button" class="btn btn-primary" onclick="AddNewCategory()">Add Category</button>
										</div>
										<script type="text/javascript">
											function AddNewCategory(){
													var subName=document.getElementById("idtxtName").value;
													var category=document.getElementById("idcboCategory").value;
													var brand=document.getElementsByName("brand");
													var remark=document.getElementById("idtxtRemark").value;
													var bName=document.getElementById("idtxtNameFromSubAdd").value;
													var remark1=document.getElementById("idtxtRemarkFromSubAdd").value;
													var brandArray=new Array();
													var f=0;
													for ( var i = 0; i < brand.length; i++) {
														if(brand[i].checked){
															brandArray[f]=brand[i].value;
															f++;
														}
													
												}
												if(bName.length>0&&remark1.length>0){
													location.href="/warehouse/CategoryController?page=AddCategoryFromSubAdd&txtName="+subName+"&category="+category
													+"&brand="+brandArray+"&txtRemark="+remark+"&txtName1="+bName+"&txtRemark1="+remark1;
												}else{
													alert(remark1.length);
													if(bName.length<=0&&remark1.length<=0){
														alert("Please fill in brand and remark.");
													}else if(bName.length<=0){
														alert("Please fill in brand.");
													}else {
														alert("Please fill in remark");
													}
												}
											}
										</script>
										<div class="col-sm-4">
											<button class="btn btn-primary" type="button" onclick="hidenewCategoryDiv()" id="hideCategory">Cancel</button>
										</div>
										<div class="col-sm-2"></div>
									</div><br>
								</div>
								<div class="col-sm-1"></div>
							</div>
						<!-- End subcategory insert form -->
					</div>

					<div class="modal-footer p10">

						<input type="submit" name="page" class="btn btn-default w3-container w3-light-blue p10" value="Add">
					 	<input type="button" class="btn btn-default w3-container w3-light-blue p10"	data-dismiss="modal" value="Close">
					</div>

				</form>

			</div>

		</div>

	</div>

	<!-- end of the add new of the row -->
	<script>
	function rowView(){
		document.getElementById("subcategoryname").innerHTML=arguments[0];
		document.getElementById("categoryname").innerHTML=arguments[1];
		document.getElementById("remark").innerHTML=arguments[2];
		document.getElementById("createdUser").innerHTML=arguments[3];
		document.getElementById("modifiedUser").innerHTML=arguments[4];
		document.getElementById("createdDate").innerHTML=arguments[5];
		document.getElementById("modifiedDate").innerHTML=arguments[6];
		if(arguments[7]=="1"){
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
	          		<h4 class="modal-title">Showing Each Sub Category Information</h4>
	       		</div>
	       		<form>
		        <div class="modal-body p10" style="height:430px;">
		          	
		          		<div class="form-group">
							<label class="control-label col-sm-6 right" for="subcategoryname">Sub Category name:</label>
								<div class="col-sm-3">
									<label class="control-label" id="subcategoryname"></label>
								</div>
							<div class="control-label col-sm-3"></div>
						</div><br>
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
					    <%
					    	List<Category> clist=category_service.selectAll();
					    %>
					      <!-- Modal content-->
					      	<div class="modal-content">
					        	<div class="modal-header w3-container w3-light-blue p10">
					         		<button type="button" class="close" data-dismiss="modal">&times;</button>
					          		<h4 class="modal-title">Editing Sub Category Information</h4>
					       		</div>
								<script>
					       		 function confirmEdit(){
					       			var brand=document.getElementsByName("brand2");
									var temp=false;
									for ( var i = 0; i < brand.length; i++) {
										if(brand[i].checked){
											temp=true;
										}
									}
									var forReturn=0;
					       			var a=document.getElementsByName("categoryFromSubEdit");
					       			var is=0;
									for (var i = 0; i < a.length; i++) {
										if(document.getElementById("idcboCategory2").value.toUpperCase()==a[i].innerHTML.toUpperCase()){
											forReturn=a[i].value;
											is=1;
											break;
										}else {
											is=0;
										}
									}
									if(temp==true&&is==1){
										if(confirm("Are you sure to edit!")){
											document.getElementById("idcboCategory2").value=forReturn;
						       				return true;
						       			 }else return false;
						       		 
									}else {
										if(temp==false){
											alert("Please select brand(s)");
										}else{
											alert(document.getElementById("idcboCategory2").value+"is not have in list\n select again please!");
										}
										return false;
									}
					       		 }
								</script>
								<script type="text/javascript">
									function beforeSubmit(){
										var subName=document.getElementById("idtxtName2").value;
										var category=document.getElementById("idcboCategory2").value;
										var brand=document.getElementsByName("brand2");
										var remark=document.getElementById("idtxtRemark2").value;
										var flag;var brandCheck=false;
										if(document.getElementById("idtxtFlag1").checked){
											flag="1";
										}else flag="0";
										var brandArray=new Array();
										var f=0;
										for ( var i = 0; i < brand.length; i++) {
											if(brand[i].checked){
												brandArray[f]=brand[i].value;
												f++;
											}
										
										}
										if(brand1.length==brandArray.length){
											for(var i=0;i<brand1.length;i++){
												if(brand1[i]==brandArray[i]){
													brandCheck=true;
												}else brandCheck=false;
											}
										}else brandCheck=false;
										//if(brandCheck){
											//document.getElementById("btnSubmit").disabled=true;
										//}else document.getElementById("btnSubmit").disabled=false;
										if(name1!=subName||category1!=category||remark1!=remark||flag1!=flag||brandCheck==false){
											document.getElementById("btnSubmit").disabled=false;
										}else document.getElementById("btnSubmit").disabled=true;
									}
								</script>
					       		<form onsubmit="return confirmEdit()" name="sample" action="/warehouse/Sub_category_controller" method="post">
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
									<label for="lblName">Sub Category Name</label>
								</div>
								<div class="col-sm-5">
									<input class="u-full-width form-control" type="text" name="txtName" id="idtxtName2" onkeyup="beforeSubmit()" required />
								</div>
								<div class="col-sm-2"></div>
							</div><br>
							<div class="row">
								<div class="col-sm-1"></div>
								<div class="col-sm-4">
									<label for="lblCategory">Category</label>
								</div>
								<div class="col-sm-5">
									<input type="text" name="cboCategory" class="form-control2" id="idcboCategory2" onkeyup="filterCategoryFromSubEdit()" autocomplete="off"><button type="button" class="btn6" data-toggle="dropdown" id="btnDropdownCategoryFromSubEdit"><span class="caret"></span></button>
									<ul class="dropdown-menu dropdown-menu-center menu dropdown-content droplist">
			  						<%for(Category ca:cl){ %>
			  						<li name="categoryFromSubEdit" value="<% out.print(ca.getCategory_id()); %>" onclick="show3(this.innerHTML)"><% out.print(ca.getName()); %></li>
			  						<% } %>
			  						<li id="noMatchingSentenceCategoryFromSubEdit" class="noMatchingSentence">no matching data found.Click the follwing button.</li>
			  						<li class="addBrandSub" onclick="showNewCategoryDiv1()">Add new Category</li>
			  						</ul>
								</div>
								<div class="col-sm-2"></div>
								<script type="text/javascript">
									function showNewCategoryDiv1(){
										document.getElementById("newCategoryDiv1").style.display="block";
										document.getElementById("newBrandDiv1").style.display="none";
									}
									function hideNewCategoryDiv1(){
										document.getElementById("newCategoryDiv1").style.display="none";
										document.getElementById("newBrandDiv1").style.display="none";
									}
								</script>
							</div><br>
							<div class="row">
								<div class="col-sm-1"></div>
								<div class="col-sm-4">
									<label for="brand">Brand</label>
								</div>
								<div class="col-sm-5">
									<input type="text" class="form-control2" id="idBrandFromSubEdit" placeholder="Select Brand(s)" onkeyup="filterBrandFromSubEdit()" autocomplete="off"><button type="button" class="btn6" data-toggle="dropdown" id="btnDropdownFromSubEdit"><span class="caret"></span></button>
									<ul class="dropdown-menu dropdown-menu-center menu dropdown-content droplist">
			  						<%for(Brand b:bl){ %>
			  						<li name="brandFromSubEdit">&nbsp;&nbsp;<input type="checkbox" name="brand2" value="<%out.print(b.getBrand_id());%>" onclick="beforeSubmit()"/><%out.print(b.getName()); %></li>
			  						<% } %>
			  						<li id="noMatchingSentenceFromSubEdit" class="noMatchingSentence">no matching data found.Click the follwing button.</li>
			  						<li class="addBrandSub" onclick="showNewBrandDiv1()">Add new brand</li>
			  						</ul>
								</div>
								<script type="text/javascript">
									function showNewBrandDiv1(){
										document.getElementById("newBrandDiv1").style.display="block";
										document.getElementById("newCategoryDiv1").style.display="none";
									}
									function hideNewBrandDiv1(){
										document.getElementById("newBrandDiv1").style.display="none";
										document.getElementById("newCategoryDiv1").style.display="none";
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
								<div class="col-sm-1"></div>
								<div class="col-sm-4">
									<label for="lblFlag">Flag</label>
								</div>
								<div class="col-sm-5">
									<input type="radio" value="1" name="txtFlag" id="idtxtFlag1" onclick="beforeSubmit(this.value)"/><font color="green">ON</font>&nbsp;&nbsp;
									<input type="radio" value="0" name="txtFlag" id="idtxtFlag2" onclick="beforeSubmit(this.value)"/><font color="red">OFF</font>
								</div>
								<div class="col-sm-2"></div>
							</div><br>
							<!-- for brand add from subcategory edit -->
							<div class="row" id="newBrandDiv1">
								<div class="col-sm-1"></div>
								<div class="col-sm-10" style="border-style: solid;border-radius:15px;border-color: skyblue;">
								<center><h4>Add Brand</h4></center>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-4">
											<label for="lblName">Brand Name</label>
										</div>
										<div class="col-sm-5">
											<input class="u-full-width form-control" type="text" name="txtName3" id="idtxtName3" />
										</div>
										<div class="col-sm-2"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-4">
											<label for="lblRemark">Remark</label>
										</div>
										<div class="col-sm-5">
											<input class="u-full-width form-control" type="text" name="txtRemark3" id="idtxtRemark3"/>
										</div>
										<div class="col-sm-2"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-4">
											<button type="button" class="btn btn-primary" onclick="AddNewBrand1()">Add Brand</button>
										</div>
										<script type="text/javascript">
											function AddNewBrand1(){
													var id=document.getElementById("idtxtId2").value;
													var subName=document.getElementById("idtxtName2").value;
													var category=document.getElementById("idcboCategory2").value;
													var brand=document.getElementsByName("brand2");
													var remark=document.getElementById("idtxtRemark2").value;
													var bName=document.getElementById("idtxtName3").value;
													var remark1=document.getElementById("idtxtRemark3").value;
													var flag;
													if(document.getElementById("idtxtFlag1").checked){
														flag="1";
													}else flag="0";
													var brandArray=new Array();
													var f=0;
													for ( var i = 0; i < brand.length; i++) {
														if(brand[i].checked){
															brandArray[f]=brand[i].value;
															f++;
														}
													
												}
													location.href="/warehouse/BrandController?page=Add&txtId="+id+"&txtName="+subName+"&category="+category
													+"&brand="+brandArray+"&txtRemark="+remark+"&txtName1="+bName+"&txtRemark1="+remark1+"&txtFlag="+flag;
											}
										</script>
										<div class="col-sm-4">
											<button class="btn btn-primary" type="button" onclick="hideNewBrandDiv1()">Cancel</button>
										</div>
										<div class="col-sm-2"></div>
									</div><br>
								</div>
								<div class="col-sm-1"></div>
							</div>
							<!-- end for brand add from sub category edit -->
							
							<!-- for category add from sub category edit -->
							<div class="row displayNone" id="newCategoryDiv1">
								<div class="col-sm-1"></div>
								<div class="col-sm-10" style="border-style: solid;border-radius:15px;border-color: skyblue;">
								<center><h4>Add Category</h4></center>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-4">
											<label for="lblName">Category Name</label>
										</div>
										<div class="col-sm-5">
											<input class="u-full-width form-control" type="text" id="idtxtNameFromSubEdit" />
										</div>
										<div class="col-sm-2"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-4">
											<label for="lblRemark">Remark</label>
										</div>
										<div class="col-sm-5">
											<input class="u-full-width form-control" type="text" id="idtxtRemarkFromSubEdit"/>
										</div>
										<div class="col-sm-2"></div>
									</div><br>
									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-4">
											<button type="button" class="btn btn-primary" onclick="AddNewCategory1()">Add Category</button>
										</div>
										<script type="text/javascript">
											function AddNewCategory1(){
													var id=document.getElementById("idtxtId2").value;
													var subName=document.getElementById("idtxtName2").value;
													var category=document.getElementById("idcboCategory2").value;
													var brand=document.getElementsByName("brand2");
													var remark=document.getElementById("idtxtRemark2").value;	
													var caName=document.getElementById("idtxtNameFromSubEdit").value;
													var remark1=document.getElementById("idtxtRemarkFromSubEdit").value;
													var flag="0";
													if(document.getElementById("idtxtFlag1").checked){
														flag="1";
													}else{
														flag="0";
													}
													var brandArray=new Array();
													var f=0;
													for ( var i = 0; i < brand.length; i++) {
														if(brand[i].checked){
															brandArray[f]=brand[i].value;
															f++;
														}
													
												}
												if(caName.length>0&&remark1.length>0){
													location.href="/warehouse/CategoryController?page=AddCategoryFromSubEdit&txtName="+subName+"&txtId="+id+"&category="+category
													+"&brand="+brandArray+"&txtRemark="+remark+"&txtName1="+caName+"&txtRemark1="+remark1+"&txtFlag="+flag;
												}else{
													//alert(remark1.length);
													if(caName.length<=0&&remark1.length<=0){
														alert("Please fill in brand and remark.");
													}else if(caName.length<=0){
														alert("Please fill in brand.");
													}else {
														alert("Please fill in remark");
													}
												}
											}
										</script>
										<div class="col-sm-4">
											<button class="btn btn-primary" type="button" onclick="hideNewCategoryDiv1()" id="hideCategory11">Cancel</button>
										</div>
										<div class="col-sm-2"></div>
									</div><br>
								</div>
								<div class="col-sm-1"></div>
							</div>
							<!-- end for category add from sub category edit -->
						<!-- End subcategory insert form -->
					</div>
						      
						        <div class="modal-footer p10">

						        	<input type="submit" id="btnSubmit" class="btn btn-default w3-container w3-light-blue p10"  name="page" value="Edit" disabled/>

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
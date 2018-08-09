<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.*"%>
<%@page import="com.java.plyd.service.*"%>
<html>
<head>
	<title>Stock In </title>
	<%@ include file="link.jsp" %>
<script type="text/javascript">

function insertmerchandiseValue(){
	if(arguments[0]!=""){
		document.getElementById("cbomerchandise").value=arguments[0];
	}else document.getElementById("cbomerchandise").value="0";
}
</script>
</head>
<body class="w3-container w3-light-gray" onload="insertmerchandiseValue('<%out.print(request.getAttribute("merchandiseID"));%>')">
	<%@include file="header.jsp" %>
					<script type="text/javascript">
						function selectMerchandise(){
							var merchandise=document.getElementById("cbomerchandise").value;
							location.href="/warehouse/Stock_inDetailController?page=filterMerchandise&merchandiseid="+merchandise;
						}
					</script>
					<div class="row panel-body p10">
					<!-- inserting the code for each operation -->
					<div class="col-sm-9">
						<div class="row p10">
							<div class="panel panel-default">
						  		<div class="w3-container p10 row">
						  			<div class="col-sm-6"><h4>Stock In Detail Information</h4></div>
						  			<div class="col-sm-3" style="text-align: right;padding-top: 8px;padding-right: 0px;">Select Merchandise:</div>
						  			<div class="col-sm-3">
						  				<select class="form-control" id="cbomerchandise" name="cbomerchandise" onchange="selectMerchandise()">
						  					<option value="0">All Merchandise</option>
						  				<%MerchandiseService merchandiseService=(MerchandiseService)SpringBeanFactory.getBean("MerchandiseService");
										  List<Merchandise> merchandiseList=(List<Merchandise>)merchandiseService.selectAll();
										  for(Merchandise m:merchandiseList){
										%>
											<option value="<%out.print(m.getMerchandise_id());%>"><%out.print(m.getName()); %></option>
						  				<%} %>
						  				</select>
						  			</div>		
						  		</div>

						  		<!--end of Body column -->
						  		<!--Panel-->


<div class="panel-body p10">
				<!-- for body part of the body column -->
		  			<!-- start of search result table -->
		  			<%List<Stock_InDetail> stock_indetaillist=(List<Stock_InDetail>)request.getAttribute("stockoutdetail"); %>
		  			
		  			<table id="example"  class="table table-condensed table-bordered p10">
		  				<caption class="w3-container w3-text-black w3-myfont"></caption>
					    <thead class="w3-container w3-light-blue p10">
					      <tr>
					        
					        <th>Merchandise</th>
					        <th>Qty</th>
					       
					      </tr>
					    </thead>
					    <tbody>
						
						<tr>
							<%
							Object mer=(request.getAttribute("merchandiseID"));
						Integer i=(Integer)mer; 
						//int aa=Integer.parseInt(mer);
						
								Merchandise m=(Merchandise)merchandiseService.selectMerchandise(i);%>
						
					
							<td>
							
							<% 
							
							out.print(m.getName());
							%>
							
							</td>
							<td>
								<%
									out.println(request.getAttribute("SumQty"));
								%>
							</td>
							
				      </tr>
				    </tbody>
				  </table>
	  			<!-- end of search result table -->
	  		</div>
		</div>
	</div>
</div>




<!-- end of inserting the code for each operation -->
<%@ include file="right.jsp" %>
</body>
</html>
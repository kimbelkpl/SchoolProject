
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.*"%>
<%@page import="com.java.plyd.service.*"%>
<html>
<head>
	<title>Stock Balance</title>
	<%@ include file="link.jsp" %>
<script type="text/javascript">

function insertWarehouseValue(){
	if(arguments[0]!=""){
		document.getElementById("cbowarehouse").value=arguments[0];
	}else document.getElementById("cbowarehouse").value="0";
}
</script>
</head>
<body class="w3-container w3-light-gray" onload="insertWarehouseValue('<%out.print(request.getAttribute("warehouseId"));%>')">
	<%@include file="header.jsp" %>
					<script type="text/javascript">
						function selectWarehouse(){
							var warehouse=document.getElementById("cbowarehouse").value;
							location.href="/warehouse/StockBalanceController?page=filterWarehouse&warehouseId="+warehouse;
						}
					</script>
					<div class="row panel-body p10">
					<!-- inserting the code for each operation -->
					<div class="col-sm-9">
						<div class="row p10">
							<div class="panel panel-default">
						  		<div class="w3-container p10 row">
						  			<div class="col-sm-6"><h4>Stock Balance Information</h4></div>
						  			<div class="col-sm-3" style="text-align: right;padding-top: 8px;padding-right: 0px;">Select Warehouse:</div>
						  			<div class="col-sm-3">
						  				<select class="form-control" id="cbowarehouse" name="cbowarehouse" onchange="selectWarehouse()">
						  					<option value="0">All Warehouse</option>
						  				<%WarehouseService warehouseService=(WarehouseService)SpringBeanFactory.getBean("WarehouseService");
										  List<Warehouse> warehouseList=(List<Warehouse>)warehouseService.selectAll();
										  for(Warehouse w:warehouseList){
										%>
											<option value="<%out.print(w.getId());%>"><%out.print(w.getWareName()); %></option>
						  				<%} %>
						  				</select>
						  			</div>		
						  		</div>

						  		<!--end of Body column -->
						  		<!--Panel-->


<div class="panel-body p10">
				<!-- for body part of the body column -->
		  			<!-- start of search result table -->
		  			<%List<Stock_Balance> stockBalanceList=(List<Stock_Balance>)request.getAttribute("stockBalanceList"); %>
		  			
		  			<table id="example"  class="table table-condensed table-bordered p10">
		  				<caption class="w3-container w3-text-black w3-myfont"></caption>
					    <thead class="w3-container w3-light-blue p10">
					      <tr>
					        <th>Merchandise</th>
					        <th>Warehouse</th>
					        <th>Qty</th>
					        <th>Remark</th>
					      </tr>
					    </thead>
					    <tbody>
						
							<%
							for(Stock_Balance stockBalance: stockBalanceList){
						%>
						<tr>
							<%
							  MerchandiseService merchandiseService=(MerchandiseService)SpringBeanFactory.getBean("MerchandiseService");
							  Merchandise merchandise=(Merchandise)merchandiseService.selectMerchandise(stockBalance.getMerchandise_id());
							  Warehouse warehouse=(Warehouse)warehouseService.selectwarehouse(stockBalance.getWarehouse_id());
							%>
							<td>
								<%
									out.print(merchandise.getName());
								%>
							</td>
							
							<td>
								<%
									out.println(warehouse.getWareName());
								%>
							</td>
							<td>
								<%
									out.println(stockBalance.getQty());
								%>
							</td>
							<td>
								<%
									out.println(stockBalance.getRemark());
								%>
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
<%@ include file="right.jsp" %>
</body>
</html>
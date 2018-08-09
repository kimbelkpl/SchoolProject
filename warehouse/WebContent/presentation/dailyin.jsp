<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*"%>
<%@page import="com.java.plyd.service.*"%>

<html>
<head>
<title>StockIn Information</title>
<%@ include file="link.jsp" %>
</head>

<body>
<body class="w3-container w3-light-gray">
	<%@ include file="header.jsp" %>

				<div class="row panel-body p10">
					<!-- inserting the code for each operation -->
					<div class="col-sm-9">
						<div class="row p10">
							<div class="panel panel-default">
								<div class="panel-heading w3-container w3-light-blue p10">
			  						<span class="dropdown">
			  							<button type="button" class="btn w3-container w3-light-blue p-header-btn dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-export"></span> Export </button>
										  <ul class="dropdown-menu p10">
										    <li class="w3-container w3-text-black w3-hover-blue w3-hover-text-white p10"> Merchanise</li>
										    <li class="divider"></li>
										    <li class="w3-container w3-text-black w3-hover-blue w3-hover-text-white p10"> Warehouse</li>
										    <li></li>
										  </ul>
			  						</span>			  						
						  		</div> 

								<!--end of Body column -->
								<!--Panel-->


								<div class="panel-body p10">
									<!-- start of search result table -->

									<script type="text/javascript">
						  			function checkDate()
						  			{
						  				var start=document.getElementById("sdid").value;

						  				if(start=="")
					  					{
					  					alert(start+"empty");
					  					return false;
					  					}
					  				else
					  					{
						  				
						  				if(start<=end)
						  					{
						  					//alert(start +"true");
						  					return true;
						  					}
						  				else
						  					{
						  					alert(end +"your start date must be less than end date");
						  					return false;
						  					}
					  					}
						  			}
						  		</script>

									<form action="/warehouse/Stock_inDetailController"
										onsubmit="return checkDate()">
										<div class="row">
											<div class="col-sm-4">
												<input type="date" id="sdid" name="startdtxt" placeholder="Start Date" />
											</div>

											
											<div class="col-sm-4">
												<input class="btn btn-default w3-light-blue" type="submit" value="DailyMerchandise"
													name="page" />
											</div>
										</div>

									</form>
												<style>
#stockinSearch tbody tr{
transition:all .25s ease-in-out
}
#stockinSearch tbody tr:hover { background-color: skyblue; cursor:pointer;

}
</style>
			
									<table id="stockinSearch"
										class="table table-condensed table-bordered p10">
										<thead class="w3-container w3-light-blue p10">
											<tr>
												
												<th>Stock In Date</th>
												<th>Merchandise Name</th>
												<th>Qty</th>
											</tr>
										</thead>


										<%
										String startdate=(String)request.getAttribute("start");
										String search=(String)request.getAttribute("search");
										
										Stock_in stockIn=new Stock_in();
										boolean t=true;
											IStock_InDetailService stdservice=(IStock_InDetailService) SpringBeanFactory
											.getBean("Stock_InDetailService");
									   	IStock_inService  stock_inService= (IStock_inService) SpringBeanFactory
										.getBean("Stock_inService");
									   	List<Stock_in> stock_inList=null;
									   	
									   	if(search.equals("search"))
									   	{%>
									   	
									   		<script>
									   	//alert("hi");
									   	var st='<%=startdate%>';
									   	
									   
									   		document.getElementById("sdid").value=st;
							  				
							  				
							  			</script>
									   	
							  				
							  			<%
									   		stockIn.setStockIndate(startdate);
									   		
									   		try{
									   			stock_inList = stock_inService.selectAllByDailySumMerchandise(stockIn);
									   			t=true;
									   			System.out.println(t+"\tT");
									   		}catch(NullPointerException ne)
									   		{
									   			t=false;
									   			System.out.println(t+"There is no data entries from catch");
									   		}
									   		
									   		if(stock_inList==null | stock_inList.equals("")| stock_inList.equals(null))
									   		{
									   			t=false;
									   			System.out.println(t+"There is no data entries");
									   		}
									   		else
									   			System.out.println(t+"  from else ");
									   		
									   	}
									   	else
									   	{
									   		 stock_inList = stock_inService.selectAll();
									   	}
								
								List<Stock_InDetail>stdList=stdservice.selectAll();
												IUserService userservice=(IUserService)SpringBeanFactory.getBean("UserService");
												
												 
										%>

										<tbody>
											<%
												for(Stock_in s:stock_inList){
												for (Stock_InDetail stock : stdList) {
											%>
											<tr>
												<%
													if(s.getStockInId()==stock.getStock_in_id()) {
												%>
												
												<td>
													<%
														out.println(s.getStockIndate());
													%>
												</td>

												<td>
													<%
														//out.println(stock.getMerchandise_name());
													out.println(stock.getMerchandise_id());
													%>
												</td>
												<td>
													<%
														out.println(stock.getQty());
													%>
												</td>
												
												
												


												 
														<%
															}
														%>
														<%
															}
														%>
												
											
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
					



					<div class="col-sm-3 p10">
						<!-- first notification panel 1 -->
						<div class="row">
							<div class="panel panel-default">
								<div class="panel-heading w3-container w3-light-blue p10">Panel
									Heading</div>
								<div class="panel-body">Panel Content</div>
							</div>
						</div>
						<!-- end of first notification panel 1 -->
						<!-- first notification panel 2 -->
						<div class="row">
							<div class="panel panel-default">
								<div class="panel-heading w3-container w3-light-blue p10">Panel
									Heading</div>
								<div class="panel-body">Panel Content</div>
							</div>
						</div>
						<!-- end of first notification panel 2 -->
						<!-- first notification panel 3 -->
						<div class="row">
							<div class="panel panel-default">
								<div class="panel-heading w3-container w3-light-blue p10">Panel
									Heading</div>
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
	<!-- Start add function -->
	<script src="jquery.js"></script>
	<script type="text/javascript">
    $(document).ready(function(){
        $(".add-row").click(function(){
            var merchandise = $("#cboMerchandise").val();
            var qty = $("#txtQty").val();
            var subunit = $("#cbosubunit").val();
            var remark = $("#txtRemark").val();  
            var voucher=$("#txtVoucherNo").val();
            var merid=$("#merchandise").val();
            var markup = "<tr><td><center><input type='hidden' name='merid' value='"+merid+"'/>"+merid+"</center></td><td><input type='hidden' name='cboMerchandise' value= '" + merchandise +"'/>" + merchandise + "</td><td><input type='hidden' name='txtQty' value='"+qty+"'/>" + qty +"</td><td><input type='hidden' name='cbosubunit' value='" + subunit +"'/>" + subunit +"</td><td><input type='hidden' name='txtRemark' value='"+remark+"'/>" + remark+"</td><td><input type='hidden' name='txtVoucherNo' value='"+voucher+"'/>"+voucher +"</td><td><input type='checkbox' name='record'  /> </td></tr>";
            $("#table1 tbody").append(markup);
        });
        
        // Find and remove selected table rows
         $(".delete-row").click(function(){
            $("#table1 tbody").find('input[name="record"]').each(function(){
            	if($(this).is(":checked")){
                    $(this).parents("tr").remove();
                }
            });
        });
    });     
</script>

	<!--  End add function-->

	

</body>
</html>
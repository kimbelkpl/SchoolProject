<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*"%>
<%@page import="com.java.plyd.service.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Excel</title>
</head>
<body>
	<h1>Export to Excel Example</h1>
	<table cellpadding="1" cellspacing="1" border="1" bordercolor="gray">
		<tr>
			<td>Stock Out Detail Id</td>
			<td>Stock Out Date</td>
			<th>Warehouse Name</th>
			<td>Merchandise Name</td>
			<td>Qty</td>
			<td>Sub Unit</td> 
			<td>Remark</td>
			
		</tr>
		<%
		IStockoutdetailService stockoutdetailService = (IStockoutdetailService) SpringBeanFactory
		.getBean("StockoutdetailService");
		IStock_outService  stock_outService= (IStock_outService) SpringBeanFactory
				.getBean("Stock_outService");
			List<StockoutDetail> soutdetaill=(List<StockoutDetail>)stockoutdetailService.selectOrder();
		List<Stock_out> soutlist=(List<Stock_out>)stock_outService.selectAll();
		
			if(soutdetaill!=null){
				response.setContentType("application/vnd.ms.excel");
				response.setHeader("Content-Disposition", "inline; filename="+"stockoutDetail.xls");
				//System.out.println("finish excel");
			}
			
		for(StockoutDetail sin:soutdetaill){
			for(Stock_out s:soutlist){
		%>
			<%
		if(s.getStock_out_id()==sin.getStockoutid()) {
												%>
		<tr>
	
			<td><%out.print(sin.getStockoutdetail_id()); %></td>
			<td><%out.print(s.getStock_out_date()); %></td>
			<td><%out.print(s.getFromwarehouse_id()); %>
			<%-- <td><%out.print(sin.getMerchandise()); %></td> --%>
			<td><%out.print(sin.getMerchandise_id()); %></td>
			<td><%out.print(sin.getQty()); %></td>
			<td><%out.print(sin.getSubunit()); %></td> 
			<td><%out.print(sin.getRemark()); %></td>
			
			
		</tr>
		<%}} }%>
	</table>
</body>
</html>
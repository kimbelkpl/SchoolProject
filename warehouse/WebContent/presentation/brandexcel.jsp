<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.util.*"%>
<%@page import="com.java.plyd.service.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Excel</title>
</head>
<body>
	<h1>Export to Excel Example</h1>
	<table cellpadding="1" cellspacing="1" bordercolor="gray">
		<tr>
			<td>Name</td>
			<td>Remark</td>
			<td>Created User</td>
			<td>Modified User</td>
			<td>Created Date</td>
			<td>Modified Date</td>
		</tr>
		<%
			List<Brand> bl=(List<Brand>)request.getAttribute("bl");
			if(bl!=null){
				response.setContentType("application/vnd.ms.excel");
				response.setHeader("Content-Disposition", "inline; filename="+"brand.xls");
			}
		for(Brand b:bl){
			%>
			<tr>
				<td><%out.print(b.getName()); %></td>
				<td><%out.print(b.getRemark()); %></td>
				<td><%out.print(b.getCreated_user_id()); %></td>
				<td><%out.print(b.getModified_user_id()); %></td>
				<td><%out.print(b.getCreated_date()); %></td>
				<td><%out.print(b.getModified_date()); %></td>
			</tr>
			
		<%
			}
		%>
	</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.util.*"%>
<%@page import="com.java.plyd.service.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>Start Page</title>
<%@ include file="link.jsp" %>
</head>
<body class="w3-container w3-light-gray">
				<%@ include file="header.jsp" %>
					<!-- inserting the code for each operation -->
					<div class="col-sm-9">
						<div class="row p10">
							<div class="panel panel-default">
						  		
		  		<div class="panel-body p10">
		  			<!-- start of search result table -->
		  			<br>
		  			<br>
		  			<br>
		  			<center><h1>Welcome! <%=uname %></h1></center>
		  			<br>
		  			<br>
		  			<br>
		  		</div>
			</div>
		</div>
	</div>
	<!-- end of inserting the code for each operation -->

	
	<%@ include file="right.jsp" %>
				
</body>
</html>
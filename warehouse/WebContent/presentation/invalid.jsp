
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Login Form</title>
 <%@ include file="link.jsp" %>
 <script type="text/javascript">
 function invalid(){
 	document.getElementById("error").innerHTML=arguments[0];
 	document.getElementById("un").value=arguments[1];
 	document.getElementById("pw").value=arguments[2];
 }
 </script>
   
</head>
<body onload="invalid('<%out.print(request.getAttribute("error"));%>','<%out.print(request.getAttribute("username"));%>','<%out.print(request.getAttribute("password"));%>')">
	<br><br><br><br>
	<div class="container-fluid">
	<br><br><br><br><br>
	<div class="row">
	<div class="col-sm-4"></div>
	<div class="col-sm-4 divStyle">
	<center>
		
		<h3>Login</h3><br>
        <form action="/warehouse/UserController" name="sample" method="post">
        <table class="tableLogin">
        <tr>
        	<td>
        		<input class="u-full-width form-control1" placeholder="Username" type="text" name="un" id="un" required/>
            </td>
        </tr>
        <tr>
        <td>&nbsp;</td>
        </tr>
        <tr>
        	<td>
        		<input class="u-full-width form-control1" type="password" placeholder="Password" name="pw" id="pw" required/>
        	</td>
        </tr>
        <tr>
        <td>&nbsp;</td><td>&nbsp;</td>
        </tr>
        <tr>
        <td>&nbsp;</td><td>&nbsp;</td>
        </tr>
        <tr><td>
        <center><input class="btn btn-primary btn-block" type="submit" value="login"
         name="page" /></center></td>
         </tr>
        </table>
        </form>
        <br>
        <font color="red"><label id="error"></label></font>
        <br>
	</center>
	</div>
	<div class="col-sm-4"></div>
	</div>
	</div>
</body>
</html>
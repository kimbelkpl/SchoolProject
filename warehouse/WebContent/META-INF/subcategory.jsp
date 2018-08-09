<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sub Category Page</title>
<link rel="stylesheet" type="text/css" href="../bootstrap/dist/css/bootstrap.min.css">
   <script src="../JQuery/jquery.js"></script>
  <script src="../bootstrap/dist/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="../ownCss/style.css">
  <script src="../jss/brand.js"></script>
  <script>
  function validate(){
	
	var len = document.forms["sample"]["txtName"].value.length;
	var len1 = document.forms["sample"]["txtRemark"].value.length;
	if(len==0&&len1==0){
		alert("Please fill all information");
		}else if(len==0){
			alert("Please fill brand name!");
			return false;
		}else if(len1==0){
		alert("Please fill remark!");
		return false;
	}
}</script>
</head>
<body>
  <div class="cotainer-fluid">
  <div class="row">
			<nav class="navbar navbar-default" id="ff">
        		<div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="hidden-xs" href="#" style="margin-left:30px;"><img class="pull-left imglogo" style="margin:10px 0px;" src="../images/logo1.gif"></a>
            <a class="visible-xs navbar-brand" href="#">Warehouse</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right ul1" style="margin-right:30px;padding-top:25px;">
                <li><a href="#">Home</a></li>
                <li><a href="#">News</a></li>
                <li><a href="#">AboutUs</a></li>
                <li><a href="#">ContactUs</a></li>
                <!-- For dropdown box of page4 -->
              <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Major Pages
                  <span class="caret"></span></a>
                  <ul class="dropdown-menu ul2">
                     <li><a href="#"><b>Customer</b></a></li>
                    <li><a href="#"><b>Supplier</b></a></li>
                    <li><a href="brand.jsp"><b>Brand<b></a></li>
                    <li><a href="category.jsp"><b>Category<b></a></li>
                    <li><a href="subcategory.jsp"><b>SubCategory<b></a></li>
                    <li><a href="#"><b>Stock_In<b></a></li>
                    <li><a href="#"><b>Stock_Out<b></a></li>
                    </ul>
              </li>
                  <!-- End of droup page4 -->
              </ul>
          </div><!--/.nav-collapse -->
        		</div><!--/.container-fluid -->
      </nav>
    </div>
    <div class="row">
      <div class="col-md-4"></div>
      <div class="col-md-4">
        <h3>Sub Category</h3><br><br>
       <form onsubmit="return validate()" name="sample">
        <table>
        <tr>
        <td><label name="lblName">Category Name</label></td><td><input
              class="u-full-width form-control" type="text" name="txtName" id="txtName"/></td>
        </tr>
        <tr>
        <td>&nbsp;</td><td>&nbsp;</td>
        </tr>
        <tr>
        <td><label name="lblSubCategory">Sub Category</label></td>
        <td>
          <select name="cboCategory" style="width:100%;">
              <option>Something</option>
              <option>Something</option>
            </select>
        </td>
        </tr>
        <tr>
        <td>&nbsp;</td><td>&nbsp;</td>
        </tr>
        <tr>
        <tr>
        <td><label name="lblRemark">Remark</label></td><td><input
              class="u-full-width form-control" type="text" name="lblRemark" id="txtRemark"/></td>
        </tr>
        <tr>
        <td>&nbsp;</td><td>&nbsp;</td>
        </tr>
        <tr><td>
        <center><input class="btn btn-primary" type="submit" value="Submit"
         name="btnSubmit"/></center></td>
          <td>
        <center><input class="btn btn-primary" type="reset" value="Cancel"
         name="btnCancel"/></center></td>
         </tr>
        </table>
        </form>
      </div>
      <div class="col-md-4"></div>
    </div>
  </div>
</body>
</html>
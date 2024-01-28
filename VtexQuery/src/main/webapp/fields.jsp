<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Search for your Vtex data</title>
<!-- HTML5 Shim and Respond.js IE9 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="codedthemes">
<meta name="keywords"
	content=", Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
<meta name="author" content="codedthemes">

<!-- Favicon icon -->
<link rel="shortcut icon" href="assets/images/favicon.png"
	type="image/x-icon">
<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">

<!-- Google font-->
<link href="https://fonts.googleapis.com/css?family=Ubuntu:400,500,700"
	rel="stylesheet">

<!-- themify -->
<link rel="stylesheet" type="text/css"
	href="assets/icon/themify-icons/themify-icons.css">

<!-- iconfont -->
<link rel="stylesheet" type="text/css"
	href="assets/icon/icofont/css/icofont.css">

<!-- simple line icon -->
<link rel="stylesheet" type="text/css"
	href="assets/icon/simple-line-icons/css/simple-line-icons.css">

<!-- Required Fremwork -->
<link rel="stylesheet" type="text/css"
	href="assets/plugins/bootstrap/css/bootstrap.min.css">

<!-- Style.css -->
<link rel="stylesheet" type="text/css" href="assets/css/main.css">

<!-- Responsive.css-->
<link rel="stylesheet" type="text/css" href="assets/css/responsive.css">
</head>
<body>
	<!-- <div class="content-wrapper"> -->
		<!-- Container-fluid starts -->
		<div class="container-fluid">
			<!-- Row Starts -->
			<div class="row">
				<div class="col-sm-12 p-0">
					<div class="main-header">
						<h4>Search for your Vtex data</h4>
						<ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
							<li class="breadcrumb-item"><i class="icofont icofont-home"></i></li>
							<li class="breadcrumb-item">Pages</li>
							<li class="breadcrumb-item">Account selection</li>
							<li class="breadcrumb-item">Data Table selection</li>
							<li class="breadcrumb-item">Field selection</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- Row end -->
			<div class="row">
				<div class="col-md-6">
					<div class="card">
						<div class="card-block">
							<div class="md-card-block">
								<p class="m-b-20">
	                              <span class="f-w-600 f-16 d-block m-b-10">Select the Data Table you need to search from: </span> 
	                              You have selected the account: <strong><%=session.getAttribute("accounts") %></strong></p>
                           		<p class="m-b-20">You have selected the table: <strong><%=session.getAttribute("table") %></strong> </p>
                           		<p class="m-b-20">Select the field of the chosen table to search:</p>
                           		<form id="table_selection" name="table_selection" method="post" action="${pageContext.request.contextPath}/Search">
                           		<% 
                           		String table = (String) session.getAttribute("table");
                           		if(table.equalsIgnoreCase("Sku")) {
                           			out.println("<input type='radio' id='ProductName' name='sku_fields' value='ProductName' checked='checked'>"); 
									out.println("<label for='ProductName'>Product name</label><br/>"); 
									out.println("<input type='radio' id='IsActive' name='sku_fields' value='IsActive'>"); 
									out.println("<label for='IsActive'>Is Active? (0 or 1)</label><br/>");
									/*
									request.setAttribute("Sku", session.getAttribute("table")); 
									request.setAttribute("bu", request.getAttribute("account"));
									*/
                           		 } else if (table.equalsIgnoreCase("Order")) {
                           			out.println("<input type='radio' id='Status' name='sku_fields' value='Status'>"); 
									out.println("<label for='Status'>Status</label><br/>"); 
									out.println("<input type='radio' id='FirstName' name='sku_fields' value='FirstName'>"); 
									out.println("<label for='FirstName'>Firstname</label><br/>");
									out.println("<input type='radio' id='Email' name='sku_fields' value='Email'>"); 
									out.println("<label for='Email'>Email (insert a valid email address)</label><br/>");
									out.println("<input type='radio' id='CreationDate' name='sku_fields' value='CreationDate'>"); 
									out.println("<label for='CreationDate'>Creation date (platform doesn't work for date = something)</label><br/>");
									out.println("<input type='radio' id='PaymentSystemName' name='sku_fields' value='PaymentSystemName'>"); 
									out.println("<label for='PaymentSystemName'>Payment system</label><br/>");
									/*
									request.setAttribute("Order", request.getParameter("data_table"));
									request.setAttribute("bu", request.getAttribute("account"));
									*/
                           		 } else if (table.equalsIgnoreCase("Product")) {
                           			out.println("<input type='radio' id='Name' name='sku_fields' value='Name'>"); 
									out.println("<label for='Name'>Name</label><br/>"); 
									out.println("<input type='radio' id='Description' name='sku_fields' value='Description'>"); 
									out.println("<label for='Description'>Description</label><br/>");
									out.println("<input type='radio' id='ReleaseDate' name='sku_fields' value='ReleaseDate'>"); 
									out.println("<label for='ReleaseDate'>Release date (yyyy-MM-dd)</label><br/>");
									out.println("<input type='radio' id='IsActive' name='sku_fields' value='IsActive'>"); 
									out.println("<label for='IsActive'>Is Active? (0 Or 1)</label><br/>");
									/*
									request.setAttribute("Product", request.getParameter("data_table")); 
									request.setAttribute("bu", request.getAttribute("account"));
									*/
                           		 } else if (table.equalsIgnoreCase("Category")) {
                           			out.println("<input type='radio' id='Name' name='sku_fields' value='Name'>"); 
									out.println("<label for='Name'>Name</label><br/>"); 
									/*
									request.setAttribute("Category", request.getParameter("data_table"));
									request.setAttribute("bu", request.getAttribute("account"));
									*/
                           		 }
                           		%>
                           		<input type="text" id="search_text" name="search_text" placeholder="Insert what to search for">
                           		<input type="submit" id="submit_fields" value="Search"><br/>
                           		<input type="button" id="fields_back" value="Back" onclick="window.history.back()" style="margin-top: 5px;">
								</form>
								<!-- 
								<button id="next">Next</button>
								 -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Container-fluid ends -->
	<!-- </div>  -->

	<!-- Warning Section Starts -->
	<!-- Older IE warning message -->
	<!--[if lt IE 9]>
<div class="ie-warning">
    <h1>Warning!!</h1>
    <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
    <div class="iew-container">
        <ul class="iew-download">
            <li>
                <a href="http://www.google.com/chrome/">
                    <img src="assets/images/browser/chrome.png" alt="Chrome">
                    <div>Chrome</div>
                </a>
            </li>
            <li>
                <a href="https://www.mozilla.org/en-US/firefox/new/">
                    <img src="assets/images/browser/firefox.png" alt="Firefox">
                    <div>Firefox</div>
                </a>
            </li>
            <li>
                <a href="http://www.opera.com">
                    <img src="assets/images/browser/opera.png" alt="Opera">
                    <div>Opera</div>
                </a>
            </li>
            <li>
                <a href="https://www.apple.com/safari/">
                    <img src="assets/images/browser/safari.png" alt="Safari">
                    <div>Safari</div>
                </a>
            </li>
            <li>
                <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                    <img src="assets/images/browser/ie.png" alt="">
                    <div>IE (9 & above)</div>
                </a>
            </li>
        </ul>
    </div>
    <p>Sorry for the inconvenience!</p>
</div>
<![endif]-->
	<!-- Warning Section Ends -->

	<!-- Required Jqurey -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	
	</script>
	
	<script src="assets/plugins/jquery/dist/jquery.min.js"></script>
	<script src="assets/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="assets/plugins/tether/dist/js/tether.min.js"></script>

	<!-- Required Fremwork -->
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

	<!-- waves effects.js -->
	<script src="assets/plugins/Waves/waves.min.js"></script>

	<!-- Scrollbar JS-->
	<script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>
	<script src="assets/plugins/jquery.nicescroll/jquery.nicescroll.min.js"></script>

	<!--classic JS-->
	<script src="assets/plugins/classie/classie.js"></script>

	<!-- notification -->
	<script src="assets/plugins/notification/js/bootstrap-growl.min.js"></script>

	<!-- custom js -->
	<script type="text/javascript" src="assets/js/main.min.js"></script>
	<script type="text/javascript" src="assets/pages/elements.js"></script>
	<script type="text/javascript" src="assets/js/menu.min.js"></script>
</body>
</html>
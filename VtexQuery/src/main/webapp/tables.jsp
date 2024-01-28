<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.mpsilvestri.entity.Token"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

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
	                              You have selected the account: <strong><%=session.getAttribute("accounts") %></strong>
                           		</p>
                           		<p class="m-b-20">You have the following Data Tables available for search:</p>
								<form id="table_selection" name="table_selection" method="post" action="${pageContext.request.contextPath}/Fields">
									<input type="radio" id="Sku" name="data_table" value="Sku" checked='checked'>
									<label for="Sku">Sku</label>&nbsp;&nbsp;<label class="bg-primary" id="sku_count"></label><br/>
									<input type="radio" id="Order" name="data_table" value="Order">
									<label for="Order">Order</label>&nbsp;&nbsp;<label class="bg-primary" id="order_count"></label><br/>
									<input type="radio" id="Product" name="data_table" value="Product">
									<label for="Product">Product</label>&nbsp;&nbsp;<label class="bg-primary" id="product_count"></label><br/>
									<input type="radio" id="Category" name="data_table" value="Category">
									<label for="Category">Category</label>&nbsp;&nbsp;<label class="bg-primary" id="category_count"></label><br/>
									<input type="button" id="tables_back" value="Back" onclick="window.history.back()">
									<input type="submit" id="submit_table" value="Next">
								</form>
								
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
	
	<% String business_unit = (String) session.getAttribute("accounts"); %>
	let unit_script = '<% out.print(business_unit); %>';
	
	<% 
		String api_key = "";
		int server = 0;
		List<Token> tokens = (List<Token>) session.getAttribute("values");
		for (Token token : tokens)
			if(token.getUnit().equalsIgnoreCase(business_unit)) {
				api_key = token.getApi_key();
				server = token.getServer();
			}
	%>
	
	let api_key_script = '<% out.print(api_key); %>';
	let server_script = '<% out.print(server); %>';
	
	/*
    var request = new XMLHttpRequest();
    request.open("POST","https://api"+server_script+".esv2.com/v2/Api/DataTablesGetDataCount");
    request.setRequestHeader("Access-Control-Allow-Credentials", "true");
    request.setRequestHeader("Access-Control-Allow-Origin", "http://localhost:8082");
    request.setRequestHeader("Access-Control-Allow-Origin", "GET,OPTIONS,PATCH,DELETE,POST,PUT");
    // request.setRequestHeader("Access-Control-Allow-Origin", "http://localhost:8082");
    var xmlDoc;
    request.onreadystatechange = function() {
        if (request.readyState == 4 && request.status == 200) {
        xmlDoc = request.responseXML;
        console.log(xmlDoc);
        alert(xmlDoc);
        } else {
        	xmlDoc = request.responseXML;
            console.log(xmlDoc);
            alert(xmlDoc);
        }
    };
    request.setRequestHeader('Content-Type', 'text/xml');
    var xml = "<ApiRequest xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xs='http://www.w3.org/2001/XMLSchema'>"+

		   "<ApiKey>"+api_key_script+"</ApiKey>"+

		   "<TableName>Sku</TableName>"+
		   
		"</ApiRequest>";
    request.send(xml);
    
    */
	
	// ============================
		
	var sku_xml = "<ApiRequest xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xs='http://www.w3.org/2001/XMLSchema'>"+

		   "<ApiKey>"+api_key_script+"</ApiKey>"+

		   "<TableName>Sku</TableName>"+
		   
		"</ApiRequest>";
		
	var order_xml = "<ApiRequest xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xs='http://www.w3.org/2001/XMLSchema'>"+

	   "<ApiKey>"+api_key_script+"</ApiKey>"+

	   "<TableName>Order</TableName>"+
	   
	"</ApiRequest>";
	
	var product_xml = "<ApiRequest xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xs='http://www.w3.org/2001/XMLSchema'>"+

	   "<ApiKey>"+api_key_script+"</ApiKey>"+

	   "<TableName>Product</TableName>"+
	   
	"</ApiRequest>";
	
	var category_xml = "<ApiRequest xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xs='http://www.w3.org/2001/XMLSchema'>"+

	   "<ApiKey>"+api_key_script+"</ApiKey>"+

	   "<TableName>Category</TableName>"+
	   
	"</ApiRequest>";
		
	const oReqSku = new XMLHttpRequest();
	oReqSku.addEventListener("load", reqListenerSku);
	oReqSku.open("POST", "https://api"+server_script+".esv2.com/v2/Api/DataTablesGetDataCount");
	oReqSku.send(sku_xml);
	
	function reqListenerSku () {
	  let response = this.responseText;
	  document.getElementById("sku_count").innerHTML = response;
	  console.log('This is the count: ' + response);
	  console.log(this.responseText);
	}
	
	const oReqOrder = new XMLHttpRequest();
	oReqOrder.addEventListener("load", reqListenerOrder);
	oReqOrder.open("POST", "https://api"+server_script+".esv2.com/v2/Api/DataTablesGetDataCount");
	oReqOrder.send(order_xml);
	
	function reqListenerOrder () {
	  let response = this.responseText;
	  document.getElementById("order_count").innerHTML = response;
	  console.log('This is the count: ' + response);
	  console.log(this.responseText);
	}
	
	const oReqProduct = new XMLHttpRequest();
	oReqProduct.addEventListener("load", reqListenerProduct);
	oReqProduct.open("POST", "https://api"+server_script+".esv2.com/v2/Api/DataTablesGetDataCount");
	oReqProduct.send(product_xml);
	
	function reqListenerProduct () {
	  let response = this.responseText;
	  document.getElementById("product_count").innerHTML = response;
	  console.log('This is the count: ' + response);
	  console.log(this.responseText);
	}
	
	const oReqCategory = new XMLHttpRequest();
	oReqCategory.addEventListener("load", reqListenerCategory);
	oReqCategory.open("POST", "https://api"+server_script+".esv2.com/v2/Api/DataTablesGetDataCount");
	oReqCategory.send(category_xml);
	
	function reqListenerCategory () {
	  let response = this.responseText;
	  document.getElementById("category_count").innerHTML = response;
	  console.log('This is the count: ' + response);
	  console.log(this.responseText);
	}
	
	// ============================
	
	/*
	
	let count_sku_xml = '<ApiRequest xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">'+

		   '<ApiKey>'+api_key_script+'</ApiKey>'+

		   '<TableName>Sku</TableName>'+
		   
		'</ApiRequest>';
		
	const request = new XMLHttpRequest();
	request.open("POST", "https://api"+server_script+".esv2.com/v2/Api/Subscribers/", true);
	request.setRequestHeader("Content-Type", "text/xml");
	request.send(count_sku_xml);
	
	*/
	
	// ============================
	
	/*
	let count_sku_xml = '<ApiRequest xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">'+

    '<ApiKey>'+api_key_script+'</ApiKey>'+

    '<TableName>Sku</TableName>'+

    '</ApiRequest>';
		
    $.support.cors = true;	
    
    	$.ajax({
			url             :   'https://api'+server_script+'.esv2.com/v2/Api/DataTablesGetDataCount',
			type            :   'POST',
			precessData     :   false,
			contentType     :   'text/xml',
			data            :   count_sku_xml,
			sucess          :   function( data ) {
				alert('success sku: ' + data);
			},
			error           :   function() {
				alert('failed to send ajax request');
			},
			complete        :   function() {
				alert('ajax request completed: ' + data);
			}
			});
		
	let count_order_xml = '<ApiRequest xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">'+

    '<ApiKey>'+api_key_script+'</ApiKey>'+

    '<TableName>Order</TableName>'+

    '</ApiRequest>';
    
    $.support.cors = true;
		
		$.ajax({
			url             :   'https://api'+server_script+'.esv2.com/v2/Api/DataTablesGetDataCount',
			type            :   'POST',
			precessData     :   false,
			contentType     :   'text/xml',
			data            :   count_order_xml,
			sucess          :   function( data ) {
				alert('success order: ' + data);
			},
			error           :   function() {
				alert('failed to send ajax request');
			},
			complete        :   function() {
				alert('ajax request completed');
			}
			});
		
	let count_product_xml = '<ApiRequest xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">'+

    '<ApiKey>'+api_key_script+'</ApiKey>'+

    '<TableName>Product</TableName>'+

    '</ApiRequest>';
    
    $.support.cors = true;
		
		$.ajax({
			url             :   'https://api'+server_script+'.esv2.com/v2/Api/DataTablesGetDataCount',
			type            :   'POST',
			precessData     :   false,
			contentType     :   'text/xml',
			data            :   count_product_xml,
			sucess          :   function( data ) {
				alert('success product: ' + data);
			},
			error           :   function() {
				alert('failed to send ajax request');
			},
			complete        :   function() {
				alert('ajax request completed');
			}
			});
		
	let count_category_xml = '<ApiRequest xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">'+

    '<ApiKey>'+api_key_script+'</ApiKey>'+

    '<TableName>Category</TableName>'+

    '</ApiRequest>';
    
    $.support.cors = true;
		
		$.ajax({
			url             :   'https://api'+server_script+'.esv2.com/v2/Api/DataTablesGetDataCount',
			type            :   'POST',
			precessData     :   false,
			contentType     :   'text/xml',
			data            :   count_category_xml,
			sucess          :   function( data ) {
				alert('success category: ' + data);
			},
			error           :   function() {
				alert('failed to send ajax request');
			},
			complete        :   function() {
				alert('ajax request completed');
			}
			});
		*/	
	
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
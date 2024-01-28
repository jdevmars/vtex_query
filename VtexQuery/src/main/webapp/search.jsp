<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Scanner"%>
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
						<li class="breadcrumb-item">Search results</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- Row end -->
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-block">
						<div class="md-card-block">
							<p class="m-b-20">
								<span class="f-w-600 f-16 d-block m-b-10">Select the Data
									Table you need to search from: </span> You have selected the account:
								<strong><%=session.getAttribute("accounts")%></strong>
							</p>
							<p class="m-b-20">
								You have selected the table: <strong><%=session.getAttribute("table")%></strong>
							</p>
							<p class="m-b-20">
								You have selected this field for search: <strong><%=request.getAttribute("field")%><strong>
							</p>
							<p class="m-b-20">
								This is what you decided to search for: "<i><%=request.getAttribute("search_text")%></i>"
							</p>
							<p class="m-b-20">
								You have a total of <span style="color: red;"><i><%=request.getAttribute("count")%></i></span>
								records found in this search.
							</p>
							<!-- <p class="m-b-20">These are the results:</p>  -->
						</div>
					</div>
					<div class="card">
                     <div class="card-header">
                        <h5 class="card-header-text">These are the results: </h5>
                        <!-- <p>Add <code>.table-hover</code> Class in table tag</p>  -->
                     </div>
					<div class="card-block">
						<div class="md-card-block">
							<div class="row">
								<div class="col-sm-12 table-responsive">
									<table border="0" class="table table-hover">
										<%
										String query;
										List<String> query_lines = new ArrayList<>();
										query = (String) request.getAttribute("query_results_lines");
										Scanner in = new Scanner(query).useDelimiter(",");
										while (in.hasNextLine())
											query_lines.add(in.nextLine());
										%>

										<%
										String header = query_lines.get(0);
										String[] header_parts = header.split(",");

										out.println("<tr>");
										for (int i = 0; i < header_parts.length; i++) {
											out.println("<th>");
											if (i == 0) {
												out.println(header_parts[i].substring(1));
												continue;
											}
											out.println(header_parts[i]);
											out.println("</th>");
										}
										out.println("</tr>");
										%>

										<%
										for (int i = 1; i < query_lines.size(); i++) {
											out.println("<tr>");
											String line = query_lines.get(i);
											if (!line.contains("\"")) {
												String[] parts = line.split(",");
												for (int j = 0; j < parts.length; j++) {
											out.println("<td>");
											out.println(parts[j]);
											out.println("</td>");
												}
											} else {
												String[] parts = line.split("\"");
												for (int k = 0; k < parts.length; k++) {
											if (parts[k].startsWith(",") || parts[k].endsWith(","))
												parts[k] = parts[k].replace(",", "");
											if (parts[k].length() == 0)
												break;
											out.println("<td>");
											out.println(parts[k]);
											out.println("</td>");
												}
											}
											out.println("</tr>");
										}

										out.println("<tr><td>");
										out.println("<span style='background-color: yellow;'>This is the total amount returned: " + (query_lines.size() - 1)
												+ "</span>");
										out.println("</tr></td>");

										in.close();
										%>
									</table>
								</div>
							</div>
							<button id="search_back" onclick="window.history.back()"
								style="margin-top: 5px;">Back</button>
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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
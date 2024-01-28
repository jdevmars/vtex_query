<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Something went wrong</title>
</head>
<body>
	This error occurred: <br/><br/> <%=request.getAttribute("error") %>
</body>
</html>
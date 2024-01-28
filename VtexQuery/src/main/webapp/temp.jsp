<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table border="1">
      <tr>
            <th><strong><%=request.getAttribute("field") %><strong></th>
      </tr>
      <%
            List<String> results_lines = new ArrayList<String>();
            results_lines = (List<String>)request.getAttribute("query_results_lines");
            
            List<String> query_lines = new ArrayList<String>();
            query_lines = (List<String>)session.getAttribute("query_lines");
                           				
            for(int i = 0; i < query_lines.size(); i++) {
                  out.println("<tr><td>");
                  out.println(query_lines.get(i));
                  out.println("</tr></td>");
            }
                           				
            out.println("<tr><td>");
            out.println("This is the size of query_lines in search.jsp: " + query_lines.size());
            out.println("</tr></td>");
       %>
</table>

</body>
</html>
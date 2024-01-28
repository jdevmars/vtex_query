package com.mpsilvestri.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mpsilvestri.api.Count;
import com.mpsilvestri.api.Query;
import com.mpsilvestri.dao.VtexDAO;

@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Search() {
        super();

    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String api_key = "";
		int server = 0;
		
		String table = (String) session.getAttribute("table");
		String field = request.getParameter("sku_fields");
		String search_text = request.getParameter("search_text");
		
		int count;
		String operator = "Like";
		
		
		try {
			api_key = VtexDAO.selectKey((String)session.getAttribute("accounts"));
			server = VtexDAO.selectServer((String)session.getAttribute("accounts"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println("Setting the attributes field, search_text, api_key and server in Search Servlet...");
		request.setAttribute("field", field);
		request.setAttribute("search_text", search_text);
		request.setAttribute("api_key", api_key);
		request.setAttribute("server", server);
		
		System.out.println("Table in Search Servlet: " + table);
		System.out.println("Field in Search Servlet: " + field);
		System.out.println("Search text in Search Servlet: " + search_text);
		System.out.println("API Key in Search Servlet: " + api_key);
		System.out.println("This is the server in Search Servlet: " + server);
		
		if(field.equalsIgnoreCase("Email")) {
			if(!search_text.contains(".") && !search_text.contains("@") && !search_text.contains("co")) {
				request.setAttribute("error", "You've inserted an invalid email address: " + search_text);
				RequestDispatcher rd = request.getRequestDispatcher("error.jsp"); 
				rd.forward(request, response);
			}
			
		}
		
		// it counts zero
		if(table.equalsIgnoreCase("Order") && field.equalsIgnoreCase("CreationDate")) {
			operator = "Equals";
		}
		
		// it works
		if(table.equalsIgnoreCase("Product") && field.equalsIgnoreCase("ReleaseDate")) {
			operator = "Equals";
		}
		
		try {
			System.out.println("Calling the Count constructor in Search Servlet...");
			new Count(api_key, server, table, field, search_text, operator);
			new Query(api_key, server, api_key, table, field, search_text);
			String query_results = Query.query_results;
			request.setAttribute("query_results_lines", query_results);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		count = new Count().return_count();
		request.setAttribute("count", count);
		
		System.out.println("Dispatching to search.jsp from Search Servlet...");
		RequestDispatcher rd = request.getRequestDispatcher("search.jsp"); 
		rd.forward(request, response);
	}

}

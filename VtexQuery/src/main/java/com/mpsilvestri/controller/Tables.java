package com.mpsilvestri.controller;

import java.io.IOException;
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
import com.mpsilvestri.entity.Token;

@WebServlet("/Tables")
public class Tables extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Tables() {
        super();

    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		String business_unit;
		
		int sku_count;
		int order_count;
		int product_count;
		int category_count;
		*/
				
		HttpSession session = request.getSession();
		
		/*
		List<Token> tokens = (List<Token>) session.getAttribute("values");
		System.out.println("This is the size of tokens (number of accounts/keys) in Tables: " + tokens.size());
		
		for(int i = 0; i < tokens.size(); i++) {
			System.out.println("Table calling Count with API Key: " + tokens.get(i).getApi_key());
			System.out.println("Table calling Count with Server: " + tokens.get(i).getServer());
			new Count(tokens.get(i).getApi_key(), tokens.get(i).getServer());
		}
		
		sku_count = new Count().count_sku;
		System.out.println("=============================================");
		System.out.println("Valor de sku_count em Tables: " + sku_count);
		order_count = new Count().count_order;
		System.out.println("Valor de order_count em Tables: " + order_count);
		product_count = new Count().count_product;
		System.out.println("Valor de product_count em Tables: " + product_count);
		category_count = new Count().count_category;
		System.out.println("Valor de category_count em Tables: " + category_count);
		System.out.println("=============================================");
		
		session.setAttribute("accounts", request.getParameter("accounts"));
		session.setAttribute("sku_count", sku_count);
		session.setAttribute("order_count", order_count);
		session.setAttribute("product_count", product_count);
		session.setAttribute("category_count", category_count);
		*/
		
		session.setAttribute("accounts", request.getParameter("accounts"));
		RequestDispatcher rd = request.getRequestDispatcher("tables.jsp"); 
		rd.forward(request, response);
	}
	
	// <<-- gave it up, much delay to present tables.jsp
	/*
	protected void prepare_counts() {
					
	}
	*/
	
}

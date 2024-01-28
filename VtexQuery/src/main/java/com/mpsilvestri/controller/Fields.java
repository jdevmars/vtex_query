package com.mpsilvestri.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Fields")
public class Fields extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Fields() {
        super();

    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setAttribute("table", request.getParameter("data_table"));
		// request.setAttribute("data_table", request.getAttribute("table_selection"));
		
		RequestDispatcher rd = request.getRequestDispatcher("fields.jsp"); 
		rd.forward(request, response);
	}

}

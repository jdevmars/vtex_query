package com.mpsilvestri.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mpsilvestri.dao.VtexDAO;

/**
 * Servlet implementation class Start
 */
@WebServlet("/Start")
public class Start extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Start() {
        
    }

	
	public void init(ServletConfig config) throws ServletException {
				
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VtexDAO dao = new VtexDAO();
		Connection con = dao.connect();
		
		HttpSession session = request.getSession();
		session.setAttribute("connection", con);
		
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	}

}

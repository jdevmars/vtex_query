package com.mpsilvestri.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mpsilvestri.entity.Token;

@WebServlet("/Accounts")
public class Accounts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Accounts() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Token> tokens = new ArrayList<Token>();
		
		HttpSession session = request.getSession();
		Connection con = (Connection) session.getAttribute("connection");
		Statement stmt;
		ResultSet rs;
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from token;");
			while(rs.next()) {
				Token token = new Token();
				token.setId(rs.getInt(1));
				token.setUnit(rs.getString(2));
				token.setApi_key(rs.getString(3));
				token.setServer(rs.getInt(4));
				tokens.add(token);
				
				System.out.println(rs.getInt(1) + "  " + rs.getString(2) + "  " + rs.getString(3) + "  " + rs.getInt(4));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {  
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		session.setAttribute("values", tokens);
		RequestDispatcher rd = request.getRequestDispatcher("accounts.jsp"); 
		rd.forward(request, response);
	}

}

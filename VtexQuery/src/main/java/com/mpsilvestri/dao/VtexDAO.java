package com.mpsilvestri.dao;

import java.sql.*;

import javax.servlet.http.HttpSession;

public class VtexDAO {
	
	private String url = "jdbc:mysql://localhost:3306/api";
	private String user = "root";
	private String password = "admin@123456";
	private static Connection con;
	
	public Connection connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			this.con = DriverManager.getConnection(url,user,password);
		} catch (Exception ex) {
			System.out.println("Problem connection to MySQL instance!");
			System.out.println(ex.getMessage());
		}
		return con;
	}
	
	public void selectAll() throws SQLException {
		Statement stmt=con.createStatement();  
		ResultSet rs=stmt.executeQuery("select * from token;");  
		while(rs.next()) {
			System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3));
			
		}
		//con.close();  
	}
	
	public static String selectKey(String account) throws SQLException {
		VtexDAO dao = new VtexDAO();
		Connection con = dao.connect();
		String sql = "select api_key from token where unit like '%" + account + "%'";
		String result = "";
		// PreparedStatement stmt = con.prepareStatement(sql);
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {
			System.out.println("This is the API Key from VtexDao called by Search Servlet: " + rs.getString("api_key"));
			result = rs.getString("api_key");
		}
		
		return result;
	}
	
	public static int selectServer(String account) throws SQLException{
		VtexDAO dao = new VtexDAO();
		Connection con = dao.connect();
		String sql = "select server from token where unit like '%" + account + "%'";
		int result = 0;
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			System.out.println("This is the server number from VtexDao called by Search Servlet: " + rs.getInt("server"));
			result = rs.getInt("server");
		}
		
		return result;
	}
	

}

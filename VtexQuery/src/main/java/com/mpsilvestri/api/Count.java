package com.mpsilvestri.api;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpRequest.BodyPublishers;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;

public class Count {
	
	String api_key;
	int server;
	String url;
	
	String table;
	String field;
	String search_text;
	
	static int count;
	public static int count_sku;
	public static int count_order;
	public static int count_product;
	public static int count_category;
	
	String operator;
	
	public Count(String api_key, int server, String table, String field, String search_text, String operator) {
		this.api_key = api_key;
		this.server = server;
		this.table = table;
		this.field = field;
		this.search_text = search_text;
		this.operator = operator;
		
		System.out.println("Table in Count: " + this.table);
		System.out.println("Field in Count: " + this.field);
		System.out.println("Search text in Count: " + this.search_text);
		System.out.println("API Key in Count: " + this.api_key);
		System.out.println("This is the server in Count: " + this.server);
		System.out.println("This is the operator: " + this.operator);
		
		try {
			System.out.println("Creating XML with URI and data in Count...");
			String uri = "https://api"+server+".esv2.com/v2/Api/DataTablesGetDataCount";
			String data = "<ApiRequest xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\">\r\n"
					+ "\r\n"
					+ "   <ApiKey>"+this.api_key+"</ApiKey>\r\n"
					+ "\r\n"
					+ "   <TableName>"+this.table+"</TableName>\r\n"
					+ "\r\n"
					+ "   <WhereConditions>\r\n"
					+ "\r\n"
					+ "      <Where>\r\n"
					+ "\r\n"
					+ "         <ColumnName>"+this.field+"</ColumnName>\r\n"
					+ "\r\n"
					+ "         <Operator>"+this.operator+"</Operator>\r\n"
					+ "\r\n"
					+ "         <Value>"+this.search_text+"</Value>\r\n"
					+ "\r\n"
					+ "      </Where>\r\n"
					+ "\r\n"
					+ "   </WhereConditions>\r\n"
					+ "\r\n"
					+ "</ApiRequest>";
			
			System.out.println("Calling the API in Count...");
			count = post(uri, data);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// << == gave it up, much delay in presenting tables.jsp
	/*
	public Count(String api_key, int server) {
		String tables[] = {"Sku", "Order", "Product", "Category"};
		this.api_key = api_key;
		this.server = server;
		System.out.println("This is api_key in Count: " + api_key);
		System.out.println("This is server in Count: " + server);
		// this.table = table;
		
		System.out.println("Calling the Count API for each table");
		for(int i = 0; i < tables.length; i++) {
			try {
				String uri = "https://api"+server+".esv2.com/v2/Api/DataTablesGetDataCount";
				
				String data = "<ApiRequest xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\">\r\n"
						+ "\r\n"
						+ "   <ApiKey>"+this.api_key+"</ApiKey>\r\n"
						+ "\r\n"
						+ "   <TableName>"+tables[i]+"</TableName>\r\n"
						+ "   \r\n"
						+ "</ApiRequest>";
				
				if(tables[i].equalsIgnoreCase("Sku"))
					count_sku = count_sku(uri, data);
				if(tables[i].equalsIgnoreCase("Order"))
					count_order = count_order(uri, data);
				if(tables[i].equalsIgnoreCase("Product"))
					count_product = count_product(uri, data);
				if(tables[i].equalsIgnoreCase("Category"))
					count_category = count_category(uri, data);
				
				
			} catch (Exception e) {
				System.out.println("Failure in Count: " + e.getMessage() + "\n" + e.getStackTrace());
			}
		}
		
		
	}
	*/
	public Count() {

	}

	public int post(String uri, String data) throws Exception {
	    
	    String count = "0";
		
		HttpClient client = HttpClient.newBuilder().build();
	    HttpRequest request = HttpRequest.newBuilder()
	            .uri(URI.create(uri))
	            .POST(BodyPublishers.ofString(data))
	            .build();

	    HttpResponse<String> response = client.send(request, BodyHandlers.ofString());
	    System.out.println("Response code: " + response.statusCode());
	    System.out.println("Response: " + response.body());
	    if (response.statusCode() == 200) {
	    	System.out.println("Count: " + response.body().substring(response.body().indexOf("<Count>")+7, response.body().indexOf("</Count>")));
	    	count = response.body().substring(response.body().indexOf("<Count>")+7, response.body().indexOf("</Count>"));
	    	return Integer.parseInt(count);
	    }
	    else {
	    	System.out.println("There is no count available to display!");
	    	return Integer.parseInt(count);
	    }
	    
	}
	
	public int return_count() {
		return count;
	}
	
	public int count_sku(String uri, String data) throws IOException, InterruptedException {
		String count = "0";
		
		HttpClient client = HttpClient.newBuilder().build();
	    HttpRequest request = HttpRequest.newBuilder()
	            .uri(URI.create(uri))
	            .POST(BodyPublishers.ofString(data))
	            .build();

	    HttpResponse<String> response = client.send(request, BodyHandlers.ofString());
	    System.out.println("Response code: " + response.statusCode());
	    System.out.println("Response: " + response.body());
	    if (response.statusCode() == 200) {
	    	System.out.println("Count: " + response.body().substring(response.body().indexOf("<Count>")+7, response.body().indexOf("</Count>")));
	    	count = response.body().substring(response.body().indexOf("<Count>")+7, response.body().indexOf("</Count>"));
	    	return Integer.parseInt(count);
	    }
	    else {
	    	System.out.println("There is no count available to display!");
	    	return Integer.parseInt(count);
	    }
	}
	
	public int count_order(String uri, String data) throws IOException, InterruptedException {
		String count = "0";
		
		HttpClient client = HttpClient.newBuilder().build();
	    HttpRequest request = HttpRequest.newBuilder()
	            .uri(URI.create(uri))
	            .POST(BodyPublishers.ofString(data))
	            .build();

	    HttpResponse<String> response = client.send(request, BodyHandlers.ofString());
	    System.out.println("Response code: " + response.statusCode());
	    System.out.println("Response: " + response.body());
	    if (response.statusCode() == 200) {
	    	System.out.println("Count: " + response.body().substring(response.body().indexOf("<Count>")+7, response.body().indexOf("</Count>")));
	    	count = response.body().substring(response.body().indexOf("<Count>")+7, response.body().indexOf("</Count>"));
	    	return Integer.parseInt(count);
	    }
	    else {
	    	System.out.println("There is no count available to display!");
	    	return Integer.parseInt(count);
	    }
	}
	
	public int count_product(String uri, String data) throws IOException, InterruptedException {
		String count = "0";
		
		HttpClient client = HttpClient.newBuilder().build();
	    HttpRequest request = HttpRequest.newBuilder()
	            .uri(URI.create(uri))
	            .POST(BodyPublishers.ofString(data))
	            .build();

	    HttpResponse<String> response = client.send(request, BodyHandlers.ofString());
	    System.out.println("Response code: " + response.statusCode());
	    System.out.println("Response: " + response.body());
	    if (response.statusCode() == 200) {
	    	System.out.println("Count: " + response.body().substring(response.body().indexOf("<Count>")+7, response.body().indexOf("</Count>")));
	    	count = response.body().substring(response.body().indexOf("<Count>")+7, response.body().indexOf("</Count>"));
	    	return Integer.parseInt(count);
	    }
	    else {
	    	System.out.println("There is no count available to display!");
	    	return Integer.parseInt(count);
	    }
	}
	
	public int count_category(String uri, String data) throws IOException, InterruptedException {
		String count = "0";
		
		HttpClient client = HttpClient.newBuilder().build();
	    HttpRequest request = HttpRequest.newBuilder()
	            .uri(URI.create(uri))
	            .POST(BodyPublishers.ofString(data))
	            .build();

	    HttpResponse<String> response = client.send(request, BodyHandlers.ofString());
	    System.out.println("Response code: " + response.statusCode());
	    System.out.println("Response: " + response.body());
	    if (response.statusCode() == 200) {
	    	System.out.println("Count: " + response.body().substring(response.body().indexOf("<Count>")+7, response.body().indexOf("</Count>")));
	    	count = response.body().substring(response.body().indexOf("<Count>")+7, response.body().indexOf("</Count>"));
	    	return Integer.parseInt(count);
	    }
	    else {
	    	System.out.println("There is no count available to display!");
	    	return Integer.parseInt(count);
	    }
	}
	
}

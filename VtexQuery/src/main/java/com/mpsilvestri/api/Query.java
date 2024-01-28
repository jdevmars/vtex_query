package com.mpsilvestri.api;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpRequest.BodyPublishers;
import java.net.http.HttpResponse.BodyHandlers;
import java.util.ArrayList;
import java.util.List;

public class Query {
	
	String api_key;
	int server;
	String url;
	
	String table;
	String field;
	String search_text;
	
	// static int count;
	String operator;
	public static String query_results;
	
	public Query(String api_key, int server, String url, String table, String field, String search_text) {
		
		this.api_key = api_key;
		this.server = server;
		this.url = url;
		this.table = table;
		this.field = field;
		this.search_text = search_text;
		
		System.out.println("Table in Query: " + this.table);
		System.out.println("Field in Query: " + this.field);
		System.out.println("Search text in Query: " + this.search_text);
		System.out.println("API Key in Query: " + this.api_key);
		System.out.println("This is the server in Query: " + this.server);
		
		try {
			System.out.println("Creating XML with URI and data in Query...");
			String uri = "https://api"+server+".esv2.com/v2/Api/DataTablesGetData";
			/*
			String data = "<ApiRequest xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\">\r\n"
					+ "\r\n"
					+ "    <ApiKey>"+this.api_key+"</ApiKey>\r\n"
					+ "\r\n"
					+ "    <TableName>"+this.table+"</TableName>\r\n"
					+ "\r\n"
					+ "    <Columns>\r\n"
					+ "\r\n"
					+ "        <Column>"+this.field+"</Column>\r\n"
					+ "\r\n"
					+ "    </Columns>\r\n"
					+ "\r\n"
					+ "    <WhereConditions>\r\n"
					+ "\r\n"
					+ "         <Where>\r\n"
					+ "\r\n"
					+ "             <ColumnName>"+this.field+"</ColumnName>\r\n"
					+ "\r\n"
					+ "             <Operator>"+this.operator+"</Operator>\r\n"
					+ "\r\n"
					+ "             <Value>"+this.search_text+"</Value>\r\n"
					+ "\r\n"
					+ "         </Where>\r\n"
					+ "\r\n"
					+ "    </WhereConditions>\r\n"
					+ "\r\n"
					+ "    <OrderByColumns>\r\n"
					+ "\r\n"
					+ "         <OrderBy>\r\n"
					+ "\r\n"
					+ "             <ColumnName>"+this.field+"</ColumnName>\r\n"
					+ "\r\n"
					+ "             <Direction>Ascending</Direction>\r\n"
					+ "\r\n"
					+ "         </OrderBy>\r\n"
					+ "\r\n"
					+ "    </OrderByColumns>\r\n"
					+ "\r\n"
					+ "    <Limit>49</Limit>\r\n"
					+ "\r\n"
					+ "</ApiRequest>";
			*/
			String data; 
			XML xml = new XML(api_key, server, url, table, field, search_text);
			data = xml.generate_xml();
			
			System.out.println("Calling the API in Query...");
			// count = post(uri, data);
			Query.query_results = post(uri, data);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Query() {
		
	}
	
	public String post(String uri, String data) throws Exception {
		// String count = "0";
		
		// List<String> results_lines = new ArrayList<String>();
		String results_lines;
		
		HttpClient client = HttpClient.newBuilder().build();
	    HttpRequest request = HttpRequest.newBuilder()
	            .uri(URI.create(uri))
	            .POST(BodyPublishers.ofString(data))
	            .build();

	    HttpResponse<String> response = client.send(request, BodyHandlers.ofString());
	    System.out.println("Response code: " + response.statusCode());
	    System.out.println("Response: " + response.body());
	    
	    results_lines = String.valueOf(response.body()); 
	    /*
	    System.out.println("Printing list of lines from  Query: ");
	    for(int i = 0; i < results_lines.size(); i++) {
	    	System.out.print(results_lines.get(i));
	    }	
	    */
	    
	    return results_lines;
	    /*
	    if (response.statusCode() == 200) {
	    	System.out.println("Count: " + response.body().substring(response.body().indexOf("<Count>")+7, response.body().indexOf("</Count>")));
	    	count = response.body().substring(response.body().indexOf("<Count>")+7, response.body().indexOf("</Count>"));
	    	return Integer.parseInt(count);
	    }
	    else {
	    	System.out.println("There is no count available to display!");
	    	return Integer.parseInt(count);
	    }
		*/
		// return 0;
		
	}

}

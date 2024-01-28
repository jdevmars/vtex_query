package com.mpsilvestri.entity;

public class Token {

	private int id;
	private String unit;
	private String api_key;
	private int server;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getApi_key() {
		return api_key;
	}
	public void setApi_key(String api_key) {
		this.api_key = api_key;
	}

	public int getServer() {
		return server;
	}
	public void setServer(int server) {
		this.server = server;
	}
	public Token() {
		
	}
	
}

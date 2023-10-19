package com.example.demo;

public class Chef {
	int chef_id;
	String chef_name;
	String email;
	String password;
	public Chef() {
		super();
	}
	public Chef(int chef_id, String chef_name, String email, String password) {
		super();
		this.chef_id = chef_id;
		this.chef_name = chef_name;
		this.email = email;
		this.password = password;
	}
	public int getChef_id() {
		return chef_id;
	}
	public void setChef_id(int chef_id) {
		this.chef_id = chef_id;
	}
	public String getChef_name() {
		return chef_name;
	}
	public void setChef_name(String chef_name) {
		this.chef_name = chef_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	

}

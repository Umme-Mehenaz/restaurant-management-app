package com.example.demo;

public class Admin {
	int admin_id;
	String admin_name;
	String email;
	String passw;
	public Admin() {
		super();
	}
	public Admin(int admin_id, String admin_name, String email, String passw) {
		super();
		this.admin_id = admin_id;
		this.admin_name = admin_name;
		this.email = email;
		this.passw = passw;
	}
	public int getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassw() {
		return passw;
	}
	public void setPassw(String passw) {
		this.passw = passw;
	}
	
	

}

package com.example.demo;

public class Food {
	int food_id;
	String food_name;
	double price;
	String catagori;
	int quantity;
	String img;
	
	public Food() {
		super();
	}
	
	

	public Food(int food_id, String food_name, double price, String catagori, int quantity, String img) {
		super();
		this.food_id = food_id;
		this.food_name = food_name;
		this.price = price;
		this.catagori = catagori;
		this.quantity = quantity;
		this.img = img;
		
	}
	public int getFood_id() {
		return food_id;
	}
	public void setFood_id(int food_id) {
		this.food_id = food_id;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getCatagori() {
		return catagori;
	}
	public void setCatagori(String catagori) {
		this.catagori = catagori;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	
	

}

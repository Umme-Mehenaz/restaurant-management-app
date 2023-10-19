package com.example.demo;

public class Sale {
	int bill_id;
	int id;
	String name;
	String email;
	int food_id;
	String food_name;
	double price;
	String catagori;
	int quantity;
	double total;
	String img;
	double sub_total;
	double vat;
	int order_id;
	int order_id_details;
	
//	public Sale( int food_id, String food_name, double price, String catagori, int quantity) {
//		super();
//		
//		this.food_id = food_id;
//		this.food_name = food_name;
//		this.price = price;
//		this.catagori = catagori;
//		this.quantity = quantity;
//	}
//	public Sale(int id, String name, String email, int food_id, String food_name, double price, String catagori,int quantity) {
//		super();
//	
//		this.id = id;
//		this.name = name;
//		this.email = email;
//		this.food_id = food_id;
//		this.food_name = food_name;
//		this.price = price;
//		this.catagori = catagori;
//		this.quantity = quantity;
//		
//	}
	
	
//	public Sale(int bill_id, int id, String name, String email, int food_id, String food_name, double price,
//			String catagori, int quantity) {
//		super();
//		this.bill_id = bill_id;
//		this.id = id;
//		this.name = name;
//		this.email = email;
//		this.food_id = food_id;
//		this.food_name = food_name;
//		this.price = price;
//		this.catagori = catagori;
//		this.quantity = quantity;
//	}
//	
	
	
	public Sale(int food_id, String food_name, double price, String catagori,
			int quantity, String img, int id, String name, String email, double sub_total) {
		super();
		
		this.food_id = food_id;
		this.food_name = food_name;
		this.price = price;
		this.catagori = catagori;
		this.quantity = quantity;
		this.img = img;
		this.id = id;
		this.name = name;
		this.email = email;
		this.sub_total = sub_total;
	}
	
	public Sale(int bill_id, int id, int food_id, double total, double sub_total, double vat, int order_id,
		int order_id_details) {
	super();
	this.bill_id = bill_id;
	this.id = id;
	this.food_id = food_id;
	this.total = total;
	this.sub_total = sub_total;
	this.vat = vat;
	this.order_id = order_id;
	this.order_id_details = order_id_details;
}

	public Sale() {
		super();
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public int getBill_id() {
		return bill_id;
	}
	public void setBill_id(int bill_id) {
		this.bill_id = bill_id;
	}
	public double getSub_total() {
		return sub_total;
	}
	public void setSub_total(double sub_total) {
		this.sub_total = sub_total;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public double getVat() {
		return vat;
	}

	public void setVat(double vat) {
		this.vat = vat;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getOrder_id_details() {
		return order_id_details;
	}

	public void setOrder_id_details(int order_id_details) {
		this.order_id_details = order_id_details;
	}
	
	
	

}

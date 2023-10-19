package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SaleDA {
	Connection con;
	PreparedStatement pstmt;
	PreparedStatement pstm;
	
	public List<Sale> allCart() {
		List<Sale> sList = new ArrayList<>();
		Sale s;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
			pstmt = con.prepareStatement("select * from cart");
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				s = new Sale( rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4),rs.getInt(5), rs.getString(6),rs.getInt(7), rs.getString(8), rs.getString(9), rs.getDouble(10));
				sList.add(s);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return sList;

	}

	
	public void cart(Sale s) {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
			pstmt = con.prepareStatement("insert into cart values(?,?,?,?,?,?,?,?,?,?)");
			pstmt.setInt(1, s.food_id);
			pstmt.setString(2, s.food_name);
			pstmt.setDouble(3, s.price);
			pstmt.setString(4, s.catagori);
			pstmt.setInt(5, s.quantity);
			pstmt.setString(6, s.img);
			pstmt.setInt(7, s.id);
			pstmt.setString(8, s.name);
			pstmt.setString(9, s.email);
			pstmt.setDouble(10, s.sub_total);
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
			// TODO: handle exception
			e.printStackTrace();
		}

	}
	public List<Sale> chefOrder() {
		List<Sale> sList = new ArrayList<>();
		Sale s;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
			pstmt = con.prepareStatement("select * from food_order where catagori <> 'Beverage' ");
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				s = new Sale(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4),rs.getInt(5), rs.getString(6),rs.getInt(7), rs.getString(8), rs.getString(9), rs.getDouble(10));
				sList.add(s);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return sList;

	}

	public List<Sale> allOrder() {
		List<Sale> sList = new ArrayList<>();
		Sale s;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
			pstmt = con.prepareStatement("select * from food_order");
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				s = new Sale(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4),rs.getInt(5), rs.getString(6),rs.getInt(7), rs.getString(8), rs.getString(9), rs.getDouble(10));
				sList.add(s);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return sList;

	}
	
	public void order(Sale s) {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
			pstmt = con.prepareStatement("insert into orders (order_id, id, sub_total, total, vat)");
			pstmt.setInt(1, s.order_id);
			pstmt.setInt(2, s.id);
			pstmt.setDouble(3, s.sub_total);
			pstmt.setDouble(4, s.total);
			pstmt.setDouble(5, s.vat);
			
			
			
			 pstmt.executeUpdate();
			
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
				pstm = con.prepareStatement("insert into order_item (order_id_details, order_id, food_id, food_name, price, quantity, sub_total )");
				pstm.setInt(1, s.order_id_details);
				pstm.setInt(2, s.order_id);
				pstm.setInt(3, s.food_id);
				pstmt.setString(4, s.food_name);
				pstm.setDouble(5, s.price);
				pstm.setInt(6, s.quantity);
				pstm.setDouble(7, s.sub_total);
				
				
				 pstm.executeUpdate();
			

		} catch (Exception e) {
			System.out.println(e);
			// TODO: handle exception
			e.printStackTrace();
		}

	}
	

	

	public void changeQuantity(int foodId, int qty) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
			pstmt = con.prepareStatement("update cart set quantity = ?, sub_total = price * ? where food_id = ?");
			pstmt.setInt(3, foodId);
			pstmt.setInt(1, qty);
			pstmt.setInt(2, qty);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	
	public void deleteAll(int food_id) {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
			pstmt = con.prepareStatement("delete from cart where food_id=?");
			pstmt.setInt(1, food_id);
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	

}

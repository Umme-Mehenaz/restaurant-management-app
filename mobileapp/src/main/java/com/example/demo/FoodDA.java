package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FoodDA {
	Connection con;
	PreparedStatement pstmt;
	
	public List<Food> allFood() {
		List<Food> sList = new ArrayList<>();
		Food s;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
			pstmt = con.prepareStatement("select * from food");
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				s = new Food(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getInt(5), rs.getString(6));
				sList.add(s);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return sList;

	}

	
	public void inserts(Food s) {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
			pstmt = con.prepareStatement("insert into food values(?,?,?,?,?,?)");
			pstmt.setInt(1, s.food_id);
			pstmt.setString(2, s.food_name);
			pstmt.setDouble(3, s.price);
			pstmt.setString(4, s.catagori);
			pstmt.setInt(5, s.quantity);
			pstmt.setString(6, s.img);
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
			// TODO: handle exception
			e.printStackTrace();
		}

	}


public void update(Food s) {

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
		pstmt = con.prepareStatement("update food set food_name=?,price=?,catagori=?,quantity=?,img=? where food_id=?");
		pstmt.setInt(6, s.food_id);
		pstmt.setString(1, s.food_name);
		pstmt.setDouble(2, s.price);
		pstmt.setString(3, s.catagori);
		pstmt.setInt(4, s.quantity);
		pstmt.setString(5, s.img);
		
		
		pstmt.executeUpdate();

	} catch (Exception e) {
		System.out.println(e);
		// TODO: handle exception
		e.printStackTrace();
	}

}

public void deletes(int food_id) {

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
		pstmt = con.prepareStatement("delete from food where food_id=?");
		pstmt.setInt(1, food_id);
		
		pstmt.executeUpdate();

	} catch (Exception e) {
		System.out.println(e);
		// TODO: handle exception
		e.printStackTrace();
	}

}
public List<Food> pizza() {
	List<Food> sList = new ArrayList<>();
	Food s;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
		pstmt = con.prepareStatement("select * from food where catagori = 'Pizza'");
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {

			s = new Food(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getInt(5), rs.getString(6));
			sList.add(s);
		}

	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return sList;

}

public List<Food> burger() {
	List<Food> sList = new ArrayList<>();
	Food s;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
		pstmt = con.prepareStatement("select * from food where catagori = 'Burger'");
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {

			s = new Food(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getInt(5), rs.getString(6));
			sList.add(s);
		}

	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return sList;

}
public List<Food> chicken() {
	List<Food> sList = new ArrayList<>();
	Food s;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
		pstmt = con.prepareStatement("select * from food where catagori = 'Chicken'");
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {

			s = new Food(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getInt(5), rs.getString(6));
			sList.add(s);
		}

	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return sList;

}
public List<Food> beverage() {
	List<Food> sList = new ArrayList<>();
	Food s;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
		pstmt = con.prepareStatement("select * from food where catagori = 'Beverage'");
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {

			s = new Food(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getInt(5), rs.getString(6));
			sList.add(s);
		}

	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return sList;

}
public List<Food> snacks() {
	List<Food> sList = new ArrayList<>();
	Food s;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
		pstmt = con.prepareStatement("select * from food where catagori = 'Snacks'");
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {

			s = new Food(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getInt(5), rs.getString(6));
			sList.add(s);
		}

	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return sList;

}

public List<Food> deals() {
	List<Food> sList = new ArrayList<>();
	Food s;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
		pstmt = con.prepareStatement("select * from food where catagori = 'Deals'");
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {

			s = new Food(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getInt(5), rs.getString(6));
			sList.add(s);
		}

	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return sList;

}

}

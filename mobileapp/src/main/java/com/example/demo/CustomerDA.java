package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CustomerDA {
	Connection con;
	PreparedStatement pstmt;
	
	
	List<Customer> slist;
	public List<Customer> allStudent() {
		Connection con;
		PreparedStatement pstmt;
		slist = new ArrayList<>();
		Customer s;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
			pstmt = con.prepareStatement("select * from customer");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				
				s = new Customer();
				s.setId(rs.getInt(1));
				s.setName(rs.getString(2));
				s.setEmail(rs.getString(3));
				s.setPassword(rs.getString(4));
				slist.add(s);
			}
		} catch (Exception e) {
			System.out.println(e);

		}
		return slist;
	}
	
	
	public Customer singup(Customer s) {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
			pstmt = con.prepareStatement("insert into customer values(?,?,?,?)");
			pstmt.setInt(1, s.id);
			pstmt.setString(2, s.name);
			pstmt.setString(3, s.password);
			pstmt.setString(4, s.email);
		
			pstmt.executeUpdate();
			con.isClosed();

		} catch (Exception e) {
			System.out.println(e);
			// TODO: handle exception
			e.printStackTrace();
		}
		return s;

	}
	
	public Customer singin(int id) {
		Customer s = new Customer();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
			pstmt = con.prepareStatement("select * from customer where id="+ id);
			ResultSet rs= pstmt.executeQuery();
			
			while(rs.next()) {
				s = new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
			// TODO: handle exception
			e.printStackTrace();
		}
		return s;

	}
	

}

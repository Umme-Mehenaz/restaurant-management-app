package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ChefDA {
	
	Connection con;
	PreparedStatement pstmt;
	
	
	List<Chef> slist;
	public List<Chef> allChef() {
		Connection con;
		PreparedStatement pstmt;
		slist = new ArrayList<>();
		Chef s;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
			pstmt = con.prepareStatement("select * from chef");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				
				s = new Chef();
				s.setChef_id(rs.getInt(1));
				s.setChef_name(rs.getString(2));
				s.setEmail(rs.getString(3));
				s.setPassword(rs.getString(4));
				slist.add(s);
			}
		} catch (Exception e) {
			System.out.println(e);

		}
		return slist;
	}
	
	
	public Chef chef_singup(Chef s) {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
			pstmt = con.prepareStatement("insert into chef values(?,?,?,?)");
			pstmt.setInt(1, s.chef_id);
			pstmt.setString(2, s.chef_name);
			pstmt.setString(3, s.email);
			pstmt.setString(4, s.password);
		
			pstmt.executeUpdate();
			con.isClosed();

		} catch (Exception e) {
			System.out.println(e);
			// TODO: handle exception
			e.printStackTrace();
		}
		return s;

	}
	
	public Chef chef_singin(int chef_id) {
		Chef s = new Chef();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
			pstmt = con.prepareStatement("select * from chef where chef_id="+ chef_id);
			ResultSet rs= pstmt.executeQuery();
			
			while(rs.next()) {
				s = new Chef(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
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

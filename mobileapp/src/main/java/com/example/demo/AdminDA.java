package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AdminDA {
	Connection con;
	PreparedStatement pstmt;
	
	
	List<Admin> slist;
	public List<Admin> allAdmin() {
		Connection con;
		PreparedStatement pstmt;
		slist = new ArrayList<>();
		Admin s;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
			pstmt = con.prepareStatement("select * from admin");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				
				s = new Admin();
				s.setAdmin_id(rs.getInt(1));
				s.setAdmin_name(rs.getString(2));
				s.setEmail(rs.getString(3));
				s.setPassw(rs.getString(4));
				slist.add(s);
			}
		} catch (Exception e) {
			System.out.println(e);

		}
		return slist;
	}
	
	
	public Admin adSingup(Admin s) {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
			pstmt = con.prepareStatement("insert into admin values(?,?,?,?)");
			pstmt.setInt(1, s.admin_id);
			pstmt.setString(2, s.admin_name);
			pstmt.setString(4, s.passw);
			pstmt.setString(3, s.email);
		
			pstmt.executeUpdate();
			con.isClosed();

		} catch (Exception e) {
			System.out.println(e);
			// TODO: handle exception
			e.printStackTrace();
		}
		return s;

	}
	
	public Admin adSingin(int admin_id) {
		Admin s = new Admin();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp", "root", "nh123456");
			pstmt = con.prepareStatement("select * from admin where Admin_id="+ admin_id);
			ResultSet rs= pstmt.executeQuery();
			
			while(rs.next()) {
				s = new Admin(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
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

package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDa {

	
		
		Connection con;
		PreparedStatement pst;
		
		public Login getUser(Login a){
			
			Login s = null;
		try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mobileapp","root","nh123456");
				pst = con.prepareStatement("select * from login where user =? pass =?");
				pst.setInt(2, a.pass);
				pst.setString(1, a.user);
			ResultSet rs = pst.executeQuery();
			
				if(rs.next()) {
					s = new Login();
					
					s.setUser(rs.getString(1));
					s.setPass(rs.getInt(2));
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.print(e);
			}
			
			return s;
		}

	
	
}

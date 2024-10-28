package com.sai.connect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sai.model.User;
import com.sai.servlets.RegisterServlet;

public class Crud {
	static Connection con;
	static {
		Connect c = new Connect();
		con = c.connect();

	}

	public boolean add(User u) {
		String query = "insert into user(name,email,password,phnum,branch,year,rollno)values(?,?,?,?,?,?,?)";
		boolean b = true;
		try {
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, u.getName());
			pst.setString(2, u.getEmail());
			pst.setString(3, u.getPassword());
			pst.setString(4, u.getPhnum());
			pst.setString(5, u.getBranch());
			pst.setString(6, u.getYear());
			pst.setString(7, u.getRollno());
			b = pst.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			RegisterServlet tr = new RegisterServlet();
		}
		return b;

	}

	public User read(String email, String password) {
		String query = "select * from user where email=? and password=?";
		User u = null;
		try {
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			ResultSet res = pst.executeQuery();
			if (res.next()) {
				u = new User(res.getString(2), res.getString(3), res.getString(4), res.getString(5), 
						res.getString(6),
						res.getString(7), res.getString(8));

			}
		} catch (SQLException e) {
			e.printStackTrace();

		}
		return u;
	}
	public User read(String rollno) {
		String query = "select * from user where rollno=?";
		User u = null;
		try {
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, rollno);
			
			ResultSet res = pst.executeQuery();
			if (res.next()) {
				u = new User(res.getString("name"), res.getString("branch"), res.getString("rollno"));

			}
		} catch (SQLException e) {
			e.printStackTrace();

		}
		return u;
	}

}

package com.sai.connect;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connect {
	private String url = "jdbc:mysql://localhost:3306/libaray";
	private String username = "root";
	private String password = "sai123";
	 Connection con = null;

	public  Connection connect() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

}

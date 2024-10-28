package com.sai.connect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MagzineCrud {
	static Connection con = null;
	static {
		Connect c = new Connect();
		con = c.connect();
	}
public ArrayList read() {
	String approve="yes";
	String query="select * from magzine where approve=? order by id desc";
	ArrayList list = new ArrayList();
	try {
		PreparedStatement pst = con.prepareStatement(query);
		pst.setString(1,approve);
		ResultSet res = pst.executeQuery();
		while(res.next()) {
			Magzine p = new Magzine(res.getString(2),res.getString(3),res.getString(4),res.getString(5),
					res.getString(6),res.getString(7));
			list.add(p);
		}
			
		
	} catch (SQLException e) {
	
		e.printStackTrace();
	}
	
	return list;
	
}
public ArrayList readapprove() {
	// Fetch unapproved magazines from the database
	String approve = "no";
	String query = "SELECT * FROM magzine WHERE approve = ?";
	ArrayList<Magzine> list = new ArrayList<>();

	try {
	    PreparedStatement pst = con.prepareStatement(query);
	    pst.setString(1, approve);
	    ResultSet res = pst.executeQuery();
	    
	    // Loop through result set and add magazines to the list
	    while (res.next()) {
	        Magzine p = new Magzine(res.getString("title"), res.getString("description"),
	                                res.getString("url"), res.getString("rollno"),
	                                res.getString("approve"), res.getString("name"));
	        list.add(p);
	    }
	    
	    // Optional: print the list for debugging (outside the loop)
	    System.out.println(list);

	} catch (SQLException e) {
	    e.printStackTrace();  // Use proper logging in production
	}

	return list;

	
}
public int update(String rollno ,String title) {
	String query = "update magzine set approve='yes' where rollno=? and title=?";
	int a = 0 ;

	try {
		PreparedStatement pst = con.prepareStatement(query);
		pst.setString(1, rollno);
		pst.setString(2,title);
	  a = pst.executeUpdate();
	
		 
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	return a;
}
public int delete(String rollno ,String title) {
	String query = "delete from magzine where rollno=? and title=?";
	int a = 0 ;

	try {
		PreparedStatement pst = con.prepareStatement(query);
		pst.setString(1, rollno);
		pst.setString(2,title);
	  a = pst.executeUpdate();
		
		 
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	return a;

}

}

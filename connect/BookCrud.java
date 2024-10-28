package com.sai.connect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sai.model.Book;


public class BookCrud {
	static Connection con = null;
	
	static{
		Connect c = new Connect();
		con = c.connect();
	}

	
	public ArrayList read(String branch) {
		String query = "select * from book where branch=? and approve=?";
		Book b = null;
		String approve = "yes";
		ArrayList<Book> list = new ArrayList();
		try {
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, branch);
			pst.setString(2, approve);
			ResultSet res = pst.executeQuery();
			while(res.next()) {
				 b = new Book(res.getString(2),res.getString(3),res.getString(4),res.getString(5),res.getString(6),res.getString(9));
				 list.add(b);
			}
			 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	public ArrayList read() {
		String query = "select * from book where approve=?";
		Book b = null;
		ArrayList<Book> list = new ArrayList();
		try {
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, "no");
			ResultSet res = pst.executeQuery();
			while(res.next()) {
				 b = new Book(res.getString(2),res.getString(3),res.getString(4),res.getString(5),res.getString(6),
						 res.getString(7),res.getString(8),res.getString(9) );
				 list.add(b);
			}
			 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	public int update(String rollno ,String title,String available) {
		String query = "UPDATE book SET approve='yes', available=? WHERE rollno=? AND title=?";
		int a = 0 ;
	
		try {
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, available);
			pst.setString(2, rollno);
			pst.setString(3,title);
		  a = pst.executeUpdate();
			
			 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return a;
	}
	
public int delete(String rollno ,String title) {
	String query = "delete from book where rollno=? and title=?";
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


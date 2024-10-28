package com.sai.connect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sai.model.BookLog;
import com.sai.model.User;

public class BookLogCrud {
	static Connection con;
	static {
		Connect c = new Connect();
		con = c.connect();

	}
	public boolean add(BookLog book) {
		String query = "insert into booklog(name,rollno,branch,title,taken,receive)values(?,?,?,?,?,?)";
		boolean b = true;
		try {
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, book.getName());
			pst.setString(2, book.getRollno());
			pst.setString(3, book.getBranch());
			pst.setString(4, book.getTitle());
			pst.setString(5, book.getTaken());
			pst.setString(6,book.getReceive() );
			b = pst.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return b;

	}
	public int update(BookLog book) {
		String query = "update booklog set receive=? where rollno=? and title=?";
		int b = 0;
		try {
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, book.getReceive());
			pst.setString(2, book.getRollno());
			pst.setString(3, book.getTitle());
			System.out.println(book.getReceive());
			b = pst.executeUpdate();
			System.out.println(b);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return b;

	}

	public ArrayList read() {
		String query = "select * from booklog  order by id desc";
		ArrayList list = new ArrayList();
		BookLog b = null;
		try {
			PreparedStatement pst = con.prepareStatement(query);
			ResultSet res = pst.executeQuery();
			while (res.next()) {
				b = new BookLog(res.getString(2), res.getString(3), res.getString(4), res.getString(6), res.getString(7)
						,res.getString(8)
						);
				list.add(b);

			}
		} catch (SQLException e) {
			e.printStackTrace();

		}
		return list;
	}

	public ArrayList read(String rollno) {
		String query = "select * from booklog where rollno=? order by id desc";
		ArrayList list = new ArrayList();
		BookLog b = null;
		try {
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, rollno);
			ResultSet res = pst.executeQuery();
			while (res.next()) {
				b = new BookLog(res.getString(2), res.getString(3), res.getString(6), res.getString(7), res.getString(8)
						);
				list.add(b);

			}
		} catch (SQLException e) {
			e.printStackTrace();

		}
		return list;
	}
	
	public int delete(BookLog book) {
		String query = "delete from booklog where rollno=? and title=?";
		int b = 0;
		try {
			PreparedStatement pst = con.prepareStatement(query);
			
			pst.setString(1, book.getRollno());
			pst.setString(2, book.getTitle());
			
			b = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return b;

	}
	
	
	
	
	
	
}

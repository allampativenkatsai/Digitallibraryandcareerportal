package com.sai.connect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sai.model.ExamPdf;

public class ExamPdfCrud {
	static Connection con = null;
	static {
		Connect c = new Connect();
		con = c.connect();
	}
public ArrayList read(String branch) {
	String query="select * from exampdf where branch=? and approve=? order by sem";
	ArrayList list = new ArrayList();
	String approve="yes";
	try {
		PreparedStatement pst = con.prepareStatement(query);
		pst.setString(1, branch);
		pst.setString(2, approve);
		ResultSet res = pst.executeQuery();
		while(res.next()) {
		ExamPdf p = new ExamPdf(res.getString(2),res.getString(3),res.getString(4),res.getString(5)
				,res.getString(6),res.getString(7),res.getString(8),res.getString(9));
			list.add(p);
		}
		
				
		
	} catch (SQLException e) {
	
		e.printStackTrace();
	}	
	return list;
	
}
public ArrayList read() {
	String query = "select * from exampdf where approve=?";
	ArrayList list = new ArrayList();
	String approve="no";
	try {
		PreparedStatement pst = con.prepareStatement(query);
		pst.setString(1, approve);
		ResultSet res = pst.executeQuery();
		while(res.next()) {
		ExamPdf p = new ExamPdf(res.getString(2),res.getString(3),res.getString(4),res.getString(5)
				,res.getString(6),res.getString(7),res.getString(8),res.getString(9));
			list.add(p);
			System.out.print(list);
		}
		
				
		
	} catch (SQLException e) {
	
		e.printStackTrace();
	}	
	return list;
	
}
public int update(String rollno ,String title) {
	String query = "update exampdf set approve='yes' where rollno=? and title=?";
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
	String query = "delete from exampdf where rollno=? and title=?";
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

package com.sai.servlets;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sai.connect.Connect;
import com.sai.connect.Crud;
import com.sai.model.User;

public class RegisterServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String cpassword = req.getParameter("cpassword");
		String rollno = req.getParameter("rollno");
		if(email.length()>10 && password.length()>7) {
			if(password.equals(cpassword)) {
				if(rollno!=null) {
					String temp = rollno.substring(0,2);
				
				if("ad".equals(temp)) {
				admin( req, res) ;
				}
				else {
					user(req,res);
				}
				}
				
		}	else {
			try {
				res.sendRedirect("register.html");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}else {	
		try {
			res.sendRedirect("register.html");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
				
}
	public void user(HttpServletRequest req, HttpServletResponse res) {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String cpassword = req.getParameter("cpassword");
		String name = req.getParameter("name");
		String phnum = req.getParameter("phnum");
		String rollno = req.getParameter("rollno");
		String year = null ;
		String branch = null;
		if(rollno!=null) {
		String temp2 = rollno.substring(0, 2);
		int a = Integer.parseInt(temp2);
		 year = String.valueOf(24 - a);
		
		String temp = rollno.substring(7, 8);
		
		if (temp.equals("1")) {
			branch = "CIVIL";
		} else if (temp.equals("2")) {
			branch = "EEE";
		} else if (temp.equals("3")) {
			branch = "MECH";
		} else if (temp.equals("4")) {
			branch = "ECE";
		} else if (temp.equals("5")) {
			branch = "CSE";
		}
		}

		User u = new User(name,email,password,phnum,branch,year,rollno);
		
		boolean b =add(u,res);
		if(b==false) {
			try {
				res.sendRedirect("login.html");
			} catch (IOException e) {
				try {
					res.sendRedirect("register.html");
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		}
	}
    public void admin(HttpServletRequest req, HttpServletResponse res) {
    	String email = req.getParameter("email");
		String password = req.getParameter("password");
		String cpassword = req.getParameter("cpassword");
		String name = req.getParameter("name");
		String phnum = req.getParameter("phnum");
		String rollno = req.getParameter("rollno");
		String branch="libaray";
		User u = new User(name,email,password,phnum,branch,"0",rollno);
	
		boolean b =add(u,res);
		if(b==false) {
			try {
				res.sendRedirect("login.html");
			} catch (IOException e) {
				try {
					res.sendRedirect("register.html");
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				e.printStackTrace();
			}
		}
		
    }
    static Connection con;
	static {
		Connect c = new Connect();
		con = c.connect();

	}

	public boolean add(User u, HttpServletResponse res) {
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
			try {
				res.sendRedirect("register.html");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		}
		return b;

	}
}
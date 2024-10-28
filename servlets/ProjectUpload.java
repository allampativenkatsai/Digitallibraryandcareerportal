package com.sai.servlets;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.sai.connect.Connect;
@MultipartConfig
public class ProjectUpload extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) {
		
		String title = req.getParameter("title");
		 String description = req.getParameter("description");
		 String branch = req.getParameter("branch");
		 HttpSession session = req.getSession();
		 String name = (String) session.getAttribute("name");
			String rollno = (String) session.getAttribute("rollno");
			String temp = (String) session.getAttribute("user");
			String m = req.getParameter("m");
		 String approve = null;
			if(temp!=null) {
				if("admin".equals(temp)) {
					approve="yes";
				}
				else {
					approve="no";
				}
			}
		try {
			Part file = req.getPart("file");
			
			String filename = file.getSubmittedFileName();
			String uploadPath = getServletContext().getRealPath("") + "resources/";
			String filePath = uploadPath + File.separator + filename;
			file.write(filePath);
			String fileUrl = "resources/" + filename;
			Connect c = new Connect();
			Connection conn = c.connect();
			if("add".equals(m)) {
				insert(conn,title,description,branch,fileUrl,
						approve,name,rollno);
				
				
				 session.setAttribute("path","project.jsp?branch="+branch);
					res.sendRedirect("add.jsp");
				}else {
				delete(file);
				res.sendRedirect("appdeleteproject.jsp");                
				}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		} 
		
	}
	public void insert(Connection conn,String title,String description,String branch,String url,
			String approve,String name,String rollno) {
	String query = "INSERT INTO project(title,description,branch,url,approve,name,rollno)"
			+ " VALUES (?, ?, ?, ?,?,?,?)";
	PreparedStatement ps;
	try {
		ps = conn.prepareStatement(query);
	
	ps.setString(1, title);
	ps.setString(2, description);
	ps.setString(3, branch);
	ps.setString(4, url);
ps.setString(5,approve);
ps.setString(6,name);
ps.setString(7,rollno);
	ps.executeUpdate();

	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	}
	public void delete(Part file) {
		try {
			file.delete();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
}

package com.sai.servlets;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.sai.connect.Connect;

@MultipartConfig
public class UploadServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) {

		String title = req.getParameter("title");
		String author = req.getParameter("author");
		String branch = req.getParameter("branch");
		HttpSession session = req.getSession();
		String name = (String) session.getAttribute("name");
		String rollno = (String) session.getAttribute("rollno");
		String temp = (String) session.getAttribute("user");
		String available = req.getParameter("available");
		String m = req.getParameter("m");
		String approve = null;
		
		// Determine approval status based on user type
		if (temp != null) {
			approve = "admin".equals(temp) ? "yes" : "no";
		}

		try {
			// Get the file part from the request
			Part file = req.getPart("file");
			String fileName = file.getSubmittedFileName();
			String uploadPath = getServletContext().getRealPath("") + "resources/";
			String filePath = uploadPath + File.separator + fileName;

			// Save the file to the server
			file.write(filePath);

			// Generate the file URL to be saved in the database
			String fileUrl = "resources/" + fileName;
			Connect c = new Connect();
			Connection conn = c.connect();

			// If 'add', insert a new record; otherwise, delete the file
			if ("add".equals(m)) {
				insert(conn, title, author, branch, fileUrl, name, rollno, approve,available);
				
				 session.setAttribute("path","book.jsp?branch="+branch);
				res.sendRedirect("add.jsp");
			} else {
				delete(file);
				res.sendRedirect("appdeletebook.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// Insert record into the 'book' table
	public void insert(Connection conn, String title, String author, String branch, String fileUrl, String name, 
			String rollno, String approve,String available) {
		try {
			String query = "INSERT INTO book(title, author, branch, url, approve, name, rollno,available) VALUES (?, ?, ?, ?, ?, ?, ?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, title);
			ps.setString(2, author);
			ps.setString(3, branch);
			ps.setString(4, fileUrl);
			ps.setString(5, approve);
			ps.setString(6, name);
			ps.setString(7, rollno);
			ps.setString(8, available);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// Delete file from server
	public void delete(Part file) {
		try {
			file.delete();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

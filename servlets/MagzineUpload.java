package com.sai.servlets;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.sai.connect.Connect;

@MultipartConfig
public class MagzineUpload extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) {
		
		String title = req.getParameter("title");
		 String description = req.getParameter("description");
		 HttpSession session = req.getSession();
		 String name=(String) session.getAttribute("name");
			String rollno=(String) session.getAttribute("rollno");
			String temp = (String) session.getAttribute("user");
			String m = req.getParameter("m");
	        String approve = "no";  // Default to "no"
	        if ("admin".equals(temp)) {
	            approve = "yes";
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
				insert(conn,title,description,fileUrl,rollno,approve,name);
				 session.setAttribute("path","magzine.jsp");
					res.sendRedirect("add.jsp");
				}else {
				delete(file);
				res.sendRedirect("appdeletemagzine.jsp");
				}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		} 
		
	}
	public void insert(Connection conn,String title,String description,String url,String rollno,String approve
			,String name) {
		try {
			String query = "INSERT INTO magzine(title,description,url,rollno,approve,name) VALUES (?, ?, ?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, title);
			ps.setString(2, description);
			
			ps.setString(3, url);
			ps.setString(4, rollno);
ps.setString(5,approve);
ps.setString(6,name);

			ps.executeUpdate();
			ps.close();
			conn.close();
			
	}catch (Exception e) {
			
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

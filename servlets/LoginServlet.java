package com.sai.servlets;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sai.connect.Crud;
import com.sai.model.User;
import javax.servlet.http.Cookie;
public class LoginServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) {
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		Crud c = new Crud();
		User u = c.read(email, password);
		
		if (u.getEmail().equals(email)) 
		{
			if (u.getPassword().equals(password)) 
			{
				Cookie cookie= new Cookie("email",email);
				
				cookie.setMaxAge(60*60);
				res.addCookie(cookie);
		if(u!=null) {
		HttpSession session = req.getSession();
		session.setAttribute("name", u.getName());
		session.setAttribute("email", u.getEmail());
		session.setAttribute("branch", u.getBranch());
		session.setAttribute("year", u.getYear());
		session.setAttribute("rollno", u.getRollno());
		session.setAttribute("phnum", u.getPhnum());
		
		String rollno=(String)session.getAttribute("rollno");
		if(rollno!=null) {
			String temp = rollno.substring(0,2);
		
		if("ad".equals(temp)) {
			session.setAttribute("user", "admin");
		try {
			res.sendRedirect("homeadmin.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
		}else {
			session.setAttribute("user", "stud");
			try {
				res.sendRedirect("home.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		}}}
		}else {
			try {
				res.sendRedirect("login.html");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
			
	}

}

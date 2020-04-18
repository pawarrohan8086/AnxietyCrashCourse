package com.anxiety.controller.login;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anxiety.bean.dto.PasswordEnrypt;
import com.anxiety.dao.StudentOpration;


@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String user=request.getParameter("user");
		String email=request.getParameter("email");
		String pswd=request.getParameter("pswd");
		
		if(user.equalsIgnoreCase("admin")) {
			
			if(email.equals("admin123@gmail.com") && pswd.equals("admin")) {
				
				response.sendRedirect("admin/AddStudent.jsp");
			}else {
				response.sendRedirect("Home.jsp#apply");
			}
		}else {
			
			ServletContext sc=getServletContext();
			StudentOpration so=new StudentOpration(sc.getInitParameter("driver"), sc.getInitParameter("dburl"), sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
			String checkpswd=so.loginCheck(email);
			
			if(checkpswd!=null) {
				
				if(PasswordEnrypt.checkpw(pswd, checkpswd)) {
					
					so.closeConnection();
					response.sendRedirect("student/profile.jsp");
				}else {
				
					response.sendRedirect("Home.jsp#apply");
				}
				
			}else {
				response.sendRedirect("Home.jsp#apply");
			}
			
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}

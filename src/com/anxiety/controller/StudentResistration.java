package com.anxiety.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/StudentResistration")
public class StudentResistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String password=request.getParameter("pswd");
		String cpassword=request.getParameter("cpswd");
		if(password.equals(cpassword)) {
			HttpSession session=request.getSession(true);
			session.setAttribute("email",email);
			session.setAttribute("password", password);
			response.sendRedirect("StudentEnroll.jsp");
		}else {
			response.sendRedirect("index.html");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

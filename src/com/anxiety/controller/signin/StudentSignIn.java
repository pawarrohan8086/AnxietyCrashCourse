package com.anxiety.controller.signin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/StudentSignIn")
public class StudentSignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
		HttpSession session=request.getSession(false);
		String email=(String) session.getAttribute("email");
		String password=(String)session.getAttribute("password");
		String ipaddress=(String)session.getAttribute("ipaddress");
		String hostname=(String)session.getAttribute("hostname");
		String location=(String)session.getAttribute("location");
		String date=(String)session.getAttribute("date");
		
		RequestDispatcher rd=request.getRequestDispatcher(response.encodeURL("StudentEnroll.jsp"));
		rd.include(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

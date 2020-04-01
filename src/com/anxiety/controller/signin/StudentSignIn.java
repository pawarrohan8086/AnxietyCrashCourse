package com.anxiety.controller.signin;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "StudentSignIn", urlPatterns = {"/StudentSignIn"})
public class StudentSignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		 HttpSession session=request.getSession(true);
		 session.setAttribute("uname", request.getParameter("uname"));
		 session.setAttribute("email", request.getParameter("email"));
		 session.setAttribute("pswd", request.getParameter("pswd"));
		 session.setAttribute("ipaddress",request.getRemoteAddr());
		 session.setAttribute("hostname", request.getRemoteHost());
		 session.setAttribute("date",new Date().toString());

		//store into database
		 request.setAttribute("flag","needs-validation");
		RequestDispatcher rd=request.getRequestDispatcher(response.encodeURL("StudentEnroll.jsp"));
		rd.include(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

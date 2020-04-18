package com.anxiety.controller.signin;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anxiety.dao.StudentOpration;

@WebServlet(name = "StudentSignIn", urlPatterns = {"/StudentSignIn"})
public class StudentSignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd=null;
		String email=request.getParameter("email");
		ServletContext sc=getServletContext();
		StudentOpration so=new StudentOpration(sc.getInitParameter("driver"), sc.getInitParameter("dburl"), sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
		String checkpswd=so.loginCheck(email);
		
		//return null when email not exist
		if(checkpswd==null) {
			
		 HttpSession session=request.getSession(true);
		 session.setAttribute("uname", request.getParameter("uname"));
		 session.setAttribute("email", email);
		 session.setAttribute("pswd", request.getParameter("psw"));
		 session.setAttribute("ipaddress",request.getRemoteAddr());
		 session.setAttribute("hostname", request.getRemoteHost());
		 session.setAttribute("date",new Date().toString());
		
		 request.setAttribute("flag","needs-validation");
		 rd=request.getRequestDispatcher(response.encodeURL("student/StudentEnroll.jsp"));
		rd.include(request, response);
		}else
		{
			rd=request.getRequestDispatcher("Home.jsp#apply");
			rd.forward(request, response);
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

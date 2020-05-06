package com.anxiety.controller.signin;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anxiety.dao.StudentOpration;

@WebServlet(name = "StudentSignIn", urlPatterns = { "/StudentSignIn" })
public class StudentSignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher rd = null;
		String email = request.getParameter("email");
		ServletContext sc = getServletContext();
		StudentOpration so = new StudentOpration(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
		sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
		String[] mailid = so.loginCheck(email);
		// return null when email not exist
		if (mailid == null) {
			request.setAttribute("uname", request.getParameter("uname"));
			request.setAttribute("email", email);
			request.setAttribute("pswd", request.getParameter("psw"));
			request.setAttribute("flag", "needs-validation");
			rd = request.getRequestDispatcher(response.encodeURL("student/StudentEnroll.jsp"));
			rd.include(request, response);
		} else {
			
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Mail Id already exist');window.location='Home.jsp#apply'");
			out.println("</script>");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}

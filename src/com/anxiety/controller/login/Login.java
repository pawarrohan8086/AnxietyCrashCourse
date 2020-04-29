package com.anxiety.controller.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anxiety.bean.dto.PasswordEnrypt;
import com.anxiety.dao.StudentOpration;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String user = request.getParameter("user");
		String email = request.getParameter("email");
		String pswd = request.getParameter("pswd");
		if (user.equalsIgnoreCase("admin")) {
			if (email.equals("admin123@gmail.com") && pswd.equals("admin")) {
				session.setAttribute("user", user);
				response.sendRedirect("admin/ShowAllStudent.jsp");
			} else {
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('wrong mail or password please try again..!');window.location='Home.jsp#apply'");
				out.println("</script>");
			}
		} else {

			ServletContext sc = getServletContext();
			StudentOpration so = new StudentOpration(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
					sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
			String[] mailid = so.loginCheck(email);
			String checkpswd=mailid[0];
			if (checkpswd != null) {

				if (PasswordEnrypt.checkpw(pswd, checkpswd)) {
					so.closeConnection();
					session.setAttribute("user", user);
					session.setAttribute("id",mailid[1]);
					session.setAttribute("uname", mailid[2]);
					session.setAttribute("sname", mailid[3]);
					response.sendRedirect("student/profile.jsp");
				} else {
					response.setContentType("text/html");
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Wrong email or password');window.location='Home.jsp#apply'");
					out.println("</script>");
				}

			} else {
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Wrong email or password');window.location='Home.jsp#apply'");
				out.println("</script>");
			}

		}

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}

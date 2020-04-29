package com.anxiety.controller.update;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.ListIterator;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anxiety.bean.bo.StudentBO;
import com.anxiety.bean.vo.StudentVO;
import com.anxiety.dao.StudentOpration;

@WebServlet("/ProfileUpdate")
public class ProfileUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String oldcontact = request.getParameter("oldcontact");
		String oldemail = request.getParameter("oldemail");
		String oldpassword = request.getParameter("oldpassword");

		System.out.println("old mail  " + oldemail);
		HttpSession session = request.getSession(false);
		String id = session.getAttribute("id").toString();
		StudentVO sdata = new StudentVO();

		// check contact
		if (oldcontact.equals(request.getParameter("contact"))) {
			sdata.setContact(request.getParameter("contact"));
		} else {

			ServletContext sc = getServletContext();
			StudentOpration so = new StudentOpration(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
					sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
			ArrayList<Long> mob = so.contactCheck();
			ListIterator<Long> ltr = mob.listIterator();
			int flag = 0;
			while (ltr.hasNext()) {
				Long contact = ltr.next();
				if (contact == Long.parseLong(request.getParameter("contact"))) {
					flag = 1;
					break;
				}
			}
			if (flag == 1) {
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Mobile number already Resister');window.location='student/UpdateProfile.jsp'");
				out.println("</script>");

			} else {

				sdata.setContact(request.getParameter("contact"));
			}

			so.closeConnection();

		}

		// check password
		if (oldpassword.equals(request.getParameter("password")))

		{
			sdata.setPassword(request.getParameter("password"));
		} else {

		}

		// check mail
		if (oldemail.equals(request.getParameter("email"))) {
			sdata.setEmail(request.getParameter("email"));
		} else {
			String email = request.getParameter("email");
			System.out.println("new mail  " + email);
			ServletContext sc = getServletContext();
			StudentOpration so = new StudentOpration(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
					sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
			String[] mailid = so.loginCheck(email);

			// return null when email not exist
			if (mailid == null) {

				sdata.setEmail(email);

			}
			so.closeConnection();
			System.out.println("else");
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Email id already Resister...:)');window.location='student/UpdateProfile.jsp'");
			out.println("</script>");

		}

		sdata.setUsername(request.getParameter("uname"));
		sdata.setSname(request.getParameter("name"));
		sdata.setAddress(request.getParameter("address"));

		StudentBO sbo = new StudentBO();
		sbo.setUsername(sdata.getUsername());
		sbo.setEmail(sdata.getEmail());
		sbo.setSname(sdata.getSname());
		sbo.setContact(Long.parseLong(sdata.getContact()));
		sbo.setAddress(sdata.getAddress());
		sbo.setPassword(sdata.getPassword());

		ServletContext sc = getServletContext();
		StudentOpration so = new StudentOpration(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
				sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
		int c = so.updateProfile(id, sbo);
		if (c == 1) {
			String show = "update Succesfully";
			response.sendRedirect("student/profile.jsp?alert=" + show + "");
		} else {

			String show = "same record Found";
			response.sendRedirect("student/profile.jsp?alert=" + show + "");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}

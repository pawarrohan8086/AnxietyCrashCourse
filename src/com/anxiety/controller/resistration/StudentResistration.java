package com.anxiety.controller.resistration;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.ListIterator;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anxiety.bean.bo.StudentBO;
import com.anxiety.bean.dto.StudentDTO;
import com.anxiety.bean.vo.StudentVO;
import com.anxiety.dao.StudentOpration;

@WebServlet("/StudentResistration")
public class StudentResistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int flag = 5;
		ServletContext sc = getServletContext();
		StudentOpration so = new StudentOpration(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
				sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
		ArrayList<Long> mob = so.contactCheck();
		if (mob == null) {
			flag = 0;
		} else {
			ListIterator<Long> ltr = mob.listIterator();
			while (ltr.hasNext()) {
				Long contact = ltr.next();
				if (contact == Long.parseLong(request.getParameter("mobile"))) {
					so.closeConnection();
					flag = 1;
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Mobile number already Resister');window.location='student/StudentEnroll.jsp'");
					out.println("</script>");

				} else {
					flag = 0;
				}
			}
		}
		if (flag == 0) {

			int sid = Math.abs(UUID.randomUUID().hashCode());
			String value = request.getParameter("course");
			String[] cvalue = value.split("-");
			String course = cvalue[0];
			String fees = cvalue[1];

			// hold the data
			StudentVO sdata = new StudentVO();
			sdata.setUsername(request.getParameter("uname"));
			sdata.setEmail(request.getParameter("email"));
			sdata.setPassword(request.getParameter("pswd"));
			sdata.setSname(request.getParameter("name"));
			sdata.setContact(request.getParameter("mobile"));
			sdata.setAddress(request.getParameter("address"));
			sdata.setFees(fees);
			sdata.setAdmision_date(request.getParameter("adate"));
			sdata.setCourse(course);

			// dto class
			StudentDTO sdto = new StudentDTO();
			sdto.setUsername(sdata.getUsername());
			sdto.setEmail(sdata.getEmail());
			sdto.setPassword(sdata.getPassword());
			sdto.setSname(sdata.getSname());
			sdto.setStudentid(sid);
			sdto.setContact(Long.parseLong(sdata.getContact()));
			sdto.setAddress(sdata.getAddress());
			sdto.setFees(Double.parseDouble(sdata.getFees()));
			sdto.setAdmision_date(sdata.getAdmision_date());
			sdto.setCourse(sdata.getCourse());

			// bo class
			StudentBO sbo = new StudentBO();
			sbo.setUsername(sdto.getUsername());
			sbo.setEmail(sdto.getEmail());
			sbo.setPassword(sdto.getPassword());
			sbo.setSname(sdto.getSname());
			sbo.setContact(sdto.getContact());
			sbo.setAddress(sdto.getAddress());
			sbo.setFees(sdto.getFees());
			sbo.setAdmision_date(sdto.getAdmision_date());
			sbo.setCourse(sdto.getCourse());
			sbo.setStudentid(sdto.getStudentid());

			int c = so.insertRecord(sbo);

			if (c == 1) {

				so.closeConnection();
				HttpSession session=request.getSession();
				session.setAttribute("id", sid);
				session.setAttribute("uname",sbo.getUsername());
				session.setAttribute("sname",sbo.getSname());
				RequestDispatcher rd1 = request.getRequestDispatcher("student/profile.jsp");
				rd1.include(request, response);
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Sorry Something went to wrong please try again');window.location='Home.jsp#apply'");
				out.println("</script>");
			}

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

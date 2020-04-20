package com.anxiety.controller.update;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anxiety.bean.bo.SubjectBO;
import com.anxiety.dao.SubjectOperation;

@WebServlet("/SubjectUpdate")
public class SubjectUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		SubjectBO subbo = new SubjectBO();

		subbo.setSub_id(Integer.parseInt(request.getParameter("subid")));
		subbo.setSub_name(request.getParameter("subname"));
		subbo.setSub_tmarks(Integer.parseInt(request.getParameter("stmark")));
		subbo.setSub_pmarks(Integer.parseInt(request.getParameter("spmark")));
		subbo.setSub_question(Integer.parseInt(request.getParameter("exque")));
		subbo.setSub_fees(Double.parseDouble(request.getParameter("sfees")));
		subbo.setSub_offer(Integer.parseInt(request.getParameter("soffer")));
		subbo.setSub_duration(Integer.parseInt(request.getParameter("sduration")));

		ServletContext sc = getServletContext();
		SubjectOperation subo = new SubjectOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
				sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
		int c = subo.updateSubject(subbo);
		if (c == 1) {
			String show = "Subject Updated";
			response.sendRedirect("admin/ShowAllSubjects.jsp?alert=" + show + "");
		} else {

			String show = "somthing goes wrong....!";
			response.sendRedirect("admin/ShowAllSubjects.jsp?alert=" + show + "");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

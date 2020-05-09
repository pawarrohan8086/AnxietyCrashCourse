package com.anxiety.controller.delete;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anxiety.dao.StudentOpration;


@WebServlet("/DeleteStudent")
public class DeleteStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sid=request.getParameter("id");
		ServletContext sc=getServletContext();
		StudentOpration so=new StudentOpration(sc.getInitParameter("driver"), sc.getInitParameter("dburl"), sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
		int c=so.deleteRecord(sid);
		if(c==1) {
			String show="Record Deleted.";
			response.sendRedirect("admin/ShowAllStudent.jsp?alert="+show+"");	
		}else {
		
			String show="Something Wrong...!";
			response.sendRedirect("admin/ShowAllStudent.jsp?alert="+show+"");
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}

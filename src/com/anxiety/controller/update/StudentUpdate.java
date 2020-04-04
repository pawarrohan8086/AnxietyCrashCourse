package com.anxiety.controller.update;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anxiety.bean.bo.StudentBO;
import com.anxiety.bean.vo.StudentVO;
import com.anxiety.dao.StudentOpration;


@WebServlet("/StudentUpdate")
public class StudentUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String id=request.getParameter("id");
		StudentVO sdata=new StudentVO();
		sdata.setUsername(request.getParameter("uname"));
		sdata.setEmail(request.getParameter("email"));
		sdata.setSname(request.getParameter("name"));
		sdata.setContact(request.getParameter("contact"));
		sdata.setAddress(request.getParameter("address"));
		sdata.setFees(request.getParameter("fees"));
		sdata.setAdmision_date(request.getParameter("adate"));
		sdata.setCourse(request.getParameter("course"));
		
		StudentBO sbo=new StudentBO();
		sbo.setUsername(sdata.getUsername());
		sbo.setEmail(sdata.getEmail());
		sbo.setSname(sdata.getSname());
		sbo.setContact(Long.parseLong(sdata.getContact()));
		sbo.setAddress(sdata.getAddress());
		sbo.setFees(Double.parseDouble(sdata.getFees()));
		sbo.setAdmision_date(sdata.getAdmision_date());
		sbo.setCourse(sdata.getCourse());
		
		
		ServletContext sc=getServletContext();
		StudentOpration so=new StudentOpration(sc.getInitParameter("driver"), sc.getInitParameter("dburl"), sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
		int c=so.updateRecord(id,sbo);
		if(c==1) {
			String show="update Succesfully";
			response.sendRedirect("UpdateStudent.jsp?alert="+show+"&id="+id+"");	
		}else {
		
			String show="same record Found";
			response.sendRedirect("UpdateStudent.jsp?alert="+show+"&id="+id+"");
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

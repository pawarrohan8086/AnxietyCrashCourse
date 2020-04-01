package com.anxiety.controller.resistration;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anxiety.bean.vo.StudentVO;


@WebServlet("/StudentResistration")
public class StudentResistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String[] uid = UUID.randomUUID().toString().split("-");
		HttpSession session=request.getSession(false);
		
		//hold the data
		StudentVO sdata=new StudentVO();
		sdata.setUsername(session.getAttribute("uname").toString());
		sdata.setEmail(session.getAttribute("email").toString());
		sdata.setPassword(session.getAttribute("pswd").toString());
		sdata.setSname(request.getParameter("name"));
		sdata.setContact(request.getParameter("mobile"));
		sdata.setAddress(request.getParameter("address"));
		sdata.setFees(request.getParameter("fees"));
		sdata.setAdmision_date(request.getParameter("adate"));
		sdata.setCourse(request.getParameter("course"));
		
		PrintWriter out=response.getWriter();
		out.println("resister successfull");
		out.println(sdata.getUsername()+"\n"
				+sdata.getEmail()+"\n"
				+sdata.getPassword()+"\n"
				+sdata.getSname()+"\n"
				+sdata.getContact()+"\n"
				+sdata.getAddress()+"\n"
				+sdata.getFees()+"\n"
				+sdata.getAdmision_date()+"\n"
				+sdata.getCourse());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

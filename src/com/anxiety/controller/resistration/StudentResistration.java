package com.anxiety.controller.resistration;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

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

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String[] uid = UUID.randomUUID().toString().split("-");
		String sid=uid[0];
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
		
		//dto class
		StudentDTO sdto=new StudentDTO();
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
		
		//bo class
		StudentBO sbo=new StudentBO();
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
		
		
		ServletContext sc=getServletContext();
		StudentOpration so=new StudentOpration(sc.getInitParameter("driver"), sc.getInitParameter("dburl"), sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
		int c=so.insertRecord(sbo);
		PrintWriter out=response.getWriter();
		if(c==1) {
			
				out.println("resister successfull");
				out.println(sdata.getUsername()+"\n"+ sdto.getStudentid()
				+sdata.getEmail()+"\n"
				+sdata.getPassword()+"\n"
				+sdata.getSname()+"\n"
				+sdata.getContact()+"\n"
				+sdata.getAddress()+"\n"
				+sdata.getFees()+"\n"
				+sdata.getAdmision_date()+"\n"
				+sdata.getCourse());
		}else out.println("not register");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

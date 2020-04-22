package com.anxiety.controller.update;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anxiety.bean.bo.OptionBO;
import com.anxiety.dao.OptionOperation;
@WebServlet("/OptionUpdate")
public class OptionUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		OptionBO obo=new OptionBO();
		obo.setQue_id(Integer.parseInt(request.getParameter("qid")));
		obo.setOption_id(Byte.parseByte(request.getParameter("opid")));
		obo.setOption1(request.getParameter("op1"));
		obo.setOption2(request.getParameter("op2"));
		obo.setOption3(request.getParameter("op3"));
		obo.setOption4(request.getParameter("op4"));
		
		ServletContext sc = getServletContext();
		OptionOperation opo = new OptionOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
				sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
		int c =opo.updateOption(obo);
		if (c == 1) {
			String show = "Question Updated";
			response.sendRedirect("admin/ShowAllQuestions.jsp?alert=" + show + "");
		} else {

			String show = "somthing goes wrong....!";
			response.sendRedirect("admin/ShowAllQuestions.jsp?alert=" + show + "");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

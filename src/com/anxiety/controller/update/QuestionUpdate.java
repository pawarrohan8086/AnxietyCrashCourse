package com.anxiety.controller.update;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anxiety.bean.bo.QuestionBO;
import com.anxiety.dao.QuestionOperation;


@WebServlet("/QuestionUpdate")
public class QuestionUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		QuestionBO qbo=new QuestionBO();
		qbo.setQue_id(Integer.parseInt(request.getParameter("qid")));
		qbo.setQue_marks(Integer.parseInt(request.getParameter("qmark")));
		qbo.setSub_name(request.getParameter("subname"));
		qbo.setQuestion_type(request.getParameter("qtype"));
		qbo.setQuetext(request.getParameter("qtext"));
		qbo.setAnstext(request.getParameter("atext"));

		ServletContext sc = getServletContext();
		QuestionOperation qo = new QuestionOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
				sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
		int c =qo.updateQuestion(qbo);
		if (c == 1) {
			RequestDispatcher rd=request.getRequestDispatcher("admin/UpdateOption.jsp?id="+qbo.getQue_id()+"");
			rd.include(request, response);
		} else {

			String show = "somthing goes wrong....!";
			response.sendRedirect("admin/ShowAllQuestions.jsp?alert=" + show + "");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}

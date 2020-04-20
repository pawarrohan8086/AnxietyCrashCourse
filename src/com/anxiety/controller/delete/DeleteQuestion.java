package com.anxiety.controller.delete;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anxiety.dao.OptionOperation;
import com.anxiety.dao.QuestionOperation;


@WebServlet("/DeleteQuestion")
public class DeleteQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int queid=Integer.parseInt(request.getParameter("id"));
		
		ServletContext sc=getServletContext();
		QuestionOperation qo=new QuestionOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"), sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
		int c=qo.deleteQuestion(queid);
		if(c==1) {
			OptionOperation opo=new OptionOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"), sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
			int d=opo.deleteOption(queid);
			if(d==1) {
				String show="Question Deleted.";
				response.sendRedirect("admin/ShowAllQuestions.jsp?alert="+show+"");	
			}else {
				String show="somthing goes wrong....!";
				response.sendRedirect("admin/ShowAllQuestions.jsp?alert="+show+"");
			}
		}else {
			String show="somthing goes wrong....!";
			response.sendRedirect("admin/ShowAllQuestions.jsp?alert="+show+"");
		}


	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

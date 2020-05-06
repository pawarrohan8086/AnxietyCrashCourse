package com.anxiety.controller.answer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.ListIterator;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anxiety.bean.bo.OptionBO;
import com.anxiety.bean.bo.QuestionBO;
import com.anxiety.dao.OptionOperation;
import com.anxiety.dao.QuestionOperation;

@WebServlet("/AddAnswers")
public class AddAnswers extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mins = request.getParameter( "mins" );
		if( mins == null ) mins = "0";
		  
		String secs = request.getParameter( "secs" );
		if( secs == null ) secs = "31";

		String qid = request.getParameter( "qid" );
		if( qid == null ) qid = "1";


		response.sendRedirect("exam/exam2.jsp?mins="+mins+"&secs="+secs+"");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

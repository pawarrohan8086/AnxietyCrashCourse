package com.anxiety.controller.question;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anxiety.bean.bo.OptionBO;
import com.anxiety.bean.bo.QuestionBO;
import com.anxiety.bean.vo.OptionVO;
import com.anxiety.bean.vo.QuestionVO;
import com.anxiety.dao.OptionOperation;
import com.anxiety.dao.QuestionOperation;

@WebServlet("/addque")
public class AddQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		QuestionVO qvo=new QuestionVO();
		qvo.setSub_name(request.getParameter("sub_name"));
		qvo.setQuestion_type(request.getParameter("question_type"));
		qvo.setQue_marks(request.getParameter("que_marks"));
		qvo.setQuetext(request.getParameter("quetext"));
		qvo.setAns_id(request.getParameter("ans_id"));
	
		OptionVO ovo=new OptionVO();
		ovo.setOption1(request.getParameter("option1"));
		ovo.setOption2(request.getParameter("option2"));
		ovo.setOption3(request.getParameter("option3"));
		ovo.setOption4(request.getParameter("option4"));
		
		QuestionBO qbo=new QuestionBO();
		qbo.setSub_name(qvo.getSub_name());
		qbo.setQue_marks(Integer.parseInt(qvo.getQue_marks()));
		qbo.setQuestion_type(qvo.getQuestion_type());
		qbo.setQuetext(qvo.getQuetext());
		switch(qvo.getAns_id()) {
		
		case "1":	qbo.setAnstext(ovo.getOption1());
					break;
		case "2": 	qbo.setAnstext(ovo.getOption2());
		  			break;
		case "3": 	qbo.setAnstext(ovo.getOption3());
					break;
		case "4": 	qbo.setAnstext(ovo.getOption4());
					break;
		default:	qbo.setAnstext("null");
		}
		
		OptionBO obo=new OptionBO();
		obo.setOption_id(Byte.parseByte(qvo.getAns_id()));
		obo.setOption1(ovo.getOption1());
		obo.setOption2(ovo.getOption2());
		obo.setOption3(ovo.getOption3());
		obo.setOption4(ovo.getOption4());
		
		ServletContext sc=getServletContext();
		QuestionOperation queo=new QuestionOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"), sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
		int[] c=queo.addQuestion(qbo);
		
		obo.setQue_id(c[1]);
		
		if(c[0]==1) {
			
			OptionOperation opto=new OptionOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"), sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
			int d=opto.addQuestion(obo);
			if(d==1) {
				queo.closeConnection();
				response.sendRedirect("admin/AddQuestion.jsp?q=1");
			}
		}else {
			queo.closeConnection();
			response.sendRedirect("admin/AddQuestion.jsp?q=0");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

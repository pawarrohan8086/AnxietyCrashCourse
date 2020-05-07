package com.anxiety.controller.answer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anxiety.bean.bo.AnswerBO;
import com.anxiety.dao.AnswerOperation;

@WebServlet("/AddAnswers")
public class AddAnswers extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int flag=5,tmakrs=0,gmarks=0;
		HttpSession session = request.getSession(false);
		String course=session.getAttribute("course").toString();
        //generate auid for answer
		long auid = System.currentTimeMillis();
		int qsize = Integer.parseInt(request.getParameter("qsize"));
		PrintWriter out = response.getWriter();
		if (qsize != 0) {
			AnswerBO abo = null;
			List<AnswerBO> ala=new ArrayList<AnswerBO>();
			
			for (int i = 1; i <= qsize; i++) {

				int qid = Integer.parseInt(request.getParameter("qid" + i + ""));
				String quetext = request.getParameter("quetext" + i + "");
				String anstext = request.getParameter("anstext" + i + "");
				String qtype = request.getParameter("qtype" + i + "");
				int qmark = Integer.parseInt(request.getParameter("qmark" + i + ""));
				String ans = request.getParameter("ans" + i + "");
				if (ans == null)
					ans = "not selected";
				tmakrs=tmakrs+qmark;
				abo = new AnswerBO();
				abo.setQid(qid);
				abo.setQuetext(quetext);
				abo.setAnstext(anstext);
				abo.setQmark(qmark);
				abo.setAns(ans);
				abo.setQtype(qtype);
				abo.setSub_name(course);
				abo.setAuid(auid+"");
				if (ans.equals(anstext)) {
					abo.setGrade("Right");
					gmarks=gmarks+qmark;
				} else {
					abo.setGrade("Wrong");
				}
				ala.add(abo);
			}
			ServletContext sc = getServletContext();
			AnswerOperation ao = new AnswerOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
			sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
			int[] c=ao.addAnswer(ala);
			for(int  c1:c) {
				if(c1!=0) {
						flag=1;
				}else {
					flag=0;
				}
			}
			if(flag==1) {
				
				out.println("completed");
				out.println(course);
				out.println(auid);
				out.println("total"+tmakrs);
				out.println("getting"+gmarks);
				float perc=(gmarks*100)/tmakrs;
				out.println(perc); 
				if(perc>35.00) {
					out.println("pass");
				}else {
					out.println("fail");
				}
				long millis=System.currentTimeMillis();  
				java.util.Date date=new java.util.Date(millis);  
				out.println(date); 
				
				
				
			}else {
				out.println("incompleted");
			}

		}


		// response.sendRedirect("student/grade.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

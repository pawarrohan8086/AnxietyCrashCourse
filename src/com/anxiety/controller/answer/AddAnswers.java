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
import com.anxiety.bean.bo.GradeBO;
import com.anxiety.dao.AnswerOperation;
import com.anxiety.dao.GradeCardOperation;

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
				abo.setAuid(auid);
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
				
				GradeBO gbo=new GradeBO();
				gbo.setSid(Integer.parseInt(session.getAttribute("id").toString()));
				gbo.setCourse(course);
				gbo.setAuid(auid);
				gbo.setScore(gmarks);
				gbo.setTmark(tmakrs);
				float perc=(gmarks*100)/tmakrs;
				gbo.setPercentage(perc);
				if(perc>35.00) {
					gbo.setRemark("pass");
				}else {
					gbo.setRemark("fail");
				}
				long millis=System.currentTimeMillis();  
				java.util.Date edate=new java.util.Date(millis); 
				gbo.setEdate(edate.toString());
				GradeCardOperation gradeo = new GradeCardOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
						sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
				int f=gradeo.addGrade(gbo);
				if(f==1) {
					response.sendRedirect("student/grade.jsp");
				}else {
					out.println("Something went wrong");
				}
				
				
				
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

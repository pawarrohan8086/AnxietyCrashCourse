package com.anxiety.controller.subject;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anxiety.bean.bo.SubjectBO;
import com.anxiety.bean.vo.SubjectVO;


@WebServlet("/AddSubject")
public class AddSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SubjectVO subvo=new SubjectVO();
		
		subvo.setSub_name(request.getParameter("subjectname"));
		subvo.setSub_tmarks(request.getParameter("stmark"));
		subvo.setSub_pmarks(request.getParameter("spmark"));
		subvo.setSub_question(request.getParameter("stquestion"));
		subvo.setSub_fees(request.getParameter("sfees"));
		subvo.setSub_offer(request.getParameter("soffer"));
		subvo.setSub_duration(request.getParameter("sduration"));
		
		int subid=+UUID.randomUUID().hashCode();
		SubjectBO subbo=new SubjectBO();
		subbo.setSub_id(subid);
		subbo.setSub_name(subvo.getSub_name());
		subbo.setSub_tmarks(Integer.parseInt(subvo.getSub_tmarks()));
		subbo.setSub_pmarks(Integer.parseInt(subvo.getSub_pmarks()));
		subbo.setSub_question(Integer.parseInt(subvo.getSub_question()));
		subbo.setSub_fees(Integer.parseInt(subvo.getSub_fees()));
		subbo.setSub_offer(Integer.parseInt(subvo.getSub_offer()));
		subbo.setSub_duration(Integer.parseInt(subvo.getSub_duration()));

	
	
	
	
	}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}

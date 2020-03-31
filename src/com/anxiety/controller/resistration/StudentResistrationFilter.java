package com.anxiety.controller.resistration;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@WebFilter(servletNames = { "StudentResistration" })
public class StudentResistrationFilter implements Filter {

   
	public void destroy() {
		// TODO Auto-generated method stub
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	
		
		String uname=request.getParameter("name");
		String mobile=request.getParameter("mobile");
		String address=request.getParameter("address");
		String fees=request.getParameter("fees");
		String adate=request.getParameter("adate");
		String course=request.getParameter("course");
		
		HttpServletRequest req=(HttpServletRequest)request;
		HttpSession session=req.getSession(false);
		session.setAttribute("name", uname);
		session.setAttribute("mobile", mobile);
		session.setAttribute("address", address);
		session.setAttribute("fees", fees);
		session.setAttribute("adate", adate);
		session.setAttribute("course", course);
		chain.doFilter(request, response);
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}

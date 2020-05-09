package com.anxiety.controller.signin;

import java.io.IOException;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter(filterName="filter1", urlPatterns="/StudentSignIn")
public class StudentLogFilter implements Filter {

	public void destroy() {
		
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req=(HttpServletRequest)request;
		
		String ipaddress=request.getRemoteAddr();
		String hostname=request.getRemoteHost();
		String location=request.getLocale().toString();
		String date=new Date().toString();
		
		HttpSession session=req.getSession(true);
		session.setAttribute("ipaddress",ipaddress );
		session.setAttribute("hostname",hostname);
		session.setAttribute("location",location);
		session.setAttribute("date",date);
		
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}

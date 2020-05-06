package com.anxiety.controller.login;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns = {/*"/student/*","/admin/*"*/})
public class LoginFilter implements Filter {
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		Object user=null;
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		if(session.isNew()) {
			 user ="notadmin";
		}else {
			user=session.getAttribute("user");
		}
		if (user == null) {
			RequestDispatcher rd = request.getRequestDispatcher("/Home.jsp");
			rd.forward(request, response);
		} else if (user.toString().equals("admin")) {
			chain.doFilter(request, response);
		} else if (user.toString().equals("student")) {
			chain.doFilter(request, response);
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("/Home.jsp");
			rd.forward(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}

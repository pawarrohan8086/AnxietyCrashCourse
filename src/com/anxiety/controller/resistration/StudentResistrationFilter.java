package com.anxiety.controller.resistration;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/StudentResistration")
public class StudentResistrationFilter implements Filter {

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		String name = request.getParameter("name");
		String mobile = request.getParameter("mobile");
		String address = request.getParameter("address");
		if ((name != null && mobile != null) && address != null) {

			String vmob = "(0/91)?[7-9][0-9]{9}";

			if (mobile.matches(vmob)) {

				chain.doFilter(request, response);

			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('null value inserted');window.location='student/StudentEnroll.jsp'");
				out.println("</script>");
				return;
			}

		} else {
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('null value inserted');window.location='student/StudentEnroll.jsp'");
			out.println("</script>");
			return;
		}

	}// do get

	public void init(FilterConfig fConfig) throws ServletException {

	}

}

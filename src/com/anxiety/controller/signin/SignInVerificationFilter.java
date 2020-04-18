package com.anxiety.controller.signin;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;



@WebFilter(filterName="filter1", urlPatterns="/StudentSignIn")
public class SignInVerificationFilter implements Filter {

	
	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		RequestDispatcher rd=null;
		final String validemail="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"+"[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
		final String validpass="^.*(?=.{8,})(?=..*[0-9])(?=.*[a-z])(?=.*[A-Z]).*$";
		final String validuname="^[a-zA-Z0-9_-]{3,15}$";
		if(request.getParameter("email")!=null &&
		( request.getParameter("psw")!=null && request.getParameter("cpsw")!=null) ){
			
			if(request.getParameter("psw").equals(request.getParameter("cpsw")) 
					&& request.getParameter("uname").matches(validuname)) {
			
				if(request.getParameter("email").matches(validemail) && request.getParameter("psw").matches(validpass)) {
						
					chain.doFilter(request, response);
				}
				else{
					
					rd=request.getRequestDispatcher("Home.jsp#apply");
					rd.forward(request, response);
				}
				
			}else {
				rd=request.getRequestDispatcher("Home.jsp#apply");
				rd.forward(request, response);
			}
		}else {
			rd=request.getRequestDispatcher("Home.jsp#apply");
			rd.forward(request, response);
		}
		
	}
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}

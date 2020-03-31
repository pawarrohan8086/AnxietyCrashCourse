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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@WebFilter(filterName="filter2", urlPatterns="/StudentSignIn")
public class SignInVerificationFilter implements Filter {

	
	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req=(HttpServletRequest)request;
		RequestDispatcher rd=null;
		HttpSession session=req.getSession(false);
		String validemail="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"+"[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
		String validpass="^.*(?=.{8,})(?=..*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).*$";
		
		String email=request.getParameter("email");
		String password=request.getParameter("pswd");
		String cpassword=request.getParameter("cpswd");

		
		if( email.matches(validemail) && password.equals(cpassword)) {
			
			if(password.matches(validpass)) {
				
				session.setAttribute("email",email );
				session.setAttribute("password",password);
			chain.doFilter(request, response);

			}else 
			{
				session.invalidate();
				rd=request.getRequestDispatcher("Home.jsp");
				rd.forward(request, response);
			}//innerelse
		}else 
		{
			session.invalidate();
			rd=request.getRequestDispatcher("Home.jsp");
			rd.forward(request, response);
		}//outerelse
		
	}
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}

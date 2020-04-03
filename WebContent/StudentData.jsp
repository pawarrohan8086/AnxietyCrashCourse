<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Student Registration</title>
<%@include file="/commonfiles/link.jsp"%>
</head>
<%@ page import="com.anxiety.dao.StudentOpration,java.util.ArrayList,com.anxiety.bean.bo.StudentBO,java.util.ListIterator" %> 
<body>
<%@include file="/commonfiles/Header.jsp" %>
          <div class="stable table-responsive animate">
            <h2>Student Data</h2><br>
            <table class="table table-sm table-hover">
                <thead class="thead-dark table-bordered" >
                    <tr>
                        <th>SID</th>                 
                        <th>SNAME</th>
                        <th>CONTACT</th>
                        <th>EMAIL</th>
                        <th>USERNAME</th>
                        <th>PASSWORD</th>
                        <th>ADDRESS</th>
                        <th>COURSE</th>
                        <th>FEES</th>
                        <th>ADMISION_DATE</th>
                        <th>EDIT</th>
                        <th>DELETE</th>
                    </tr>
                </thead>
  
        
         <%
        
        		ServletContext sc=getServletContext();
        		StudentOpration so=new StudentOpration(sc.getInitParameter("driver"), sc.getInitParameter("dburl"), sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
        		 ArrayList<StudentBO> sal=so.getAllRecord();					
				ListIterator<StudentBO> li=sal.listIterator();
				StudentBO sd=null;
				while(li.hasNext()){
						sd=li.next();
						out.println("hello");
				
				
		%>   
              
                <tbody>
                <tr>
                    <td><%=sd.getStudentid() %></td>
                    <td><%=sd.getSname() %> </td>
                    <td><%= sd.getContact() %></td>
                    <td><%= sd.getEmail()%></td>
                    <td><%=sd.getUsername() %> </td>
                    <td><%=sd.getPassword() %></td>
                    <td><%= sd.getAddress()%></td>
                    <td><%=sd.getCourse() %></td>
                    <td><%=sd.getFees() %></td>
                    <td><%=sd.getAdmision_date()	 %></td>
                    <td><a href="Home.jsp">Edit</a></td>
                    <td><a href="Home.jsp">Delete</a></td>
                </tr>
                <% } so.closeConnection(); %>
                </tbody>
            </table>
        </div>       

 
<%@include file="/commonfiles/Footer.jsp" %>
</body>
</html>
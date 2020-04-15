<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.anxiety.dao.StudentOpration,java.util.ArrayList,com.anxiety.bean.bo.StudentBO,java.util.ListIterator" %>
<!DOCTYPE html>
<html>
<head>
<title> Update Student </title>

<%@include file= "/commonfiles/link.jsp"%>
</head>
<body>
<%@include file="/commonfiles/Header.jsp" %>
	<div class="wrapper">

		<!-- asidebar Holder -->
		<div id="asidebar">
			<div class="asidebar-header">
				<h3>Anxiety Crash Course</h3>
				<strong>RP</strong>
			</div>
			<ul class="list-unstyled components">
				<li  class="active">
					<a href="#student" data-toggle="collapse" aria-expanded="false">
						<i class="glyphicon glyphicon-text-background"></i>
						Student
					</a>
					<ul class="collapse list-unstyled" id="student">
						<li  class="active"><a href="AddStudent.jsp">Add Student </a></li>
					</ul>
				</li>
				<li >
					<a href="#question" data-toggle="collapse" aria-expanded="false">
						<i class="glyphicon glyphicon-text-background"></i>
						Question
					</a>
					<ul class="collapse list-unstyled" id="question">
						<li ><a href="AddQuestion.jsp">Add Questions </a></li>
					</ul>
				</li>
				<li>
					<a href="#subject" data-toggle="collapse" aria-expanded="false">
						<i class="glyphicon glyphicon-briefcase"></i>Subject
					</a>
					<ul class="collapse list-unstyled" id="subject">
						<li><a href="AddSubject.jsp">Add  Subject</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<!-- Page Content Holder -->
		<div id="content">
			<button type="button" id="asidebarCollapse" class="btn btn-danger navbar-btn">
				<i class="glyphicon glyphicon-align-justify"> </i>
			</button>
			<br><br>
<!-- Edit Student data -->
<div class="container">
    <h1>Edit Profile</h1>
    <hr>
    <div class="row">
    <h3 class="text-muted">Student info</h3><br><br>

      
               <%
               
               	String updateAlert=request.getParameter("alert");
               if(updateAlert==null){
            	   updateAlert="";
               }
               	String sid=request.getParameter("id");
        		ServletContext sc=getServletContext();
        		StudentOpration so=new StudentOpration(sc.getInitParameter("driver"), sc.getInitParameter("dburl"), sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
        		StudentBO sd=so.getRecordById(sid);
        		
				%> 
      <!-- edit form column -->
      <div class="col-md-9 personal-info">
        <div class="alert alert-info alert-dismissable">
          <a class="panel-close" data-dismiss="alert"></a> 
          <i class="fa fa-graduation-cap"></i>
           <strong><%=updateAlert %></strong> 
        </div>
       
        
        <form class="form-horizontal" action="../StudentUpdate" role="form" method="post">
          <div class="row">
            <label class="col-lg-3 control-label text-info">Name:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text"  name="name" value="<%=sd.getSname() %>" required>
            </div>
          </div><br>
          <div class="row">
            <label class="col-lg-3 control-label text-info">Address:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="address" value="<%= sd.getAddress()%>" required>
            </div>
          </div><br>
          <div class="row">
            <label class="col-lg-3 control-label text-info">Contact:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="contact" value="<%= sd.getContact() %>" maxlength="10"  minlength="10" required>
            </div>
          </div><br>
          <div class="row">
            <label class="col-lg-3 control-label text-info">Course:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="course" value="<%=sd.getCourse() %>" required>
            </div>
          </div><br>
          <div class="row">
            <label class="col-lg-3 control-label text-info">Fees:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="fees" value="<%=sd.getFees() %>" required>
            </div>
          </div><br>
           <div class="row ">
            <label class="col-lg-3 control-label  text-info">Admission Date:</label>
            <div class="col-lg-8">
              <input class="form-control" type="date" name="adate" value="<%=sd.getAdmision_date() %>" required>
            </div>
          </div><br>
          <div class="row">
            <label class="col-lg-3 control-label text-info">Email:</label>
            <div class="col-lg-8">
              <input class="form-control" type="email" name="email" value="<%= sd.getEmail()%>" required>
            </div>
          </div><br>
          <div class="row">
            <label class="col-md-3 control-label text-info">User Name:</label>
            <div class="col-md-8">
              <input class="form-control" type="text" name="uname" value="<%=sd.getUsername() %>" required>
			<input type="hidden" name="id" value="<%=sid%>">            
            </div>
          </div><br>
          <%   so.closeConnection(); %>  
          <div class="row">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
              <input type="submit" class="btn btn-success" value="Save Changes">
              <span></span>
              <a href="AddStudent.jsp"><input type="button" class="btn btn-info" value="Back"></a>
            </div>
          </div>
        </form>
      </div>
  </div>
</div>
<hr>
</div>
</div>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		$('#asidebarCollapse').on('click', function () {
			$('#asidebar').toggleClass('active');
		});
	});
</script>
<%@include file="/commonfiles/Footer.jsp" %>
</body>
</html> 

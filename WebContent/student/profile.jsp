<!DOCTYPE html>
<html>
<head>
<title>student</title>
<%@include file="/commonfiles/link.jsp"%>
<%@page
	import="java.util.ArrayList,java.util.ListIterator,java.sql.ResultSet,com.anxiety.dao.StudentOpration,com.anxiety.bean.bo.StudentBO"%>
</head>
<body>
	<%@include file="common/Header.jsp"%>
	<div class="wrapper">
		<div id="mySidebar" class="sidebar">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">x</a>
			<img
				src="http://localhost:8080/AnxietyCrashCourse/web/images/studentlogo.jpg"
				class="rounded-circle mx-auto d-block" alt="user logo" width="150"
				height="150"> <br>
			<%
				String sid = session.getAttribute("id").toString();
				ServletContext sc = getServletContext();
				StudentOpration so = new StudentOpration(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
						sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
				StudentBO sbo = so.getRecordById(sid);
			%>
			<h3 style="color: #FCF6F5FF; text-align: center;">
				<%=sbo.getSname()%></h3>
			<br>
			<hr style="color: black;">
			<ul>
				<li class="active"><a href="profile.jsp"><i
						class="fa fa-fw fa-user"></i> Profile</a></li>
				<li><a href="UpdateProfile.jsp"><i class="fa fa-pencil"
						aria-hidden="true"></i> Edit Profile</a></li>
				<li><a href="exam.jsp"><i class="fa fa-book"
						aria-hidden="true"></i> Exam</a></li>
				<li><a href="grade.jsp"><i class="fa fa-line-chart"
						aria-hidden="true"></i> Grade</a></li>
			</ul>
		</div>

		<div id="main">
			<button type="button" class="openbtn btn btn-primary"
				onclick="openNav()">
				<i class="fa fa-bars"> Open</i>
			</button>
			<br> <br>
			<%
				String updateAlert = request.getParameter("alert");
				if (updateAlert == null) {
					updateAlert = "";
				}
			%>
			<div class="alert alert-info alert-dismissable">
				<a class="panel-close" data-dismiss="alert"></a> <i
					class="fa fa-fw fa-user"></i>Personal Data
			</div>
			<h4>
				<strong style="color: blue; align: center;"><%=updateAlert%></strong>
			</h4>
			<br>
			<div class="col-xs-12 col-sm-8">
              <ul class="list-group">
              <li class="list-group-item"><strong>User Id :</strong>&nbsp;&nbsp;<%=sid%></li>
              <li class="list-group-item"><strong>Name :</strong>&nbsp;&nbsp; <%=sbo.getSname()%></li>
                <li class="list-group-item"><strong>Admission Date :</strong>&nbsp;&nbsp;<%=sbo.getAdmision_date()%></li>
                <li class="list-group-item"><strong>Course :</strong>&nbsp;&nbsp;<%=sbo.getCourse()%></li>
                <li class="list-group-item"><strong>Fees :</strong>&nbsp;&nbsp;<%=sbo.getFees()%></li>
                <li class="list-group-item"><strong>User Name :</strong>&nbsp;&nbsp;<%=sbo.getUsername()%></li>
                <li class="list-group-item"><i class="fa fa-envelope"></i>&nbsp;&nbsp;<%=sbo.getEmail() %></li>
                <li class="list-group-item"><i class="fa fa-phone"></i> &nbsp;&nbsp;<%=sbo.getContact()%> </li>
                <li class="list-group-item"><i class="fa fa-address-card" aria-hidden="true"></i> &nbsp;&nbsp;<%=sbo.getAddress()%></li>
              </ul>
              			<br> <a href="UpdateProfile.jsp"><input type="button"
				class="btn btn-success " value="Edit Profile" /></a>
            </div>

		</div>
	</div>

	<script
		src="http://localhost:8080/AnxietyCrashCourse/web/js/stoggle.js"></script>
	<script src="http://localhost:8080/AnxietyCrashCourse/js/jquery-min.js"></script>
	<script src="http://localhost:8080/AnxietyCrashCourse/js/popper.min.js"></script>
	<script
		src="http://localhost:8080/AnxietyCrashCourse/js/bootstrap.min.js"></script>
	<%@include file="/commonfiles/Footer.jsp"%>
</body>
</html>

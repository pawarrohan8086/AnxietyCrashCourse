<!DOCTYPE html>
<html>
<head>
<title>student</title>
<%@include file="/commonfiles/link.jsp"%>
<%@page import="java.util.ArrayList,java.util.ListIterator,java.sql.ResultSet,com.anxiety.dao.StudentOpration,com.anxiety.bean.bo.StudentBO" %>
</head>
<body>
	<%@include file="/commonfiles/Header.jsp"%>
	<div class="wrapper">
		<div id="mySidebar" class="sidebar">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">x</a>
			<img
				src="http://localhost:8080/AnxietyCrashCourse/web/images/studentlogo.jpg"
				class="rounded-circle mx-auto d-block" alt="user logo" width="150"
				height="150"> <br>
			<h3 style="color: #FCF6F5FF; text-align: center;">Student Name</h3>
			<br>
			<hr style="color: black;">
			<ul>
				<li class="active"><a href="profile.jsp"><i
						class="fa fa-fw fa-user"></i> Profile</a></li>
				<li><a href="seprofile.jsp"><i class="fa fa-pencil"
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
			<br>
			<br>

			<h4>Personal Data</h4>
			<br>
			<%
				//request.setAttribute("sid","974516138");
				String sid=request.getAttribute("sid").toString();
			ServletContext sc = getServletContext();
			StudentOpration so = new StudentOpration(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
					sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
			StudentBO sbo=so.getRecordById(sid);
			%>
			<table class="table bio-table ">
				<tbody>
					<tr>
						<td>Student Id</td>
						<td>:&nbsp;&nbsp; <%=sid %></td>
					</tr>
					<tr>
						<td>Name</td>
						<td>:&nbsp;&nbsp; <%=sbo.getSname() %></td>
					</tr>
					<tr>
						<td>Address</td>
						<td>:&nbsp;&nbsp; <%=sbo.getAddress() %></td>
					</tr>
					<tr>
						<td>Admission Date</td>
						<td>:&nbsp;&nbsp; <%=sbo.getAdmision_date() %></td>
					</tr>
					<tr>
						<td>Contact</td>
						<td>:&nbsp;&nbsp; <%=sbo.getContact() %></td>
					</tr>
					<tr>
						<td>Course</td>
						<td>:&nbsp;&nbsp;<%=sbo.getCourse() %></td>
					</tr>
					<tr>
						<td>Fees</td>
						<td>:&nbsp;&nbsp; <%=sbo.getFees() %></td>
					</tr>
					<tr>
						<td>Uname</td>
						<td>:&nbsp;&nbsp;<%=sbo.getUsername() %></td>
					</tr>
					<tr>
						<td></td>
						<td><a href="student/seprofile.jsp?id=<%=sid %>"><input type="button"
								class="btn btn-info " value="Edit Profile" /></a></td>
					</tr>
				</tbody>
			</table>
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


<html>
<head>
<title>student</title>
<%@include file="/commonfiles/link.jsp"%>
<%@page
	import="java.util.ArrayList,java.util.ListIterator,java.sql.ResultSet,com.anxiety.dao.StudentOpration,com.anxiety.bean.bo.StudentBO"%>
<%@page
	import="java.util.ArrayList,java.util.ListIterator,java.sql.ResultSet,com.anxiety.dao.SubjectOperation,com.anxiety.bean.bo.SubjectBO"%>
</head>
<body>
	<%@include file="common/Header.jsp"%>

	<div class="wrapper">
		<div id="mySidebar" class="sidebar ">
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
				<li><a href="profile.jsp"><i class="fa fa-fw fa-user"></i>
						Profile</a></li>
				<li class="active"><a href="UpdateProfile.jsp"><i
						class="fa fa-pencil" aria-hidden="true"></i> Edit Profile</a></li>
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
			<br> <br> <br> <br>

			<h4>Edit your profile</h4>
			<br>
			<form class="form-horizontal" action="../ProfileUpdate" role="form"
				method="post">
				<div class="row">
					<label class="col-lg-3 control-label text-info">Name:</label>
					<div class="col-lg-8">
						<input class="form-control" type="text" name="name"
							pattern="[a-zA-Z][a-zA-Z ]+[a-zA-Z]$" value="<%=sbo.getSname()%>"
							required>
					</div>
				</div>
				<br>
				<div class="row">
					<label class="col-lg-3 control-label text-info">Address:</label>
					<div class="col-lg-8">
						<input class="form-control" type="text" name="address"
							value="<%=sbo.getAddress()%>" required>
					</div>
				</div>
				<br>
				<div class="row">
					<label class="col-lg-3 control-label text-info">Contact:</label>
					<div class="col-lg-8">
						<input class="form-control" type="number" name="contact"
							pattern="(0/91)?[7-9][0-9]{9}" maxlength="10" minlength="10"
							value="<%=sbo.getContact()%>" required>
					<input type="hidden" name="oldcontact" value="<%=sbo.getContact()%>">
					</div>
				</div>
				<br>
				<div class="row">
					<label for="course" class="col-lg-3 control-label text-info">Course:</label>
					<div class="col-lg-8">
						<input type="text" class="form-control" name="course"
							value="<%=sbo.getCourse()%>" required readonly>
					</div>
				</div>
				<br>
				<div class="row ">
					<label class="col-lg-3 control-label  text-info">Admission
						Date:</label>
					<div class="col-lg-8">
						<input class="form-control" type="date" name="adate"
							value="<%=sbo.getAdmision_date()%>" required readonly>
					</div>
				</div>
				<br>
				<div class="row">
					<label class="col-lg-3 control-label text-info">Email:</label>
					<div class="col-lg-8">
						<input class="form-control" type="email" name="email"
							value="<%=sbo.getEmail()%>" required>
							 <input type="hidden" name="oldemail" value="<%=sbo.getEmail()%>">
					</div>
				</div>
				<br>
				<div class="row">
					<label class="col-md-3 control-label text-info">Username:</label>
					<div class="col-md-8">
						<input class="form-control" type="text" name="uname"
							value="<%=sbo.getUsername()%>" required>
					</div>
				</div>
				<br>
				<div class="row">
					<label class="col-md-3 control-label text-info"> Change
						Password:</label>
					<div class="col-md-8">
						<input class="form-control" type="password" name="password"
							value="<%=sbo.getPassword()%>" required> 
							<input type="hidden" name="oldpassword" value="<%=sbo.getPassword()%>">
					</div>
				</div>
				<br>
				<div class="row">
					<label class="col-md-3 control-label"></label>
					<div class="col-md-8">
						<input type="submit" class="btn btn-primary" value="Save Changes">
						<span></span> <a href="profile.jsp"><input type="button"
							class="btn btn-dark" value="Back"></a>
					</div>
				</div>
			</form>
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


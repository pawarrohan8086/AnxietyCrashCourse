
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
	<%@include file="/commonfiles/Header.jsp"%>

	<div class="wrapper">
		<div id="mySidebar" class="sidebar ">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">x</a>
			<img
				src="http://localhost:8080/AnxietyCrashCourse/web/images/studentlogo.jpg"
				class="rounded-circle mx-auto d-block" alt="user logo" width="150"
				height="150"> <br>
			<h3 style="color: #FCF6F5FF; text-align: center;">Student Name</h3>
			<br>
			<hr style="color: black;">
			<ul>
				<li><a href="profile.jsp"><i class="fa fa-fw fa-user"></i>
						Profile</a></li>
				<li class="active"><a href="seprofile.jsp"><i
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
			<%
				String sid = request.getParameter("id").toString();
				ServletContext sc = getServletContext();
				StudentOpration so = new StudentOpration(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
						sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
				StudentBO sbo = so.getRecordById(sid);
			%>
			<form class="form-horizontal" action="#" role="form">
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
					</div>
				</div>
				<br>
				<div class="row">
					<label for="course" class="col-lg-3 control-label text-info">Course:</label>
					<div class="col-lg-8">
						<select class="form-control" name="course" required>
							<option value="<%=sbo.getCourse()%>"><%=sbo.getCourse()%></option>
							<%
								SubjectOperation subo = new SubjectOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
										sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
								ArrayList<SubjectBO> al = subo.getAllSubject();
								if (al != null) {
									%><option value="">None</option><%
									ListIterator<SubjectBO> ltr = al.listIterator();
									while (ltr.hasNext()) {

										SubjectBO sbo1 = ltr.next();
										String sub = sbo1.getSub_name();
										double fee = sbo1.getSub_fees();
										int discount = sbo1.getSub_offer();
										double fees = (fee - (fee * ((double) discount / 100.0)));
							%>
							<option value="<%=sub%>-<%=fees%>"><%=sub%></option>
							<%
								}
								}else{
									%>
									<option value="">Subject not Available</option>
									<%
								}
							%>
						</select>
					</div>
				</div>
				<br>
				<div class="row ">
					<label class="col-lg-3 control-label  text-info">Admission
						Date:</label>
					<div class="col-lg-8">
						<input class="form-control" type="date" name="adate"
							value="<%=sbo.getAdmision_date()%>" required>
					</div>
				</div>
				<br>
				<div class="row">
					<label class="col-lg-3 control-label text-info">Email:</label>
					<div class="col-lg-8">
						<input class="form-control" type="email" name="email"
							value="<%=sbo.getEmail()%>" required>
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
						<input class="form-control" type="Password" name="Password"
							value="<%=sbo.getPassword()%>" required>
					</div>
				</div>
				<br>
				<div class="row">
					<label class="col-md-3 control-label"></label>
					<div class="col-md-8">
						<input type="submit" class="btn btn-primary" value="Save Changes">
						<span></span> <a href="profile.jsp"><input type="button" class="btn btn-dark"
							value="Back"></a>
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


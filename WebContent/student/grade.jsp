<!DOCTYPE html>
<html>
<head>
<title>student Panel</title>
<%@include file="/commonfiles/link.jsp"%>
<%@page
	import="java.math.RoundingMode,java.text.DecimalFormat,java.text.SimpleDateFormat,java.util.Date,com.anxiety.dao.GradeCardOperation,com.anxiety.bean.bo.GradeBO,java.util.ArrayList,java.util.ListIterator"%>
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
				String sname = session.getAttribute("sname").toString();
			%>
			<h3 style="color: #FCF6F5FF; text-align: center;"><%=sname%></h3>
			<br>
			<hr style="color: black;">
			<ul>
				<li><a href="profile.jsp"><i class="fa fa-fw fa-user"></i>
						Profile</a></li>
				<li><a href="UpdateProfile.jsp"><i class="fa fa-pencil"
						aria-hidden="true"></i> Edit Profile</a></li>
				<li><a href="exam.jsp"><i class="fa fa-book"
						aria-hidden="true"></i> Exam</a></li>
				<li class="active"><a href="grade.jsp"><i
						class="fa fa-line-chart" aria-hidden="true"></i> Grade</a></li>
			</ul>
		</div>

		<div id="main">
			<button type="button" class="openbtn btn btn-primary"
				onclick="openNav()">
				<i class="fa fa-bars"> Open</i>
			</button>
			<br> <br> <br> <br> <br>
			<h4>Grade Card</h4>
			<br>
			<table class="table">
				<thead>
					<tr>
						<th>Subject Name</th>
						<th>Exam Total Marks</th>
						<th>Your score</th>
						<th>Percentage</th>
						<th>Remark</th>
						<th>Exam Date</th>
					</tr>
				</thead>
				<%
					int count = 0;
					float progress = 0.0f, perc = 0.0f;
					ServletContext sc = getServletContext();
					GradeCardOperation go = new GradeCardOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
							sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
					ArrayList<GradeBO> gal = go.getAllGrade(session.getAttribute("id").toString());
					if (gal == null) {

					} else {
						ListIterator<GradeBO> ltr = gal.listIterator();
						while (ltr.hasNext()) {
							GradeBO gbo = ltr.next();
				%>
				<tbody>
					<tr>
						<td><%=gbo.getCourse()%></td>
						<td><%=gbo.getTmark()%></td>
						<td><%=gbo.getScore()%></td>
						<td><%=gbo.getPercentage()%>%</td>
						<%
							String color = "";
									if (gbo.getRemark().equals("pass")) {
										count++;
										color = "blue";
										progress = progress + 33.33f;
										perc = perc + gbo.getPercentage();
									} else {
										color = "red";
									}
						%>
						<td style="color:<%=color%>;"><%=gbo.getRemark()%></td>
						<td><%=gbo.getEdate()%></td>
					</tr>
				</tbody>
				<%
					}
						go.closeConnection();
					}
					String btn = "disabled";
					if (progress >= 99.00) {
						btn = "";
					}
					//date format
					String pattern = "dd-mm-yyyy";
					SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

					String date = simpleDateFormat.format(new Date());

					//precentage format
					double percet=perc/count;
					DecimalFormat df = new DecimalFormat("##.##");
					df.setRoundingMode(RoundingMode.CEILING);
					
				%>
			</table>
			<div style="margin-top: 100px;">
				<h4>Exam Progress</h4>
				<br>
				<form action="../exam/Certificate.jsp" method="post">
					<input type="hidden" name="sname"
						value="<%=session.getAttribute("sname")%>"> <input
						type="hidden" name="date" value="<%=date%>"> <input
						type="hidden" name="course"
						value="<%=session.getAttribute("course")%>"> <input
						type="hidden" name="perc" value="<%=df.format(percet)%>"> <input
						type="submit" class="btn btn-info" name="certificate"
						value=" Click to Get Certificate" <%=btn%>>
				</form>

				<p>
					<br> <strong>Note.</strong> for downloading the certificate
					you have to clear <i style="color: tomato;">minimum 3 Attempt.</i>
				</p>

				<div class="progress">
					<div
						class="progress-bar progress-bar-striped progress-bar-animated"
						style="width:<%=progress%>%"></div>
				</div>
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







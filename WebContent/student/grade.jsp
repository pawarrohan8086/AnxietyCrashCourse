<!DOCTYPE html>
<html>
<head>
<title>student Panel</title>
<%@include file="/commonfiles/link.jsp"%>
<%@page
	import="com.anxiety.dao.GradeCardOperation,com.anxiety.bean.bo.GradeBO,java.util.ArrayList,java.util.ListIterator"%>
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
					float progress=0;
					ServletContext sc = getServletContext();
					GradeCardOperation go = new GradeCardOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
							sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
					ArrayList<GradeBO> gal = go.getAllGrade(session.getAttribute("id").toString());
					if(gal==null){
						
					}else{
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
						String color="";
						if(gbo.getRemark().equals("pass")){
							color="blue";
							progress=progress+33.33f;
							
						}else{
							color="red";
						}
						
						%>
						<td style="color:<%=color %>;"><%=gbo.getRemark()%></td>
						<td><%=gbo.getEdate()%></td>
					</tr>
				</tbody>
				<%
					}
					go.closeConnection();
					}
				%>
			</table>
			<div style="margin-top: 100px;">
				<h4>Exam Progress</h4>
				<p>After completing this bar you are able to download
					certificates</p>
				<div class="progress">
					<div
						class="progress-bar progress-bar-striped progress-bar-animated"
						style="width:<%=progress %>%"></div>
				</div>
				<a href="#"><input
					type="button" class="btn btn-info" name="certificate"
					value=" Click to Get Certificate" disabled></a>
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







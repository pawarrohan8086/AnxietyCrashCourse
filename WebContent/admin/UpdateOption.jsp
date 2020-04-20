<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.anxiety.dao.OptionOperation,java.util.ArrayList,com.anxiety.bean.bo.OptionBO,java.util.ListIterator"%>
<!DOCTYPE html>
<html>
<head>
<title>update Question</title>

<%@include file="/commonfiles/link.jsp"%>
</head>
<body>
	<%@include file="/commonfiles/Header.jsp"%>
	<div class="wrapper">

		<!-- asidebar Holder -->
		<div id="asidebar">
			<div class="asidebar-header">
				<h3>Admin</h3>
				<strong>RP</strong>
			</div>
			<ul class="list-unstyled components">
				<li><a href="#student" data-toggle="collapse"
					aria-expanded="false"> <i
						class="glyphicon glyphicon-text-background"></i> Student
				</a>
					<ul class="collapse list-unstyled" id="student">
						<li><a href="ShowAllStudent.jsp">Show All Student </a></li>
					</ul></li>
				<li class="active"><a href="#question" data-toggle="collapse"
					aria-expanded="false"> <i
						class="glyphicon glyphicon-text-background"></i> Question
				</a>
					<ul class="collapse list-unstyled" id="question">
						<li><a href="AddQuestion.jsp">Add Questions </a></li>
						<li><a href="ShowAllQuestions.jsp">Show All Question</a></li>
						<li class="active"><a href="ShowAllOptions.jsp">Show All
								Option</a></li>
					</ul></li>
				<li><a href="#subject" data-toggle="collapse"
					aria-expanded="false"> <i class="glyphicon glyphicon-briefcase"></i>Subject
				</a>
					<ul class="collapse list-unstyled" id="subject">
						<li><a href="AddSubject.jsp">Add Subject</a></li>
						<li><a href="ShowAllSubjects.jsp">Show All Subject</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- Page Content Holder -->
		<div id="content">
			<button type="button" id="asidebarCollapse"
				class="btn btn-danger navbar-btn">
				<i class="glyphicon glyphicon-align-justify"> </i>
			</button>
			<br> <br>
			<!-- Edit Student data -->
			<div class="container">
				<h1>Update Option</h1>
				<hr>
				<div class="row">
					<h3 class="text-muted">Option info</h3>
					<br> <br>
					<%
						int qid = Integer.parseInt(request.getParameter("id"));
						ServletContext sc = getServletContext();
						OptionOperation opo = new OptionOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
								sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
						OptionBO opd = opo.getOptionByQId(qid);
					%>
					<!-- edit form column -->
					<div class="col-md-9 personal-info">
						<form class="form-horizontal" action="../OptionUpdate"
							role="form" method="get">
							<div class="row">
								<label class="col-lg-3 control-label text-info">Right
									Answer:</label>
								<div class="col-lg-8">
									<input class="form-control" type="number" name="opid"
									min="1" max="4"	value="<%=opd.getOption_id()%>" required>
								</div>
							</div>
							<br>
							<div class="row">
								<label class="col-lg-3 control-label text-info">Option 1:</label>
								<div class="col-lg-8">
									<input class="form-control" type="text" name="op1"
									 value="<%=opd.getOption1()%>" required>
								</div>
							</div>
							<br>
							<div class="row">
								<label class="col-lg-3 control-label text-info">
									Option 2:</label>
								<div class="col-lg-8">
									<input class="form-control" type="text" name="op2"
										value="<%=opd.getOption2()%>" required>
								</div>
							</div>
							<br>
							<div class="row">
								<label class="col-lg-3 control-label text-info">
									Option 3:</label>
								<div class="col-lg-8">
									<input class="form-control" type="text" name="op3"
										value="<%=opd.getOption3()%>" required>
								</div>
							</div>
							<br>
							<div class="row">
								<label class="col-lg-3 control-label text-info"> Option 4:</label>
								<div class="col-lg-8">
									<input class="form-control" type="text" name="op4"
										value="<%=opd.getOption4()%>" required> <input
										type="hidden" name="qid" value="<%=qid%>">
								</div>
							</div>
							<br>

							<%
								opo.closeConnection();
							%>
							<div class="row">
								<label class="col-md-3 control-label"></label>
								<div class="col-md-8">
									<input type="submit" class="btn btn-success"
										value="Save Changes"> <span></span> <a
										href="ShowAllOptions.jsp"><input type="button"
										class="btn btn-info" value="Back"></a>
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
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#asidebarCollapse').on('click', function() {
				$('#asidebar').toggleClass('active');
			});
		});
	</script>
	<%@include file="/commonfiles/Footer.jsp"%>
</body>
</html>

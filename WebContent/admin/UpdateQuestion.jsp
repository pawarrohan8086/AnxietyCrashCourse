<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.anxiety.dao.QuestionOperation,java.util.ArrayList,com.anxiety.bean.bo.QuestionBO,java.util.ListIterator"%>
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
						<li><a href="ShowAllStudent.jsp">Show All Student.jsp</a></li>
					</ul></li>
				<li class="active"><a href="#question" data-toggle="collapse"
					aria-expanded="false"> <i
						class="glyphicon glyphicon-text-background"></i> Question
				</a>
					<ul class="collapse list-unstyled" id="question">
						<li><a href="AddQuestion.jsp">Add Questions </a></li>
						<li class="active"><a href="ShowAllQuestions.jsp"> Show All
								Question</a></li>
					</ul></li>
				<li><a href="#subject" data-toggle="collapse"
					aria-expanded="false"> <i class="glyphicon glyphicon-briefcase"></i>Subject
				</a>
					<ul class="collapse list-unstyled" id="subject">
						<li><a href="AddSubject.jsp">Add Subject</a></li>
						<li><a href="ShowAllSubject.jsp"> Show All
								Subject</a></li>

					</ul></li>
			</ul>
		</div>
		<!-- Page Content Holder -->
		<div id="content">
			<button type="button" id="asidebarCollapse"
				class="btn btn-danger navbar-btn">
				<i class="glyphicon glyphicon-align-justify"> </i>
			</button>
			<br>
			<br>
			<!-- Edit Student data -->
			<div class="container">
				<h1>Update Question</h1>
				<hr>
				<div class="row">
					<h3 class="text-muted">Question info</h3>
					<br>
					<br>
					<%
						int qid = Integer.parseInt(request.getParameter("id"));
						ServletContext sc = getServletContext();
						QuestionOperation qo = new QuestionOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
								sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
						QuestionBO qd = qo.getQuestionByQid(qid);
					%>
					<!-- edit form column -->
					<div class="col-md-9 personal-info">
						<form class="form-horizontal" action="../QuestionUpdate"
							role="form" method="get">
							<div class="row">
								<label class="col-lg-3 control-label text-info">Subject
									Name:</label>
								<div class="col-lg-8">
									<input class="form-control" type="text" name="subname"
										value="<%=qd.getSub_name() %>" required>
								</div>
							</div>
							<br>
							<div class="row">
								<label class="col-lg-3 control-label text-info">Question
									Mark:</label>
								<div class="col-lg-8">
									<input class="form-control" type="number" name="qmark"
										max="100" min="1" value="<%=qd.getQue_marks() %>" required>
								</div>
							</div>
							<br>
							<div class="row">
								<label class="col-lg-3 control-label text-info">Question 
									Type</label>
								<div class="col-lg-8">
									<input class="form-control" type="text" name="qtype"
									 value="<%=qd.getQuestion_type() %>" disabled required>
								</div>
							</div>
							<br>
							<div class="row">
								<label class="col-lg-3 control-label text-info">
									Question:</label>
								<div class="col-lg-8">
									<input class="form-control" type="text" name="qtext"
								 value="<%=qd.getQuetext() %>"
										required>
								</div>
							</div>
							<br>
							<div class="row">
								<label class="col-lg-3 control-label text-info">
									Answer:</label>
								<div class="col-lg-8">
									<input class="form-control" type="text" name="atext"
								 value="<%=qd.getAnstext() %>" required>
									<input type="hidden" name="qid" value="<%=qid%>">
								</div>
							</div>
							<br>

							<%
								qo.closeConnection();
							%>
							<div class="row">
								<label class="col-md-3 control-label"></label>
								<div class="col-md-8">
									<input type="submit" class="btn btn-success"
										value="Save Changes"> <span></span> <a
										href="ShowAllQuestions.jsp"><input type="button"
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

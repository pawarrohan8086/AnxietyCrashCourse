<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.anxiety.dao.SubjectOperation,java.util.ArrayList,com.anxiety.bean.bo.SubjectBO,java.util.ListIterator"%>
<!DOCTYPE html>
<html>
<head>
<title>update student</title>

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
				<li><a href="#question" data-toggle="collapse"
					aria-expanded="false"> <i
						class="glyphicon glyphicon-text-background"></i> Question
				</a>
					<ul class="collapse list-unstyled" id="question">
						<li><a href="AddQuestion.jsp">Add Questions </a></li>
					</ul></li>
				<li class="active"><a href="#subject" data-toggle="collapse"
					aria-expanded="false"> <i class="glyphicon glyphicon-briefcase"></i>Subject
				</a>
					<ul class="collapse list-unstyled" id="subject">
						<li><a href="AddSubject.jsp">Add Subject</a></li>
						<li class="active"><a href="ShowAllSubject.jsp"> Show All
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
				<h1>Update Subject</h1>
				<hr>
				<div class="row">
					<h3 class="text-muted">Subject info</h3>
					<br>
					<br>
					<%
						int sub_id = Integer.parseInt(request.getParameter("id"));
						ServletContext sc = getServletContext();
						SubjectOperation subo = new SubjectOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
								sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
						SubjectBO subd = subo.getSubjectBySubId(sub_id);
					%>
					<!-- edit form column -->
					<div class="col-md-9 personal-info">
						<form class="form-horizontal" action="../SubjectUpdate"
							role="form" method="post">
							<div class="row">
								<label class="col-lg-3 control-label text-info">Subject
									Name:</label>
								<div class="col-lg-8">
									<input class="form-control" type="text" name="subname"
										value="<%=subd.getSub_name()%>" required>
								</div>
							</div>
							<br>
							<div class="row">
								<label class="col-lg-3 control-label text-info">Total
									Marks:</label>
								<div class="col-lg-8">
									<input class="form-control" type="number" name="stmark"
										max="100" min="1" value="<%=subd.getSub_tmarks()%>" required>
								</div>
							</div>
							<br>
							<div class="row">
								<label class="col-lg-3 control-label text-info">Passing
									Marks</label>
								<div class="col-lg-8">
									<input class="form-control" type="number" name="spmark"
										max="100" min="1" value="<%=subd.getSub_pmarks()%>" required>
								</div>
							</div>
							<br>
							<div class="row">
								<label class="col-lg-3 control-label text-info">Exam
									Questions:</label>
								<div class="col-lg-8">
									<input class="form-control" type="number" name="exque"
										max="100" min="1" value="<%=subd.getSub_question()%>"
										required>
								</div>
							</div>
							<br>
							<div class="row">
								<label class="col-lg-3 control-label text-info">Subject
									Fees:</label>
								<div class="col-lg-8">
									<input class="form-control" type="number" name="sfees"
										max="10000" min="1" value="<%=subd.getSub_fees()%>" required>
								</div>
							</div>
							<br>
							<div class="row ">
								<label class="col-lg-3 control-label  text-info">Subject
									Discount:</label>
								<div class="col-lg-8">
									<input class="form-control" type="number" name="soffer"
										max="100" min="1" value="<%=subd.getSub_offer()%>" required>
								</div>
							</div>
							<br>
							<div class="row">
								<label class="col-lg-3 control-label text-info">Course
									Duration:</label>
								<div class="col-lg-8">
									<input class="form-control" type="number" name="sduration"
										max="12" min="1" value="<%=subd.getSub_duration()%>" required>
									<input type="hidden" name="subid" value="<%=sub_id%>">
								</div>
							</div>
							<br>
							<%
								subo.closeConnection();
							%>
							<div class="row">
								<label class="col-md-3 control-label"></label>
								<div class="col-md-8">
									<input type="submit" class="btn btn-success"
										value="Save Changes"> <span></span> <a
										href="ShowAllSubjects.jsp"><input type="button"
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

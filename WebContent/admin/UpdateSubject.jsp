<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.anxiety.dao.SubjectOperation,java.util.ArrayList,com.anxiety.bean.bo.SubjectBO,java.util.ListIterator"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Subject</title>

<%@include file="/commonfiles/link.jsp"%>
</head>
<body>
	<%@include file="common/Header.jsp"%>
	<div class="wrapper">
<%@include file="common/asidebar.jsp"%>

		<!-- Page Content Holder -->
		<div id="content">
			<button type="button" id="asidebarCollapse"
				class="btn btn-danger navbar-btn">
				<i class="glyphicon glyphicon-align-justify"> </i>
			</button>
			<br> <br>
			<!-- Edit Student data -->
			<div class="container">
				<h1>Update Subject</h1>
				<hr>
				<div class="row">
					<h3 class="text-muted">Subject info</h3>
					<br> <br>
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
										max="100" min="1" value="<%=subd.getSub_question()%>" required>
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
	<%@include file="/commonfiles/Footer.jsp"%>
</body>
</html>

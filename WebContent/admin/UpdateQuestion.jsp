<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.anxiety.dao.QuestionOperation,com.anxiety.dao.SubjectOperation,java.util.ArrayList,com.anxiety.bean.bo.QuestionBO,java.util.ListIterator"%>
<!DOCTYPE html>
<html>
<head>
<title>update Question</title>

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
				<h1>Update Question</h1>
				<hr>
				<div class="row">
					<h3 class="text-muted">Question info</h3>
					<br> <br>
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
									<select class="form-control" name="subname" required>
										<option value="<%=qd.getSub_name()%>"><%=qd.getSub_name()%></option>
										<%
											SubjectOperation subo = new SubjectOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
													sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
											ArrayList<String> al = subo.getSubject();
											if (al != null) {
												ListIterator<String> ltr = al.listIterator();
												while (ltr.hasNext()) {
													String sub = ltr.next().toString();
										%>
										<option value="<%=sub%>"><%=sub%></option>
										<%
											}
											}
											subo.closeConnection();
										%>
									</select>
								</div>
							</div>
							<br>
							<div class="row">
								<label class="col-lg-3 control-label text-info">Question
									Mark:</label>
								<div class="col-lg-8">
									<input class="form-control" type="number" name="qmark"
										max="100" min="1" value="<%=qd.getQue_marks()%>" required>
								</div>
							</div>
							<br> <input type="hidden" name="qtype"
								value="<%=qd.getQuestion_type()%>">
							<div class="row">
								<label class="col-lg-3 control-label text-info">
									Question:</label>
								<div class="col-lg-8">
									<input class="form-control" type="text" name="qtext"
										value="<%=qd.getQuetext()%>" required>
								</div>
							</div>
							<br>
							<div class="row">
								<label class="col-lg-3 control-label text-info"> Answer:</label>
								<div class="col-lg-8">
									<input class="form-control" type="text" name="atext"
										value="<%=qd.getAnstext()%>" required> <input
										type="hidden" name="qid" value="<%=qid%>">
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
										value="Next Changes"> <span></span> <a
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
	<%@include file="/commonfiles/Footer.jsp"%>
</body>
</html>

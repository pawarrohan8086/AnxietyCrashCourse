<!DOCTYPE html>
<html>
<head>
<title>Student Data</title>
<%@ page
	import="com.anxiety.dao.SubjectOperation,java.util.ArrayList,com.anxiety.bean.bo.SubjectBO,java.util.ListIterator"%>
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
						<li class="active"><a href="ShowAllSubjects.jsp">Show All
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
			<br> <br>

			<h2>Subject Data</h2>
			<br>
			<form action="SearchSubject.jsp">
				<div class="p-1 bg-light rounded rounded-pill shadow-sm mb-4">
					<div class="input-group">
						<input type="search" name=sq
							placeholder="Don't find subject the click me?"
							pattern="^(?!\s*$).+" aria-describedby="button-addon1"
							class="form-control border-0 bg-light" required>
						<div class="input-group-append">
							<button id="button-addon1" type="submit"
								class="btn btn-link text-primary">
								<i class="fa fa-search"> Search subject</i>
							</button>
						</div>
					</div>
				</div>
			</form>
			<%
				String deleteAlert = request.getParameter("alert");
				if (deleteAlert == null) {
					deleteAlert = "";
				}
			%>
			<p class="text-center">
				<strong style="color: tomato;"><i><%=deleteAlert%></i></strong>
			</p>


			<%
				ServletContext sc = getServletContext();
				SubjectOperation subo = new SubjectOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
						sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
				ArrayList<SubjectBO> subal = subo.getAllSubject();
				if (subal == null) {
			%>
			<p class="text-center">
				<strong style="color: #009e73;"><i>Sorry no data
						found...please insert subject.</i></strong>
			</p>

			<%
				} else {
			%>
			<table class=" table table-condensed table-success">
				<thead class="table-dark">
					<tr>
						<th>SUBJECT ID</th>
						<th>SUBJECT NAME</th>
						<th>TOTAL MARKS</th>
						<th>PASSING MARKS</th>
						<th>QUESTION</th>
						<th>FEES</th>
						<th>DISCOUNT</th>
						<th>DURATION</th>
						<th colspan="2">MODIFY</th>
					</tr>
				</thead>
				<%
					ListIterator<SubjectBO> li = subal.listIterator();
						SubjectBO subd = null;
						while (li.hasNext()) {
							subd = li.next();
				%>


				<tbody>

					<tr>
						<td><%=subd.getSub_id()%></td>
						<td><%=subd.getSub_name()%></td>
						<td><%=subd.getSub_tmarks()%></td>
						<td><%=subd.getSub_pmarks()%></td>
						<td><%=subd.getSub_question() %></td>
						<td><%=subd.getSub_fees() %></td>
						<td><%=subd.getSub_offer() %></td>
						<td><%=subd.getSub_duration() %></td>
						<td>
							<form action="UpdateSubject.jsp" method="post">
								<input type="hidden" name=id value="<%=subd.getSub_id()%>">
								<button type="submit" class="btn btn-secondary">Edit</button>
							</form>
						</td>
						<td>
							<form action="../DeleteSubject" method="post">
								<input type="hidden" name=id value="<%=subd.getSub_id()%>">
								<button type="submit" class="btn btn-danger">Delete</button>
							</form>
						</td>
						<%
							}
								subo.closeConnection();
						%>
					</tr>
				</tbody>
			</table>
			<%
				}
			%>
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

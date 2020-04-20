<!DOCTYPE html>
<html>
<head>
<title>Question Data</title>
<%@ page
	import="com.anxiety.dao.OptionOperation,java.util.ArrayList,com.anxiety.bean.bo.OptionBO,java.util.ListIterator"%>
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

			<h2>Option Data</h2>
			<br>
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
				OptionOperation opo = new OptionOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
						sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
				ArrayList<OptionBO> opal = opo.getAllOption();
				if (opal == null) {
			%>
			<p class="text-center">
				<strong style="color: #009e73;"><i>Sorry no data
						found...please Add Question.</i></strong>
			</p>

			<%
				} else {
			%>
			<table class=" table  table-secondary table-bordered table-sm">
				<thead class="thead-dark">
					<tr>
						<th>ANSWER_ID</th>
						<th>QUESTION_ID</th>
						<th>OPTION_1</th>
						<th>OPTION_2</th>
						<th>OPTION_3</th>
						<th>OPTION_4</th>
						<th>MODIFY</th>
					</tr>
				</thead>
				<%
					ListIterator<OptionBO> li = opal.listIterator();
						OptionBO opd = null;
						while (li.hasNext()) {
							opd = li.next();
				%>
				<tbody>

					<tr>
						<td><%=opd.getOption_id()%></td>
						<td><a href="" Style="color: blue;"><%=opd.getQue_id()%></a></td>
						<td><%=opd.getOption1()%></td>
						<td><%=opd.getOption2()%></td>
						<td><%=opd.getOption3()%></td>
						<td><%=opd.getOption4()%></td>
						<td>
							<form action="UpdateOption.jsp" method="post">
								<input type="hidden" name=id value="<%=opd.getQue_id()%>">
								<button type="submit" class="btn btn-secondary">Edit</button>
							</form>
						</td>
						<%
							}
								opo.closeConnection();
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

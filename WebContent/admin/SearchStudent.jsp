<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<!DOCTYPE html>
<html>
<head>
<title>Search</title>
<%@ page
	import="com.anxiety.dao.StudentOpration,java.util.ArrayList,com.anxiety.bean.bo.StudentBO,java.util.ListIterator"%>
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
				<li class="active"><a href="#student" data-toggle="collapse"
					aria-expanded="false"> <i
						class="glyphicon glyphicon-text-background"></i> Student
				</a>
					<ul class="collapse list-unstyled" id="student">
						<li class="active"><a href="ShowAllStudent.jsp">Show All
								Student </a></li>
					</ul></li>
				<li><a href="#question" data-toggle="collapse"
					aria-expanded="false"> <i
						class="glyphicon glyphicon-text-background"></i> Question
				</a>
					<ul class="collapse list-unstyled" id="question">
						<li><a href="AddQuestion.jsp">Add Questions </a></li>
					</ul></li>
				<li><a href="#subject" data-toggle="collapse"
					aria-expanded="false"> <i class="glyphicon glyphicon-briefcase"></i>Subject
				</a>
					<ul class="collapse list-unstyled" id="subject">
						<li><a href="AddSubject.jsp">Add Subject</a></li>
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
			<h2>Student Data</h2>
			<br>
			<%!String alert = "";%>
			<%
				String q = request.getParameter("sq");
				ServletContext sc1 = getServletContext();
				StudentOpration so1 = new StudentOpration(sc1.getInitParameter("driver"), sc1.getInitParameter("dburl"),
						sc1.getInitParameter("dbuser"), sc1.getInitParameter("dbpswd"));
				ArrayList<StudentBO> sal1 = so1.searchRecord(q);
				if (sal1 == null) {
			%>
			<p class="text-center">
				<strong style="color: blue;"><i>No match found</i></strong>
			</p>
			<%
				} else {
			%>
			<p class="text-center">
				<strong style="color: blue;"><i><%=sal1.size()%>.Record
						found</i></strong>
			</p>
			<table
				class="table table-responsive table-sm table-bordered table-hover">
				<thead class="table-dark">
					<tr>
						<th colspan="2">MODIFY</th>
						<th>SID</th>
						<th>SNAME</th>
						<th>ADDRESS</th>
						<th>CONTACT</th>
						<th>EMAIL</th>
						<th>USERNAME</th>
						<th>COURSE</th>
						<th>FEES</th>
						<th>ADMISION_DATE</th>
						<th>PASSWORD</th>
					</tr>
				</thead>

				<%
					ListIterator<StudentBO> li1 = sal1.listIterator();
						StudentBO sd1 = null;
						while (li1.hasNext()) {
							sd1 = li1.next();
				%>

				<tbody>
					<tr>
						<td><a href="UpdateStudent.jsp?id=<%=sd1.getStudentid()%>">
								<button type="button" class="btn btn-secondary">Edit</button>
						</a></td>
						<td><a href="../DeleteStudent?id=<%=sd1.getStudentid()%>"><button
									type="button" class="btn btn-danger">Delete</button></a></td>
						<td><%=sd1.getStudentid()%></td>
						<td><%=sd1.getSname()%></td>
						<td><%=sd1.getAddress()%></td>
						<td><%=sd1.getContact()%></td>
						<td><%=sd1.getEmail()%></td>
						<td><%=sd1.getUsername()%></td>
						<td><%=sd1.getCourse()%></td>
						<td><%=sd1.getFees()%></td>
						<td><%=sd1.getAdmision_date()%></td>
						<td><%=sd1.getPassword()%></td>

						<%
							}
								so1.closeConnection();
							}
						%>
					</tr>
				</tbody>
			</table>

			<form action="SearchStudent.jsp">
				<div class="p-1 bg-light rounded rounded-pill shadow-sm mb-4">
					<div class="input-group">
						<input type="search" name=sq
							placeholder="What're you searching for student?"
							pattern="^(?!\s*$).+" aria-describedby="button-addon1"
							class="form-control border-0 bg-light" required>
						<div class="input-group-append">
							<button id="button-addon1" type="submit"
								class="btn btn-link text-primary">
								<i class="fa fa-search"> Search Record</i>
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
				StudentOpration so = new StudentOpration(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
						sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
				ArrayList<StudentBO> sal = so.getAllRecord();
				if (sal == null) {
			%>
			<p class="text-center">
				<strong style="color: #009e73;"><i>Sorry no data
						found...please insert Record.</i></strong>
			</p>

			<%
				} else {
			%>
			<table
				class=" table table-responsive table-sm table-bordered table-hover">
				<thead class="table-dark">
					<tr>
						<th colspan="2">MODIFY</th>
						<th>SID</th>
						<th>SNAME</th>
						<th>ADDRESS</th>
						<th>CONTACT</th>
						<th>EMAIL</th>
						<th>USERNAME</th>
						<th>COURSE</th>
						<th>FEES</th>
						<th>ADMISION_DATE</th>
						<th>PASSWORD</th>
					</tr>
				</thead>
				<%
					ListIterator<StudentBO> li = sal.listIterator();
						StudentBO sd = null;
						while (li.hasNext()) {
							sd = li.next();
				%>


				<tbody>
					<tr>
						<td>
							<form action="UpdateStudent.jsp" method="post">
								<input type="hidden" name=id value="<%=sd.getStudentid()%>">
								<button type="submit" class="btn btn-secondary">Edit</button>
							</form>
						</td>
						<td>
							<form action="../DeleteStudent" method="post">
								<input type="hidden" name=id value="<%=sd.getStudentid()%>">
								<button type="submit" class="btn btn-danger">Delete</button>
							</form>
						</td>
						<td><%=sd.getStudentid()%></td>
						<td><%=sd.getSname()%></td>
						<td><%=sd.getAddress()%></td>
						<td><%=sd.getContact()%></td>
						<td><%=sd.getEmail()%></td>
						<td><%=sd.getUsername()%></td>
						<td><%=sd.getCourse()%></td>
						<td><%=sd.getFees()%></td>
						<td><%=sd.getAdmision_date()%></td>
						<td><%=sd.getPassword()%></td>
						<%
							}
								so.closeConnection();
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

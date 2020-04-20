<!DOCTYPE html>
<html>
<head>
<title>Questions data</title>
<%@include file="/commonfiles/link.jsp"%>
<%@page
	import="java.util.ArrayList,java.util.ListIterator,java.sql.ResultSet,com.anxiety.dao.SubjectOperation"%>
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
						<li class="active"><a href="AddQuestion.jsp">Add
								Questions </a></li>
					</ul></li>
				<li><a href="#subject" data-toggle="collapse"
					aria-expanded="false"> <i class="glyphicon glyphicon-briefcase"></i>Subject
				</a>
					<ul class="collapse list-unstyled" id="subject">
						<li><a href="AddSubject.jsp">Add Subject</a></li>
					</ul></li>
			</ul>
		</div>
		<% 
		String alert="",q="";
		q=request.getParameter("q");
		if(q==null){
			q="";
		}
		else if(q.equals("1")){
				alert="Question added Successful";
			}else{
				alert="question not added";
			}
		%>
		<!-- Page Content Holder -->
		<div id="content">
			<button type="button" id="asidebarCollapse"
				class="btn btn-danger navbar-btn">
				<i class="glyphicon glyphicon-align-justify"> </i>
			</button>
			<h3><i style="color :blue;margin-left:35%;"><%=alert %></i></h3>
			<br><br>
			<h2>Add Question and Details</h2>
			<br>
			<form action="../addque" method="post">
				<table class="table  table-borderless">
					<tbody>
						<tr>
							<td><label for="subject">Select Subject :</label></td>
							<td>
								<div class="form-group">
									<select class="form-control" name="sub_name" required>
										<option value="">None</option>
										<%
											ServletContext sc = getServletContext();
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
							</td>
							<td><label for="marks">Question Marks :</label></td>
							<td>
								<div class="form-group">
									<input type="number" class="form-control" id="marks"
										name="que_marks" min="1" max="100" placeholder="marks"
										required>
								</div>
							</td>
							<td><label for="Question">Question Type</label></td>
							<td>
								<div class="form-group">
									<select class="form-control" name="question_type" required>
										<option value="">None</option>
										<option value="optional">Optional</option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<td><label for="quetext">Question :</label></td>
							<td colspan="5">
								<div class="form-group">
									<input type="text" class="form-control" id="quetext"
										name="quetext" placeholder="Question Text" required>
								</div>
							</td>
						</tr>
						<tr>
							<td><label for="option1">Option 1 :</label></td>
							<td colspan="5">
								<div class="form-group">
									<input type="text" class="form-control" id="option1"
										name="option1" placeholder="Option  1" required>
								</div>
							</td>
						</tr>
						<tr>
							<td><label for="option2">Option 2 :</label></td>
							<td colspan="5">
								<div class="form-group">
									<input type="text" class="form-control" id="option2"
										name="option2" placeholder="Option  2" required>
								</div>
							</td>
						</tr>
						<tr>
							<td><label for="option3">Option 3 :</label></td>
							<td colspan="5">
								<div class="form-group">
									<input type="text" class="form-control" id="option3"
										name="option3" placeholder="Option  3" required>
								</div>
							</td>
						</tr>
						<tr>
							<td><label for="option4">Option 4 :</label></td>
							<td colspan="5">
								<div class="form-group">
									<input type="text" class="form-control" id="option4"
										name="option4" placeholder="Option  4" required>
								</div>
							</td>
						</tr>
						<tr>
							<td><label for="anstext">Right Option :</label></td>
							<td colspan="5">
								<div class="form-group">
									<input type="number" class="form-control" id="anstext"
										name="ans_id"
										placeholder="enter option number which is right answer" min="1"
										max="4" required>
								</div>
							</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td>
								<button type="submit" class="btn btn-primary">Add
									Question</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
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

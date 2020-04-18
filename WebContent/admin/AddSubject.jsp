<!DOCTYPE html>
<html>
<head>
<title>Subject data</title>
<%@include file="/commonfiles/link.jsp" %>

</head>
<body>
<%@include file="/commonfiles/Header.jsp" %>
	<div class="wrapper">

		<!-- asidebar Holder -->
		<div id="asidebar">
			<div class="asidebar-header">
				<h3>Admin</h3>
				<strong>RP</strong>
			</div>
			<ul class="list-unstyled components">
				<li >
					<a href="#student" data-toggle="collapse" aria-expanded="false">
						<i class="glyphicon glyphicon-text-background"></i>
						Student
					</a>
					<ul class="collapse list-unstyled" id="student">
						<li ><a href="AddStudent.jsp">Add Student </a></li>
					</ul>
				</li>
				<li >
					<a href="#question" data-toggle="collapse" aria-expanded="false">
						<i class="glyphicon glyphicon-text-background"></i>
						Question
					</a>
					<ul class="collapse list-unstyled" id="question">
						<li ><a href="AddQuestion.jsp">Add Questions </a></li>
					</ul>
				</li>
				<li class="active">
					<a href="#subject" data-toggle="collapse" aria-expanded="false">
						<i class="glyphicon glyphicon-briefcase"></i>Subject
					</a>
					<ul class="collapse list-unstyled" id="subject">
						<li class="active"><a href="AddSubject.jsp">Add  Subject</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<%! String alert="Subject added successful"; %>
		
		<!-- Page Content Holder -->
		<div id="content">
			<button type="button" id="asidebarCollapse" class="btn btn-danger navbar-btn">
				<i class="glyphicon glyphicon-align-justify"></i>
			</button>
			<h4><i style="color:blue;margin-left:400px;"><%=alert %></i></h4>
			<br><br>
			<h2>Add Subject Details</h2><br>
			<form action="AddSubject"> 
			<table class="table table-responsive table-borderless">
				<tbody>
					<tr>
						<td>
								<label>Subject Name :</label></td>
								<td>
									<div class="form-group">
									<input type="text" class="form-control" 
									name="subjectname" placeholder="ex.java" required>	
									</div>
								</td>
							</tr>
							<tr>
								<td><label>Subject Total Marks :</label></td>
								<td>   
									<div class="form-group">
										<input type="number" class="form-control"
										 name="stmark" min="1" max="100" placeholder="ex.100" required>
									</div>
								</td>
							</tr>
							<tr>
								<td><label>Subject Passing Marks :</label></td>
								<td>   
									<div class="form-group">
										<input type="number" class="form-control"
										 name="spmark" min="1" max="100" placeholder="min marks" required>
									</div>
								</td>
							</tr>
							<tr>
								<td><label>Subject Offer :</label></td>
								<td>   
									<div class="form-group">
										<input type="number" class="form-control" name="soffer"
										min="1" max="100" placeholder="discount" required>
									</div>
								</td>
							</tr>
							<tr>
								<td><label>Subject Fees :</label></td>
								<td>   
									<div class="form-group">
										<input type="number" class="form-control" name="sfees"
										min="1" max="100000"placeholder="fees" required>
									</div>
								</td>
							</tr>
							<tr>
								<td><label>Subject Total Question :</label></td>
								<td>   
									<div class="form-group">
										<input type="number" class="form-control" name="stquestion" 
										min="1" max="100" placeholder="for examination" required>
									</div>
								</td>
							</tr>
							<tr>
								<td><label>Subject Duration :</label></td>
								<td>   
									<div class="form-group">
										<input type="number" class="form-control" name="sduration" 
										min="1" placeholder="in month" required>
									</div>
								</td>
							</tr>
							<tr>
								<td></td>
								<td>    <button type="submit" class="btn btn-primary">Add Subject</button>
						</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		$('#asidebarCollapse').on('click', function () {
			$('#asidebar').toggleClass('active');
		});
	});
</script>
<%@include file="/commonfiles/Footer.jsp" %>
</body>
</html> 

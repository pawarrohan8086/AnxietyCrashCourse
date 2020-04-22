<!DOCTYPE html>
<html>
<head>
<title>Subject data</title>
<%@include file="/commonfiles/link.jsp"%>

</head>
<body>
	<%@include file="common/Header.jsp"%>
	<div class="wrapper">
<%@include file="common/asidebar.jsp"%>
		<%
			String alert = "", q = "";
			q = request.getParameter("q");
			if (q == null) {
				q = "";
			} else if (q.equals("1")) {
				alert = "Subject added successful";
			} else {
				alert = "subject not added";
			}
		%>

		<!-- Page Content Holder -->
		<div id="content">
			<button type="button" id="asidebarCollapse"
				class="btn btn-danger navbar-btn">
				<i class="glyphicon glyphicon-align-justify"></i>
			</button>
			<h3>
				<i style="color: blue; margin-left: 35%;"><%=alert%></i>
			</h3>
			<br>
			<br>
			<h2>Add Subject Details</h2>
			<br>
			<form action="../addsub">
				<table class="table  table-borderless">
					<tbody>
						<tr>
							<td><label>Subject Name :</label></td>
							<td>
								<div class="form-group">
									<input type="text" class="form-control" name="subjectname"
										placeholder="ex.java" required>
								</div>
							</td>
						</tr>
						<tr>
							<td><label>Subject Total Marks :</label></td>
							<td>
								<div class="form-group">
									<input type="number" class="form-control" name="stmark" min="1"
										max="100" placeholder="ex.100" required>
								</div>
							</td>
						</tr>
						<tr>
							<td><label>Subject Passing Marks :</label></td>
							<td>
								<div class="form-group">
									<input type="number" class="form-control" name="spmark" min="1"
										max="100" placeholder="min marks" required>
								</div>
							</td>
						</tr>
						<tr>
							<td><label>Subject Offer :</label></td>
							<td>
								<div class="form-group">
									<input type="number" class="form-control" name="soffer" min="1"
										max="100" placeholder="discount" required>
								</div>
							</td>
						</tr>
						<tr>
							<td><label>Subject Fees :</label></td>
							<td>
								<div class="form-group">
									<input type="number" class="form-control" name="sfees" min="1"
										max="100000" placeholder="fees" required>
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
							<td>
								<button type="submit" class="btn btn-primary">Add
									Subject</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<%@include file="/commonfiles/Footer.jsp"%>
</body>
</html>

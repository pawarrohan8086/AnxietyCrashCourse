<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- asidebar Holder -->
<div id="asidebar">
	<div class="asidebar-header">
		<h3>Admin</h3>
		<strong>RP</strong>
	</div>
	<div id="myDIV">
		<ul class="list-unstyled components">
			<li class="n "><a href="#student" data-toggle="collapse"
				aria-expanded="false"> <i
					class="glyphicon glyphicon-text-background"></i> Student
			</a>
				<ul class="collapse list-unstyled" id="student">
					<li class="m"><a href="ShowAllStudent.jsp">Show All
							Student </a></li>
				</ul></li>
			<li class="n "><a href="#question" data-toggle="collapse"
				aria-expanded="false"> <i
					class="glyphicon glyphicon-text-background"></i> Question
			</a>
				<ul class="collapse list-unstyled" id="question">
					<li class="m"><a href="AddQuestion.jsp">Add Questions </a></li>
					<li class="m"><a href="ShowAllQuestions.jsp">Show All
							Question</a></li>
					<li class="m"><a href="ShowAllOptions.jsp">Show All Option</a></li>
				</ul></li>
			<li class="n "><a href="#subject" data-toggle="collapse"
				aria-expanded="false"> <i class="glyphicon glyphicon-briefcase"></i>Subject
			</a>
				<ul class="collapse list-unstyled" id="subject">
					<li class="m"><a href="AddSubject.jsp">Add Subject</a></li>
					<li class="m"><a href="ShowAllSubjects.jsp">Show All
							Subject</a></li>
				</ul></li>
		</ul>
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

	// Add active class to the current button (highlight it)
	var header = document.getElementById("myDIV");
	var lim = header.getElementsByClassName("m");
	var lin = header.getElementsByClassName("n");
	for (var i = 0; i < lim.length; i++) {
		lim[i].addEventListener("click", function() {
			var current = document.getElementsByClassName("active");
			current[0].className = current[0].className.replace(" active", "");
			this.className += " active";
		});
	}
	for (var i = 0; i < lin.length; i++) {
		lin[i].addEventListener("click", function() {
			var current = document.getElementsByClassName("active");
			current[0].className = current[0].className.replace(" active", "");
			this.className += " active";
		});
	}
</script>

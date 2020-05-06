<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<%@ page
	import="com.anxiety.dao.QuestionOperation,java.util.ArrayList,com.anxiety.bean.bo.QuestionBO,java.util.ListIterator"%>
<%@ page
	import="com.anxiety.dao.OptionOperation,java.util.ArrayList,com.anxiety.bean.bo.OptionBO,java.util.ListIterator"%>

<%@include file="/commonfiles/link.jsp"%>
<title>Exam</title>
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/AnxietyCrashCourse/web/css/examstyle.css">

<%
String sid =session.getAttribute( "id" ).toString();
String sname =session.getAttribute( "sname" ).toString();
String course = session.getAttribute( "course" ).toString();
String mins = request.getParameter( "mins" );
String secs = request.getParameter( "secs" );
%>
</head>
<body>
	<div>
		<div class="top-container">
			<h1>Anxiety Crash Course</h1>
			<p>Scroll down to see full screen question.</p>
		</div>
		<form action="../AddAnswers" name="forma">
			<div class="d-flex bd-highlight mb-3 header" id="myHeader">
				<div class="mr-auto p-2 bd-highlight">
					<h4 style="color: tomato;">
						Student id
						<%=sid%></h4>
				</div>
				<div class="mr-auto p-2 bd-highlight">
					<h4 style="color: cyan;">
						Student :
						<%=sname%></h4>
				</div>
				<div class="mr-auto p-2 bd-highlight">
					<h4 style="color: pink;">
						Course
						<%=course%></h4>
				</div>
				<div class=" p-2 bd-highlight">
					<strong>Remaining Time : <input type="text" name="mins"
						size="1" style="border: 0px solid black" readonly> min <input
						type="text" name="secs" size="1" style="border: 0px solid black"
						readonly>sec
					</strong>
				</div>
			</div>
			<div class="content">
				<%
				int qid = 1;
				ServletContext sc = getServletContext();
				QuestionOperation qo = new QuestionOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
						sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
				OptionOperation opo = new OptionOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
						sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
				ArrayList<QuestionBO> allquestions = qo.getQuestionBySubName(course);
				ListIterator<QuestionBO> quelist = allquestions.listIterator();
				QuestionBO qued = null;
				while (quelist.hasNext()) {
					qued = quelist.next();
					OptionBO options = opo.getOptionByQId(qued.getQue_id());
			%>
				<!-- 			<form action="# ">../AddAnswers*/ -->
				<div class="scp-quizzes-main table-info "
					style="border-style: groove;">
					<div class="scp-quizzes-data" style="margin-top:20px;">
						<input type="hidden" name="qid" value="<%=qid%>">

						<p>
							<strong>Q:<%=qid%>.<%=qued.getQuetext()%>
							</strong>
						</p>
						<p>
							<strong
								style="border-style: groove; border: 2px solid gray; border-radius: 5px; background-color: gray; color: white;">Mark
								: <%=qued.getQue_marks()%></strong>
						</p>
					</div>
				</div>
				<div class="panel-footer">
					<div class="panel-body">
						<h4>Answer</h4>
						<br>
					</div>
					<input type="radio" id="<%=options.getOption1()%>" name="<%=qid%>"
						value="<%=options.getOption1()%>"> <label
						for="<%=options.getOption1()%>">1. <%=options.getOption1()%></label><br />
					<input type="radio" id="<%=options.getOption2()%>" name="<%=qid%>"
						value="<%=options.getOption2()%>" > <label
						for="<%=options.getOption2()%>">2. <%=options.getOption2()%></label><br />
					<input type="radio" id="<%=options.getOption3()%>" name="<%=qid%>"
						value="<%=options.getOption3()%>" > <label
						for="<%=options.getOption3()%>">3. <%=options.getOption3()%></label><br />
					<input type="radio" id="<%=options.getOption4()%>" name="<%=qid%>"
						value="<%=options.getOption4()%>" > <label
						for="<%=options.getOption4()%>">4.<%=options.getOption4()%></label><br /><br /><br /><br />

				</div>

			</div>
			<%
			qid = qid + 1;
			}
		%>
			<div class="footer inline-block">
				<input type="submit" class="btn btn-success float-right"
					name="submit" value="Submit"> <a
					href="../student/grade.jsp"><input type="button"
					class="btn btn-danger float-left" name="Submit" value="End Exam"></a>
				<p>Good Luck...&#128578;</p>
			</div>

		</form>
	</div>
	<script>
	<!--
	var mins = <%=mins%>; // write mins to javascript
	var secs = <%=secs%>
		; // write secs to javascript
		function timer() {
			// tic tac
			if (--secs == -1) {
				secs = 59;
				--mins;
			}

			// leading zero? formatting
			if (secs < 10)
				secs = "0" + secs;
			if (mins < 10)
				mins = "0" + parseInt(mins, 10);
			// display
			document.forma.mins.value = mins;
			document.forma.secs.value = secs;
			// continue?
			if (secs == 0 && mins == 0) // time over
			{
				setTimeout(function(){ alert('your exam session time Out');window.location='../student/grade.jsp'; }, 400);
				document.forma.ok.disabled = true;
				document.formb.results.style.display = "block";
			} else // call timer() recursively every 1000 ms == 1 sec
			{
				window.setTimeout("timer()", 1000);
			}
		}
		//-->
		timer(); // call timer() after page is loaded
		function disableBackButton() {
			window.history.forward();
		}
		setTimeout("disableBackButton()", 0);
		window.onscroll = function() {
			myFunction()
		};

		var header = document.getElementById("myHeader");
		var sticky = header.offsetTop;

		function myFunction() {
			if (window.pageYOffset > sticky) {
				header.classList.add("sticky");
			} else {
				header.classList.remove("sticky");
			}
		}
	</script>
</body>
</html>
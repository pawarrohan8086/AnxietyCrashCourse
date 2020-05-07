<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<%@ page
	import="com.anxiety.dao.QuestionOperation,java.util.ArrayList,com.anxiety.bean.bo.QuestionBO,com.anxiety.bean.bo.SubjectBO,java.util.ListIterator"%>
<%@ page
	import="com.anxiety.dao.OptionOperation,com.anxiety.dao.SubjectOperation,java.util.ArrayList,com.anxiety.bean.bo.OptionBO,java.util.ListIterator"%>

<%@include file="/commonfiles/link.jsp"%>
<title>Exam</title>
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/AnxietyCrashCourse/web/css/examstyle.css">

<%
String sid =session.getAttribute( "id" ).toString();
String sname =session.getAttribute( "sname" ).toString();
String course = session.getAttribute( "course" ).toString();

%>
</head>
<body>
	<div>
		<div class="top-container">
			<h1>Anxiety Crash Course</h1>
			<p>Scroll down to see full screen question.</p>
		</div>
		<form action="../AddAnswers" name="mcQuestion" id="mcQuestion"  method="get">
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
					<strong>Remaining Time :  <span id="display" style="color:#FF0000;font-size:20px"></span>
					</strong>
					
				</div>
			</div>
			<div class="content">
				<%
				int qid = 1;
				ServletContext sc = getServletContext();
				SubjectOperation subo = new SubjectOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
				sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
				SubjectBO subdata=subo.getSubjectData(course);
				int quesize=subdata.getSub_question();
				%><input type="hidden" name="qsize" value="<%=quesize%>"><% 
				QuestionOperation qo = new QuestionOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
						sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
				
				OptionOperation opo = new OptionOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
						sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
				
				ArrayList<QuestionBO> allquestions = qo.getQuestionBySubName(course);
				java.util.Collections.shuffle( allquestions );//shuffle the question list
				ListIterator<QuestionBO> quelist = allquestions.listIterator();
				
				QuestionBO qued = null;
				while (quelist.hasNext()) {
					
					if(quesize!= 0){
					qued = quelist.next();
					OptionBO options = opo.getOptionByQId(qued.getQue_id());
			%>
			
				<div class="scp-quizzes-main table-info "
					style="border-style: groove;">
					<div class="scp-quizzes-data" style="margin-top: 20px;">
						<input type="hidden" name="qid<%=qid%>" value="<%=qid%>">
						
						<p>
							<strong>Q:<%=qid%>.<%=qued.getQuetext()%>
							</strong>
							<input type="hidden" name="quetext<%=qid%>" value="<%=qued.getQuetext() %>">
							<input type="hidden" name="anstext<%=qid%>" value="<%=qued.getAnstext() %>">
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
					<input type="radio" id="<%=options.getOption1()%><%=qid%>" name="ans<%=qid%>"
						value="<%=options.getOption1()%>"> <label
						for="<%=options.getOption1()%><%=qid%>">1. <%=options.getOption1()%></label><br />
					<input type="radio" id="<%=options.getOption2()%><%=qid%>" name="ans<%=qid%>"
						value="<%=options.getOption2()%>"> <label
						for="<%=options.getOption2()%><%=qid%>">2. <%=options.getOption2()%></label><br />
					<input type="radio" id="<%=options.getOption3()%><%=qid%>" name="ans<%=qid%>"
						value="<%=options.getOption3()%>"> <label
						for="<%=options.getOption3()%><%=qid%>">3. <%=options.getOption3()%></label><br />
					<input type="radio" id="<%=options.getOption4()%><%=qid%>" name="ans<%=qid%>"
						value="<%=options.getOption4()%>"> <label
						for="<%=options.getOption4()%><%=qid%>">4.<%=options.getOption4()%></label><br />
					<br /> <br /> <br />  
					<input type="hidden" name="qtype<%=qid%>" value="<%=qued.getQuestion_type() %>">
					<input type="hidden" name="qmark<%=qid%>" value="<%=qued.getQue_marks()%>">
				</div>

			</div>
			<%
			qid = qid + 1;
			quesize--;				
			}else{
				break;
			}
				}
		%>
			<div class="footer inline-block">
				<input type="submit" class="btn btn-success float-right"
					name="submit" value="Submit">
					<a href="../Logout"><input type="button"
					class="btn btn-danger float-left" name="Submit" value="LogOut"></a>
				<p>Good Luck...&#128578;</p>
			</div>

		</form>
	</div>
	<script>
	
	//timer function
    var div = document.getElementById('display');
    function CountDown(duration, display) {
        var timer = duration, minutes, seconds;
        var interVal=  setInterval(function () {
            minutes = parseInt(timer / 60, 10);
            seconds = parseInt(timer % 60, 10);
            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;
            display.innerHTML ="<b>" + minutes + " m : " + seconds + " s" + "</b>";
            if (timer > 0) {
               --timer;
           }else{
               clearInterval(interVal)
               SubmitFunction();
           }
       },1000);
    }
    function SubmitFunction(){
        document.getElementById('mcQuestion').submit();
    }
    CountDown(1200,div);
  
    //sticky header    
    window.onscroll = function() {myFunction()};
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
<!DOCTYPE html>
<html>
<head>
<title>student</title>
<%@include file="/commonfiles/link.jsp" %>

</head>
<body>
	<%@include file="common/Header.jsp"%>

<div class="wrapper">
    <div id="mySidebar" class="sidebar ">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">x</a>
        <img src="http://localhost:8080/AnxietyCrashCourse/web/images/studentlogo.jpg" class="rounded-circle mx-auto d-block" alt="user logo" width="150" height="150"> 
        <br>
        <%String sname = session.getAttribute("sname").toString(); %>
        <h3 style="color:#FCF6F5FF;text-align: center;"><%=sname %></h3><br>
        <hr style="color: black;">
        <ul>
            <li>  <a href="profile.jsp"><i class="fa fa-fw fa-user"></i> Profile</a></li>
            <li >  <a href="UpdateProfile.jsp"><i class="fa fa-pencil" aria-hidden="true"></i> Edit Profile</a></li>
            <li class="active">  <a href="exam.jsp"><i class="fa fa-book" aria-hidden="true"></i> Exam</a></li>
            <li>  <a href="grade.jsp"><i class="fa fa-line-chart" aria-hidden="true"></i> Grade</a></li>
        </ul>
    </div>
    
    <div id="main">
        <button type="button" class="openbtn btn btn-primary" onclick="openNav()">
            <i class="fa fa-bars"> Open</i>
        </button>  
          <br> <br><br><br>
					
                            <h4>Exam Tour</h4>
                    
                        <div><br>
                        <p> Dear student this is the practice exam and your first attempts of examination is free click below to next,<br>
                            Question can have four multiple choice option for 30 min don't use refresh button.<br>
                            after complete the exam if you pass this exam you will be awarded by the anxiety crash course .</p>
                            
                            <form action="../AddAnswers" onsubmit="if(document.getElementById('agree').checked) { return true; } else { alert('after clicking button exam imediatly started'); return false; }">
                                <input type="checkbox" name="checkbox" value="check" id="agree" />
                                <strong style="color:blue;">After clicking start button exam will be started.</strong> <br><br>
                                <input type="submit" class="btn btn-info " name="submit" value="Start Exam" />
                            </form>
                       </div>
    		</div> 
		</div>

<script src="http://localhost:8080/AnxietyCrashCourse/web/js/stoggle.js"></script>
<script src="http://localhost:8080/AnxietyCrashCourse/js/jquery-min.js"></script>
<script src="http://localhost:8080/AnxietyCrashCourse/js/popper.min.js"></script>
<script src="http://localhost:8080/AnxietyCrashCourse/js/bootstrap.min.js"></script>

<%@include file="/commonfiles/Footer.jsp" %>
</body>
</html> 




                        

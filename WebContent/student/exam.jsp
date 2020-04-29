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
					
                            <h4>Exam tour</h4>
                    
                        <div><br>
                        <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,<br>
                            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse<br>
                            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                            proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                            
                            <form action="exam.jsp" onsubmit="if(document.getElementById('agree').checked) { return true; } else { alert('Please indicate that you have read and agree to the Terms and Conditions and Privacy Policy'); return false; }">
                                <input type="checkbox" name="checkbox" value="check" id="agree" />
                                <strong style="color:blue;">I have read and agree to the Terms and Conditions and Privacy Policy.</strong> <br><br>
                                <input type="submit" class="btn btn-info " name="submit" value="procced" />
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




                        

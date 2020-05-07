<!DOCTYPE html>
<html>
<head>
<title>student Pannel</title>
<%@include file="/commonfiles/link.jsp" %>

</head>
<body>
	<%@include file="common/Header.jsp"%>

<div class="wrapper">
    <div id="mySidebar" class="sidebar ">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">x</a>
        <img src="http://localhost:8080/AnxietyCrashCourse/web/images/studentlogo.jpg" class="rounded-circle mx-auto d-block" alt="user logo" width="150" height="150"> 
        <br>
        <% String sname = session.getAttribute("sname").toString(); %>
        <h3 style="color:#FCF6F5FF;text-align: center;"><%=sname%></h3><br>
        <hr style="color: black;">
        <ul>
            <li>  <a href="profile.jsp"><i class="fa fa-fw fa-user"></i> Profile</a></li>
            <li >  <a href="UpdateProfile.jsp"><i class="fa fa-pencil" aria-hidden="true"></i> Edit Profile</a></li>
            <li>  <a href="exam.jsp"><i class="fa fa-book" aria-hidden="true"></i> Exam</a></li>
            <li class="active">  <a href="grade.jsp"><i class="fa fa-line-chart" aria-hidden="true"></i> Grade</a></li>
        </ul>
    </div>
    
    <div id="main">
        <button type="button" class="openbtn btn btn-primary" onclick="openNav()">
            <i class="fa fa-bars"> Open</i>
        </button>  
               <br> <br><br><br>
	
                    <br><h4>Grade Card</h4>
          <br>          
                <table class="table">
                    <thead>
                        <tr>
                            <th>Subject Name</th>
                            <th>Exam Total Marks</th>
                            <th>Your score</th>
                            <th>Percentage</th>
                            <th>Remark</th>
                            <th>Exam Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>java</td>
                            <td>100</td>
                            <td>30</td>
                            <td>30%</td>
                            <td>pass</td>
                            <td>thu may 31 12:30:00 IST 2018</td>
                        </tr>
                    </tbody>
                </table>
 
    		</div> 
		</div>

<script src="http://localhost:8080/AnxietyCrashCourse/web/js/stoggle.js"></script>
<script src="http://localhost:8080/AnxietyCrashCourse/js/jquery-min.js"></script>
<script src="http://localhost:8080/AnxietyCrashCourse/js/popper.min.js"></script>
<script src="http://localhost:8080/AnxietyCrashCourse/js/bootstrap.min.js"></script>

<%@include file="/commonfiles/Footer.jsp" %>
</body>
</html> 




                        

                
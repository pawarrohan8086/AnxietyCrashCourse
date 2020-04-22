<!DOCTYPE html>
<html>
<head>
<title>student</title>
<%@include file="/commonfiles/link.jsp" %>
</head>
<body>
<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setHeader ("Expires", "0"); //prevents caching at the proxy server
%>
<%@include file="/commonfiles/Header.jsp" %>

<div class="wrapper">
    <div id="mySidebar" class="sidebar ">
    
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
        <img src="http://localhost:8080/AnxietyCrashCourse/web/images/studentlogo.jpg" class="rounded-circle mx-auto d-block" alt="user logo" width="150" height="150"> 
        <br>
        <h3 style="color:#FCF6F5FF;text-align: center;"> Student Name</h3><br>
        <hr style="color: black;">
        <ul>
            <li class="active">  <a href="profile.jsp"><i class="fa fa-fw fa-user"></i> Profile</a></li>
            <li>  <a href="seprofile.jsp"><i class="fa fa-pencil" aria-hidden="true"></i> Edit Profile</a></li>
            <li>  <a href="exam.jsp"><i class="fa fa-book" aria-hidden="true"></i> Exam</a></li>
            <li>  <a href="grade.jsp"><i class="fa fa-line-chart" aria-hidden="true"></i> Grade</a></li>
        </ul>
    </div>
    
    <div id="main">
        <button type="button" class="openbtn btn btn-primary" onclick="openNav()">
            <i class="fa fa-bars"> Open</i>
        </button>  
                <br><br>
              
                    <h4>Personal Data</h4><br>
           
                <table class="table bio-table ">
                    <tbody>
                        <tr>      
                            <td>Student Id</td>
                            <td>:&nbsp;&nbsp; a23jsj3</td> 
                        </tr>
                        <tr>    
                            <td>Name</td>
                            <td>:&nbsp;&nbsp; Rohan pawar</td>
                        </tr>
                        <tr>    
                            <td>Address</td>
                            <td>:&nbsp;&nbsp; mumbai</td>       
                        </tr>
                        <tr>
                            <td>Admission Date</td>
                            <td>:&nbsp;&nbsp; 6 March 1980</td>
                        </tr>
                        <tr>
                            <td>Contact  </td>
                            <td>:&nbsp;&nbsp; 983497345</td>
                        </tr>
                        <tr>
                            <td>Course</td>
                            <td>:&nbsp;&nbsp; java</td>
                        </tr>
                        <tr>
                            <td>Fees</td>
                            <td>:&nbsp;&nbsp; 3000</td> 
                        </tr>
                        <tr>
                            <td>Uname</td>
                            <td>:&nbsp;&nbsp; rohan8086</td>
                        </tr>
                        <tr>
                            <td>Password</td>
                            <td>:&nbsp;&nbsp;394dfgrhtrgfh8750945cxvdfg</td>
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

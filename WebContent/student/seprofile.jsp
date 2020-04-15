<!DOCTYPE html>
<html>
<head>
<title>student</title>
<%@include file="/commonfiles/link.jsp" %>

</head>
<body>
<%@include file="/commonfiles/Header.jsp" %>

<div class="wrapper">
    <div id="mySidebar" class="sidebar ">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
        <img src="http://localhost:8080/AnxietyCrashCourse/web/images/studentlogo.jpg" class="rounded-circle mx-auto d-block" alt="user logo" width="150" height="150"> 
        <br>
        <h3 style="color:#FCF6F5FF;text-align: center;"> Student Name</h3><br>
        <hr style="color: black;">
        <ul>
            <li>  <a href="profile.jsp"><i class="fa fa-fw fa-user"></i> Profile</a></li>
            <li class="active">  <a href="seprofile.jsp"><i class="fa fa-pencil" aria-hidden="true"></i> Edit Profile</a></li>
            <li>  <a href="exam.jsp"><i class="fa fa-book" aria-hidden="true"></i> Exam</a></li>
            <li>  <a href="grade.jsp"><i class="fa fa-line-chart" aria-hidden="true"></i> Grade</a></li>
        </ul>
    </div>
    
    <div id="main">
        <button type="button" class="openbtn btn btn-primary" onclick="openNav()">
            <i class="fa fa-bars"> Open</i>
        </button>  
                <br><br>
				
                        <h4>Edit your profile</h4><br>
           
                    <form class="form-horizontal" action="#" role="form">
                        <div class="row">
                            <label class="col-lg-3 control-label text-info">Name:</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text"  name="name" value="" required>
                            </div>
                        </div><br>
                        <div class="row">
                            <label class="col-lg-3 control-label text-info">Address:</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" name="address" value="" required>
                            </div>
                        </div><br>
                        <div class="row">
                            <label class="col-lg-3 control-label text-info">Contact:</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" name="contact" value="" required>
                            </div>
                        </div><br>
                        <div class="row">
                            <label class="col-lg-3 control-label text-info">Course:</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" name="course" value="" required>
                            </div>
                        </div><br>
                        <div class="row ">
                            <label class="col-lg-3 control-label  text-info">Admission Date:</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" name="adate" value="" required>
                            </div>
                        </div><br>
                        <div class="row">
                            <label class="col-lg-3 control-label text-info">Email:</label>
                                <div class="col-lg-8">
                                    <input class="form-control" type="text" name="email" value="janesemail@gmail.com" required>
                                </div>
                            </div><br>
                            <div class="row">
                                <label class="col-md-3 control-label text-info">Username:</label>
                                <div class="col-md-8">
                                    <input class="form-control" type="text" name="uname" value="janeuser" required>
                                </div>
                            </div><br>
                            <div class="row">
                                <label class="col-md-3 control-label text-info">Password:</label>
                                <div class="col-md-8">
                                    <input class="form-control" type="Password" name="Password"  required>
                                </div>
                            </div><br>
                            <div class="row">
                                <label class="col-md-3 control-label"></label>
                                <div class="col-md-8">
                                    <input type="submit" class="btn btn-primary" value="Save Changes">
                                    <span></span>
                                    <input type="reset" class="btn btn-dark" value="Cancel">
                                </div>
                            </div>
                        </form>
    		</div> 
		</div>

<script src="http://localhost:8080/AnxietyCrashCourse/web/js/stoggle.js"></script>
<script src="http://localhost:8080/AnxietyCrashCourse/js/jquery-min.js"></script>
<script src="http://localhost:8080/AnxietyCrashCourse/js/popper.min.js"></script>
<script src="http://localhost:8080/AnxietyCrashCourse/js/bootstrap.min.js"></script>
<%@include file="/commonfiles/Footer.jsp" %>
</body>
</html> 


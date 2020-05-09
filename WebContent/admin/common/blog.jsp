<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>AnxietyCrashCourse</title>
<%@include file="/commonfiles/link.jsp" %>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
	%>
	<!-- home -->
	<div id="home" class="inner-w3pvt-page">
		<div class="overlay-innerpage">
			<!-- banner -->
			<div class="top_w3pvt_main container">

				<!-- nav -->
				<div class="nav_w3pvt text-center">
					<!-- nav -->
					<nav class="lavi-wthree">
						<div id="logo">
							<h1>
								<a class="navbar-brand" href="Home.jsp">Anxiety</a>
							</h1>
						</div>
						<label for="drop" class="toggle">Menu</label> <input
							type="checkbox" id="drop" />
						<ul class="menu mr-auto">
							<li><a href="Home.jsp">Home</a></li>
							<li><a href="about.jsp">About</a></li>
							<li>
								<!-- First Tier Drop Down --> <label for="drop-2" class="toggle">Know
									More<span class="fa fa-angle-down" aria-hidden="true"></span>
							</label> <a href="#">Know More<span class="fa fa-angle-down"
									aria-hidden="true"></span></a> <input type="checkbox" id="drop-2" />
								<ul>
									<li><a href="Home.jsp#features">Features</a></li>
									<li><a href="Home.jsp#services">Services</a></li>
									<li><a href="Home.jsp#gallery">Gallery</a></li>
									<li><a href="../Home.jsp#test">Testimonials</a></li>
									<li><a href="blog.jsp">Blogs</a></li>
								</ul>
							</li>
							<li><a href="contact.jsp">Contact</a></li>

							<!-- second Tier Drop Down -->
							<li class=" log-vj ml-lg-5"><label for="drop-3"
								class="toggle"> <span class="fa fa-user-circle-o"
									aria-hidden="true"></span> &nbsp;Student <span
									class="fa fa-angle-down" aria-hidden="true"></span>
							</label> <a href="#"> <span class="fa fa-user-circle-o"
									aria-hidden="true"></span> &nbsp;admin <span
									class="fa fa-angle-down" aria-hidden="true"></span>
							</a> <input type="checkbox" id="drop-3" />
								<ul>
									<li><a href="../ShowAllStudent.jsp">Student</a></li>
									<li><a href="../ShowAllSubjects.jsp">Subject</a></li>
									<li><a href="../ShowAllQuestions.jsp">Question</a></li>
									<li><a href="../ShowAllOptions.jsp">Option</a></li>
									<li><a href="../../Logout">Logout</a></li>
								</ul></li>
						</ul>
					</nav>
				</div>
				<!-- //nav -->
			</div>
			<!-- //nav -->

		</div>
		<!-- //banner -->
	</div>
	<!-- //home -->
	<!-- about -->

 <!-- about -->
    <section class="coming-wthree-soon py-5">
        <div class="container py-md-5">
            <div class="row py-md-5">
                <div class="col-lg-6 coming-soon-w3ls-info p-lg-5">
                    <h3 class="tittle-wthree two coming text-left">Coming Soon</h3>
                    <p class="sub-tittle text-left mt-4 mb-sm-5 mb-4">Sed do eiusmod tempor incididunt ut labore et dolore
                        magna
                        aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
                </div>
                <div class="col-lg-6 coming-soon-w3ls-info-form footer-grids p-lg-5">

                    <h6 class="mb-3">Follow us for update now </h6>
                    <form action="#" method="post" class="coming-soon">
                        <input type="email" id="email" name="EMAIL" placeholder="Enter your email here" required>
                        <button type="submit" class="btn"><span class="fa fa-paper-plane-o" aria-hidden="true"></span></button>
                    </form>
                    <div class="icon-social mt-4">
                        <a href="#" class="button-footr">
                            <span class="fa mx-2 fa-facebook"></span>
                        </a>
                        <a href="#" class="button-footr">
                            <span class="fa mx-2 fa-twitter"></span>
                        </a>
                        <a href="#" class="button-footr">
                            <span class="fa mx-2 fa-dribbble"></span>
                        </a>
                        <a href="#" class="button-footr">
                            <span class="fa mx-2 fa-pinterest"></span>
                        </a>
                        <a href="#" class="button-footr">
                            <span class="fa mx-2 fa-google-plus"></span>
                        </a>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- //about -->
<%@include file="/commonfiles/Footer.jsp" %>
</body>
</html>
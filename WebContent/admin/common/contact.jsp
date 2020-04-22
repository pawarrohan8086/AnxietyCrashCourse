<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>AnxietyCrashCourse</title>
<%@include file="/commonfiles/link.jsp"%>
</head>
<body>
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
									<li><a href="Home.jsp#test">Testimonials</a></li>
									<li><a href="blog.jsp">Blogs</a></li>
								</ul>
							</li>
							<li class="active"><a href="contact.jsp">Contact</a></li>

							<!-- second Tier Drop Down -->
							<li class="log-vj ml-lg-5"><label for="drop-3"
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
								<li><a href="/AnxietyCrashCourse/Home.jsp">Logout</a></li>
							</ul>
							</li>
						</ul>
					</nav>
					<!-- //nav -->
				</div>
			</div>
			<!-- //nav -->

		</div>
		<!-- //banner -->
	</div>
	<!-- //home -->
	<!-- about -->
	<section class="about py-5">
		<div class="container py-md-5">
			<h3 class="tittle-wthree text-center">Contact Us</h3>
			<p class="sub-tittle text-center mt-4 mb-sm-5 mb-4">Sed do
				eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
				ad minim veniam, quis nostrud exercitation</p>
			<div class="row">

				<div class="col-lg-6 contact-info-left">
					<ul class="list-unstyled w3ls-items">
						<li>
							<div class="row mt-5">
								<div class="col-3">
									<div class="con-icon">
										<span class="fa fa-home"></span>
									</div>
								</div>
								<div class="col-9">
									<h6>Address</h6>
									<p>
										Roaksh info tech. <br>city centre mall,indira gandi Park,
										<br>Nashik City.
									</p>
								</div>
							</div>
						</li>

						<li>
							<div class="row mt-5">
								<div class="col-3">
									<div class="con-icon">
										<span class="fa fa-envelope"></span>
									</div>
								</div>
								<div class="col-9">
									<h6>Email</h6>
									<a href="mailto:info@example.com">pawarrohan8086@gmail.com</a>
								</div>
							</div>
						</li>
						<li>
							<div class="row mt-5">
								<div class="col-3">
									<div class="con-icon">
										<span class="fa fa-phone"></span>
									</div>
								</div>
								<div class="col-9">
									<h6>Phone</h6>
									<p>(+91)-9975057282</p>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<div class="col-lg-6 contact-right-wthree-info login">
					<h5 class="text-center mb-4"></h5>
					<form action="#" method="post">
						<div class="form-group mt-4">
							<label>Name</label> <input type="text" class="form-control"
								id="validationDefault01" placeholder="" required>
						</div>
						<div class="form-group mt-4">
							<label>Eamil</label> <input type="email" class="form-control"
								id="validationDefault02" placeholder="" required>
						</div>

						<div class="form-group mt-4">
							<label class="mb-2">Password</label> <input type="password"
								class="form-control" id="password1" placeholder="" required>
						</div>
						<div class="form-group mt-4">
							<label class="mb-2">Message</label>
							<textarea class="form-control" name="Message" placeholder=""
								required></textarea>
						</div>
						<button type="submit" class="btn btn-primary submit mb-4">Submit
						</button>

					</form>

				</div>
			</div>
		</div>
	</section>
	<!-- //about -->
	<%@include file="/commonfiles/Footer.jsp"%>
</body>
</html>
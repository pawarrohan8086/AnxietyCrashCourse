<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>AnxietyCrashCourse</title>
<%@include file="/commonfiles/link.jsp" %>
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
						<li class="active"><a href="about.jsp">About</a></li>
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
								<li><a href="/AnxietyCrashCourse/Home.jsp">Logout</a></li>
							</ul>
						</li>
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
		<section class="about py-5">
			<div class="container py-md-5">
				<div class="about-w3ls-info text-center mx-auto">
					<h3 class="tittle-wthree pt-md-5 pt-3">About Us</h3>
					<p class="sub-tittle mt-3 mb-sm-5 mb-4">Integer pulvinar leo id viverra feugiat. Pellentesque libero ut justo, semper at tempus vel, ultrices in ligula. Lorem ipsum dolor sit amet sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Sed do eiusmod tempor incididunt ut labore et dolore
						magna
					aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
					<a href="know-more.jsp" class="btn btn-primary submit">Read More</a>
				</div>
			</div>
		</section>
		<!-- //about -->
		<!-- /features -->
		<div class="welcome py-5" id="features">
			<div class="container py-xl-5 py-lg-3">
				<div class="row">
					<div class="col-lg-5 welcome-left">
						<p>What We Provide</p>
						<h3 class="tittle-wthree mt-2 mb-3">We Rank the Best
						Courses on the Web</h3>

						<p class="mt-4 pr-lg-5">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse porta erat sit amet eros
							sagittis, quis
							hendrerit
						libero aliquam. Fusce semper augue ac dolor efficitur, a pretium metus pellentesque.</p>
					</div>
					<div class="col-lg-7 welcome-right text-center mt-lg-0 mt-5">
						<div class="row">

							<div class="col-sm-4 service-1-w3ls serve-gd2">
								<div class="serve-grid mt-4">
									<span class="fa fa-language s2"></span>
									<p class="mt-2">Languages</p>
								</div>
								<div class="serve-grid mt-4">
									<span class="fa fa-tachometer s3"></span>
									<p class="mt-2">Software </p>
								</div>
							</div>
							<div class="col-sm-4 service-1-w3ls serve-gd3">
								<div class="serve-grid mt-4">
									<span class="fa fa-handshake-o s4"></span>
									<p class="mt-2">Business</p>
								</div>
								<div class="serve-grid mt-4">
									<span class="fa fa-address-card-o s5"></span>
									<p class="text-li mt-2">Coaching </p>
								</div>
								<div class="serve-grid mt-4">
									<span class="fa fa-paint-brush s6"></span>
									<p class="mt-2">Design </p>
								</div>
							</div>
							<div class="col-sm-4 service-1-w3ls serve-gd2">
								<div class="serve-grid mt-4">
									<span class="fa fa-podcast s1"></span>
									<p class="mt-2">Development </p>
								</div>
								<div class="serve-grid mt-4">
									<span class="fa fa-book s7"></span>
									<p class="mt-2">Literature</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- //features -->

		<!-- services -->
		<section class="services text-center py-5" id="services">
			<div class="container py-md-5">
				<h3 class="tittle-wthree text-center">Real Facts</h3>
				<p class="sub-tittle text-center mt-4 mb-sm-5 mb-4">Sed do eiusmod tempor incididunt ut labore et dolore
					magna
				aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
				<div class="row ser-sec-1">
					<div class="col-md-4 ser-w3pvt-gd-wthree">
						<div class="icon">
							<span class="fa fa-lightbulb-o s1"></span>
						</div>
						<!-- Icon ends here -->
						<div class="service-content">
							<h5> New Classes</h5>
							<p class="serp">
								Quisque sagittis lacus eu lorem sodalesd enean adipiscing.
							</p>
						</div>
					</div>
					<div class="col-md-4 ser-w3pvt-gd-wthree">
						<div class="icon">
							<span class="fa fa-user s4"></span>
						</div>
						<!-- Icon ends here -->
						<div class="service-content">
							<h5>Expert Mentors</h5>
							<p class="serp">
								Quisque sagittis lacus eu lorem sodalesd enean adipiscing.
							</p>
						</div>
					</div>
					<div class="col-md-4 ser-w3pvt-gd-wthree">
						<div class="icon">
							<span class="fa fa-question-circle s3"></span>
						</div>
						<!-- .Icon ends here -->
						<div class="service-content">
							<h5>Live Support</h5>
							<p class="serp">
								Quisque sagittis lacus eu lorem sodalesd enean adipiscing.
							</p>
						</div>
					</div>
				</div>
				<div class="row ser-sec-1">
					<div class="col-md-4 ser-w3pvt-gd-wthree">
						<div class="icon">
							<span class="fa fa-gift s6"></span>
						</div>
						<!-- Icon ends here -->
						<div class="service-content">
							<h5>Lifetime Access</h5>
							<p class="serp">
								Quisque sagittis lacus eu lorem sodalesd enean adipiscing.
							</p>
						</div>
					</div>
					<div class="col-md-4 ser-w3pvt-gd-wthree">
						<div class="icon">
							<span class="fa fa-angellist s5"></span>
						</div>
						<!-- Icon ends here -->
						<div class="service-content">
							<h5>Membership</h5>
							<p class="serp">
								Quisque sagittis lacus eu lorem sodalesd enean adipiscing.
							</p>
						</div>
					</div>
					<div class="col-md-4 ser-w3pvt-gd-wthree">
						<div class="icon">
							<span class="fa fa-folder-open-o s6"></span>
						</div>
						<!-- .Icon ends here -->
						<div class="service-content">
							<h5>25000+ Courses</h5>
							<p class="serp">
								Quisque sagittis lacus eu lorem sodalesd enean adipiscing.
							</p>
						</div>
					</div>
				</div>
				<div class="row ser-sec-1">
					<div class="col-md-4 ser-w3pvt-gd-wthree border-bottom-0 bottom-vj-gds">
						<div class="icon">
							<span class="fa fa-black-tie s3"></span>
						</div>
						<!-- Icon ends here -->
						<div class="service-content">
							<h5>Law and Ethic</h5>
							<p class="serp">
								Quisque sagittis lacus eu lorem sodalesd enean adipiscing.
							</p>
						</div>
					</div>
					<div class="col-md-4 ser-w3pvt-gd-wthree border-bottom-0 bottom-vj-gds">
						<div class="icon">
							<span class="fa fa-music s2"></span>
						</div>
						<!-- Icon ends here -->
						<div class="service-content">
							<h5>Art and Music</h5>
							<p class="serp">
								Quisque sagittis lacus eu lorem sodalesd enean adipiscing.
							</p>
						</div>
					</div>
					<div class="col-md-4 ser-w3pvt-gd-wthree border-bottom-0">
						<div class="icon">
							<span class="fa fa-bar-chart s7"></span>
						</div>
						<!-- .Icon ends here -->
						<div class="service-content">
							<h5>Data Scientist</h5>
							<p class="serp">
								Quisque sagittis lacus eu lorem sodalesd enean adipiscing.
							</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- //services -->
		<!--/mid-content-->
		<section class="last-content py-5">
			<div class="container py-md-3 text-center">
				<div class="last-lavi-inner-content px-lg-5">
					<h3 class="mb-4 tittle-wthree">Get started with <span>Online </span> Education !</h3>
					<p class="px-lg-5">Sed ut perspiciatis unde omnis natus error dolor volup tatem ed accus antium dolor emque
						laudantium, totam rem aperiam, eaqu ipsa quae ab illo quasi architi ecto beatae vitae dicta
					sunt dolor ipsum.</p>
					<div class="buttons mt-md-4 mt-3">
						<a href="#apply" class="btn btn-default">Apply Now</a>
						<a href="contact.jsp" class="btn btn1"> Contact Us </a>
					</div>
				</div>
			</div>
		</section>
		<!--//mid-content-->
		    <!-- /features -->
    <div class="team-w3ls py-5">
        <div class="container py-xl-5 py-lg-3">
            <div class="row">

                <div class="col-lg-7 welcome-right text-center mt-lg-0 mt-5">
                    <div class="row">

                        <div class="col-sm-4 service-1-w3ls serve-gd2">
                            <div class="serve-grid team-gd mt-4">
                                <img src="/AnxietyCrashCourse/web/images/t1.jpg" alt="img" class="img-fluid image1">
                                <p class="mt-3">Professor 1</p>
                            </div>
                            <div class="serve-grid team-gd mt-4">
                                <img src="/AnxietyCrashCourse/web/images/t2.jpg" alt="img" class="img-fluid image1">
                                <p class="mt-3">Professor 2 </p>
                            </div>
                        </div>
                        <div class="col-sm-4 service-1-w3ls serve-gd3">
                            <div class="serve-grid team-gd mt-4">
                                <img src="/AnxietyCrashCourse/web/images/t3.jpg" alt="img" class="img-fluid image1">
                                <p class="mt-3">Professor 3</p>
                            </div>
                            <div class="serve-grid  team-gd mt-4">
                                <img src="/AnxietyCrashCourse/web/images/t4.jpg" alt="img" class="img-fluid image1">
                                <p class="text-li mt-2">Professor 4 </p>
                            </div>
                            <div class="serve-grid team-gd mt-4">
                                <img src="/AnxietyCrashCourse/web/images/t5.jpg" alt="img" class="img-fluid image1">
                                <p class="mt-3">Professor 5</p>
                            </div>
                        </div>
                        <div class="col-sm-4 service-1-w3ls serve-gd2">
                            <div class="serve-grid team-gd mt-4">
                                <img src="/AnxietyCrashCourse/web/images/t6.jpg" alt="img" class="img-fluid image1">
                                <p class="mt-3">Professor 6 </p>
                            </div>
                            <div class="serve-grid team-gd mt-4">
                                <img src="/AnxietyCrashCourse/web/images/t1.jpg" alt="img" class="img-fluid image1">
                                <p class="mt-3">Professor 7 </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 welcome-left pl-lg-5">
                    <p>Our Facilities</p>
                    <h3 class="tittle-wthree mt-2 mb-3">Meet Our Professors</h3>

                    <p class="mt-4 pr-lg-5">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse porta erat sit amet eros
                        sagittis, quis
                        hendrerit
                        libero aliquam. Fusce semper augue ac dolor efficitur, a pretium metus pellentesque.</p>
                </div>
            </div>
        </div>
    </div>
    <!-- //features -->
<%@include file="/commonfiles/Footer.jsp" %>
</body>
</html>
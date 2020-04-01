<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="CommonFile.jsp" %>
<title>AnxietyCrashCourse</title>
</head>
<body>
<!-- home -->
<div id="home">
	<!-- banner -->
	<div class="top_w3pvt_main container">

		<!-- nav -->
		<div class="nav_w3pvt text-center ">
			<!-- nav -->
			<nav class="lavi-wthree">
				<div id="logo">
					<h2> <a class="navbar-brand" style="color:black" href="index.html">Anxiety</a>
					</h2>
				</div>

				<label for="drop" class="toggle">Menu</label>
				<input type="checkbox" id="drop" />
				<ul class="menu mr-auto">
					<li class="active"><a href="index.html">Home</a></li>
					<li><a href="about.html">About</a></li>
					<li>
						<!-- First Tier Drop Down -->
						<label for="drop-2" class="toggle">Know More<span class="fa fa-angle-down" aria-hidden="true"></span> </label>
						<a href="#">Know More<span class="fa fa-angle-down" aria-hidden="true"></span></a>
						<input type="checkbox" id="drop-2" />
						<ul>
							<li><a href="#features">Features</a>
							</li>
							<li><a href="#services">Services</a>
							</li>
							<li><a href="#gallery">Gallery</a>
							</li>
							<li><a href="#test">Testimonials</a>
							</li>
							<li><a href="under.html">Blogs</a>
							</li>
						</ul>
					</li>
					<li><a href="contact.html">Contact</a></li>

					<!-- second Tier Drop Down -->
					<li class="log-vj ml-lg-5">
						<span class="fa fa-user-circle-o" aria-hidden="true"></span>
						<label for="drop-3" class="toggle">Student<span class="fa fa-angle-down" aria-hidden="true"></span> </label>
						<a href="#">Student<span class="fa fa-angle-down" aria-hidden="true"></span></a>
						<input type="checkbox" id="drop-3" />
						<ul>
							<li><a href="#apply">login</a>
							</li>
							<li><a href="#apply">sign up</a>
							</li>
						</ul>
					</li>
				</nav>
				<!-- //nav -->
			</div>
		</div>
		<!-- //nav -->
		<!-- banner slider -->
		<div id="homepage-slider" class="st-slider">
			<input type="radio" class="cs_anchor radio" name="slider" id="play1" checked="" />
			<input type="radio" class="cs_anchor radio" name="slider" id="slide1" />
			<input type="radio" class="cs_anchor radio" name="slider" id="slide2" />
			<input type="radio" class="cs_anchor radio" name="slider" id="slide3" />
			<div class="images">
				<div class="images-inner">
					<div class="image-slide">
						<div class="banner-w3pvt-1">
							<div class="overlay-wthree"></div>

						</div>
					</div>
					<div class="image-slide">
						<div class="banner-w3pvt-2">
							<div class="overlay-wthree"></div>
						</div>
					</div>
					<div class="image-slide">
						<div class="banner-w3pvt-3">
							<div class="overlay-wthree"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="labels">
				<div class="fake-radio">
					<label for="slide1" class="radio-btn"></label>
					<label for="slide2" class="radio-btn"></label>
					<label for="slide3" class="radio-btn"></label>
				</div>
			</div>
			<!-- banner-w3ls-info -->
			<div class="banner-w3ls-info">
				<div class="content-bg-1 one-bg">
					<span class="fa fa-lightbulb-o" aria-hidden="true"></span>
					<h3 class="ban-text">
						Creative Study Pattern
					</h3>
				</div>
				<div class="content-bg-1 two-bg">
					<span class="fa fa-book"></span>
					<h3 class="ban-text">
						Quick Crash Courses
					</h3>
				</div>
				<div class="content-bg-1 third-bg">
					<span class="fa fa-shield" aria-hidden="true"></span>
					<h3 class="ban-text">
						Certification Awarded
					</h3>
				</div>
			</div>
			<!-- //banner-w3ls-info -->
		</div>
		<!-- //banner slider -->
	</div>
	<!-- //banner -->

	<!-- //home -->

	<!-- about -->
	<section class="about py-5">
		<div class="container py-md-5">
			<div class="about-w3ls-info text-center mx-auto">
				<h3 class="tittle-wthree pt-md-5 pt-3">About Us</h3>
				<p class="sub-tittle mt-3 mb-sm-5 mb-4">Integer pulvinar leo id viverra feugiat. Pellentesque libero ut justo, semper at tempus vel, ultrices in ligula. Lorem ipsum dolor sit amet sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Sed do eiusmod tempor incididunt ut labore et dolore
					magna
				aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
				<a href="single.html" class="btn btn-primary submit">Read More</a>
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
						<h5>Law & Ethic</h5>
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
					<a href="contact.html" class="btn btn1"> Contact Us </a>
				</div>
			</div>
		</div>
	</section>
	<!--//mid-content-->

	<!-- gallery -->
	<div class="gallery py-5 text-center" id="gallery">
		<div class="container py-md-5">
			<h3 class="tittle-wthree text-center">Our Gallery</h3>
			<p class="sub-tittle text-center mt-3 mb-sm-5 mb-4">Sed do eiusmod tempor incididunt ut labore et
				dolore
				magna
			aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
			<div class="row no-gutters">
				<div class="col-md-6 gal-img">
					<a href="#gal1"><img src="web/images/g1.jpg" alt="Gallery Image" class="img-fluid"></a>
				</div>
				<div class="col-md-3 gal-img">
					<a href="#gal2"><img src="web/images/g2.jpg" alt="Gallery Image" class="img-fluid"></a>
				</div>
				<div class="col-md-3 gal-img">
					<a href="#gal3"><img src="web/images/g3.jpg" alt="Gallery Image" class="img-fluid"></a>
				</div>


				<div class="col-md-3 gal-img ml-auto">
					<a href="#gal5"><img src="web/images/g5.jpg" alt="Gallery Image" class="img-fluid"></a>
				</div>
				<div class="col-md-3 gal-img mr-auto">
					<a href="#gal6"><img src="web/images/g6.jpg" alt="Gallery Image" class="img-fluid"></a>
				</div>
				<div class="col-md-6 gal-img">
					<a href="#gal4"><img src="web/images/g4.jpg" alt="Gallery Image" class="img-fluid"></a>
				</div>
			</div>


			<!-- gallery popups -->
			<!-- popup-->
			<div id="gal1" class="pop-overlay animate">
				<div class="popup">
					<img src="images/g1.jpg" alt="Popup Image" class="img-fluid" />
					<p class="mt-4">Nulla viverra pharetra se, eget pulvinar neque pharetra ac int. placerat placerat
					dolor.</p>
					<a class="close" href="#gallery">&times;</a>
				</div>
			</div>
			<!-- //popup -->
			<!-- popup-->
			<div id="gal2" class="pop-overlay animate">
				<div class="popup">
					<img src="images/g2.jpg" alt="Popup Image" class="img-fluid" />
					<p class="mt-4">Nulla viverra pharetra se, eget pulvinar neque pharetra ac int. placerat placerat
					dolor.</p>
					<a class="close" href="#gallery">&times;</a>
				</div>
			</div>
			<!-- //popup -->
			<!-- popup-->
			<div id="gal3" class="pop-overlay animate">
				<div class="popup">
					<img src="images/g3.jpg" alt="Popup Image" class="img-fluid" />
					<p class="mt-4">Nulla viverra pharetra se, eget pulvinar neque pharetra ac int. placerat placerat
					dolor.</p>
					<a class="close" href="#gallery">&times;</a>
				</div>
			</div>
			<!-- //popup3 -->
			<!-- popup-->
			<div id="gal4" class="pop-overlay animate">
				<div class="popup">
					<img src="images/g4.jpg" alt="Popup Image" class="img-fluid" />
					<p class="mt-4">Nulla viverra pharetra se, eget pulvinar neque pharetra ac int. placerat placerat
					dolor.</p>
					<a class="close" href="#gallery">&times;</a>
				</div>
			</div>
			<!-- //popup -->
			<!-- popup-->
			<div id="gal5" class="pop-overlay animate">
				<div class="popup">
					<img src="images/g5.jpg" alt="Popup Image" class="img-fluid" />
					<p class="mt-4">Nulla viverra pharetra se, eget pulvinar neque pharetra ac int. placerat placerat
					dolor.</p>
					<a class="close" href="#gallery">&times;</a>
				</div>
			</div>
			<!-- //popup -->
			<!-- popup-->
			<div id="gal6" class="pop-overlay animate">
				<div class="popup">
					<img src="images/g6.jpg" alt="Popup Image" class="img-fluid" />
					<p class="mt-4">Nulla viverra pharetra se, eget pulvinar neque pharetra ac int. placerat placerat
					dolor.</p>
					<a class="close" href="#gallery">&times;</a>
				</div>
			</div>
			<!-- //popup -->
			<!-- //gallery popups -->
		</div>
	</div>
	<!-- //gallery -->

	<!-- /apply-->
	<section class="apply-main py-5" id="apply">
		<div class="container py-md-5">
			<div class="row">
				<div class="col-lg-7 apply-info px-lg-5">
					<h3 class="tittle-wthree apply-hd text-white mb-lg-5 mb-3">It’s limited seating! Hurry up. Get the Coaching Training for Free</h3>
					<div class="row wthree-stats-inf">
						<div class="col-6 stats_w3pvt_counter_grid mt-3">
							<div class="d-flex">
								<p class="counter">008</p>
								<p class="para-w3pvt">Courses</p>
							</div>
						</div>
						<div class="col-6 stats_w3pvt_counter_grid mt-3">
							<div class="d-flex">
								<p class="counter">600</p>
								<p class="para-w3pvt">Lectures</p>
							</div>
						</div>
						<div class="col-6 stats_w3pvt_counter_grid mt-3">
							<div class="d-flex">
								<p class="counter">222</p>
								<p class="para-w3pvt">Students</p>
							</div>
						</div>
						<div class="col-6 stats_w3pvt_counter_grid mt-3">
							<div class="d-flex">
								<p class="counter">10</p>
								<p class="para-w3pvt">Years</p>
							</div>
						</div>
					</div>

					<!-- apply section -->
				</div>
				<div class="col-lg-5 login p-md-5 p-4 mx-auto bg-white mw-100">
					<h5 class="text-center mb-4">Apply Now</h5>	
								
					<form action="StudentSignIn" method="post">
						<div class="form-group">
							<label>user Name</label>
							<input type="text" class="form-control" id="validationDefault02" required="required" name="uname">
							<span style="color:#FAD7A0 ;font-size:12px;margin-top: 10px;">
							3 to 15 char use ( lower , digit ).</span>
						</div>
						<div class="form-group">
							<label>Email</label>
							<input type="email" class="form-control" id="validationDefault02" required="required" name="email">
							
						</div>

						<div class="form-group mb-4">
							<label class="mb-2">Enter Password</label>
							<input type="password"  class="form-control" id="password1" placeholder="" required="required" name="pswd">
							<span style="color:#FAD7A0 ;font-size:12px;margin-top: 10px;">
							8 to 20 char use (one-upper,one-lower,one-digit and one-special).</span>
						</div>
						<div class="form-group mb-4">
							<label class="mb-2">Conform Password</label>
							<input type="password" name="cpswd" class="form-control" id="password1" placeholder="" required="required">
						</div>
						<button type="submit" class="btn btn-primary submit mb-4">Register</button>
					</form>
					<!--pop up login-->
					<button class="btn btn-primary slogin mb-4" onclick="document.getElementById('id01').style.display='block'">Login</button>

					<div id="id01" class="modal"> 
						<form class="modal-content animate" action="#" method="post">
							<div class="logincontainer">
								<span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close">&times;</span>
								<h3>Login</h3>
							</div>

							<div class="container">
								<label for="uname"><b>Username or email</b></label>
								<input type="text" class="form-control" id="validationDefault01" name="uname" required="required">

								<label for="psw"><b>Password</b></label>
								<input type="password" class="form-control" id="password1" name="psw" required="required">

								<button type="submit" title="login">Login</button>
								<label>
									<input type="checkbox" checked="checked" name="remember"> Remember me
								</label>
							</div>

							<div class="container" style="background-color:#f1f1f1">
								<button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
								<span class="psw">Forgot <a href="#">password?</a></span>
							</div>
						</form>
					</div><!--pop up login-->

				</div>
			</div>
		</div>
	</section>
	<!-- //apply -->


	<!-- testimonials -->
	<section class="testimonials py-5" id="test">
		<div class="container py-xl-5 py-lg-3">
			<h3 class="tittle-wthree text-center">Testimonials</h3>
			<p class="sub-tittle text-center mt-4 mb-sm-5 mb-4">Sed do eiusmod tempor incididunt ut labore et dolore
				magna
			aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
			<div class="row">
				<div class="col-lg-4 testimonials_grid mt-3">
					<div class="p-lg-5 p-4 testimonials-gd-vj">
						<p class="sub-test"><span class="fa fa-quote-left s4" aria-hidden="true"></span> Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod possimus, omnis voluptas.
						</p>
						<div class="row mt-4">
							<div class="col-3 testi-img-res">
								<img src="images/te1.jpg" alt=" " class="img-fluid" />
							</div>
							<div class="col-9 testi_grid">
								<h5 class="mb-2">anjali mehata</h5>
								<p>Java developer</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 testimonials_grid mt-3">
					<div class="p-lg-5 p-4 testimonials-gd-vj">
						<p class="sub-test"><span class="fa fa-quote-left s4" aria-hidden="true"></span>Quisque sagittis lacus eu lorem , cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod possimus.
						</p>
						<div class="row mt-4">
							<div class="col-3 testi-img-res">
								<img src="images/te2.jpg" alt=" " class="img-fluid" />
							</div>
							<div class="col-9 testi_grid">
								<h5 class="mb-2">saurabh bagul</h5>
								<p>Cloud Services</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 testimonials_grid mt-3">
					<div class="p-lg-5 p-4 testimonials-gd-vj">
						<p class="sub-test"><span class="fa fa-quote-left s4" aria-hidden="true"></span> Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod possimus, omnis voluptas.
						</p>
						<div class="row mt-4">
							<div class="col-3 testi-img-res">
								<img src="images/te3.jpg" alt=" " class="img-fluid" />
							</div>
							<div class="col-9 testi_grid">
								<h5 class="mb-2">Akshay pawar</h5>
								<p>Android Developer</p>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>
	<!-- //testimonials -->

<%@include file="Footer.jsp" %>
</body>
</html>

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
							<a class="navbar-brand" href="common/Home.jsp">Anxiety</a>
						</h1>
					</div>
					<label for="drop" class="toggle">Menu</label> <input
						type="checkbox" id="drop" />
					<ul class="menu mr-auto">
						<li><a href="common/Home.jsp">Home</a></li>
						<li><a href="common/about.jsp">About</a></li>
						<li>
							<!-- First Tier Drop Down --> <label for="drop-2" class="toggle">Know
								More<span class="fa fa-angle-down" aria-hidden="true"></span>
						</label> <a href="#">Know More<span class="fa fa-angle-down"
								aria-hidden="true"></span></a> <input type="checkbox" id="drop-2" />
							<ul>
								<li><a href="common/Home.jsp#features">Features</a></li>
								<li><a href="common/Home.jsp#services">Services</a></li>
								<li><a href="common/Home.jsp#gallery">Gallery</a></li>
								<li><a href="common/Home.jsp#test">Testimonials</a></li>
								<li><a href="common/blog.jsp">Blogs</a></li>
							</ul>
						</li>
						<li><a href="common/contact.jsp">Contact</a></li>

						<!-- second Tier Drop Down -->
						<li class="active log-vj ml-lg-5"><label for="drop-3"
							class="toggle"> <span class="fa fa-user-circle-o"
								aria-hidden="true"></span> &nbsp;Student <span
								class="fa fa-angle-down" aria-hidden="true"></span>
						</label> <a href="#"> <span class="fa fa-user-circle-o"
								aria-hidden="true"></span> &nbsp;admin <span
								class="fa fa-angle-down" aria-hidden="true"></span>
						</a> <input type="checkbox" id="drop-3" />
							<ul>
								<li><a href="ShowAllStudent.jsp">Student</a></li>
								<li><a href="ShowAllSubjects.jsp">Subject</a></li>
								<li><a href="ShowAllQuestions.jsp">Question</a></li>
								<li><a href="ShowAllOptions.jsp">Option</a></li>
								<li><a href="../Logout">Logout</a></li>
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
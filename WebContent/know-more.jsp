<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>AnxietyCrashCourse</title>
<%@include file="/commonfiles/link.jsp" %>
</head>
<body>
<%@include file="/commonfiles/Header.jsp" %>
    <!-- about -->
    <section class="single-w3ls-page py-5">
        <div class="container py-md-5">
            <div class="content-sing-w3pvt px-lg-5">
                <img class="img-fluid" src="web/images/banner2.jpg" alt="banner2">
                <h4 class="title-wthree my-3">Lorem ipsum dolor sit amet</h4>
                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod magna .Lorem ipsum dolor sit amet, consectetuer adipiscing elit,Sed diam nonummy nibh euismod magna .Integer pulvinar leo id viverra feugiat. Pellentesque Libero Justo, Semper At Tempus Vel, Ultrices In Sed Ligula. Nulla Uter Sollicitudin Velit.</p>
                <p class="mt-3">Integer pulvinar leo id viverra feugiat. Pellentesque Libero Justo, Semper At Tempus Vel, Ultrices In Sed Ligula. Nulla Uter Sollicitudin Velit.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod magna.</p>
                <div class="social-icons-footer">
                    <ul class="list-unstyled w3pvt-icons mb-5">
                        <li class="lead">
                            Catch On Social :
                        </li>
                        <li>
                            <a href="#">
                                <span class="fa fa-facebook-f"></span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="fa fa-twitter"></span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="fa fa-instagram"></span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="fa fa-github"></span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="fa fa-pinterest-p"></span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="fa fa-whatsapp"></span>
                            </a>
                        </li>
                    </ul>
                </div>

                <div class="row about-w3pvt-top mt-2">

                    <div class="col-lg-6 about-info">
                        <h4 class="title-wthree mb-5">Lorem ipsum dolor sit magna feugiat etiam sed dolor</h4>
                        <p>Donec malesuada ex sit amet pretium sid ornare. Nulla congue scelerisque tellus, utpretium nulla malesuada sedint. Suspendisse venenatis,Lorem ipsum dolor sit magna dolor.</p>


                    </div>
                    <div class="col-lg-6 about-img">
                        <div class="row">
                            <div class="col">
                                <img src="web/images/g3.jpg" class="img-fluid" alt="user-image">
                            </div>
                            <div class="col">
                                <img src="web/images/g2.jpg" class="img-fluid" alt="user-image">
                            </div>
                        </div>
                    </div>


                </div>
            </div>
            <div class="comments my-5">
                <h4 class="title-wthree mb-5">Recent Comments</h4>
                <div class="comments-grids mt-4">
                    <div class="media mt-4">
                        <img class="mr-3" src="web/images/te1.jpg" alt="image">
                        <div class="media-body comments-grid-right">
                            <h4>Johnson</h4>
                            <ul class="my-2">
                                <li class="font-weight-bold">2 Apr 2019
                                    <i>|</i>
                                </li>
                                <li>
                                    <a href="#" class="font-weight-bold">Reply</a>
                                </li>
                            </ul>
                            <p>mattis ut hendrerit non, facilisis eget mauris. Sed ultricies nec purus quis
                                tempor.
                                Phasellus bibendum eu.</p>
                        </div>
                    </div>
                    <div class="media mt-sm-5 mt-3 ml-5">
                        <a class="pr-3" href="#">
                            <img src="web/images/te2.jpg" class="img-fluid media-img" alt="image">
                        </a>
                        <div class="media-body comments-grid-right">
                            <h4>Watson</h4>
                            <ul class="my-2">
                                <li class="font-weight-bold">2 Apr 2019
                                    <i>|</i>
                                </li>
                                <li>
                                    <a href="#" class="font-weight-bold">Reply</a>
                                </li>
                            </ul>
                            <p>mattis ut hendrerit non, facilisis eget mauris. Sed ultricies nec
                                purus
                                quis
                                tempor. Phasellus bibendum eu.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="contact-right-wthree-info login">

                <h4 class="title-wthree mb-5">Leave a Comment</h4>
                <form action="#" method="post" class="single-page-form">
                    <div class="form-group mt-4">
                        <label>Name</label>

                        <input type="text" class="form-control" id="validationDefault01" placeholder="" required="">
                    </div>
                    <div class="form-group mt-4">
                        <label>Email</label>
                        <input type="email" class="form-control" id="validationDefault02" placeholder="" required="">
                    </div>


                    <div class="form-group mt-4">
                        <label class="mb-2">Message</label>
                        <textarea class="form-control" name="Message" placeholder="" required=""></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary submit mb-4">Post Comment </button>

                </form>

            </div>
        </div>
    </section>
    <!-- //about -->
<%@include file="/commonfiles/Footer.jsp" %>
</body>
</html>
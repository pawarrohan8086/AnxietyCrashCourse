<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Student Registration</title>
<%@page
	import="java.util.ArrayList,java.util.ListIterator,java.sql.ResultSet,com.anxiety.dao.SubjectOperation,com.anxiety.bean.bo.SubjectBO"%>
<%@include file="/commonfiles/link.jsp"%>
</head>
<body>
	<%@include file="/commonfiles/Header.jsp"%>
	<!-- registration form -->
	<div class="row">
		<div class="col-75">
			<div class="rtable">
				<form action="./StudentResistration" method="post">
					<div class="row">
						<div class="col-50">
							<h2 style="color: #E84A5F; margin-bottom: 50px">Student
								Registration</h2>
							<label for="name"><i class="fa fa-user"></i> Name</label> <input
								type="text" id="rtableselect"
								pattern="[a-zA-Z][a-zA-Z ]+[a-zA-Z]$" name="name"
								placeholder="full name" required> <label for="mobile"><i
								class="fa fa-phone-square"></i> Mobile</label> <input type="text"
								id="rtableselect" pattern="(0/91)?[7-9][0-9]{9}" name="mobile"
								placeholder="Mobile" maxlength="10" minlength="10" required>
							<label for="address"><i class="fa fa-address-card-o"></i>
								Address</label> <input type="text" id="rtableselect" name="address"
								placeholder="address" required>
							<div class="row">
								<div class="form-group col-50">
									<label for="course"><i class="fa fa-mortar-board"></i>
										Choose a Course</label> <select id="rtableselect" name=course required>
										<%
											String uname=request.getAttribute("uname").toString();
											String email=request.getAttribute("email").toString();
											String pswd=request.getAttribute("pswd").toString();
											ServletContext sc = getServletContext();
											SubjectOperation subo = new SubjectOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
													sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
											ArrayList<SubjectBO> al = subo.getAllSubject();
											if (al != null) {
										%><option value="">None</option>
										<%
											ListIterator<SubjectBO> ltr = al.listIterator();
												while (ltr.hasNext()) {

													SubjectBO sbo = ltr.next();
													String sub = sbo.getSub_name();
													double fee = sbo.getSub_fees();
													int discount = sbo.getSub_offer();
													double fees = (fee - (fee * ((double) discount / 100.0)));
										%>
										<option value="<%=sub%>-<%=fees%>"><%=sub%></option>
										<%
											}
											} else {
										%>
										<option value="">Subject not Available</option>
										<%
											}
										%>
									</select>
								</div>
							</div>
							<label for="inputdefault"><i class="fa fa-calendar"></i>
								Admission Date</label> <input type="date" id="rtableselect" name="adate"
								required>
								<input type="hidden" name="uname" value="<%=uname %>">
								<input type="hidden" name="email" value="<%=email %>">
								<input type="hidden" name="pswd" value="<%=pswd %>">
								 <input id="rtableselect" type="submit"
								value="Resister" class="btn btn-primary">
						</div>
						<div class="col-50">
							<div class="col-25">
								<div class="rtable">
									<h4>
										Subject <span class="price" style="color: black"><b>Discount</b>
										</span>
									</h4>
									<p></p>
									<%
									request.removeAttribute(uname);
									request.removeAttribute(email);
									request.removeAttribute(pswd);
										if (al != null) {
											ListIterator<SubjectBO> ltr = al.listIterator();
											while (ltr.hasNext()) {
												SubjectBO sbo = ltr.next();
												String sub = sbo.getSub_name();
												int dis = sbo.getSub_offer();
									%>
									<p>
										<%=sub%><span class="price"><%=dis%> <i
											class="fa fa-percent"></i></span>
									</p>
									<%
										}
										} else {
									%>
									<h5 style="color: blue;">No data Available</h5>
									<%
										}
									%>

								</div>
							</div>
							<div class="col-25">
								<div class="rtable">
									<h4>
										Available Courses <span class="price" style="color: black"><b>Fees</b>
											<i class="fa fa-money"></i> </span>
									</h4>
									<p></p>
									<%
										if (al != null) {
											ListIterator<SubjectBO> ltr = al.listIterator();
											while (ltr.hasNext()) {
												SubjectBO sbo = ltr.next();
												String sub = sbo.getSub_name();
												double fees = sbo.getSub_fees();
									%>
									<p>
										<%=sub%><span class="price"><%=fees%> <i
											class="fa fa-rupee"></i></span>
									</p>
										<%
											}
											} else {
										%>
									
									<h5 style="color: blue;">No data Available</h5>
									<%
										}
									%>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@include file="/commonfiles/Footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Student Registration</title>
<%@include file="CommonFile.jsp" %>
</head>
<body>
<%@include file="Header.jsp" %>
        <!-- registration form -->
        <div class="container">
            <h2 style="color: #E84A5F;margin-bottom:50px">Student Registration Form</h2>
            <%
            	String flag=request.getAttribute("flag").toString();
            	
            %>
            <form action="StudentResistration" class="<%=flag%>">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" id="name" placeholder="Enter Name" name="name" required="required">
                    <div class="valid-feedback">Valid.</div>
                    <div class="invalid-feedback">Please fill out this field.</div>
                </div>
                <div class="form-group">
                    <label for="mobile">Mobile:</label>
                    <input type="text" class="form-control" id="mobile" placeholder="Enter mobile" name="mobile" required="required" maxlength="10">
                    <div class="valid-feedback">Valid.</div>
                    <div class="invalid-feedback">Please fill out this field.</div>
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <textarea class="form-control" id="address" placeholder="Enter Address" name="address" required="required"></textarea>
                    <div class="valid-feedback">Valid.</div>
                    <div class="invalid-feedback">Please fill out this field.</div>
                </div>
                <div class="form-group">
                    <label for="fees">Fees:</label>
                    <input type="text" class="form-control" id="fees" placeholder="Fees" name="fees" required="required">
                    <div class="valid-feedback">Valid.</div>
                    <div class="invalid-feedback">Please fill out this field.</div>
                </div>
                <div class="form-group">
                    <label for="Date">Admission Date:</label>
                    <input type="Date" class="form-control" id="adate" placeholder="Addmission Date" name="adate" required="required">
                    <div class="valid-feedback">Valid.</div>
                    <div class="invalid-feedback">Please fill out this field.</div>
                </div><div class="form-group">
                    <label for="course">Course:</label>
                    <input type="text" class="form-control" id="course" placeholder="Course" name="course" required="required">
                    <div class="valid-feedback">Valid.</div>
                    <div class="invalid-feedback">Please fill out this field.</div>
                </div> 
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
<%@include file="Footer.jsp" %>
</body>
</html>
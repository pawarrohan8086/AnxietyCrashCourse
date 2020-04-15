<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Student Registration</title>
<%@include file= "/commonfiles/link.jsp"%>
</head>
<body>
<%@include file="/commonfiles/Header.jsp" %>
        <!-- registration form -->
            
  <div class="row">
    <div class="col-75">
      <div class="rtable">
        <form action="StudentResistration">
          <div class="row">
            <div class="col-50">
              <h2 style="color: #E84A5F;margin-bottom:50px">Student Registration</h2>
              <label for="name"><i class="fa fa-user"></i> Name</label>
              <input type="text" id="rtableselect" pattern="[a-zA-Z][a-zA-Z ]+[a-zA-Z]$" name="name" placeholder="full name" required>
              <label for="mobile"><i class="fa fa-phone-square"></i> Mobile</label>
              <input type="text" id="rtableselect" pattern="(0/91)?[7-9][0-9]{9}" name="mobile" placeholder="Mobile" 
              maxlength="10" minlength="10" required>
              <label for="address"><i class="fa fa-address-card-o"></i> Address</label>
              <input type="text" id="rtableselect" name="address" placeholder="address" required>
              <div class="row">
                <div class="form-group col-50">
                  <label for="course"><i class="fa fa-mortar-board"></i> Choose a Course</label>
                  <select id="rtableselect" name=course required>
                     <option value="">None</option>
                    <option value="java">Java</option>
                    <option value="android">Android</option>
                    <option value="python">Python</option>
                    <option value="javascript">Java Script</option>
                  </select>
                </div>
                <div class="col-50">
                  <label for="fees"><i class="fa fa-money"></i> Fees</label >
                  <select id="rtableselect" name="fees" required>
                    <option value="">None</option>
                    <option value="1000">1000</option>
                    <option value="2000">2000</option>
                    <option value="3000">3000</option>
                    <option value="4000">4000</option>
                  </select>
                </div>
              </div>
              <label for="inputdefault"><i class="fa fa-calendar"></i> Admission Date</label>
              <input type="date" id="rtableselect" name="adate" required>
              <input id="rtableselect" type="submit" value="Continue" class="btn btn-primary">
            </div>
            <div class="col-50">
              <div class="col-25">
                <div class="rtable">
                  <h4>Offers <span class="price" style="color:black"><i class="fa fa-percent"></i> <b>4</b></span></h4>
                 <p></p>
                  <p>1 month only<span class="price">$5</span></p>
                   <p>3 month only<span class="price">$15</span></p>
                </div>
              </div>
              <div class="col-25">
                <div class="rtable">
                  <h4>Available Courses <span class="price" style="color:black"><i class="fa fa-mortar-board"></i> <b>4</b></span></h4>
                  <p></p>
                  <p>Python<span class="price">$5</span></p>
                  <p>Java Script <span class="price">$8</span></p>
                  <p>Android<span class="price">$2</span></p>
                </div>
              </div>
            </div>
          </div>
        </form>
        </div>
      </div>
    </div>
<%@include file="/commonfiles/Footer.jsp" %>
</body>
</html>
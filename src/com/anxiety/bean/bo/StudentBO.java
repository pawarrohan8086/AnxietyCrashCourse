package com.anxiety.bean.bo;


public class StudentBO {
 private String username,email,password,sname,address,course,admision_date;
 private long contact,studentid;
 private double fees;
 
public long getStudentid() {
	return studentid;
}
public void setStudentid(long studentid) {
	this.studentid = studentid;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPassword() {
	
	return password;
}
public void setPassword(String password) {
	
	
	this.password= password;
}
public String getSname() {
	return sname;
}
public void setSname(String sname) {
	this.sname = sname.toLowerCase();
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public long getContact() {
	return contact;
}
public void setContact(long contact) {
	this.contact = contact;
}
public String getCourse() {
	return course;
}
public void setCourse(String course) {
	this.course = course;
}
public String getAdmision_date() {
	return admision_date;
}
public void setAdmision_date(String admision_date) {
	this.admision_date = admision_date;
}
public double getFees() {
	return fees;
}
public void setFees(double fees) {
	this.fees = fees;
}

}

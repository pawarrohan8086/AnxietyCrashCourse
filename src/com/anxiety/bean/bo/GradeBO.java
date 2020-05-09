package com.anxiety.bean.bo;

public class GradeBO {
long auid;
private String course,remark,edate;
private int score,sid,tmark;
private float percentage;
public int getSid() {
	return sid;
}
public void setSid(int sid) {
	this.sid = sid;
}
public long getAuid() {
	return auid;
}
public void setAuid(long auid) {
	this.auid = auid;
}
public String getCourse() {
	return course;
}
public void setCourse(String course) {
	this.course = course;
}
public String getRemark() {
	return remark;
}
public void setRemark(String remark) {
	this.remark = remark;
}
public String getEdate() {
	return edate;
}
public void setEdate(String edate) {
	this.edate = edate;
}
public int getScore() {
	return score;
}
public void setScore(int score) {
	this.score = score;
}
public float getPercentage() {
	return percentage;
}
public void setPercentage(float percentage) {
	this.percentage = percentage;
}
public int getTmark() {
	return tmark;
}
public void setTmark(int tmark) {
	this.tmark = tmark;
}
public void getPercentage(float perc) {
	// TODO Auto-generated method stub
	
}
}

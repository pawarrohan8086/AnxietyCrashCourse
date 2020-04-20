package com.anxiety.bean.bo;

public class QuestionBO {
	private int que_marks,que_id;
	private String sub_name,question_type,quetext,anstext;
	
	public int getQue_marks() {
		return que_marks;
	}
	public void setQue_marks(int que_marks) {
		this.que_marks = que_marks;
	}
	
	public String getSub_name() {
		return sub_name;
	}
	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}
	public String getQuestion_type() {
		return question_type;
	}
	public void setQuestion_type(String question_type) {
		this.question_type = question_type;
	}
	public String getQuetext() {
		return quetext;
	}
	public void setQuetext(String quetext) {
		this.quetext = quetext;
	}
	public String getAnstext() {
		return anstext;
	}
	public void setAnstext(String anstext) {
		this.anstext = anstext;
	}
	public int getQue_id() {
		return que_id;
	}
	public void setQue_id(int que_id) {
		this.que_id = que_id;
	}
	
}

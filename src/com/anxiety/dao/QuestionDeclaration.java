package com.anxiety.dao;

import java.util.ArrayList;

import com.anxiety.bean.bo.QuestionBO;

public interface QuestionDeclaration {

	public int[] addQuestion(QuestionBO qbo);
	public void closeConnection();
	public ArrayList<QuestionBO> getAllQuestion();
	public QuestionBO getQuestionByQid(int qid);
	public int deleteQuestion(int  qid);
	public int updateQuestion(QuestionBO qbo);
	public ArrayList<QuestionBO> searchQuestion(String qname);
	public ArrayList<QuestionBO> getQuestionBySubName(String qtext);
}

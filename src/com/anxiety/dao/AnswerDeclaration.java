package com.anxiety.dao;

import java.util.ArrayList;
import java.util.List;

import com.anxiety.bean.bo.AnswerBO;

public interface AnswerDeclaration {
	public int[] addAnswer(List<AnswerBO> obj) ;
	 public void closeConnection();
	 public ArrayList<AnswerBO> getAllAnswers();
}

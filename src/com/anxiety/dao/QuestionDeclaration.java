package com.anxiety.dao;

import com.anxiety.bean.bo.QuestionBO;

public interface QuestionDeclaration {

	public int[] addQuestion(QuestionBO sbo);
	public void closeConnection();
}

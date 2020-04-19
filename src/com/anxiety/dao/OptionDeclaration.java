package com.anxiety.dao;

import com.anxiety.bean.bo.OptionBO;

public interface OptionDeclaration {
	public int addQuestion(OptionBO obo);
	public void closeConnection();
}

package com.anxiety.dao;

import java.util.ArrayList;

import com.anxiety.bean.bo.OptionBO;

public interface OptionDeclaration {
	public int addQuestion(OptionBO obo);
	public void closeConnection();
	public ArrayList<OptionBO> getAllOption();
	public OptionBO getOptionByQId(int qid);
	public int deleteOption(int  qid);
	public int updateOption(OptionBO obo);
}

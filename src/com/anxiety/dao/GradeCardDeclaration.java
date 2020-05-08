package com.anxiety.dao;

import java.util.ArrayList;

import com.anxiety.bean.bo.GradeBO;

public interface GradeCardDeclaration {
	public int addGrade(GradeBO gbo) ;
	 public void closeConnection();
	 public ArrayList<GradeBO> getAllGrade(String auid) ;
}

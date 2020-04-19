package com.anxiety.dao;

import com.anxiety.bean.bo.SubjectBO;

public interface SubjectDeclaration {
	
	public int addSubject(SubjectBO sbo);
	public void closeConnection() ;
	
}

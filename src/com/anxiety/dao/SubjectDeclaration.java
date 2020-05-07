package com.anxiety.dao;

import java.util.ArrayList;

import com.anxiety.bean.bo.SubjectBO;

public interface SubjectDeclaration {
	
	public int addSubject(SubjectBO sbo);
	public  void closeConnection() ;
	public ArrayList<String> getSubject();
	public ArrayList<SubjectBO> getAllSubject();
	public SubjectBO getSubjectBySubId(int sub_id);
	public int deleteSubject(int  sub_id);
	public int updateSubject(SubjectBO obj);
	public ArrayList<SubjectBO> searchSubject(String name);
	public SubjectBO getSubjectData(String subname);
	
}

package com.anxiety.dao;

import java.sql.Connection;
import java.util.ArrayList;

import com.anxiety.bean.bo.StudentBO;

public interface StudentDeclaration {

	public  int insertRecord(StudentBO obj);
	public  StudentBO getRecord(int sid);
	public  ArrayList<StudentBO> getAllRecord();
	public  int updateRecord(long sid,StudentBO obj);
	public  int deleteRecord(long sid,StudentBO obj);
	public  ArrayList<StudentBO> searchRecord(String name);
	
}

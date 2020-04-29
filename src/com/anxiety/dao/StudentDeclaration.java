package com.anxiety.dao;

import java.util.ArrayList;

import com.anxiety.bean.bo.StudentBO;

public interface StudentDeclaration {

	public  int insertRecord(StudentBO obj);
	public  StudentBO getRecordById(String sid);
	public  StudentBO getRecordByName(String name);
	public  ArrayList<StudentBO> getAllRecord();
	public  int updateRecord(String sid,StudentBO obj);
	public int updateProfile(String sid, StudentBO obj);
	public  int deleteRecord(String sid);
	public  ArrayList<StudentBO> searchRecord(String name);
	public void closeConnection();
	public String[] loginCheck(String email);
	public ArrayList<Long> contactCheck();
}

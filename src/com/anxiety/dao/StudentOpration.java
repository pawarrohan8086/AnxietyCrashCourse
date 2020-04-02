package com.anxiety.dao;

import java.util.ArrayList;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.Date;
import java.sql.Statement;
import java.sql.SQLException;

import com.anxiety.bean.bo.StudentBO;

public class StudentOpration implements StudentDeclaration {

	 	String driver,dburl,dbuser,dbpswd;
	 	static Connection con;
	 	static int tableFlag=1;
	 	
	 	public StudentOpration(String driver,String url,String user,String pswd) {	
		this.driver=driver;
		this.dburl=url;
		this.dbuser=user;
		this.dbpswd=pswd;
		try{
					Class.forName(driver);
					con=DriverManager.getConnection(dburl,dbuser,dbpswd);
					if(tableFlag==0) {
						try {
							Statement st=con.createStatement();
							String query="create table student(sid number(10) primary key,sname varchar(20) not null,contact number(10) unique,email varchar(20) unique,username varchar(20) not null,password varchar(20) not null,address varchar2(70) not null,course varchar2(20),fees number(8,2),admission_date date)";
							tableFlag=st.executeUpdate(query);
							st.close();
							
					
						}catch(SQLException e) {
						
						tableFlag=1;
						
						}
					}
					
				}catch(ClassNotFoundException | SQLException e1 )
				{
					System.out.println("class not found");
				}
	}//close constructor
		
	@Override
	public int insertRecord(StudentBO obj) {
		int c = 0;
		if(tableFlag==1) {
			try {
				PreparedStatement pst=con.prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?,?)");
				
				pst.setString(1,obj.getStudentid());
				pst.setString(2,obj.getSname());
				pst.setLong(3, obj.getContact());
				pst.setString(4, obj.getEmail());
				pst.setString(5,obj.getUsername());
				pst.setString(6,obj.getPassword());
				pst.setString(7,obj.getAddress());
				pst.setString(8,obj.getCourse());
				pst.setDouble(9,obj.getFees());
				pst.setDate(10,Date.valueOf(obj.getAdmision_date()));
				
				 c=pst.executeUpdate();
				 con.commit();
				 pst.close();
					
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return c;
	}

	@Override
	public StudentBO getRecord(int sid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<StudentBO> getAllRecord() {


		Statement st;
		try {
			st = con.createStatement();
			ResultSet results = st.executeQuery("SELECT * FROM student");
			while (results.next()) {
				 
				 
				  // Get the data from the current row using the column index - column data are in the VARCHAR format
				 
				  String data = results.getString(1);
				 
				  System.out.println("Fetching data by column index for row " + results.getRow() + " : " + data);
				 
				 
				  // Get the data from the current row using the column name - column data are in the VARCHAR format
				 
				  data = results.getString("test_col");
				 
				  System.out.println("Fetching data by column name for row " + results.getRow() + " : " + data);
				 
				 
				}
		
		} catch (SQLException e) {


			e.printStackTrace();
		}
		 
		
		 
		 

		 

		
		
		
		
		
		
		return null;
	}

	@Override
	public int updateRecord(long sid, StudentBO obj) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteRecord(long sid, StudentBO obj) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<StudentBO> searchRecord(String name) {
		// TODO Auto-generated method stub
		return null;
	}

}

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
	 public void closeConnection() {
		 
		 try {
			 if(con==null) con.close();
			 
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		 
		 
	 }
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
	public StudentBO getRecordById(String sid) {
		StudentBO sbo=null;
		String id=sid;
		try {
				Statement st = con.createStatement();
				ResultSet results = st.executeQuery("select *student from table student where studentid='"+id+"'");
				while (results.next()) {
					
					sbo=new StudentBO();
					sbo.setUsername(results.getString(5));
					sbo.setEmail(results.getString(4));
					sbo.setPassword(results.getString(6));
					sbo.setSname(results.getString(2));
					sbo.setContact(results.getLong(3));
					sbo.setAddress(results.getString(7));
					sbo.setFees(results.getDouble(9));
					sbo.setAdmision_date(results.getDate(10).toString());
					sbo.setCourse(results.getString(8));
					sbo.setStudentid(results.getString(1));
				}
				st.close();
				return sbo;
				
		} catch (SQLException e) {


			e.printStackTrace();
		}	
		return null;

	}
	@Override
	public  StudentBO getRecordByName(String name){
		StudentBO sbo=null;
		String sname=name;
		try {
				Statement st = con.createStatement();
				ResultSet results = st.executeQuery("select *student from table student where studentid='"+sname+"'");
				while (results.next()) {
					
					sbo=new StudentBO();
					sbo.setUsername(results.getString(5));
					sbo.setEmail(results.getString(4));
					sbo.setPassword(results.getString(6));
					sbo.setSname(results.getString(2));
					sbo.setContact(results.getLong(3));
					sbo.setAddress(results.getString(7));
					sbo.setFees(results.getDouble(9));
					sbo.setAdmision_date(results.getDate(10).toString());
					sbo.setCourse(results.getString(8));
					sbo.setStudentid(results.getString(1));
				}
				st.close();
				return sbo;
				
		} catch (SQLException e) {


			e.printStackTrace();
		}	
		return null;

	}
	
	@Override
	public ArrayList<StudentBO> getAllRecord() {

		ArrayList<StudentBO> al=null;
		try {
				Statement st = con.createStatement();
				ResultSet results = st.executeQuery("SELECT * FROM student");
				al=new ArrayList<StudentBO>();
				while (results.next()) {
					StudentBO sbo=new StudentBO();
					sbo.setUsername(results.getString(5));
					sbo.setEmail(results.getString(4));
					sbo.setPassword(results.getString(6));
					sbo.setSname(results.getString(2));
					sbo.setContact(results.getLong(3));
					sbo.setAddress(results.getString(7));
					sbo.setFees(results.getDouble(9));
					sbo.setAdmision_date(results.getDate(10).toString());
					sbo.setCourse(results.getString(8));
					sbo.setStudentid(results.getString(1));
					al.add(sbo);
				}
				st.close();
		} catch (SQLException e) {


			e.printStackTrace();
		}	
		return al;
		
	}
	

	@Override
	public int updateRecord(String sid, StudentBO obj) {
		
		return 0;
	}

	@Override
	public int deleteRecord(String sid) {
		String id=sid;
		int c=0;
		try {
				Statement st = con.createStatement();
				String query="delete from  student where sid='"+id+"'";
				c=st.executeUpdate(query);
				st.close();
				return c;
				
		} catch (SQLException e) {


			e.printStackTrace();
		}	
		return c;
	}

	@Override
	public ArrayList<StudentBO> searchRecord(String name) {
		
		return null;
	}

}

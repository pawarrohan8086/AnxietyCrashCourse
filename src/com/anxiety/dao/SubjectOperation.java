package com.anxiety.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.anxiety.bean.bo.SubjectBO;

public class SubjectOperation implements SubjectDeclaration {
	String driver, dburl, dbuser, dbpswd;
	static Connection con;
	static int tableFlag = 0;

	public SubjectOperation(String driver, String url, String user, String pswd) {
		this.driver = driver;
		this.dburl = url;
		this.dbuser = user;
		this.dbpswd = pswd;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(dburl, dbuser, dbpswd);
			if (tableFlag == 0) {
				try {
					Statement st = con.createStatement();
					String query = "create table subject(sub_id number(20) primary key,sub_name varchar(30) not null,sub_tmarks number(4),sub_pmarks number(4),sub_question number(10),sub_fees number(8,2),sub_offer number(10),sub_duration number(10))";
					int flag = st.executeUpdate(query);
					if(flag==0) {
						StudentOpration.tableFlag=1;
					}
					st.close();

				} catch (SQLException e) {

					tableFlag = 1;

				}
			}

		} catch (ClassNotFoundException | SQLException e1) {
			System.out.println("class not found");
		}
	}// close constructor
	
	
	
	@Override
	 public void closeConnection() {

		try {
			if (con == null)
				con.close();

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	@Override 
	public int addSubject(SubjectBO obj) {
		int c = 0;
		if (tableFlag == 1) {
			try {

				PreparedStatement pst = con.prepareStatement("insert into subject values(?,?,?,?,?,?,?,?)");
				pst.setInt(1, obj.getSub_id());
				pst.setString(2, obj.getSub_name());
				pst.setInt(3, obj.getSub_tmarks());
				pst.setInt(4, obj.getSub_pmarks());
				pst.setDouble(6, obj.getSub_fees());
				pst.setInt(5, obj.getSub_question());
				pst.setInt(8, obj.getSub_duration());
				pst.setInt(7, obj.getSub_offer());
				c = pst.executeUpdate();
				con.commit();
				pst.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return c;
	}
	@Override
	public ArrayList<String> getSubject() {
		int found=0;
		String sub=null;
		ArrayList<String> al=null;
		try {
			
			String query="select sub_name from subject";
			Statement st = con.createStatement();
			found= st.executeUpdate(query);
			
			if(found!=0) {
				al=new ArrayList<String>();
				ResultSet results=st.executeQuery(query);
				while(results.next()){
				sub=results.getString(1);
				al.add(sub);
				}
			}else {
				
				al=null;
			}
			
			st.close();
				
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return al;
	}
	@Override
	public ArrayList<SubjectBO> getAllSubject() {
		int found=0;
		ArrayList<SubjectBO> al=null;
		try {
			
			String query="select * from subject";
			Statement st = con.createStatement();
			found= st.executeUpdate(query);
			
			if(found!=0) {
				
				ResultSet results=st.executeQuery(query);
				al = new ArrayList<SubjectBO>();
				while (results.next()) {
					SubjectBO subbo = new SubjectBO();
					subbo.setSub_id(results.getInt(1));
					subbo.setSub_name(results.getString(2));
					subbo.setSub_tmarks(results.getInt(3));
					subbo.setSub_pmarks(results.getInt(4));
					subbo.setSub_question(results.getInt(5));
					subbo.setSub_fees(results.getInt(6));
					subbo.setSub_offer(results.getInt(7));
					subbo.setSub_duration(results.getInt(8));
					al.add(subbo);
				}
				
			}else {
					al=null;
			}
				st.close();
				
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return al;

	}
	@Override
	public SubjectBO getSubjectBySubId(int sub_id) {
		SubjectBO subbo = null;
		int subid = sub_id;
		try {
			PreparedStatement pst = con.prepareStatement("select * from subject where sub_id=?");
			pst.setInt(1, subid);
			ResultSet results = pst.executeQuery();
			while (results.next()) {

				subbo = new SubjectBO();
				subbo.setSub_name(results.getString(2));
				subbo.setSub_tmarks(results.getInt(3));
				subbo.setSub_pmarks(results.getInt(4));
				subbo.setSub_question(results.getInt(5));
				subbo.setSub_fees(results.getInt(6));
				subbo.setSub_offer(results.getInt(7));
				subbo.setSub_duration(results.getInt(8));
			}
			pst.close();
			return subbo;

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return null;

	}
	@Override
	public int deleteSubject(int  sub_id) {
		int subid = sub_id;
		int c = 0;
		try {
			Statement st = con.createStatement();
			String query = "delete from subject where sub_id='" +subid+ "'";
			c = st.executeUpdate(query);
			con.commit();
			st.close();
			return c;
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return c;
	}
	@Override
	public int updateSubject(SubjectBO obj) {
		int c = 0;
		try {
			
			PreparedStatement pst = con.prepareStatement("UPDATE SUBJECT set SUB_NAME=?,SUB_TMARKS=?,SUB_PMARKS=?,SUB_QUESTION=?,SUB_FEES=?,SUB_OFFER=?,SUB_DURATION=? where SUB_ID=?");
			pst.setString(1, obj.getSub_name());
			pst.setInt(2,obj.getSub_tmarks());
			pst.setInt(3,obj.getSub_pmarks());
			pst.setInt(4,obj.getSub_question());
			pst.setDouble(5,obj.getSub_fees());
			pst.setInt(6,obj.getSub_offer());
			pst.setInt(7,obj.getSub_duration());
			pst.setInt(8,obj.getSub_id());
			c = pst.executeUpdate();
			con.commit();
			pst.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return c;
	}
	@Override
	public ArrayList<SubjectBO> searchSubject(String subname) {
		int found=0;
		String sname=subname;
		ArrayList<SubjectBO> al=null;
		try {
			
			String query="select * from subject where SUB_NAME like '%"+sname+"%'";
			Statement st = con.createStatement();
			found= st.executeUpdate(query);
			
			if(found!=0) {
				
				ResultSet results=st.executeQuery(query);
				al = new ArrayList<SubjectBO>();
				while (results.next()) {
					SubjectBO subbo = new SubjectBO();
					subbo.setSub_id(results.getInt(1));
					subbo.setSub_name(results.getString(2));
					subbo.setSub_tmarks(results.getInt(3));
					subbo.setSub_pmarks(results.getInt(4));
					subbo.setSub_question(results.getInt(5));
					subbo.setSub_fees(results.getDouble(6));
					subbo.setSub_offer(results.getInt(7));
					subbo.setSub_duration(results.getInt(8));
					
					al.add(subbo);
				}
				
			}else {
					al=null;
			}
				st.close();
				
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return al;

	}


}

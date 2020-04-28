package com.anxiety.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.anxiety.bean.bo.OptionBO;

public class OptionOperation implements OptionDeclaration {
	String driver, dburl, dbuser, dbpswd;
	static Connection con;
	static int tableFlag = 0;

	public OptionOperation(String driver, String url, String user, String pswd) {
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
					String query = "create table options(option_id number(1) not null,question_id number(5) unique,option_1 varchar2(4000),option_2 varchar2(4000),option_3 varchar2(4000),option_4 varchar2(4000))";
					int flag = st.executeUpdate(query);
					if(flag==0) {
						OptionOperation.tableFlag=1;
					}else {
						OptionOperation.tableFlag=1;
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
	public int addQuestion(OptionBO obo) {
		int c = 0;
		if (tableFlag == 1) {
			try {

				PreparedStatement pst = con.prepareStatement("insert into options values(?,?,?,?,?,?)");
				pst.setInt(1,obo.getOption_id());
				pst.setInt(2,obo.getQue_id());
				pst.setString(3,obo.getOption1());
				pst.setString(4,obo.getOption2());
				pst.setString(5,obo.getOption3());
				pst.setString(6,obo.getOption4());
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
	public ArrayList<OptionBO> getAllOption() {
		int found=0;
		ArrayList<OptionBO> al=null;
		try {
			
			String query="select * from options";
			Statement st = con.createStatement();
			found= st.executeUpdate(query);
			
			if(found!=0) {
				
				ResultSet results=st.executeQuery(query);
				al = new ArrayList<OptionBO>();
				while (results.next()) {
					
					OptionBO obo = new OptionBO();
					obo.setOption_id((byte)results.getInt(1));
					obo.setQue_id(results.getInt(2));
					obo.setOption1(results.getString(3));
					obo.setOption2(results.getString(4));
					obo.setOption3(results.getString(5));
					obo.setOption4(results.getString(6));
					al.add(obo);
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
	public OptionBO getOptionByQId(int qid) {
		OptionBO obo = null;
		int queid = qid;
		try {
			PreparedStatement pst = con.prepareStatement("select * from  options where  QUESTION_ID=?");
			pst.setInt(1, queid);
			ResultSet results = pst.executeQuery();
			while (results.next()) {
				obo = new OptionBO();
				obo.setOption_id((byte)results.getInt(1));
				obo.setQue_id(results.getInt(2));
				obo.setOption1(results.getString(3));
				obo.setOption2(results.getString(4));
				obo.setOption3(results.getString(5));
				obo.setOption4(results.getString(6));
				
			}
			pst.close();
			return obo;

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return null;

	}
	@Override
	public int deleteOption(int  qid){
		int queid = qid;
		int c = 0;
		try {
			Statement st = con.createStatement();
			String query = "delete from options where   QUESTION_ID='" +queid+ "'";
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
	public int updateOption(OptionBO obo) {
		int c = 0;
		try {      
			
			PreparedStatement pst = con.prepareStatement("UPDATE options set OPTION_ID=?,OPTION_1=?,OPTION_2=?,OPTION_3=?,OPTION_4=? where  QUESTION_ID=?");
			pst.setInt(1,obo.getOption_id());
			pst.setInt(6,obo.getQue_id());
			pst.setString(2,obo.getOption1());
			pst.setString(3,obo.getOption2());
			pst.setString(4,obo.getOption3());
			pst.setString(5,obo.getOption4());
			c = pst.executeUpdate();
			con.commit();
			pst.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return c;
	}
}

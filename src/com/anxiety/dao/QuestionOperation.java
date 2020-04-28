package com.anxiety.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.anxiety.bean.bo.QuestionBO;

public class QuestionOperation implements QuestionDeclaration {
	String driver, dburl, dbuser, dbpswd;
	static Connection con;
	static int tableFlag = 0;

	public QuestionOperation(String driver, String url, String user, String pswd) {
		this.driver = driver;
		this.dburl = url;
		this.dbuser = user;
		this.dbpswd = pswd;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(dburl, dbuser, dbpswd);
				try {
					Statement st = con.createStatement();
					String query = "create table question(sub_name varchar(30) not null,que_id number(5) unique,que_marks number(10),que_type varchar(20),que_text varchar2(4000),ans_text varchar2(4000))";
					int flag = st.executeUpdate(query);
					if(flag==0) {
						QuestionOperation.tableFlag=1;
					}
					st.close();

				} catch (SQLException e) {

					QuestionOperation.tableFlag=1;

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
	public int[] addQuestion(QuestionBO obj) {
		int c = 0,qid=1,found=0;
		int[] a=new int[2];
		if(QuestionOperation.tableFlag==1) {
		try {
				
				String query="select max(que_id) from question";
				Statement st = con.createStatement();
				found= st.executeUpdate(query);
				
				if(found!=0) {
					
					ResultSet results=st.executeQuery(query);
					while(results.next()) {
						int max= results.getInt(1);
						qid=++max;
					}
				}else {
					qid=1;
				}
				
				st.close();
					
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		
		if (tableFlag == 1) {
			try {

				PreparedStatement pst = con.prepareStatement("insert into question values(?,?,?,?,?,?)");
				pst.setString(1,obj.getSub_name());
				pst.setInt(2,qid);
				pst.setInt(3,obj.getQue_marks());
				pst.setString(4,obj.getQuestion_type());
				pst.setString(5,obj.getQuetext());
				pst.setString(6,obj.getAnstext());
				c = pst.executeUpdate();
				con.commit();
				pst.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		a[0]=c;
		a[1]=qid;
		return a;
	} 
	@Override
	public ArrayList<QuestionBO> getAllQuestion() {
		int found=0;
		ArrayList<QuestionBO> al=null;
		if (tableFlag == 1) {
		try {
			
			String query="select * from question";
			Statement st = con.createStatement();
			found= st.executeUpdate(query);
			
			if(found!=0) {
				
				ResultSet results=st.executeQuery(query);
				al = new ArrayList<QuestionBO>();
				while (results.next()) {
					
					QuestionBO qbo = new QuestionBO();
					qbo.setSub_name(results.getString(1));
					qbo.setQue_id(results.getInt(2));
					qbo.setQue_marks(results.getInt(3));
					qbo.setQuestion_type(results.getString(4));
					qbo.setQuetext(results.getString(5));
					qbo.setAnstext(results.getString(6));
					al.add(qbo);
				}
				
			}else {
					al=null;
			}
				st.close();
				
		} catch (SQLException e) {

			e.printStackTrace();
		}
		}
		return al;

	}
	@Override
	public QuestionBO getQuestionByQid(int qid) {
		QuestionBO qbo = null;
		int queid = qid;
		try {
			PreparedStatement pst = con.prepareStatement("select * from  question where QUE_ID=?");
			pst.setInt(1, queid);
			ResultSet results = pst.executeQuery();
			while (results.next()) {
				qbo = new QuestionBO();
				qbo.setSub_name(results.getString(1));
				qbo.setQue_id(results.getInt(2));
				qbo.setQue_marks(results.getInt(3));
				qbo.setQuestion_type(results.getString(4));
				qbo.setQuetext(results.getString(5));
				qbo.setAnstext(results.getString(6));		}
			pst.close();
			return qbo;

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return null;

	}
	@Override
	public int deleteQuestion(int  qid) {
		int queid = qid;
		int c = 0;
		try {
			Statement st = con.createStatement();
			String query = "delete from question where  QUE_ID='" +queid+ "'";
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
	public int updateQuestion(QuestionBO qbo) {
		int c = 0;
		try {
			   
			PreparedStatement pst = con.prepareStatement("UPDATE question set SUB_NAME=?,QUE_MARKS=?,QUE_TYPE=?,QUE_TEXT=?,ANS_TEXT=? where QUE_ID=?");
			pst.setString(1,qbo.getSub_name());
			pst.setInt(2,qbo.getQue_marks());
			pst.setString(3,qbo.getQuestion_type());
			pst.setString(4,qbo.getQuetext());
			pst.setString(5,qbo.getAnstext());
			pst.setInt(6,qbo.getQue_id());
			c = pst.executeUpdate();
			con.commit();
			pst.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return c;
	}
	@Override
	public ArrayList<QuestionBO> searchQuestion(String qtext) {
		int found=0;
		String quetext=qtext;
		ArrayList<QuestionBO> al=null;
		try {
			
			String query="select * from question where QUE_TEXT like '%"+quetext+"%'";
			Statement st = con.createStatement();
			found= st.executeUpdate(query);
			if(found!=0) {
				ResultSet results=st.executeQuery(query);
				al = new ArrayList<QuestionBO>();
				while (results.next()) {
					
					QuestionBO qbo = new QuestionBO();
					qbo.setSub_name(results.getString(1));
					qbo.setQue_id(results.getInt(2));
					qbo.setQue_marks(results.getInt(3));
					qbo.setQuestion_type(results.getString(4));
					qbo.setQuetext(results.getString(5));
					qbo.setAnstext(results.getString(6));
					al.add(qbo);
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


package com.anxiety.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
			if (tableFlag == 0) {
				try {
					Statement st = con.createStatement();
					String query = "create table question(sub_name varchar(30) not null,que_id number(5) unique,que_marks number(10),que_type varchar(20),que_text varchar(500),ans_text varchar(500))";
					int flag = st.executeUpdate(query);
					if(flag==0) {
						QuestionOperation.tableFlag=1;
					}else {
						QuestionOperation.tableFlag=1;
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
	public int[] addQuestion(QuestionBO obj) {
		int c = 0,qid=1,found=0;
		int[] a=new int[2];
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
}


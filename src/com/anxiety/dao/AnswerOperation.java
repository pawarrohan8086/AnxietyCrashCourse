package com.anxiety.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

import com.anxiety.bean.bo.AnswerBO;

public class AnswerOperation implements AnswerDeclaration {
	String driver, dburl, dbuser, dbpswd;
	
	static Connection con=null;
	static int tableFlag = 0;

	public AnswerOperation(String driver, String url, String user, String pswd) {
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
					String query = "create table answer(auid number(20) not null,sub_name varchar(30) not null,que_id number(4),que_type varchar2(20),que_mark number(4),que_text varchar2(500),answer varchar2(500),right_ans varchar2(500),grade varchar2(20))";
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
	 public int[] addAnswer(List<AnswerBO> obj) {
		ArrayList<AnswerBO> ala=(ArrayList<AnswerBO>) obj;
		ListIterator<AnswerBO> ltr=ala.listIterator();
		int [] result=null;
		if (tableFlag == 1) {
			try {
				PreparedStatement pst = con.prepareStatement("insert into answer values(?,?,?,?,?,?,?,?,?)");
				while(ltr.hasNext()) {
				AnswerBO abo=ltr.next();
				pst.setLong(1,abo.getAuid());
				pst.setString(2, abo.getSub_name());
				pst.setInt(3,abo.getQid());
				pst.setString(4,abo.getQtype() );
				pst.setInt(5,abo.getQmark() );
				pst.setString(6,abo.getQuetext() );
				pst.setString(7,abo.getAns());
				pst.setString(8,abo.getAnstext() );
				pst.setString(9,abo.getGrade() );
				pst.addBatch();
				
				}
				result =pst.executeBatch();
				con.commit();
				con.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	@Override
	 public ArrayList<AnswerBO> getAllAnswers() {
		int found=0;
		ArrayList<AnswerBO> al=null;
		try {
			
			String query="select * from answer";
			Statement st = con.createStatement();
			found= st.executeUpdate(query);
			
			if(found!=0) {
				
				ResultSet results=st.executeQuery(query);
				al = new ArrayList<AnswerBO>();
				while (results.next()) {
					AnswerBO abo = new AnswerBO();
					abo.setAuid(results.getLong(1));
					abo.setSub_name(results.getString(2));
					abo.setQid(results.getInt(3));
					abo.setQtype(results.getString(4));
					abo.setQmark(results.getInt(5));
					abo.setQuetext(results.getString(6));
					abo.setAns(results.getString(7));
					abo.setAnstext(results.getString(8));
					abo.setGrade(results.getString(9));
					al.add(abo);
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

package com.anxiety.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

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
					String query = "create table options(option_id number(1) not null,question_id number(5) unique,option_1 varchar(500),option_2 varchar(500),option_3 varchar(500),option_4 varchar(500))";
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
}

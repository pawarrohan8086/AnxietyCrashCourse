package com.anxiety.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

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
						SubjectOperation.tableFlag=1;
					}else {
						SubjectOperation.tableFlag=1;
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
}

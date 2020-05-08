package com.anxiety.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Statement;
import com.anxiety.bean.bo.GradeBO;

public class GradeCardOperation implements GradeCardDeclaration {
	String driver, dburl, dbuser, dbpswd;

	static Connection con = null;
	static int tableFlag = 0;

	public GradeCardOperation(String driver, String url, String user, String pswd) {
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
					String query = "create table grade(sid number(20) not null,auid number(20) not null,sub_name varchar(30) not null,tmark number(4),test_score number(4),percentage number(5),remark varchar2(10),exam_date varchar2(40))";
					int flag = st.executeUpdate(query);
					if (flag == 0) {
						StudentOpration.tableFlag = 1;
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
	public int addGrade(GradeBO gbo) {
		int result = 5;
		if (tableFlag == 1) {
			try {
				PreparedStatement pst = con.prepareStatement("insert into grade values(?,?,?,?,?,?,?,?)");
				pst.setInt(1, gbo.getSid());
				pst.setLong(2, gbo.getAuid());
				pst.setString(3, gbo.getCourse());
				pst.setInt(4, gbo.getTmark());
				pst.setInt(5, gbo.getScore());
				pst.setFloat(6, gbo.getPercentage());
				pst.setString(7, gbo.getRemark());
				pst.setString(8, gbo.getEdate());
				result = pst.executeUpdate();
				con.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		return result;
	}

	@Override
	public ArrayList<GradeBO> getAllGrade(String sid) {
		int found = 0;
		String uid=sid;
		ArrayList<GradeBO> al = null;
		try {

			String query = "select * from grade where sid='"+uid+"'";
			Statement st = con.createStatement();
			found = st.executeUpdate(query);

			if (found != 0) {

				ResultSet results = st.executeQuery(query);
				al = new ArrayList<GradeBO>();
				while (results.next()) {
					GradeBO gbo = new GradeBO();
					gbo.setSid(results.getInt(1));
					gbo.setAuid(results.getLong(2));
					gbo.setCourse(results.getString(3));
					gbo.setTmark(results.getInt(4));
					gbo.setScore(results.getInt(5));
					gbo.setPercentage(results.getFloat(6));
					gbo.setRemark(results.getString(7));
					gbo.setEdate(results.getString(8));
					al.add(gbo);
				}

			} else {
				al = null;
			}
			st.close();

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return al;

	}

}

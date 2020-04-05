package com.anxiety.dao;

public class testdb {
	
	public static void main(String[] args) {
		System.out.println("table created");
		StudentOpration so=new StudentOpration("oracle.jdbc.driver.OracleDriver","jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
	}

}

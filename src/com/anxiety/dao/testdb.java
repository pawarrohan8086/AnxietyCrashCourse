package com.anxiety.dao;


import java.util.UUID;

public class testdb {
	
	public static void main(String[] args) {
	
		//OptionOperation so=new OptionOperation("oracle.jdbc.driver.OracleDriver","jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
	System.out.println("table created");

	//String[] uid = UUID.randomUUID().toString().split("-");
	int num=Math.abs(UUID.randomUUID().hashCode());
	
	System.out.println(num);
	}

}
